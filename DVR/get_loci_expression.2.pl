#!/usr/bin/perl
use strict;

my %hash;
open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/01_available_isoform/06_expression_and_translation/ssRNA-seq.loci.expression.combined";
while(<FILE>){
	chomp;
	my @aa = split;
	my @bb;
	for(my $n=1;$n<@aa;$n++){
		push @bb,$aa[$n];
	}
	@bb = sort {$a<=>$b} @bb;
	next if($bb[-1] == 0);
	my $ju = 1;
	for(my $n=2;$n<@aa;$n++){
		my $m = $n-1;
		if($aa[$n]>$aa[$m]){
			$ju = $n;
		}
	}
	if($ju == 1){
		$hash{$aa[0]} = "0.5";
	}elsif($ju == 2){
		$hash{$aa[0]} = "1.0";
	}elsif($ju == 3){
                $hash{$aa[0]} = "1.3";
	}elsif($ju == 4){
                $hash{$aa[0]} = "1.5";
	}elsif($ju == 5){
                $hash{$aa[0]} = "2.0";
	}elsif($ju == 6){
                $hash{$aa[0]} = "2.5";
	}elsif($ju == 7){
                $hash{$aa[0]} = "3.0";
	}elsif($ju == 8){
                $hash{$aa[0]} = "4.0";
	}elsif($ju == 9){
                $hash{$aa[0]} = "5.0";
	}elsif($ju == 10){
                $hash{$aa[0]} = "pollen";
	}
}
close FILE;

open FILE,"candidate.list8";
while(<FILE>){
	chomp;
	my @aa = split;
	my @bb = split /_/,$aa[3];
	if($aa[-1] eq "type1"){
		next if($hash{$bb[0]} eq "0.5" or $hash{$bb[0]} eq "1.0" or $hash{$bb[0]} eq "1.3");
		print "$_\t$hash{$bb[0]}\n";
	}elsif($aa[-1] eq "type2" or $aa[-1] eq "type5"){
		next if($hash{$bb[0]} eq "2.5" or $hash{$bb[0]} eq "2.0" or $hash{$bb[0]} eq "1.5" or $hash{$bb[0]} eq "3.0");
		print "$_\t$hash{$bb[0]}\n";
	}elsif($aa[-1] eq "type3" or $aa[-1] eq "type7"){
                next if($hash{$bb[0]} eq "3.5" or $hash{$bb[0]} eq "4.0");
                print "$_\t$hash{$bb[0]}\n";
	}elsif($aa[-1] eq "type4"){
                next if($hash{$bb[0]} eq "pollen");
                print "$_\t$hash{$bb[0]}\n";
        }
}
close FILE;

