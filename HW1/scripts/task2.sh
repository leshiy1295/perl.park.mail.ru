perl -nlaF';' -e 'do {print $F[8]; $count++} if $F[4]>2**20}{ print qq(Всего строк в таблице: $.. Файлов размера больше 1МБ: ), $count //= 0'
