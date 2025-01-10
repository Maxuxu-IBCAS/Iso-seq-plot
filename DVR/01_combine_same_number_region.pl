#!/usr/bin/perl
use strict;

my $chr;
my $nu = 0;
my $cha = 0;
my $start;
my $end;
my $read_number;
open FILE,"all.collapsed.rep.availabel.bed";
while(<FILE>){
	chomp;
	my @aa = split;
	$nu += 1;
	if($nu==1){
		$chr = $aa[0];
		$start = $aa[1];
		$read_number = $aa[2];
		$end = $aa[1];
		next;
	}

	if($chr eq $aa[0]){
		if($aa[2] == $read_number){
			my $temp = $aa[1]-$end;
			if($temp==1){
				$end = $aa[1];
			}else{
				print "$chr\t$start\t$end\t$read_number\n";
				$start = $aa[1];
				$end = $aa[1];
			}



		}else{
			print "$chr\t$start\t$end\t$read_number\n";
			$start = $aa[1];
			$end = $aa[1];
			$read_number = $aa[2];
		}

	}else{
		print "$chr\t$start\t$end\t$read_number\n";
		$chr = $aa[0];
		$start = $aa[1];
		$end = $aa[1];
		$read_number = $aa[2];
	}





}
print "$chr\t$start\t$end\t$read_number\n";
