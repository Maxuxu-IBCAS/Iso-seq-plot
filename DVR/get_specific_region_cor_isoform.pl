#!/usr/bin/perl
use strict;

my %hash;
open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	push @{$hash{$aa[3]}},$aa[-3];

}
close FILE;


foreach my $aa(sort {$a<=>$b} keys %hash){
	my @temp = sort {$a<=>$b} @{$hash{$aa}};
	my $temp = join("\t",@temp);
	print "$aa\t$temp\n";
}
	
