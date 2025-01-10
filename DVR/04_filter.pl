#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	my @temp;
	for(my $n=4;$n<@aa;$n++){
		push @temp,$aa[$n] unless($aa[$n] eq "NA");
	}
	@temp = sort {$a<=>$b} @temp;
	next if(@temp==1);
	
	next if($temp[-1] == 0);
	
	#
	my $largest = $temp[0]/$temp[-1];
	
	#
#	print "$_\n" if($largest < 0.5 and $temp[-1]>0.1);
	print "$_\n" if($largest < 0.5);

}
	
	
