aa<-read.table("C:\\Users\\13070\\Desktop\\for_plot2.txt")
ggplot(aa,aes(aa$V2,log10(aa$V3+1)))+geom_violin(aes(fill=aa$V2),width = 0.5,color = "black")+facet_grid(aa$V4~.,scales = "free")+
  theme(panel.grid.minor = element_blank(),
        axis.title=element_text(size=15),
        axis.text.y =element_text(size=12),
        panel.background = element_rect(
          fill = "transparent", color = "white"),
        axis.text.x = element_text(size=12,vjust=1,hjust=1,angle=45),
        plot.margin=unit(c(0.5,0.5,0.2,0.5),"cm"),
        legend.title=element_blank(),axis.line=element_line(colour="black"))+ylab("percentage")+xlab("")


ggplot(aa,aes(aa$V2,aa$V3))+geom_violin(aes(fill=aa$V2),width = 0.5,color = "black")+facet_grid(aa$V4~.,scales = "free")+
  theme(panel.grid.minor = element_blank(),
        axis.title=element_text(size=15),
        axis.text.y =element_text(size=12),
        panel.background = element_rect(
          fill = "transparent", color = "white"),
        axis.text.x = element_text(size=12,vjust=1,hjust=1,angle=45),
        plot.margin=unit(c(0.5,0.5,0.2,0.5),"cm"),
        legend.title=element_blank(),axis.line=element_line(colour="black"))+ylab("percentage")+xlab("")
