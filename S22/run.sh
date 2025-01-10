perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/19_loci_expression_and_isoform_expression/01_phase_V2/ssRNA-seq.isoform.expression.phase";while(<FILE>){chomp;@aa=split;print "$_\n" if($aa[0] eq "PB");@bb = split /\|/,$aa[0];print "$_\n" if(exists $hash{$bb[0]})}' pb.availabel.matrix >ssRNA-seq.isoform.expression.phase

perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"ssRNA-seq.isoform.expression.phase";while(<FILE>){chomp;@aa=split /\./;$label = "PB."."$aa[1]";print "$_\n" if(exists $hash{$label})}' cluster1.txt >cluster1.isoform
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"ssRNA-seq.isoform.expression.phase";while(<FILE>){chomp;@aa=split /\./;$label = "PB."."$aa[1]";print "$_\n" if(exists $hash{$label})}' cluster2.txt >cluster2.isoform
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"ssRNA-seq.isoform.expression.phase";while(<FILE>){chomp;@aa=split /\./;$label = "PB."."$aa[1]";print "$_\n" if(exists $hash{$label})}' cluster3.txt >cluster3.isoform
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"ssRNA-seq.isoform.expression.phase";while(<FILE>){chomp;@aa=split /\./;$label = "PB."."$aa[1]";print "$_\n" if(exists $hash{$label})}' cluster4.txt >cluster4.isoform
perl extract_gene_expressed_in_at_least_sample.2.pl cluster1.isoform cluster1.isoform.filter
perl extract_gene_expressed_in_at_least_sample.2.pl cluster2.isoform cluster2.isoform.filter
perl extract_gene_expressed_in_at_least_sample.2.pl cluster3.isoform cluster3.isoform.filter
perl extract_gene_expressed_in_at_least_sample.2.pl cluster4.isoform cluster4.isoform.filter
perl step5_convert_format_based_on_normalization_largest_fpkm.pl cluster1.isoform.filter >cluster1.isoform.filter.nor
perl step5_convert_format_based_on_normalization_largest_fpkm.pl cluster2.isoform.filter >cluster2.isoform.filter.nor
perl step5_convert_format_based_on_normalization_largest_fpkm.pl cluster3.isoform.filter >cluster3.isoform.filter.nor
perl step5_convert_format_based_on_normalization_largest_fpkm.pl cluster4.isoform.filter >cluster4.isoform.filter.nor
perl create_Rscript_for_plot.2.pl cluster1.isoform.filter.nor 4390 1 8
perl create_Rscript_for_plot.2.pl cluster2.isoform.filter.nor 6365 1 8
perl create_Rscript_for_plot.2.pl cluster3.isoform.filter.nor 3851 1 8
perl create_Rscript_for_plot.2.pl cluster4.isoform.filter.nor 4223 1 8
