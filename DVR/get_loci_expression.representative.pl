#!/usr/bin/perl
use strict;


open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/10_ssRNA-seq/02_expression/Hisat_stringtie.FPKM.replication_combined.representative";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash{$aa[0]} = $_;
}
close FILE;


my %hash2;
open FILE,"candidate.list8";
while(<FILE>){
	chomp;
	my @aa = split;
	my @bb = split /_/,$aa[3];
	my $label = "$bb[0]"."\t"."$aa[-1]";
	if(exists $hash2{$label}){
	}else{
		print "$hash{$bb[0]}\t$aa[-1]\n";
		$hash2{$label} = 1;
	}
}
close FILE;
