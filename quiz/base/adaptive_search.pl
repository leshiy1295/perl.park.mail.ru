#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

use DDP;
die 'USAGE -> <n> [queries]' unless @ARGV;
my $n = shift @ARGV;
my @array = (1...$n);
for my $query_index (@ARGV) {
    for (my $i = 1; $i <= @array; ++$i) {
        if ($array[$i - 1] == $query_index) {
            print "$i ";
            my @b = (@array);
            splice(@array, 1, $i - 1, splice(@b, 0, $i - 1)) if $i > 1;
            $array[0] = $query_index;
            last;
        }
    }
    p @array;
}
print "\n";
