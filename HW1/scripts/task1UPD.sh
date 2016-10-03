perl -nlE 'next if $.==1;$,=";";@F=split " ",$_,9;say @F'
