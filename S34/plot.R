cc<-read.table("C:\\Users\\13070\\Desktop\\isoform_diff_number_for_plot.txt")
ggplot(cc,aes(cc$V2,log2(cc$V3)))+
  geom_boxplot(aes(fill=cc$V2),width = 0.7,color = "black")+
  theme(panel.grid.minor = element_blank(),
        axis.title=element_text(size=15),
        axis.text.y =element_text(size=12),
        panel.background = element_rect(
          fill = "transparent", color = "white"),
        axis.text.x = element_text(size=12),
        plot.margin=unit(c(0.5,0.5,0.2,0.5),"cm"),
        legend.title=element_blank(),axis.line=element_line(colour="black"))+ylab("log2(transcript number)")+xlab("")+scale_fill_npg()
