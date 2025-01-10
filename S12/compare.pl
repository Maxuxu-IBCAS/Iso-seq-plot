#!/usr/bin/perl
use strict;

my %hash_len;
my %hash_isoform_nu;


open FILE,"locus_position.bed";
while(<FILE>){
	chomp;
	my @aa = split;
	my $len = $aa[2]-$aa[1]+1;
	$hash_len{$aa[3]} = $len;
}
close FILE;

open FILE,"locus_and_isoform_number.txt";
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_isoform_nu{$aa[0]} = $aa[1];
}
close FILE;


open FILE,"candidate_loci.list";
my %hash_novel;
while(<FILE>){
	chomp;
	my @aa = split;
	print "$aa[0]\tlen\t$hash_len{$aa[0]}\tnovel\n";
	print "$aa[0]\tnumber\t$hash_isoform_nu{$aa[0]}\tnovel\n";
	$hash_novel{$aa[0]} = 1;
}
close FILE;


open FILE,"isoform_with_B73_Gene.txt";
while(<FILE>){
	chomp;
	my @aa = split;
	next if(exists $hash_novel{$aa[0]});
	print "$aa[0]\tlen\t$hash_len{$aa[0]}\tknown\n";
        print "$aa[0]\tnumber\t$hash_isoform_nu{$aa[0]}\tknown\n";
}

