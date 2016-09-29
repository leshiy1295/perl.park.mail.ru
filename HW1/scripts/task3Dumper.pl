#/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my @arr;

while (<>) {
	chomp;
	my @F = split(';');
	push @arr, [@F];
}

print Dumper \@arr;
