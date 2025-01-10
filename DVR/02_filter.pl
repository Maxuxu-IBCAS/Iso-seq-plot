#!/usr/bin/perl
use strict;


open FILE,"locus_and_isoform_number.txt";
my %hash_nu;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_nu{$aa[0]} = $aa[1];
}
close FILE;


open FILE,"S2.overlap_with_locus.bed";
open FILE2,">specific_region.bed";
open FILE3,">specific_region.with_one_isoform.bed";
my %hash_iso_nu;
while(<FILE>){
	chomp;
	my @aa = split;
	next if($aa[3] == $hash_nu{$aa[7]});
	$hash_iso_nu{$aa[7]} += 1;
	my $label = "$aa[7]"."_"."$hash_iso_nu{$aa[7]}";
	print "$aa[0]\tPacbio\ttranscript\t$aa[1]\t$aa[2]\t.\t$aa[-2]\t.\tgene_id \"$label\"; transcript_id \"$label.1\";\n";
	print "$aa[0]\tPacbio\texon\t$aa[1]\t$aa[2]\t.\t$aa[-2]\t.\tgene_id \"$label\"; transcript_id \"$label.1\";\n";
	$aa[1] = $aa[1]-1;
	print FILE2 "$aa[0]\t$aa[1]\t$aa[2]\t$label\n";
	my $temp = $hash_nu{$aa[7]}-$aa[3];
	if($aa[3] == 1){
		print FILE3 "$aa[0]\t$aa[1]\t$aa[2]\t$label\n";
	}
}
close FILE;
close FILE2;
close FILE3;
