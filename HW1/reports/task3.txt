# запускаемый Perl-скрипт с Data::Dumper
$ cat scripts/task3Dumper.pl
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

# запуск скрипта
$ cat reports/task1.out | perl -n scripts/task3Dumper.pl > reports/task3Dumper.out

# полученный результат
$ cat reports/task3Dumper.out
$VAR1 = [
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

# для использования DDP, необходимо его предварительно установить
$ sudo cpan DDP

# запускаемый Perl-скрипт с DDP
$ cat scripts/task3DDP.pl
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

p @arr;

# запуск скрипта
$ cat reports/task1.out | perl -n scripts/task3DDP.pl
[
    [0]  [
        [0] "-rw-r--r--",
        [1] 1,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 59,
        [5] "Sep",
        [6] 29,
        [7] "21:08",
        [8] "Filename with    more that      one space between    words"
    ],
    [1]  [
        [0] "-rwxr-xr-x",
        [1] 1,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 1603,
        [5] "Sep",
        [6] 29,
        [7] "20:46",
        [8] "Readme.md"
    ],
    [2]  [
        [0] "-rwxr-xr-x",
        [1] 1,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 1228800,
        [5] "Sep",
        [6] 29,
        [7] "20:46",
        [8] "file 1.2Mb"
    ],
    [3]  [
        [0] "-rwxr-xr-x",
        [1] 1,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 1843200,
        [5] "Sep",
        [6] 29,
        [7] "20:46",
        [8] "file 1.8 Mb"
    ],
    [4]  [
        [0] "-rwxr-xr-x",
        [1] 1,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 1048576,
        [5] "Sep",
        [6] 29,
        [7] "20:46",
        [8] "file1Mb"
    ],
    [5]  [
        [0] "drwxr-xr-x",
        [1] 3,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 102,
        [5] "Sep",
        [6] 29,
        [7] "21:12",
        [8] "folder with some spaces"
    ],
    [6]  [
        [0] "drwxr-xr-x",
        [1] 3,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 102,
        [5] "Sep",
        [6] 29,
        [7] "21:12",
        [8] "folderWithoutSpaces"
    ],
    [7]  [
        [0] "drwxr-xr-x",
        [1] 7,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 238,
        [5] "Sep",
        [6] 29,
        [7] "20:46",
        [8] "reports"
    ],
    [8]  [
        [0] "drwxr-xr-x",
        [1] 6,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 204,
        [5] "Sep",
        [6] 29,
        [7] "21:03",
        [8] "scripts"
    ],
    [9]  [
        [0] "-rwxr-xr-x",
        [1] 1,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 2457600,
        [5] "Sep",
        [6] 29,
        [7] "20:46",
        [8] "файл 2.5 МБ"
    ],
    [10] [
        [0] "-rw-r--r--",
        [1] 1,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 40,
        [5] "Sep",
        [6] 29,
        [7] "21:15",
        [8] "Файл на русском языке"
    ],
    [11] [
        [0] "drwxr-xr-x",
        [1] 3,
        [2] "a.halaidzhy",
        [3] "staff",
        [4] 102,
        [5] "Sep",
        [6] 29,
        [7] "21:15",
        [8] "Директория на русском языке"
    ]
]
