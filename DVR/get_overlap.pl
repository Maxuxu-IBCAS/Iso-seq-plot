#!/usr/bin/perl
use strict;

open FILE,"candidate.list8";
my %hash;
my %hash_name;
my %hash_type;

while(<FILE>){
	chomp;
	my @aa = split;
	$aa[-1] = "type2" if($aa[-1] eq "type5");
	$aa[-1] = "type3" if($aa[-1] eq "type7");
	next unless($aa[-1] eq "type1" or $aa[-1] eq "type2" or $aa[-1] eq "type3" or $aa[-1] eq "type4");
	my @bb = split /_/,$aa[3];
	$hash_name{$bb[0]} = 1;
	my $label = "$bb[0]"."\t"."$aa[-1]";
	$hash{$label} = 1;
}
close FILE;


my @name = qw/type1 type2 type3 type4/;
print "PB\ttype1\ttype2\ttype3\ttype4\n";
foreach my $aa(keys %hash_name){
	print "$aa\t";
	foreach my $name(@name){
		my $label = "$aa"."\t"."$name";
		$hash{$label} = 0 unless(exists $hash{$label});
		print "$hash{$label}\t";
	}
	print "\n";
}
	
