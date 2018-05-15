library(readr)
code <- read_csv("~/DA_PRO/data_final.csv")
View(code)
dim(code)
#there are 117 data and 34 attributes

code_intern_yes=subset(code,code$Internship=='yes')
code_intern_yes
#out of 117 data 89 members got internship

code_intern_no=subset(code,code$Internship=='no')
code_intern_no
#28 members did not get internship

code_hour=subset(code,code$hours_spent >4)
code_hour
code_hour_result<-code_hour[code_hour$Internship=='yes',]
code_hour_result$Internship
#53/66 students who spends morethan 4 hours per week learning in coding got internship
set.seed(88)

#splitting the dataset into training and test data 
library('caTools')
split <- sample.split(code$Internship, SplitRatio = 0.50)
#get training and test data
codetrain <- subset(code, split == TRUE)
codetest <- subset(code, split == FALSE)

#analysing the dependency of programming language in getting internship
#c programming language
c_lang<-code[code$Internship=='yes' & code$c=='yes',]
code[code$c=='yes',]
c_lang
#89/117 students knows c language got internship

#python programming language
py_lang<-code[code$Internship=='yes' & code$python=='yes',]
code[code$python=='yes',]
py_lang
#80/104

#c++ programming language
c_plus_lang<-code[code$Internship=='yes' & code$c_plus=='yes',]
code[code$c_plus=='yes',]
c_plus_lang
#57/73

#java
java_lang<-code[code$Internship=='yes' & code$java=='yes',]
code[code$java=='yes',]
java_lang
#88/113

#html and javascript
web_lang<-code[code$Internship=='yes' & code$html=='yes',]
code[code$html=='yes',]
web_lang
#78/103 html  and javascript only one

#all c,c++
overall<-code[code$Internship=='yes' & code$c=='yes'&code$c_plus=='yes'&code$python=='yes'&code$java=='yes',]
code[code$c=='yes'&code$c_plus=='yes'&code$python=='yes'&code$java=='yes',]
overall
#54/69

contest<-code[code$Internship=='yes' & code$no_of_contest_win>=1,]
code[code$no_of_contest_win>=1,]
contest
#20/20 students those who won any contest got internship

#project analysis
web_based<-code[code$Internship=='yes' & code$web=='yes',]
code[code$web=='yes',]
web_based
#67/103 students those who done project related to web development got internship

data_science<-code[code$Internship=='yes' & code$data_science=='yes',]
code[code$data_science=='yes',]
data_science
#42/53

app_dev<-code[code$Internship=='yes' & code$app=='yes',]
code[code$app=='yes',]
app_dev
#14/21

backend_design<-code[code$Internship=='yes' & code$back_end=='yes',]
code[code$back_end=='yes',]
backend_design
#9/9

research_project<-code[code$Internship=='yes' & code$research=='yes',]
code[code$research=='yes',]
research_project
#10/13

paper_presentation<-code[code$Internship=='yes' & code$paper_presentation=='yes',]
code[code$paper_presentation=='yes',]
paper_presentation
#4/5


operating_system<-code[code$Internship=='yes' & code$operating_system=='yes',]
code[code$operating_system=='yes',]
operating_system
#4/5

#Grade analysis
grade<-code[code$Internship=='yes' & code$algorithm>=8 & code$Data_structure>=8,]
code[code$algorithm>=8 & code$Data_structure>=8,]
grade
#78 out of 95





