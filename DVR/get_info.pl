#!/usr/bin/perl
use strict;


my %hash_pos;
open FILE,"candidate.list8";
while(<FILE>){
	chomp;
	my @aa = split;
	my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]"."\t"."$aa[4]"."\t"."$aa[5]"."\t"."$aa[6]"."\t"."$aa[7]";
	$hash_pos{$aa[3]} = $label;
}
close FIEL;

open FILE,"specific_region_cor_isoform.list";
my %hash_iso;

while(<FILE>){
	chomp;
        my @aa = split;
	my $label = join("-",@aa[1..@aa]);
	push @{$hash_iso{$label}},$aa[0];
}
close FILE;


open FILE,"same_type.txt";
while(<FILE>){
	chomp;
	my @aa = split;
#	my $temp = join("\t",@{$hash_iso{$aa[0]}});
	my @temp = @{$hash_iso{$aa[0]}};
	foreach my $temp(@temp)	{
		next unless(exists $hash_pos{$temp});
		print "$aa[0]\t$aa[1]\t$temp\t$hash_pos{$temp}\n";
	}
}
close FILE;
	
