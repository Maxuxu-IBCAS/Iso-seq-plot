#!/usr/bin/perl
use strict;

open FILE,"candidate.list5";
while(<FILE>){
	chomp;
	my @aa = split;
	my $nu = $_=~s/NA/NA/g;
	next if($nu==3);
	my @temp;
	for(my $n=4;$n<@aa;$n++){
		push @temp,$aa[$n] unless($aa[$n] eq "NA");
	#	print "$aa[$n]\n" unless($aa[$n] eq "NA");
	}
	@temp = sort {$a<=>$b} @temp;
#	print "$_\t$temp[0]\t$temp[-1]\n";
	my $fold = $temp[0]/$temp[-1];
	print "$_\n" if($fold<0.5 and $temp[-1]>0.1);
}
close FILE;
