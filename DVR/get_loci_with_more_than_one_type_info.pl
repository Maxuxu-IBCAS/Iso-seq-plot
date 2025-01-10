#!/usr/bin/perl
use strict;


my %hash_loci;
open FILE,"loci_with_more_than_one_type.txt";
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_loci{$aa[0]} = $aa[-1];
}
close FILE;


my %hash_b73;
open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/02_compare_with_B73_annotated_genome/B73_V4_cor_isoform.txt";
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_b73{$aa[1]} = $aa[0];
}
close FILE;

open FILE,"/mnt/maxuxu/data/genome/maize_v4/B73_V4/B73_AGPv4_gene_func_symbol/B73_AGPv4_gene_func_symbol.xls";
my %hash_anno;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_anno{$aa[0]} = $_;
}
close FILE;


open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/01_available_isoform/locus_and_isoform_number.txt";
my %hash_nu;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_nu{$aa[0]} = $aa[1];
}
close FILE;

open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/01_available_isoform/locus_position.bed";
my %hash_pos;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_pos{$aa[3]} = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]";
}
close FILE;


open FILE,"candidate.list8";
while(<FILE>){
	chomp;
	my @aa = split;
	my @bb = split /_/,$aa[3];
	next unless(exists $hash_loci{$bb[0]});
	print "$_\t$hash_nu{$bb[0]}\t$hash_loci{$bb[0]}\t$hash_anno{$hash_b73{$bb[0]}}\n";
}
close FILE;




