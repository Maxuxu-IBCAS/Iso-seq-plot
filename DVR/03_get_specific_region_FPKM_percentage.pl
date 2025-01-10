#!/usr/bin/perl
use strict;

my %hash_value;

my %hash_name;
open FILE,"specific_region.bed";
while(<FILE>){
        chomp;
        my @aa = split;
        my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]";
        $hash_name{$label} = $aa[3];
}
close FILE;


open FILE,"coverage_combined.loci.txt";
while(<FILE>){
	chomp;
	my @aa = split;
	for(my $n=1;$n<@aa;$n++){
		my $label = "$aa[0]"."\t"."$n";
		$hash_value{$label} = $aa[$n];
	}
}
close FILE;


open FILE,"coverage_combined.3.txt";
while(<FILE>){
	chomp;
	my @aa = split;
	my $name = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]";
	print "$aa[0]\t$aa[1]\t$aa[2]\t$hash_name{$name}\t";
	for(my $n=3;$n<@aa;$n++){
		my $m = $n-2;
		my $name = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]";
		my @bb = split /_/,$hash_name{$name};

		my $label = "$bb[0]"."\t"."$m";
		my $value;
		if($hash_value{$label}<100){
			$value = "NA";
		}else{
			$value = $aa[$n]/$hash_value{$label};
		}
		print "$value\t";
	}
	
	print "\n";
}
close FILE;
