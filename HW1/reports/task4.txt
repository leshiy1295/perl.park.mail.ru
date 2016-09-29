# сеанс отладки скрипта из задания 3
$ cat reports/task1.out | perl -d scripts/task3Dumper.pl

Loading DB routines from perl5db.pl version 1.39_10
Editor support available.

Enter h or 'h h' for help, or 'man perldebug' for more help.

main::(scripts/task3Dumper.pl:6): my @arr;
  DB<1> l
6==>  my @arr;
7
8:  while (<>) {
9:    chomp;
10:   my @F = split(';');
11:   push @arr, [@F];
12  }
13
14: print Dumper \@arr;
  DB<1> b 9
  DB<2> c
main::(scripts/task3Dumper.pl:9):   chomp;
  DB<2> p $.
1
  DB<3> p $_
-rw-r--r--;1;a.halaidzhy;staff;21;Sep;29;21:08;FileWithoutExtension

  DB<4> v
6:  my @arr;
7
8:  while (<>) {
9==>b   chomp;
10:   my @F = split(';');
11:   push @arr, [@F];
12  }
13
14: print Dumper \@arr;
  DB<4> n
main::(scripts/task3Dumper.pl:10):    my @F = split(';');
  DB<4> p $_
-rw-r--r--;1;a.halaidzhy;staff;21;Sep;29;21:08;FileWithoutExtension
  DB<5> x \@F
0  ARRAY(0x7f9d05007d38)
     empty array
  DB<6> n
main::(scripts/task3Dumper.pl:11):    push @arr, [@F];
  DB<6> x \@F
0  ARRAY(0x7f9d03332200)
   0  '-rw-r--r--'
   1  1
   2  'a.halaidzhy'
   3  'staff'
   4  21
   5  'Sep'
   6  29
   7  '21:08'
   8  'FileWithoutExtension'
  DB<7> x \@arr
0  ARRAY(0x7f9d033320f8)
     empty array
  DB<8> n
main::(scripts/task3Dumper.pl:9):   chomp;
  DB<8> x \@arr
0  ARRAY(0x7f9d033320f8)
   0  ARRAY(0x7f9d040be8d8)
      0  '-rw-r--r--'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  21
      5  'Sep'
      6  29
      7  '21:08'
      8  'FileWithoutExtension'
  DB<9> p $.
2
  DB<10> v
6:  my @arr;
7
8:  while (<>) {
9==>b   chomp;
10:   my @F = split(';');
11:   push @arr, [@F];
12  }
13
14: print Dumper \@arr;
  DB<10> B 9
  DB<11> w @arr
  DB<12> b 9 $. == 5
  DB<13> L
scripts/task3Dumper.pl:
 9:   chomp;
    break if ($. == 5)
Watch-expressions:
 @arr
  DB<13> c
Watchpoint 0: @arr changed:
    old value:  ''
    new value:  'ARRAY(0x7f9d040be8d8)'
main::(scripts/task3Dumper.pl:10):    my @F = split(';');
  DB<13> c
Watchpoint 0: @arr changed:
    old value:  'ARRAY(0x7f9d040be8d8)'
    new value:  'ARRAY(0x7f9d040be8d8)', 'ARRAY(0x7f9d038b6840)'
main::(scripts/task3Dumper.pl:9):   chomp;
  DB<13> p $.
3
  DB<14> x \@arr
0  ARRAY(0x7f9d033320f8)
   0  ARRAY(0x7f9d040be8d8)
      0  '-rw-r--r--'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  21
      5  'Sep'
      6  29
      7  '21:08'
      8  'FileWithoutExtension'
   1  ARRAY(0x7f9d038b6840)
      0  '-rw-r--r--'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  59
      5  'Sep'
      6  29
      7  '21:08'
      8  'Filename with    more that      one space between    words'
  DB<15> L
scripts/task3Dumper.pl:
 9:   chomp;
    break if ($. == 5)
Watch-expressions:
 @arr
  DB<15> W @arr
  DB<16> c
main::(scripts/task3Dumper.pl:9):   chomp;
  DB<16> p $.
5
  DB<17> x $#arr
0  3
  DB<18> x \@arr
0  ARRAY(0x7f9d033320f8)
   0  ARRAY(0x7f9d040be8d8)
      0  '-rw-r--r--'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  21
      5  'Sep'
      6  29
      7  '21:08'
      8  'FileWithoutExtension'
   1  ARRAY(0x7f9d038b6840)
      0  '-rw-r--r--'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  59
      5  'Sep'
      6  29
      7  '21:08'
      8  'Filename with    more that      one space between    words'
   2  ARRAY(0x7f9d040a8218)
      0  '-rwxr-xr-x'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  1603
      5  'Sep'
      6  29
      7  '20:46'
      8  'Readme.md'
   3  ARRAY(0x7f9d0500b498)
      0  '-rwxr-xr-x'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  1228800
      5  'Sep'
      6  29
      7  '20:46'
      8  'file 1.2Mb'
  DB<19> H
18: x \@arr
17: x $#arr
16: p $.
15: W @arr
14: x \@arr
13: p $.
12: b 9 $. == 5
11: w @arr
10: B 9
9: p $.
8: x \@arr
7: x \@arr
6: x \@F
5: x \@F
4: p $_
3: p $_
2: p $.
1: b 9
  DB<19> !18
x \@arr
0  ARRAY(0x7f9d033320f8)
   0  ARRAY(0x7f9d040be8d8)
      0  '-rw-r--r--'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  21
      5  'Sep'
      6  29
      7  '21:08'
      8  'FileWithoutExtension'
   1  ARRAY(0x7f9d038b6840)
      0  '-rw-r--r--'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  59
      5  'Sep'
      6  29
      7  '21:08'
      8  'Filename with    more that      one space between    words'
   2  ARRAY(0x7f9d040a8218)
      0  '-rwxr-xr-x'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  1603
      5  'Sep'
      6  29
      7  '20:46'
      8  'Readme.md'
   3  ARRAY(0x7f9d0500b498)
      0  '-rwxr-xr-x'
      1  1
      2  'a.halaidzhy'
      3  'staff'
      4  1228800
      5  'Sep'
      6  29
      7  '20:46'
      8  'file 1.2Mb'
  DB<20> .
main::(scripts/task3Dumper.pl:9):   chomp;
  DB<21> L
scripts/task3Dumper.pl:
 9:   chomp;
    break if ($. == 5)
  DB<22> B 9
Line 9 not breakable.
  DB<23> c
$VAR1 = [
          [
            '-rw-r--r--',
            '1',
            'a.halaidzhy',
            'staff',
            '21',
            'Sep',
            '29',
            '21:08',
            'FileWithoutExtension'
          ],
          [
            '-rw-r--r--',
            '1',
            'a.halaidzhy',
            'staff',
            '59',
            'Sep',
            '29',
            '21:08',
            'Filename with    more that      one space between    words'
          ],
          [
            '-rwxr-xr-x',
            '1',
            'a.halaidzhy',
            'staff',
            '1603',
            'Sep',
            '29',
            '20:46',
            'Readme.md'
          ],
          [
            '-rwxr-xr-x',
            '1',
            'a.halaidzhy',
            'staff',
            '1228800',
            'Sep',
            '29',
            '20:46',
            'file 1.2Mb'
          ],
          [
            '-rwxr-xr-x',
            '1',
            'a.halaidzhy',
            'staff',
            '1843200',
            'Sep',
            '29',
            '20:46',
            'file 1.8 Mb'
          ],
          [
            '-rwxr-xr-x',
            '1',
            'a.halaidzhy',
            'staff',
            '1048576',
            'Sep',
            '29',
            '20:46',
            'file1Mb'
          ],
          [
            'drwxr-xr-x',
            '3',
            'a.halaidzhy',
            'staff',
            '102',
            'Sep',
            '29',
            '21:12',
            'folder with some spaces'
          ],
          [
            'drwxr-xr-x',
            '3',
            'a.halaidzhy',
            'staff',
            '102',
            'Sep',
            '29',
            '21:12',
            'folderWithoutSpaces'
          ],
          [
            'drwxr-xr-x',
            '7',
            'a.halaidzhy',
            'staff',
            '238',
            'Sep',
            '29',
            '20:46',
            'reports'
          ],
          [
            'drwxr-xr-x',
            '6',
            'a.halaidzhy',
            'staff',
            '204',
            'Sep',
            '29',
            '21:03',
            'scripts'
          ],
          [
            '-rwxr-xr-x',
            '1',
            'a.halaidzhy',
            'staff',
            '2457600',
            'Sep',
            '29',
            '20:46',
            'файл 2.5 МБ'
          ],
          [
            '-rw-r--r--',
            '1',
            'a.halaidzhy',
            'staff',
            '40',
            'Sep',
            '29',
            '21:15',
            'Файл на русском языке'
          ],
          [
            'drwxr-xr-x',
            '3',
            'a.halaidzhy',
            'staff',
            '102',
            'Sep',
            '29',
            '21:15',
            'Директория на русском языке'
          ]
        ];
Debugged program terminated.  Use q to quit or R to restart,
use o inhibit_exit to avoid stopping after program termination,
h q, h R or h o to get additional info.
  DB<24> p $.
13
  DB<25> q
