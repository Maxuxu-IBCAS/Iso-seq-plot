#!/usr/bin/perl
use strict;

open FILE,"/mnt/maxuxu/data/anther_pacbio_han/version_five/01_available_isoform/locus_position.bed";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash{$aa[3]} = $_;
}
close FILE;

open FILE,"candidate.list8";
while(<FILE>){
	chomp;
	my @aa = split;
	my @temp = split /_/,$aa[3];
	my @pos = split /\t/,$hash{$temp[0]};
	my $label;
	if($aa[-1] eq "type1"){
		$label = "Phase1";
	}elsif($aa[-1] eq "type2"){
		$label = "Phase2(a)";
	}elsif($aa[-1] eq "type5"){
                $label = "Phase2(b)";
	}elsif($aa[-1] eq "type3"){
                $label = "Phase3(a)";
	}elsif($aa[-1] eq "type7"){
                $label = "Phase3(b)";
	}elsif($aa[-1] eq "type4"){
                $label = "Phase4";
        }
	print "$temp[0]\t$pos[0]\t$pos[1]\t$pos[2]\t$pos[-1]\t$aa[0]-$aa[1]-$aa[2]\t$label\n";
}
close FILE;
