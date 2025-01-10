perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/05_lncRNA_NEW/00_lncRNA_detection/combined.results.final";while(<FILE>){chomp;@aa=split;print "$_\n" if(exists $hash{$aa[0]})}' pb.availabel.matrix >combined.results.final


#perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/05_lncRNA_NEW/00_lncRNA_detection/combined.results.final.matrix";while(<FILE>){chomp;@aa=split;print "$_\n" if(exists $hash{$aa[0]})}' pb.availabel.matrix >combined.results.final.matrix


#perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"combined.results";while(<FILE>){chomp;@aa=split;print "$_\n" if(exists $hash{$aa[0]})}' pb.availabel.matrix >combined.results.new
#perl -e 'while(<>){chomp;@aa=split;print "$aa[0]\t";for(my $n=1;$n<@aa;$n++){if($aa[$n]==1){$aa[$n]=0}else{$aa[$n]=1}print "$aa[$n]\t"}print "\n"}' combined.results.new >combined.results.new_0-1
#perl /mnt/maxuxu/scripts/convert_plot_format.pl combined.results.new_0-1
