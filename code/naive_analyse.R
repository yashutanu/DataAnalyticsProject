#naive bayes model
library('e1071')
library('class')

nb_model <- naiveBayes(Internship~Age+no_of_contest_win+hours_spent+algorithm+Data_structure+Resource
                       +web+paper_presentation+research+back_end+app+data_science,data = codetrain)
nb_model
#model <- naiveBayes(Internship~, data = codetrain)
predict(nb_model, codetrain[1:10,], type = "raw")
