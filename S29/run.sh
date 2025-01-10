perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"pb.availabel.matrix";while(<FILE>){chomp;@aa=split;print "$_\n" if(exists $hash{$aa[0]})}' combined.results.final >combined.results.final.each_stage

awk '$2==1 || $3==1 || $4==1 || $5==1' combined.results.final.each_stage | wc -l
awk '$2==1 || $3==1 || $4==1 || $5==1' combined.results.final.each_stage | perl -e 'while(<>){chomp;@aa=split /\./;$hash{$aa[1]}+=1}foreach my $aa(keys %hash){print "$aa\n"}' - | wc -l

awk '$6==1 || $7==1 || $8==1 || $9==1' combined.results.final.each_stage | wc -l
awk '$6==1 || $7==1 || $8==1 || $9==1' combined.results.final.each_stage | perl -e 'while(<>){chomp;@aa=split /\./;$hash{$aa[1]}+=1}foreach my $aa(keys %hash){print "$aa\n"}' - | wc -l

awk '$10==1' combined.results.final.each_stage | wc -l
awk '$10==1' combined.results.final.each_stage | perl -e 'while(<>){chomp;@aa=split /\./;$hash{$aa[1]}+=1}foreach my $aa(keys %hash){print "$aa\n"}' - | wc -l

awk '$11==1' combined.results.final.each_stage | wc -l
awk '$11==1' combined.results.final.each_stage | perl -e 'while(<>){chomp;@aa=split /\./;$hash{$aa[1]}+=1}foreach my $aa(keys %hash){print "$aa\n"}' - | wc -l
