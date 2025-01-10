#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
open FILE2,">$ARGV[1]";

while(<FILE>){
	chomp;
	my @aa = split;
	if(/^Gene/){
		print FILE2 "$_\n";
	}else{
		my @temp;
		for(my $n=1;$n<@aa;$n++){
			next if($n==3 or $n==9);
			push @temp,$aa[$n];
		}
		@temp = sort {$a<=>$b} @temp;
		
		if($temp[-1]>1){
			print FILE2 "$aa[0]\t$aa[1]\t$aa[2]\t$aa[4]\t$aa[5]\t$aa[6]\t$aa[7]\t$aa[8]\t$aa[10]\n";
		}
	}
}
close FILE;
close FILE2;
