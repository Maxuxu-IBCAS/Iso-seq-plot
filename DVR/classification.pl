#!/usr/bin/perl
use strict;


open FILE,"class.txt";
my %hash_type;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_type{$aa[1]} = $aa[0];
}
close FILE;

my %hash;
open FILE,"resuts.txt";
while(<FILE>){
	chomp;
	$_=~s/\"//g;
	my @aa = split;
	$hash{$aa[0]} = $hash_type{$aa[1]} if(exists $hash_type{$aa[1]});
}
close FILE;


open FILE,"candidate.list7";
while(<FILE>){
	chomp;
	my @aa = split;
	print "$_\t$hash{$aa[3]}\n" if(exists $hash{$aa[3]});
}
close FILE;
