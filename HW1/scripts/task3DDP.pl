#/usr/bin/perl
use strict;
use warnings;
use DDP;

my @arr;

while (<>) {
	chomp;
	my @F = split(';');
	push @arr, [@F];
}

#p \@arr;
