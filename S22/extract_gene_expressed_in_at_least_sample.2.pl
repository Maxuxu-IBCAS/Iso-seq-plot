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
#			next if($n==3 or $n==9);
			push @temp,$aa[$n];
		}
		@temp = sort {$a<=>$b} @temp;
		
		if($temp[-1]>0.5){
			print FILE2 "$_\n";
		}
	}
}
close FILE;
close FILE2;
