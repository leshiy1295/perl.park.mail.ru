# реальный список файлов директории
$ ls -l
total 12880
-rw-r--r--  1 a.halaidzhy  staff       21 Sep 29 21:08 FileWithoutExtension
-rw-r--r--  1 a.halaidzhy  staff       59 Sep 29 21:08 Filename with    more that      one space between    words
-rwxr-xr-x  1 a.halaidzhy  staff     1603 Sep 29 20:46 Readme.md
-rwxr-xr-x  1 a.halaidzhy  staff  1228800 Sep 29 20:46 file 1.2Mb
-rwxr-xr-x  1 a.halaidzhy  staff  1843200 Sep 29 20:46 file 1.8 Mb
-rwxr-xr-x  1 a.halaidzhy  staff  1048576 Sep 29 20:46 file1Mb
drwxr-xr-x  3 a.halaidzhy  staff      102 Sep 29 21:12 folder with some spaces
drwxr-xr-x  3 a.halaidzhy  staff      102 Sep 29 21:12 folderWithoutSpaces
drwxr-xr-x  7 a.halaidzhy  staff      238 Sep 29 20:46 reports
drwxr-xr-x  6 a.halaidzhy  staff      204 Sep 29 21:03 scripts
-rwxr-xr-x  1 a.halaidzhy  staff  2457600 Sep 29 20:46 файл 2.5 МБ
-rw-r--r--  1 a.halaidzhy  staff       40 Sep 29 21:15 Файл на русском языке
drwxr-xr-x  3 a.halaidzhy  staff      102 Sep 29 21:15 Директория на русском языке

# запускаемый скрипт-однострочник на Perl
$ cat scripts/task1.sh
perl -alne 'next if $. == 1;print join ";", @F[0..7], do{/^(\S+\s+){8}(.*)$/; $2}'

# запуск скрипта и сохранение результатов в файле
$ ls -l | scripts/task1.sh > reports/task1.out

# просмотр результата работы скрипта в файле
$ cat reports/task1.out
-rw-r--r--;1;a.halaidzhy;staff;21;Sep;29;21:08;FileWithoutExtension
-rw-r--r--;1;a.halaidzhy;staff;59;Sep;29;21:08;Filename with    more that      one space between    words
-rwxr-xr-x;1;a.halaidzhy;staff;1603;Sep;29;20:46;Readme.md
-rwxr-xr-x;1;a.halaidzhy;staff;1228800;Sep;29;20:46;file 1.2Mb
-rwxr-xr-x;1;a.halaidzhy;staff;1843200;Sep;29;20:46;file 1.8 Mb
-rwxr-xr-x;1;a.halaidzhy;staff;1048576;Sep;29;20:46;file1Mb
drwxr-xr-x;3;a.halaidzhy;staff;102;Sep;29;21:12;folder with some spaces
drwxr-xr-x;3;a.halaidzhy;staff;102;Sep;29;21:12;folderWithoutSpaces
drwxr-xr-x;7;a.halaidzhy;staff;238;Sep;29;20:46;reports
drwxr-xr-x;6;a.halaidzhy;staff;204;Sep;29;21:03;scripts
-rwxr-xr-x;1;a.halaidzhy;staff;2457600;Sep;29;20:46;файл 2.5 МБ
-rw-r--r--;1;a.halaidzhy;staff;40;Sep;29;21:15;Файл на русском языке
drwxr-xr-x;3;a.halaidzhy;staff;102;Sep;29;21:15;Директория на русском языке

# Комментарий:
1) next if $. == 1; # пропускаем первую строку вывода ls -l "total N"
2) do{/^(\S+\s+){8}(.*)$/; $2} # получаем имя файла, отыскав его регулярным выражением по количеству колонок. $2
                               # вернёт совпадение во вторых скобках, то есть от 9 колонки и дальше
3) print join ";", @F[0..7], do{/^(\S+\s+){8}(.*)$/; $2} # разделяем первые 8 колонок со служебной информацией и имя
                                                         # файла, объединённых в список с помощью разделителя ';', и
                                                         # выводим полученную строку
