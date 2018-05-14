#data loading
library(readr)
library(ggplot2)
library(colorspace)
library(scales)
data <- read_csv("~/DA_PRO/data_final.csv")
View(data)
dim(data)


#gender graph
gender<-table(data$Gender)
#barplot(gender[order(gender,decreasing = T)],ylim=c(0,100))

barplot(gender[order(gender,decreasing = T)],horiz = T,xlim=c(0,100),xlab="No of users",main = "Gender proportion",col=c("red","green"))

#preferred language
pre_lang=table(data$Preferred_PL)
pre_lang
barplot(pre_lang[order(pre_lang,decreasing = T)],width=5,names.arg=c("py","c","java","c++","other","c#","JS","php"),ylim=c(0,100))

#ggplot(data=data, aes(x=Preferred_PL)) +
#  geom_bar(stat="count")

reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x))))
}

p = ggplot(data = data,  aes(reorder_size(Preferred_PL))) + 
  geom_bar(aes(y = (..count..)/sum(..count..)),colour="black", fill="#DD8888", width=.8 )+ 
  scale_y_continuous(labels= percent,limit=c(0,0.4)) +
  xlab("Preferred programming language") + ylab("% of users") +
  ggtitle("% of programming language preferred by users")
p

#age group
age = ggplot(data = data,  aes(reorder_size(Age))) + 
  geom_bar(aes(y = (..count..)/sum(..count..)),colour="black", fill="#DD8888", width=.8 )+ 
  scale_y_continuous(labels= percent,limit=c(0,0.8)) +
  xlab("Age group") + ylab("% of users") +
  ggtitle("% of age group learn online courses")
age


#way of learning
way_pie=table(data$way_of_learning)
way_pie
#LIVE TEACHING        ONLINE 
#       64            53 
piepercent<- round(100*way_pie/sum(way_pie), 1)
pie(way_pie,labels=paste0(piepercent,'%'),col = rainbow(length(way_pie)))
legend("topright", c("live teaching","online learning"), cex = 0.7,
       fill = rainbow(length(way_pie)))

#mapping of way of learning to age groups
table(data$Age,data$way_of_learning)
#     LIVE TEACHING ONLINE
#18             0      1
#19            12      7
#20            35     29
#21            15     12
#22             0      3
#23             2      1



#preferred way of contest
way_contest=table(data$contest)
way_contest
#Live coding contest Online coding contest 
#     34                    83 
contest_per<- round(100*way_contest/sum(way_contest), 1)
pie(way_contest,labels=paste0(contest_per,'%'),col = rainbow(length(way_contest)))
legend("topleft", c("live contest","online coding"), cex = 0.8,
       fill = rainbow(length(way_contest)))


#goal of learning
goal = ggplot(data = data,  aes(reorder_size(Goal))) + 
  geom_bar(aes(y = (..count..)/sum(..count..)),colour="black", fill="#DD8888", width=.8 )+ 
  scale_y_continuous(labels= percent,limit=c(0,0.8)) +
  xlab("Goals") + ylab("% of users") +
  ggtitle("Goals of online coding learners")
goal

#most preferred resource
res= ggplot(data = data,  aes(reorder_size(Resource))) + 
  geom_bar(aes(y = (..count..)/sum(..count..)),colour="black", fill="#DD8888", width=.8 )+ 
  scale_y_continuous(labels= percent,limit=c(0,0.5)) +
  scale_x_discrete(labels=c("codewars","edx","moocs","codejam","udemy",
                            "codeacademy","udacity","khanacademy","coursera","hackerearth","others","codechef","hackerrank"))+
  xlab("resources") + ylab("% of users") +
  ggtitle("most useful online resource")
res

#resource-intership
table(data$Resource,data$Internship)
#                no yes
#Code Wars        0   1
#Codecademy       1   3
#Codechef         0  19
#Coursera         4   8
#Edx              1   0
#Google code jam  0   3
#Hackerearth      3   9
#Hackerrank       7  31
#Khan Academy     2   3
#MOOCS            0   2
#Others           6   7
#Udacity          2   2
#Udemy            2   1


#known lang - internship
table(data$Known_PL,data$Internship)

#workshop ratings

work= ggplot(data = data,  aes(reorder_size(Workshop_rating))) + 
  geom_bar(aes(y = (..count..)/sum(..count..)),colour="black", fill="#DD8888", width=.8 )+ 
  scale_y_continuous(labels= percent,limit=c(0,0.5)) +
  scale_x_discrete(labels=c(0,1,2,3,4,5))+
  xlab("ratings") + ylab("% of users") +
  ggtitle("workshop ratings")
work