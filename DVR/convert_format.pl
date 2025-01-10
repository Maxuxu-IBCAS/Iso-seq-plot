#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
open FILE2,">$ARGV[1]";


my %hash;
while(<FILE>){
	chomp;
	$_=~s/NA/0/g;
	my @aa = split;
	my @temp = sort {$a<=>$b} @aa[4..@aa];

	if(exists $hash{$aa[3]}){
	}else{
		$hash{$aa[3]} =1;

	print FILE2 "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t";
	for(my $n=4;$n<@aa;$n++){
	
		my $temp = $aa[$n]/$temp[-1];
		print FILE2 "$temp\t";
	
	}
	print FILE2 "\n";
	}
}
close FILE;
close FILE2;
