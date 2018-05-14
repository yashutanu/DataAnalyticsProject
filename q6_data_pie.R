library(plotrix)
d<-read.csv(file="data_final.csv",skip=1,header = TRUE)
#tt<-d[,16]
n<-NROW(d)#find no of rows in file
avg=0
avg<-sum(d[,16],na.rm=TRUE)
avg=avg/n
avg<-floor(avg)
#avg#avg time each student likely to spend time on coding per week
#assuming better grades are >=8 and good coder practices for avg no of hrs
#four combinations of cases
hrs_g_avg_and_grade_g_8=0#have greater than avg and have both sub sgpa >=8
hrs_g_avg_and_grade_l_8=0#have greater than avg and have both or one of the sub sgpa <8
hrs_l_avg_and_grade_g_8=0#have less than avg and have both sub sgpa >=8
hrs_l_avg_and_grade_l_8=0#have less than avg and have both or one of the sub sgpa <8

for(i in 1:n)
{
  if(d[i,16]>=avg)
  {
    if(d[i,13]>=8 && d[i,14]>=8)
    {
      hrs_g_avg_and_grade_g_8=hrs_g_avg_and_grade_g_8+1
    }
    else
    {
      hrs_g_avg_and_grade_l_8=hrs_g_avg_and_grade_l_8+1 
    }
  }
  else
  {
    if(d[i,13]>=8 && d[i,14]>=8)
    {
      hrs_l_avg_and_grade_g_8=hrs_l_avg_and_grade_g_8+1
    }
    else
    {
      hrs_l_avg_and_grade_l_8=hrs_l_avg_and_grade_l_8+1
    }
  }
}


c_slices<-c(hrs_g_avg_and_grade_g_8,hrs_g_avg_and_grade_l_8,hrs_l_avg_and_grade_g_8,hrs_l_avg_and_grade_l_8)
lbls<-c("hrs_ge_avg_and_grade_ge_8_","hrs_ge_avg_and_grade_l_8_","hrs_l_avg_and_grade_ge_8_","hrs_l_avg_and_grade_l_8_")
pct <- round((c_slices/sum(c_slices))*100)
lbls <- paste(lbls, pct) # add percents (number)to labels
lbls <- paste(lbls,"%",sep="") # ad % at the end
pie(c_slices,labels=lbls,main ="More coding practice better grades",col = rainbow(length(c_slices)))

#print(c_slices)#76  9 18 13

#this pie implies that people who have practised coding more than avg no of hours 
#are likely to get bettter grades
