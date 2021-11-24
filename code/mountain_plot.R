set.seed(345)
library(ggplot2)
library(RColorBrewer)
ngroup=30
names=paste("G_",seq(1,ngroup),sep="")
DAT=data.frame()

for(i in seq(1:30)){
  data=data.frame( matrix(0, ngroup , 3))
  data[,1]=i
  data[,2]=sample(names, nrow(data))
  data[,3]=prop.table(sample( c(rep(0,100),c(1:ngroup)) ,nrow(data)))
  DAT=rbind(DAT,data)
}
colnames(DAT)=c("Year","Group","Value")
DAT=DAT[order( DAT$Year, DAT$Group) , ]


coul = c("#bfaea1", "#c7bbb1", "#d2b0aa", "#f4d7d0", "#f9e6e3")
coul = colorRampPalette(coul)(ngroup)
coul=coul[sample(c(1:length(coul)) , size=length(coul) ) ]

#coul = c("#66545e", "#a39193", "#aa6f73", "#aa6f73", "#f6e0b5")

ggplot(DAT, aes(x=Year, y=Value, fill=Group )) + 
  geom_area(alpha=1  )+
  theme_bw() +
  #scale_fill_brewer(colour="red", breaks=rev(levels(DAT$Group)))+
  scale_fill_manual(values = coul)+
  theme(
    text = element_blank(),
    line = element_blank(),
    title = element_blank(),
    legend.position="none",
    panel.border = element_blank(),
    panel.background = element_blank())
