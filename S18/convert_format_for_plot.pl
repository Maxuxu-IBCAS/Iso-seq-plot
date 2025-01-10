#!/usr/bin/perl
use strict;


my %hash_translation;
open FILE,"/mnt/maxuxu/zhanglab_data/02_anther_ribo-seq_data/02_mapped_to_C72_tophat/combined_FPKM.2.txt";
while(<FILE>){
	chomp;
	my @aa = split;
	my @temp;
	for(my $n=1;$n<@aa;$n++){
                next if($aa[$n] eq "NA");
                push @temp, $aa[$n];
        }
        @temp = sort {$a<=>$b} @temp;
	$hash_translation{$aa[0]} = $temp[-1];
#	print "$aa[0]\t$temp[-1]\n";
}
close FILE;


my %hash_transcription;
open FILE,"/mnt/maxuxu/zhanglab_data/01_anther_ssRNA-seq_data/02_alignment_to_C72_hasit2/combined.B73.combine_replication.txt";
while(<FILE>){
        chomp;
        my @aa = split;
        my @temp;
        for(my $n=1;$n<@aa;$n++){
                next if($aa[$n] eq "NA");
                push @temp, $aa[$n];
        }
        @temp = sort {$a<=>$b} @temp;
        $hash_transcription{$aa[0]} = $temp[-1];
}
close FILE;


open FILE2,">for_plot.txt";


my %hash_pme;
open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/17_calculate_PME/PME_matrix";
while(<FILE>){
	chomp;
	my @aa = split;
	my @temp;
	for(my $n=1;$n<@aa;$n++){
                next if($aa[$n] eq "NA");
                push @temp, $aa[$n];
        }
        @temp = sort {$a<=>$b} @temp;
        $hash_pme{$aa[0]} = $temp[-1];
}
close FILE;

open FILE,"isoform_with_B73_Gene.txt";
my $available_anno;
my $pme_anno;
while(<FILE>){
        chomp;
        my @aa = split;
        $hash_translation{$aa[0]} = 0 unless(exists $hash_translation{$aa[0]});
        print FILE2 "$aa[0]\tanno_loci\t$hash_pme{$aa[0]}\tPME\n";
	print FILE2 "$aa[0]\tanno_loci\t$hash_translation{$aa[0]}\ttranslation\n";
	print FILE2 "$aa[0]\tanno_loci\t$hash_transcription{$aa[0]}\ttranscription\n";
}
close FILE;



open FILE,"candidate_loci.list";
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_translation{$aa[0]} = 0 unless(exists $hash_translation{$aa[0]});
	print FILE2 "$aa[0]\tnovel_loci\t$hash_pme{$aa[0]}\tPME\n";
	print FILE2 "$aa[0]\tnovel_loci\t$hash_translation{$aa[0]}\ttranslation\n";
	print FILE2 "$aa[0]\tnovel_loci\t$hash_transcription{$aa[0]}\ttranscription\n";
}
close FILE;


	






	
