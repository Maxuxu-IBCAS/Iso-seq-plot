aa<-read.table("C:\\Users\\13070\\Desktop\\compare_len_and_isoform_number.txt")

ggplot(aa,aes(aa$V4,log2(aa$V3)))+facet_grid(aa$V2~.,scales = "free")+
  geom_boxplot(aes(fill = aa$V4))+
  theme(panel.grid.minor = element_blank(),
        axis.title=element_text(size=15),
        axis.text.y =element_text(size=8),
        panel.background = element_rect(
          fill = "transparent", color = "white"),
        axis.text.x = element_text(size=9,vjust=1,hjust=1,angle=60),
        plot.margin=unit(c(0.5,0.5,0.2,0.5),"cm"),
        legend.title=element_blank(),axis.line=element_line(colour="black"))+xlab("")+ylab("expression level (log2(TPM))")+scale_fill_npg()

