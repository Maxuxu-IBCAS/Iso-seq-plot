#!/usr/bin/perl
use strict;
open FILE,"$ARGV[0]";

while(<FILE>){
	chomp;
	my @aa = split;
	my @temp;
	if(/Gene/){
		foreach my $i(@aa){
			print "$i\t";
		}
		print "\n";
		next;
	}
	for(my $n=1;$n<@aa-1;$n++){
		push @temp,"$aa[$n]";
	}
	@temp = sort{$a<=>$b} @temp;
	next if($temp[-1]<1);
	print "$aa[0]\t";
	for(my $n=1;$n<@aa-1;$n++){
		my $value = $aa[$n]/$temp[-1];
		$value = 0.001 if($value == 0);
		print "$value\t";
	}
	print "$aa[-1]\n";
}
close FILE;
	
