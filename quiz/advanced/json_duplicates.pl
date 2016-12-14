#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use DDP;
use JSON::XS ();
use JSON::XS::Boolean;
use File::Path qw/make_path rmtree/;
use File::Copy;

my $in_dir_name = 'json_in';
my $out_dir_name = 'json_out';

my %structures = ();
my %groups = ();

sub identical_arrays {
    my ($array1, $array2) = @_;
    return 0 unless ref $array1 eq 'ARRAY' && ref $array2 eq 'ARRAY';
    return 0 unless @$array1 == @$array2;
    my $equal = 1;
    for (my $i = 0; $i < @$array1; ++$i) {
        $equal = identical_values($array1->[$i], $array2->[$i]);
        last unless $equal;
    }
    return $equal;
}

sub identical_values {
    my ($value1, $value2) = @_;
    return !defined($value2) unless defined($value1);
    return !defined($value1) unless defined($value2);
    return 1 if $value1 == $value2;
    return identical_arrays($value1, $value2) || identical_objects($value1, $value2);
}

sub identical_objects {
    my ($object1, $object2) = @_;
    return 0 unless ref $object1 eq 'HASH' && ref $object2 eq 'HASH';
    my $equal = 1;
    return 0 unless scalar(keys %$object1) == scalar(keys %$object2);
    for my $key (keys %$object1) {
        $equal = exists $object2->{$key};
        last unless $equal;
    }
    return 0 unless $equal;
    for my $key (keys %$object1) {
        $equal = identical_values($object1->{$key}, $object2->{$key});
        last unless $equal;
    }
    return $equal;
}

# Считывание данных из файлов
opendir my $dh, $in_dir_name or die $!;
while (my $fname = readdir $dh) {
    my $full_file_name = "$in_dir_name/$fname";
    next unless -f $full_file_name;
    warn $fname, "\n";
    my $file_data;
    open my $fh, '<:encoding(UTF-8)', $full_file_name or die $!;
    do {
        local $/;
        $file_data = <$fh>;
    };
    close $fh;
    warn $file_data;
    my $json_object = JSON::XS::decode_json($file_data);
    p $json_object;
    $structures{$fname} = $json_object;
}
closedir $dh;
p %structures;

# Нахождение групп
my @files = keys %structures;
p @files;
while (@files) {
    my $fname1 = shift @files;
    my @identical = grep { identical_objects($structures{$fname1}, $structures{$_}) or identical_arrays($structures{$fname1}, $structures{$_}) } @files;
    warn "Working with $fname1 -> ${\do{join ',', @identical}}";
    if (@identical) {
        $groups{$fname1} = \@identical;
    }
    else {
        $groups{$fname1} = undef;
    }
    @files = grep { my $file = $_; not grep /^$file$/, @identical; } @files;
}
p %groups;

# Группировка файлов в директории
rmtree($out_dir_name);
make_path($out_dir_name);
for my $group_name (keys %groups) {
    if ($groups{$group_name}) {
        my $full_dir_name = "$out_dir_name/$group_name";
        make_path($full_dir_name);
        for my $file (@{$groups{$group_name}}) {
            copy("$in_dir_name/$group_name", "$out_dir_name/$group_name/$file");
        }
        copy("$in_dir_name/$group_name", "$out_dir_name/$group_name/$group_name");
    }
    else {
        copy("$in_dir_name/$group_name", "$out_dir_name/$group_name");
    }
}
