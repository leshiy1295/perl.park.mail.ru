# реальный список файлов директории
$ ls -l
итого 6428
-rwxrwxrwx 1 root root 1228800 сент. 28 14:52 file 1.2Mb
-rwxrwxrwx 1 root root 1843200 сент. 28 14:52 file 1.8 Mb
-rwxrwxrwx 1 root root 1048576 сент. 28 12:38 file1Mb
-rwxrwxrwx 1 root root       0 сент. 28 12:39 Filename with    more that      one space between    words
-rwxrwxrwx 1 root root       0 сент. 28 10:57 FileWithoutExtension
drwxrwxrwx 2 root root       0 сент. 28 14:48 folderWithoutSpaces
drwxrwxrwx 2 root root       0 сент. 28 08:24 folder with some spaces
-rwxrwxrwx 1 root root    1603 сент. 28 11:15 Readme.md
drwxrwxrwx 2 root root       0 сент. 28 14:55 reports
drwxrwxrwx 2 root root       0 сент. 28 14:55 scripts
drwxrwxrwx 2 root root       0 сент. 28 08:26 Директория на русском языке
-rwxrwxrwx 1 root root 2457600 сент. 28 14:52 файл 2.5 МБ
-rwxrwxrwx 1 root root       0 сент. 28 10:57 Файл на русском языке

# запускаемый скрипт-однострочник на Perl
$ cat scripts/task1.sh
perl -alne 'next if $#F < 8;print join ";", @F[0..7], do {/:\d\d\s(.*)/; $1}'

# запуск скрипта и сохранение результатов в файле
$ ls -l | scripts/task1.sh > reports/task1.out

# просмотр результата работы скрипта в файле
$ cat reports/task1.out
-rwxrwxrwx;1;root;root;1228800;сент.;28;14:52;file 1.2Mb
-rwxrwxrwx;1;root;root;1843200;сент.;28;14:52;file 1.8 Mb
-rwxrwxrwx;1;root;root;1048576;сент.;28;12:38;file1Mb
-rwxrwxrwx;1;root;root;0;сент.;28;12:39;Filename with    more that      one space between    words
-rwxrwxrwx;1;root;root;0;сент.;28;10:57;FileWithoutExtension
drwxrwxrwx;2;root;root;0;сент.;28;14:48;folderWithoutSpaces
drwxrwxrwx;2;root;root;0;сент.;28;08:24;folder with some spaces
-rwxrwxrwx;1;root;root;1603;сент.;28;11:15;Readme.md
drwxrwxrwx;2;root;root;0;сент.;28;14:58;reports
drwxrwxrwx;2;root;root;0;сент.;28;14:55;scripts
drwxrwxrwx;2;root;root;0;сент.;28;08:26;Директория на русском языке
-rwxrwxrwx;1;root;root;2457600;сент.;28;14:52;файл 2.5 МБ
-rwxrwxrwx;1;root;root;0;сент.;28;10:57;Файл на русском языке

# Комментарий:
1) next if $#F < 8; # пропускаем первую строку вывода ls -l "итого N"
2) do {/:\d\d\s(.*)/; $1} # получаем имя файла, отыскав его регулярным выражением по знаку : в дате, который больше нигде не встречается
3) print join ";", @F[0..7], do {/:\d\d\s(.*)/; $1} # разделяем первые 8 колонок со служебной информацией и имя файла,
                                                    # объединённых в список с помощью разделителя ';', и выводим полученную строку
