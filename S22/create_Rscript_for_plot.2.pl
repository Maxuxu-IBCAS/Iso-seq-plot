#!/usr/bin/perl
use strict;


my $file = $ARGV[0];
my $line_number = $ARGV[1];
my $file_number = $ARGV[2];
my $cluster = $ARGV[3];
for(my $n=1;$n<=$file_number;$n++){
	open FILE,">$ARGV[0].c$cluster.$n.R";
	print FILE "aa<-read.table(\"$file\")\n";
	print FILE "library(\"gplots\")\n";
	print FILE "rownames(aa)=aa[,1]\naa[,1]<-NULL\nset.seed(123)\nkm_result <- kmeans(aa, $cluster, nstart = 500)\n";
	print FILE "dd <- cbind(aa, cluster = km_result\$cluster)\nlibrary(\"RColorBrewer\")\n";
	print FILE "dd<-dd[order(dd[,5]),]\n";
	print FILE "newpalette<-colorRampPalette(brewer.pal(9,\"Set1\"))($cluster)\n";
	print FILE "color = (\"\")\n";
	print FILE "for (i in 1:length(dd[,1])){\n";
	print FILE "\tcolor[i] = newpalette[dd[i,5]]\n}\n";
	print FILE "aa<-dd[,1:4]\n";
	print FILE "write.table(dd,file=\"$file.c$cluster.txt\")\n" if($n==1);
	print FILE "aa <- as.matrix(aa)\n";
	print FILE "pdf(\"$file.$cluster.$n.pdf\",height = 8,width = 8)\n";
	my $start = ($n-1)*5000+1;
	my $end = $n*5000;
	if ($n == $file_number){
		print FILE "aa1<-aa[$start:$line_number,]\n";
		print FILE "color1 <- color[$start:$line_number]\n";
	}else{
	
		print FILE "aa1<-aa[$start:$end,]\n";
		print FILE "color1 <- color[$start:$end]\n";
	}
	print FILE "heatmap.2(aa1,dendrogram=\"none\",Colv=F,Rowv=F,trace=\"none\",RowSideColors = color1,cexCol=1,denscol=F,col=rev(colorRampPalette(brewer.pal(10, \"RdYlBu\"))(20)))\n";
	print FILE "dev.off()\n";
}
