#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
open FILE2,">$ARGV[1]";

while(<FILE>){
	chomp;
	my @aa = split;
	my @bb;
	if(/^Gene/){
		print FILE2 "$_\n";
		next;
	}
	print FILE2 "$aa[0]\t";
	$bb[0] = ($aa[1]+$aa[2])/2;
	$bb[1] = ($aa[3]+$aa[4])/2;
	$bb[2] = ($aa[5]+$aa[6])/2;
	$bb[3] = ($aa[7]+$aa[8])/2;
	$bb[4] = ($aa[9]+$aa[10])/2;
	$bb[5] = ($aa[11]+$aa[12])/2;
	$bb[6] = ($aa[13]+$aa[14])/2;
	$bb[7] = ($aa[15]+$aa[16])/2;
	$bb[8] = ($aa[17]+$aa[18])/2;
	$bb[9] = ($aa[19]+$aa[20])/2;
	my $temp = join("\t",@bb);
	print FILE2 "$temp\n";
}
close FILE;
close FILE2;
