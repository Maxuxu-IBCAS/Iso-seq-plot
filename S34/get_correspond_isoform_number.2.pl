#!/usr/bin/perl
use strict;

my %hash_gene;
my %hash_loci;
my %hash_cor;
open FILE,"isoform_with_B73_Gene.txt";
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_loci{$aa[0]} = 0;
	$hash_gene{$aa[1]} = 0;
	$hash_cor{$aa[0]} = $aa[1];
}
close FILE;

open FILE,"/mnt/maxuxu/data/genome/maize_v4/B73_V4/Zea_mays.AGPv4.36.gff3";

while(<FILE>){
	chomp;
	my @aa = split;
	next unless($aa[2] eq "mRNA");
	my @bb = split /;/,$aa[-1];
	$bb[-1] =~ s/transcript_id=//;
	my @cc = split /_/,$bb[-1];
	next unless(exists $hash_gene{$cc[0]});
	$hash_gene{$cc[0]}+=1;
}
close FILE;

#foreach my $aa(keys %hash_gene){
#	print "$aa\t$hash_gene{$aa}\n";
#}
#


open FILE,"all.collapsed.rep.availabel.one_line.fa";
while(<FILE>){
	chomp;
	my @aa = split /\./;
	next unless(/>/);
	my $label = "PB."."$aa[1]";
	next unless(exists $hash_loci{$label});
	$hash_loci{$label}+=1;
}
close FILE;

foreach my $aa(keys %hash_loci){
	print "$aa\tIso-seq_loci\t$hash_loci{$aa}\n";
	print "$aa\tannotated_loci\t$hash_gene{$hash_cor{$aa}}\n";
}


=head
my %hash_nu;
foreach my $aa(keys %hash_gene){
	$hash_nu{$hash_gene{$aa}}+=1;
}

my $all;
foreach my $aa(sort {$a<=>$b} keys %hash_nu){
	next if($aa==0);
	if($aa<=5){
		print "$aa\tanno\t$hash_nu{$aa}\n";
	}else{
		$all+=$aa;
	}
}
print ">5\tanno\t$all\n";

my %hash_nu;
foreach my $aa(keys %hash_loci){
        $hash_nu{$hash_loci{$aa}}+=1;
}

my $all;
foreach my $aa(sort {$a<=>$b} keys %hash_nu){
	if($aa<=5){
		
	        print "$aa\tiso\t$hash_nu{$aa}\n";
	}else{
		$all+=$aa;
        }
}
print ">5\tiso\t$all\n";
	
