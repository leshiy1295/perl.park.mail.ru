use strict;
use warnings;

sub createFieldMask {
  my %args = @_;
  my $rows = $args{rows};
  my $cols = $args{cols};
  my @field = ();
  for (my $i = 0; $i < $rows; ++$i) {
    for (my $j = 0; $j < $cols; ++$j) {
      $field[$i][$j] = '0';
    }
  }
  return \@field;
}

sub placeMines {
  my %args = @_;
  my $points = $args{points};
  my $field = $args{field};
  my $fieldRows = @$field;
  my $fieldCols = @{$field->[0]};
  die "Points coords count must be even" unless @$points % 2 == 0;
  my @pointsXArray = map { $_ % 2 == 0 ? $points->[$_] : () } keys @$points;
  die "Point coords must be in bounds of field size" if grep { $_ >= $fieldRows } @pointsXArray;
  my @pointsYArray = map { $_ % 2 != 0 ? $points->[$_] : () } keys @$points;
  die "Point coords must be in bounds of field size" if grep { $_ >= $fieldCols } @pointsYArray;
  foreach (keys @pointsXArray) {
    $field->[$pointsXArray[$_]]->[$pointsYArray[$_]] = 'X';
  }
}

sub updateCellsAroundPoint {
  my %args = @_;
  my $x = $args{x};
  my $y = $args{y};
  my $field = $args{field};
  my $sensitivity = $args{sensitivity};
  my $rows = @$field;
  my $cols = @{$field->[0]};
  my $startRow = $x - $sensitivity < 0 ? 0 : $x - $sensitivity;
  my $startCol = $y - $sensitivity < 0 ? 0 : $y - $sensitivity;
  my $endRow = $x + $sensitivity > $rows - 1 ? $rows - 1 : $x + $sensitivity;
  my $endCol = $y + $sensitivity > $cols - 1 ? $cols - 1 : $y + $sensitivity;
  for (my $i = $startRow; $i <= $endRow; ++$i) {
    for (my $j = $startCol; $j <= $endCol; ++$j) {
      if ($field->[$i]->[$j] ne 'X') {
        my $xDelta = abs($i - $x);
        my $yDelta = abs($j - $y);
        my $maxDelta = $xDelta > $yDelta ? $xDelta : $yDelta;
        $field->[$i]->[$j] += $sensitivity - ($maxDelta - 1);
      }
    }
  }
}

sub updateValues {
  my %args = @_;
  my $sensitivity = $args{sensitivity};
  my $field = $args{field};
  my $rows = @$field;
  my $cols = @{$field->[0]};
  for (my $i = 0; $i < $rows; ++$i) {
    for (my $j = 0; $j < $cols; ++$j) {
      if ($field->[$i]->[$j] eq 'X') {
        updateCellsAroundPoint(x => $i, y => $j, field => $field, sensitivity => $sensitivity);
      }
    }
  }
}

sub printField {
  my $field = shift;
  my $rows = @$field;
  my $cols = @{$field->[0]};
  my $maxElemLength = length 'X';
  for (my $i = 0; $i < $rows; ++$i) {
    for (my $j = 0; $j < $cols; ++$j) {
      $maxElemLength = length $field->[$i]->[$j] if (length $field->[$i]->[$j] > $maxElemLength);
    }
  }
  my $formatLengthForElem = $maxElemLength + 1;
  for (my $i = 0; $i < $rows; ++$i) {
    for (my $j = 0; $j < $cols; ++$j) {
      printf("%${formatLengthForElem}s", $field->[$i]->[$j] . ($j != $cols - 1 ? ' ' : "\n"));
    }
  }
}

die "Usage: perl minesweeper <height> <width> <sensitivity> [<point1.x> <point1.y>[ <point2.x> <point2.y>[ ...]]]" if (@ARGV < 3);
die "Wrong agruments format! All arguments should be positive integer numbers" if (grep { /[^\d]/ } @ARGV);
my ($rows, $cols, $sensitivity, @points) = @ARGV;
die "Rows and cols can't be equal to zero" if ($rows == 0 || $cols == 0 || $sensitivity == 0);
my $field = createFieldMask(rows => $rows, cols => $cols);
placeMines(points => \@points, field => $field);
updateValues(sensitivity => $sensitivity, field => $field);
printField($field);
