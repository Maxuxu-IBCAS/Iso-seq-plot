#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash_ex;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_ex{$aa[0]} = join("\t",@aa[0..4]);
}
close FILE;

open FILE,"$ARGV[1]";
my %hash_order;
while(<FILE>){
	chomp;
	my @aa = split;
	push @{$hash_order{$aa[-1]}},$aa[0];
}
close FILE;

open FILE,"$ARGV[2]";
while(<FILE>){
	chomp;
	my @aa = split;
	my @temp = @{$hash_order{$aa[0]}};
	foreach my $temp(@temp){
		print "$hash_ex{$temp}\n";
	}
}
close FILE;
