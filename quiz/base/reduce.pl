use strict;
use warnings;

sub reduce(&@) {
  my ($f, @list) = @_;
  die "Wrong argument given! Usage: reduce <block> <list>" unless (defined $f && @list);
  my $result = 0;
  $result = $f->($result, $_) foreach @list;
  $result;
}

# returns 10
my $result = reduce {
  my ($sum, $i) = @_;
  $sum + $i;
} 1, 2, 3, 4;
print "$result\n";
