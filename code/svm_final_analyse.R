library(e1071)
library(caret)
library(Rcpp)
library(ggplot2)
##for confusion matrix
## two-way contingency table of categorical outcome and predictors
## we want to make sure there are not 0 cells
xtabs(~Age+hours_spent,data=codetrain)

codetrain$Age=as.factor(codetrain$Age)
codetrain$Age
codetest$Age=as.factor(codetest$Age)
codetest$Age
codetrain$Internship=as.factor(codetrain$Internship)
codetest$Age=as.factor(codetest$Age)
codetest$Internship=as.factor(codetest$Internship)
codetrain$Resource=as.factor(codetrain$Resource)
codetrain$Resource
codetrain$no_of_contest_win=as.factor(codetrain$no_of_contest_win)
codetrain$no_of_contest_win
codetest$Resource=as.factor(codetest$Resource)
codetest$Resource
codetest$no_of_contest_win=as.factor(codetest$no_of_contest_win)
codetest$no_of_contest_win

codetrain$Resource=as.factor(codetrain$Resource)
codetrain$no_of_contest_win=as.factor(codetrain$no_of_contest_win)
codetrain$web=as.factor(codetrain$web)
codetrain$data_science=as.factor(codetrain$data_science)
codetrain$research=as.factor(codetrain$research)
codetrain$big_data=as.factor(codetrain$big_data)
codetrain$back_end=as.factor(codetrain$back_end)
codetrain$paper_presentation=as.factor(codetrain$paper_presentation)
codetrain$app=as.factor(codetrain$app)
codetrain$operating_system=as.factor(codetrain$operating_system)
codetrain$algorithm=as.factor(codetrain$algorithm)
codetrain$Data_structure=as.factor(codetrain$Data_structure)
codetest$algorithm=as.factor(codetest$algorithm)
codetest$Data_structure=as.factor(codetest$Data_structure)


#only depends on grades
model_grades=svm(Internship~algorithm+Data_structure,data=codetrain,kernel="linear")
pred_train_grades = predict(model_grades,codetrain)
t1=table(pred_train_grades,codetrain$Internship)
pred_train_grades
confusionMatrix(t1)

model_grades1=svm(Internship~algorithm+Data_structure,data=codetest,kernel="linear")
pred_train_grades1 = predict(model_grades1,codetest)
t4=table(pred_train_grades1,codetest$Internship)
pred_train_grades1
confusionMatrix(t4)

#depends on age,no_of_contest_won,resource,grades in algorithm,data structure
#training data set
model_all1 =svm(Internship~Age+no_of_contest_win+Resource+algorithm+Data_structure,data=codetrain,kernel ="linear")
pred_train_all1 = predict(model_all1,codetrain)
tab<-table(pred_train_all1,codetrain$Internship)
pred_train_all1
# load Caret package for computing Confusion matrix
confusionMatrix(tab)

#test data set
model_all_test1 =svm(Internship~Age+no_of_contest_win+Resource+algorithm+Data_structure,data=codetest,kernel ="linear")
pred_test_all1 = predict(model_all_test1,codetest)
t2=table(pred_test_all1,codetest$Internship)
pred_test_all1
confusionMatrix(t2)

#based on age,no_of_contest_won,resource,grades,list of projects done
#train data
model_pro1=svm(Internship~Age+no_of_contest_win+Resource+algorithm+Data_structure+research+paper_presentation+web+operating_system+data_science+app+back_end,data=codetrain,kernel='linear')
pred_train_pro1= predict(model_pro1,codetrain)
tab2=table(pred_train_pro1,codetrain$Internship)
pred_train_pro1
# load Caret package for computing Confusion matrix
confusionMatrix(tab2)

#test data
model_pro=svm(Internship~Age+no_of_contest_win+Resource+algorithm+Data_structure+research+paper_presentation+web+operating_system+data_science+app+back_end,data=codetest,kernel='linear')
pred_train_pro= predict(model_pro,codetest)
tab1=table(pred_train_pro,codetest$Internship)
pred_train_pro
# load Caret package for computing Confusion matrix
confusionMatrix(tab1)


