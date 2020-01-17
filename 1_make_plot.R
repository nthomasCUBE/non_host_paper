options(stringsAsFactors=FALSE)

data=read.csv("0_parse.txt",sep="\t",header=T)

xx=(data[,"Solanum.tuberosum"])

rn=data[,1]
for(x in 1:length(rn)){
        rn[x]=strsplit(rn[x],"\\.")[[1]][1]
}
names(xx)=rn

data=read.csv("categories.txt",sep="\t",header=T)
df=data.frame(data[,1],data[,2],xx[data[,1]])
df=na.omit(df)
print(df)
colnames(df)=c("A","B","C")

pdf("1_make_plot.pdf")
library(ggplot2)
p <- ggplot(df, aes(x=as.factor(B), y=C)) +
  geom_violin()
print(p)
dev.off()



