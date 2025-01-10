a<-read.table("C:\\Users\\13070\\Desktop\\length.txt")
ggplot(aa, aes(aa$V2)) +geom_histogram(fill = "orange",color = "white",bins = 50) +
  theme(panel.grid.minor = element_blank(),
        axis.title=element_text(size=15),
        axis.text.y =element_text(size=12),
        panel.background = element_rect(
          fill = "transparent", color = "white"),
        axis.text.x = element_text(size=12),
        plot.margin=unit(c(0.5,0.5,0.2,0.5),"cm"),
        legend.title=element_blank(),axis.line=element_line(colour="black"))+xlab("length (bp)")+ylab("No.of isoform")
