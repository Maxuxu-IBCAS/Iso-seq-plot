grep '>' combined.results.final.fa | perl -e 'while(<>){chomp;@aa=split /;/;@bb = split;$bb[0]=~s/>//;$aa[-1]=~s/length=//;print "$bb[0]\t$aa[-1]\n"}' - >length.txt
