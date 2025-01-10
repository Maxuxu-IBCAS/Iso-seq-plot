library(ggplot2)

aa<-read.table("for_plot.S28.txt")
pdf("S28.pdf",height =3,width = 5)

ggplot(aa,aes(aa$V1,fill = aa$V2,color = aa$V2))+geom_density(alpha = 0.3,adjust = 5)+
        theme(panel.grid.minor = element_blank(),
        axis.title=element_text(size=15),
        axis.text.y =element_text(size=12),
        panel.background = element_rect(
          fill = "transparent", color = "white"),
        axis.text.x = element_text(size=12),
        plot.margin=unit(c(0.5,0.5,0.2,0.5),"cm"),
        legend.title=element_blank(),axis.line=element_line(colour="black"))+ylab("density")+xlab("isoform number")+xlim(0,40)
dev.off()
