perl -e 'while(<>){chomp;@aa=split;next if(/trans/);@bb = split /\./,$aa[0];$hash{$bb[1]}+=1}foreach my $aa(keys %hash){$hash{$aa}=20 if($hash{$aa}>20);print "$hash{$aa}\tlncRNA\n"}' combined.results.final >lncRNA_isoform.number

perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"locus_and_isoform_number.txt";while(<FILE>){chomp;@aa=split;next unless(exists $hash{$aa[0]});$aa[1]=20 if($aa[1]>20);print "$aa[1]\tcoding\n"}' isoform_with_B73_Gene.txt >coding_isoform_distribution

cat lncRNA_isoform.number coding_isoform_distribution >for_plot.S28.txt
