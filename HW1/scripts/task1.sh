perl -alne 'next if $#F < 8;print join ";", @F[0..7], do {/:\d\d\s(.*)/; $1}'
