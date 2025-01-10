#!/usr/bin/perl
use strict;



open FILE,"candidate.list2";
while(<FILE>){
	chomp;
	my @aa = split;
	my $nu = (@aa-4)/2;
	print "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t";
	for(my $n=0;$n<$nu;$n++){
		my $aa = $n*2+4;
		my $bb = $n*2+5;
		my @temp;
		push @temp,$aa[$aa];
		push @temp,$aa[$bb];
		if($aa[$aa] eq "NA" or $aa[$bb] eq "NA"){
			print "NA\t";
		
		}else{
			@temp = sort {$a<=>$b} @temp;
			if($temp[1]==0){
				print "0\t";
				next;
			}
			my $value = $temp[0]/$temp[1];
			if($value>0.8){
				my $mean = ($temp[0]+$temp[1])/2;
				print "$mean\t";
			}else{
				print "NA\t";
			}
		}
	}
	print "\n";
}

