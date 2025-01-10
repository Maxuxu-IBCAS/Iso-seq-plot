# DVR detection
samtools depth -d 0 all.collapsed.rep.availabel.sorted.bam >all.collapsed.rep.availabel.bed
perl 01_combine_same_number_region.pl >S1.temp.bed
perl -e 'while(<>){chomp;@aa=split;my $len = $aa[2]-$aa[1];print "$_\n" if($len>=20 and $aa[3]>0)}' S1.temp.bed >S2.temp.bed
bedtools intersect -a S2.temp.bed -b locus_position.bed -wao >S2.overlap_with_locus.bed
perl 02_filter.pl >S3.temp.gtf


perl 03_get_specific_region_FPKM_percentage.pl >candidate.list
#perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}open FILE,"candidate.list";while(<FILE>){chomp;@aa=split;@bb=split /_/,$aa[3];print "$_\n" unless(exists $hash{$bb[0]})}' loci_overlap_with_adjacent.list >candidate.list2 

#perl combine.pl >candidate.list3
#perl 04_filter.pl candidate.list3 >candidate.list4
#perl combine_stage.pl >candidate.list5
#perl filter.pl >candidate.list6
#perl convert_format.pl candidate.list6 candidate.list7





# R

#perl classification.pl >candidate.list8
#perl -e 'while(<>){chomp;@aa=split;@bb = split /_/,$aa[3];$hash{$bb[0]}=1}foreach my $aa(keys %hash){print "$aa\n"}' candidate.list8 >candidate.list8.loci

#3c
awk '$9=="type1"' candidate.list8 >candidate.list8.sorted
awk '$9=="type2"' candidate.list8 >>candidate.list8.sorted
awk '$9=="type5"' candidate.list8 >>candidate.list8.sorted
awk '$9=="type3"' candidate.list8 >>candidate.list8.sorted
awk '$9=="type7"' candidate.list8 >>candidate.list8.sorted
awk '$9=="type4"' candidate.list8 >>candidate.list8.sorted

awk '$9=="type1"' candidate.list8 | perl -e 'while(<>){chomp;@aa=split;@bb = split /_/,$aa[3];$hash{$bb[0]}+=1}my $nu = keys %hash;print "$nu\n"' -

# plot
#perl get_overlap.pl >overlap.txt
#perl /mnt/maxuxu/scripts/convert_plot_format.pl  overlap.txt 


# gene_expression
#perl get_loci_expression.representative.pl >candidate.list8.loci.representative
#perl step5_convert_format_based_on_normalization_largest_fpkm.pl  candidate.list8.loci.representative >candidate.list8.loci.representative.nor

# check DVA accuracy
bedtools intersect -a specific_region.bed -b exon.bed -wao >specific_region.intersect_with.exon.bed

perl get_specific_region_cor_isoform.pl specific_region.intersect_with.exon.bed >specific_region_cor_isoform.list

perl check.pl | perl -e 'while(<>){chomp;@aa=split;my %hash;for(my $n=1;$n<@aa;$n++){$hash{$aa[$n]}=1}my $nu = keys %hash;print "$_\n" if($nu==1)}' - >same_type.txt
perl get_info.pl >two_and_more_checkable_regaion.txt


#perl -e 'while(<>){chomp;@aa=split;$hash{$aa[3]}=1}open FILE,"two_and_more_checkable_regaion.txt";while(<FILE>){chomp;@aa=split;print "$_\n" if(exists $hash{$aa[2]})}' ../13_specific_isoform_detection_V2_used/candidate.list8.with_one_VR_to_one_isoform | perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}+=1}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - | awk '$2>1' - | wc -l

#perl -e 'while(<>){chomp;@aa=split;$hash{$aa[3]}=1}open FILE,"two_and_more_checkable_regaion.txt";while(<FILE>){chomp;@aa=split;print "$_\n" if(exists $hash{$aa[2]})}' ../13_specific_isoform_detection_V2_used/candidate.list8.with_one_VR_to_one_isoform | awk '$2=="type2"' - | perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}+=1}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' - | awk '$2>1' - | wc -l


perl check.pl | perl -e 'while(<>){chomp;@aa=split;$nu = @aa-1;$hash{$nu}+=1}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' -
perl -e 'while(<>){chomp;@aa=split;my %hash;for(my $n=1;$n<@aa;$n++){$hash{$aa[$n]}=1};$nu = keys %hash;print "$_\n" if($nu==1)}' same_type.txt | perl -e 'while(<>){chomp;@aa=split;$nu = @aa-1;$hash{$nu}+=1}foreach my $aa(keys %hash){print "$aa\t$hash{$aa}\n"}' -

perl -e 'while(<>){chomp;@aa = split;$bb = $aa[1]-$aa[2];print "$aa[0]\t$aa[2]\tidentified\n$aa[0]\t$bb\tnotidentified\n"}' results.txt >results.for_plot


## go annotation
awk '$2==1 && $3==0 && $4==0 && $5==0' overlap.txt >stage1.gene
awk '$2==0 && $3==1 && $4==0 && $5==0' overlap.txt >stage2.gene
awk '$2==0 && $3==0 && $4==1 && $5==0' overlap.txt >stage3.gene
awk '$2==0 && $3==0 && $4==0 && $5==1' overlap.txt >stage4.gene

perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=$aa[1]}open FILE,"stage1.gene";while(<FILE>){chomp;@aa=split;print "$hash{$aa[0]}\n" if(exists $hash{$aa[0]})}' isoform_with_B73_Gene.txt >cluster.1.gene_list.txt
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=$aa[1]}open FILE,"stage2.gene";while(<FILE>){chomp;@aa=split;print "$hash{$aa[0]}\n" if(exists $hash{$aa[0]})}' isoform_with_B73_Gene.txt >cluster.2.gene_list.txt
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=$aa[1]}open FILE,"stage3.gene";while(<FILE>){chomp;@aa=split;print "$hash{$aa[0]}\n" if(exists $hash{$aa[0]})}' isoform_with_B73_Gene.txt >cluster.3.gene_list.txt
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=$aa[1]}open FILE,"stage4.gene";while(<FILE>){chomp;@aa=split;print "$hash{$aa[0]}\n" if(exists $hash{$aa[0]})}' isoform_with_B73_Gene.txt >cluster.4.gene_list.txt


perl -e 'while(<>){chomp;@aa=split /\t/;@bb = split /\//,$aa[2];$ratio = $bb[0]/$bb[1];print "$aa[0]\t$aa[1]\t$aa[-1]\t$ratio\n"}' plot.go.txt >plot.go.2.txt

perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}foreach my $aa(keys %hash){print "$aa\n"}' cluster.1.gene_list.txt >cluster.1.gene_list.tmp
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}foreach my $aa(keys %hash){print "$aa\n"}' cluster.2.gene_list.txt >cluster.2.gene_list.tmp
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}foreach my $aa(keys %hash){print "$aa\n"}' cluster.3.gene_list.txt >cluster.3.gene_list.tmp
perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=1}foreach my $aa(keys %hash){print "$aa\n"}' cluster.4.gene_list.txt >cluster.4.gene_list.tmp


