library(plotrix)
library(readr)
d <- read_csv("~/DA_PRO/data_final.csv")
View(d)
dim(d)

#q1....preferred way of teaching
d6<-as.vector(d[,6])
c_lt<-length(which(d6 =='LIVE TEACHING')) #count no of people who like to take live teaching
c_ot<-length(which(d6 =='ONLINE'))#count no of people who like to take online teaching
c_slices<-c(c_ot,c_lt)
lbls<-c("ONLINE","LIVE TEACHING")
pct <- round((c_slices/sum(c_slices))*100)
lbls <- paste(lbls, pct) # add percents (number)to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie3D(c_slices,labels=lbls,explode=0.1,main="Pie Chart for preferred way of teaching ")

#q2....preferred language
tt<-as.data.frame(d[,4])
tab<-table(tt)
df<-(as.data.frame(tab))
c_slices<-c(as.vector(df[[2]]))
lbls<-c(as.vector(df[[1]]))
pct <- round((c_slices/sum(c_slices))*100)
lbls <- paste(lbls, pct) # add percents (number)to labels
lbls <- paste(lbls,"%",sep="") # ad % at the end

pie(c_slices,labels=lbls,main ="pie chart of preferred languages",col = rainbow(length(c_slices)))
legend("topright", lbls, cex = 0.8,fill = rainbow(length(c_slices)))


#q3.....popular sites for learning coding
tt<-as.data.frame(d[,9])
tab<-table(tt)
df<-(as.data.frame(tab))
c_slices<-c(as.vector(df[[2]]))
lbls<-c(as.vector(df[[1]]))
pct <- round((c_slices/sum(c_slices))*100)
lbls <- paste(lbls, pct) # add percents (number)to labels
lbls <- paste(lbls,"%",sep="") # ad % at the end
pie(c_slices,labels=lbls,main ="pie chart of popular sites for learning coding",col = rainbow(length(c_slices)))
#legend("topleft", lbls, cex = 0.8,fill = rainbow(length(c_slices)))


#q4.....goal of learning
library(plotrix)
d<-read.csv(file="data_final.csv",skip=1,header = TRUE)
tt<-as.data.frame(d[,8])
tab<-table(tt)
df<-(as.data.frame(tab))
c_slices<-c(as.vector(df[[2]]))
lbls<-c(as.vector(df[[1]]))
pct <- round((c_slices/sum(c_slices))*100)
lbls <- paste(lbls, pct) # add percents (number)to labels
lbls <- paste(lbls,"%",sep="") # ad % at the end
pie(c_slices,labels=lbls,main ="Goal of learning",col = rainbow(length(c_slices)))


#q8....preferred jobs

library(plotrix)
d<-read.csv(file="data_final.csv",skip=1,header = TRUE)
tt<-as.data.frame(d[,10])
tab<-table(tt)
df<-(as.data.frame(tab))
c_slices<-c(as.vector(df[[2]]))
lbls<-c(as.vector(df[[1]]))
pct <- round((c_slices/sum(c_slices))*100)
lbls <- paste(lbls, pct) # add percents (number)to labels
lbls <- paste(lbls,"%",sep="") # ad % at the end
pie(c_slices,labels=lbls,main ="jobs that are preferred",col = rainbow(length(c_slices)))
