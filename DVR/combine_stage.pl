#!/usr/bin/perl
use strict;

open FILE,"candidate.list4";
while(<FILE>){
	chomp;
#	$_=~s/NA/0/g;
	my @aa = split;
	my @temp1;
	my @temp2; my @temp3;
#	push @temp1,$aa[4]; push @temp1,$aa[5]; push @temp1,$aa[6];
#	push @temp2,$aa[7]; push @temp2,$aa[8]; push @temp2,$aa[9]; push @temp2,$aa[10];
#	push @temp3,$aa[11]; push @temp3,$aa[12];
	
	print "$aa[0]\t$aa[1]\t$aa[2]\t$aa[3]\t";

	my $nu;
	for(my $n=4;$n<=6;$n++){
		$nu+=1 if($aa[$n] eq "NA");
		push @temp1,$aa[$n] unless($aa[$n] eq "NA");
	}
	if($nu==3){
		print "NA\t";
	}else{
		@temp1 = sort {$a<=>$b} @temp1;
		print "$temp1[-1]\t";
	}

	my $nu;
	for(my $n=7;$n<=10;$n++){
		$nu+=1 if($aa[$n] eq "NA");
		push @temp2,$aa[$n] unless($aa[$n] eq "NA");
	}
        if($nu==4){
                print "NA\t";
        }else{
                @temp2 = sort {$a<=>$b} @temp2;
                print "$temp2[-1]\t";
        }
	
		
	my $nu;
        for(my $n=11;$n<=12;$n++){
                $nu+=1 if($aa[$n] eq "NA");
                push @temp3,$aa[$n] unless($aa[$n] eq "NA");
        }
        if($nu==2){
                print "NA\t";
        }else{
                @temp3 = sort {$a<=>$b} @temp3;
                print "$temp3[-1]\t";
        }

	print "$aa[-1]\n";
}
close FILE;
