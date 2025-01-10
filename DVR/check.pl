#!/usr/bin/perl
use strict;


open FILE,"candidate.list8";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	
	next if($aa[-1] eq "type7");
	$hash{$aa[3]} = $aa[-1];

}
close FILE;


open FILE,"specific_region_cor_isoform.list";
my %hash2;

while(<FILE>){
	chomp;
	my @aa = split;
	next unless(exists $hash{$aa[0]});
	my $label = join("-",@aa[1..@aa]);
	push @{$hash2{$label}}, $hash{$aa[0]};
}
close FILE;


foreach my $aa(keys %hash2){
	
	next if(@{$hash2{$aa}}==1);
	my $temp = join("\t",@{$hash2{$aa}});
	$temp =~ s/type5/type2/g;
	print "$aa\t$temp\n";
}
