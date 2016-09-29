# запускаемый Perl-скрипт
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
            '-rwxrwxrwx',
            '1',
            'root',
            'root',
            '1843200',
            'сент.',
            '28',
            '14:52',
            'file 1.8 Mb'
          ],
          [
            '-rwxrwxrwx',
            '1',
            'root',
            'root',
            '1048576',
            'сент.',
            '28',
            '12:38',
            'file1Mb'
          ],
          [
            '-rwxrwxrwx',
            '1',
            'root',
            'root',
            '0',
            'сент.',
            '28',
            '12:39',
            'Filename with    more that      one space between    words'
          ],
          [
            '-rwxrwxrwx',
            '1',
            'root',
            'root',
            '0',
            'сент.',
            '28',
            '10:57',
            'FileWithoutExtension'
          ],
          [
            'drwxrwxrwx',
            '2',
            'root',
            'root',
            '0',
            'сент.',
            '28',
            '14:48',
            'folderWithoutSpaces'
          ],
          [
            'drwxrwxrwx',
            '2',
            'root',
            'root',
            '0',
            'сент.',
            '28',
            '08:24',
            'folder with some spaces'
          ],
          [
            '-rwxrwxrwx',
            '1',
            'root',
            'root',
            '1603',
            'сент.',
            '28',
            '11:15',
            'Readme.md'
          ],
          [
            'drwxrwxrwx',
            '2',
            'root',
            'root',
            '0',
            'сент.',
            '28',
            '14:58',
            'reports'
          ],
          [
            'drwxrwxrwx',
            '2',
            'root',
            'root',
            '0',
            'сент.',
            '28',
            '14:55',
            'scripts'
          ],
          [
            'drwxrwxrwx',
            '2',
            'root',
            'root',
            '0',
            'сент.',
            '28',
            '08:26',
            'Директория на русском языке'
          ],
          [
            '-rwxrwxrwx',
            '1',
            'root',
            'root',
            '2457600',
            'сент.',
            '28',
            '14:52',
            'файл 2.5 МБ'
          ],
          [
            '-rwxrwxrwx',
            '1',
            'root',
            'root',
            '0',
            'сент.',
            '28',
            '10:57',
            'Файл на русском языке'
          ]
        ];
