library(pheatmap)
library("gplots")

aa<-read.table("lncRNA.OCR.intergenic.gene.expression.used.normalizated")
pdf("lncRNA.OCR.intergenic.gene.expression.used.normalizated.pdf")

aa[,1]<-NULL

set.seed(123)
km_result <- kmeans(aa, 8, nstart = 500)
library("RColorBrewer")
dd <- cbind(aa, cluster = km_result$cluster)
dd<-dd[order(dd[,9]),]
newpalette<-colorRampPalette(brewer.pal(9,"Set1"))(8)
color = ("")
for (i in 1:length(dd[,1])){
        color[i] = newpalette[dd[i,9]]
}
aa<-dd[,1:8]
#write.table(dd,file="lncRNA_expression.normalizated.txt")
aa<-as.matrix(aa)
heatmap.2(aa,dendrogram="none",Colv=F,Rowv=F,trace="none",RowSideColors = color,cexCol=1,denscol=F,col=rev(colorRampPalette(brewer.pal(10, "RdYlBu"))(20)))
dev.off()
