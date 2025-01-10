#!/usr/bin/perl
use strict;


open FILE,"top50_loci_isoform_number";
while(<FILE>){
	chomp;
	my @aa = split;
	print "bb<-aa[aa\$V1==\"$aa[0]\",]\n";
	print "bb[,1]<-NULL\nrownames(bb)=paste(bb[,1])\nbb[,1]<-NULL\n";
	print "pheatmap(bb,cluster_cols = F,na_col=\"grey\",border_color=\"black\",color = colorRampPalette(rev(brewer.pal(n = 7, name = \"RdYlBu\")))(100))\n\n\n";
}
close FILE;
