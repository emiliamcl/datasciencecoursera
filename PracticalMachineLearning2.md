 #Assignment week 4



## Importing the dataset in desktop

setwd("")



## Importing the dataset by url

data_train <- "http://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"

data_test  <- "http://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"


## set database
data_train
db_training <- read.csv(url(data_train))db_testing  <- read.csv(url(data_test))


*See training data
head(db_training)

names(db_training)
str(db_training)

dim(db_training)

dim 19622 160

summary(db_training)



>db testing coursera

*See testing data
head(db_testing)

str(db_testing)

dim(db_testing)

dim 20 160  - 20/19622 =0,10%




### Use bd_training 70% to train , 30% to test the model

names(db_training)

summary(db_testing)




## cleanning the data



###first librarys

### Librarys
library(knitr)

library(caret)

library(rpart)

library(rpart.plot)

library(caret)

library(rattle)

library(corrplot)

library(randomForest)

library(RColorBrewer)

set.seed(12345)


## NA remove

db_training <- db_training[ , colSums(is.na(db_training)) == 0]

db_testing <- db_testing[ , colSums(is.na(db_training)) == 0]


## Remove bad collums - nearzerovar
badCols <- nearZeroVar(db_training)

db_training <- db_training[, -badCols]

badCols <- nearZeroVar(db_testing)
db_testing <- db_testing[, -badCols]



## use numeric variable - remove unrelevant variables
nonwanted = c('X', 'user_name', 'raw_timestamp_part_1', 'raw_timestamp_part_2', 'cvtd_timestamp', 'new_window', 'num_window')

db_training

db_training <- db_training[, -which(names(db_training) %in% nonwanted)]

dim(db_training)

19622    53



db_testing <- db_testing[, -which(names(db_testing) %in% nonwanted)]

dim(db_testing)

20 53 

## train test dim 53 ok

## new split data 70% train and 30%testing


Train2 <- createDataPartition(db_training$classe, p=0.70, list=F)

db_training2 <- db_training[Train2, ]

db_testing2 <- db_training[-Train2, ]

dim(db_training2)

dim(db_testing2)

dim(db_training2)

[1] 13737    53

dim(db_testing2)

[1] 5885   53


53 - 53 ok - same size



## 2PredcModelsc DT and RF - make pred##




# Decision Tree w/ cross validation  -> accuracy 0.6579



set.seed(1000)



## Classification Tree with rpart



## grow tree w/ cross validation



trctrl <- trainControl(method = "cv", number = 5, repeats = 5)

set.seed(3333)

dtree_fit <- train(classe~. , data=db_training2, method = "rpart",

                   parms = list(split = "information"),

                   trControl=trctrl,

                   tuneLength = 10)



dtree_fit

## Results

13737 samples

52 predictor

35 classes: 'A', 'B', 'C', 'D', 'E' 



No pre-processing

#Resampling: Cross-Validated (5 fold) 

#Summary of sample sizes: 10990, 10990, 10989, 10989, 10990 

## Resampling results across tuning parameters:

  

cp          Accuracy   Kappa     

0.01383379  0.6396568  0.54759484

0.01607161  0.6334692  0.54032757

0.01647849  0.6334692  0.54032757

0.01942834  0.6100263  0.50878370

0.02014037  0.6100263  0.50878370

0.02197132  0.5724634  0.45446767

0.02766758  0.5724634  0.45446767

0.03753433  0.5238415  0.38791979

0.05987862  0.3666738  0.12581549

0.11585800  0.3328251  0.07418774



Accuracy was used to select the optimal model using  the largest value.

The final value used for the model was cp = 0.01383379.




## plot
prp(dtree_fit$finalModel, box.palette = "Reds", tweak = 1.2)



test_pred <- predict(dtree_fit, newdata = db_training2)

## see confusion matrix results
confusionMatrix(test_pred, db_training2$classe )  #check accuracy



## Confusion Matrix and Statistics



Reference

## Prediction    A    B    C    D    E

A 3133  418   77  108    4

B  134 1430  269  360  351

C  214  258 1704  333  287

D  382  552  346 1397  510

E   43    0    0   54 1373


## Overall Statistics

## Accuracy : 0.6579 >>> RF better?  

95% CI : (0.6499, 0.6658)

No Information Rate : 0.2843          

P-Value [Acc > NIR] : < 2.2e-16       



Kappa : 0.5688          

Mcnemar's Test P-Value : < 2.2e-16       



## Statistics by Class:



Class: A Class: B Class: C Class: D Class: E
Sensitivity            0.8021   0.5380   0.7112   0.6203  0.54376

Specificity            0.9383   0.8994   0.9037   0.8441  0.99135

Pos Pred Value         0.8377   0.5621   0.6094   0.4383  0.93401

Neg Pred Value         0.9227   0.8903   0.9368   0.9190  0.90609

Prevalence             0.2843   0.1935   0.1744   0.1639  0.18381
Detection Rate         0.2281   0.1041   0.1240   0.1017  0.09995

Detection Prevalence   0.2723   0.1852   0.2035   0.2320  0.10701

Balanced Accuracy      0.8702   0.7187   0.8074   0.7322  0.76756

 




# Random Forest w/ cross validation - accuracy 0.9884  - better 



CV <- trainControl(method="cv", 5) #Cross-Validation 5 fold

RF <- train(classe ~ ., data=db_training2, method="rf", trControl=CV, ntree=200)

RF




## Results

## Random Forest 

13737 samples

52 predictor

5 classes: 'A', 'B', 'C', 'D', 'E' 



No pre-processing

Resampling: Cross-Validated (5 fold) 

Summary of sample sizes: 10989, 10990, 10991, 10989, 10989 

Resampling results across tuning parameters:

  

## mtry  Accuracy   Kappa    

2    0.9912645  0.9889488

27    0.9908279  0.9883965

52    0.9854412  0.9815808



#Accuracy was used to select the optimal model using  the largest value.

#The final value used for the model was mtry = 2.


### Plot RF

library(reprtree)


options(repos='http://cran.rstudio.org')

have.packages <- installed.packages()

cran.packages <- c('devtools','plotrix','randomForest','tree')

to.install <- setdiff(cran.packages, have.packages[,1])

if(length(to.install)>0) install.packages(to.install)



library(devtools)

if(!('reprtree' %in% installed.packages())){

install_github('araastat/reprtree')

}

for(p in c(cran.packages, 'reprtree')) eval(substitute(library(pkg), list(pkg=p)))



model <- randomForest(classe ~ ., data=db_training2, importance=TRUE, ntree=200, mtry = 2, do.trace=100)

reprtree:::plot.getTree(model)

#verydeep 



## Model in testing data - Accuracy



predict_RF <- predict(RF, db_testing2)

confusionMatrix(db_testing2$classe, predict_RF)



## Confusion Matrix and Statistics



#Reference

#Prediction    
A    B    C    D    E

#A 1672    2    0    0    0

#B   13 1120    6    0    0

#C    0   16 1007    3    0

#D    0    0   25  939    0

#E    0    0    0    3 1079



## Overall Statistics



## Accuracy : 0.9884        >> better than DT - Good accuracy 

#95% CI : (0.9854, 0.991)

#No Information Rate : 0.2863         

#P-Value [Acc > NIR] : < 2.2e-16      



#Kappa : 0.9854         

#Mcnemar's Test P-Value : NA             



## Statistics by Class:



###Class: A Class: B Class: C Class: D Class: E

###Sensitivity            0.9923   0.9842   0.9701   0.9937   1.0000

###Specificity            0.9995   0.9960   0.9961   0.9949   0.9994

###Pos Pred Value         0.9988   0.9833   0.9815   0.9741   0.9972

###Neg Pred Value         0.9969   0.9962   0.9936   0.9988   1.0000

###Prevalence             0.2863   0.1934   0.1764   0.1606   0.1833

###Detection Rate         0.2841   0.1903   0.1711   0.1596   0.1833

###Detection Prevalence   0.2845   0.1935   0.1743   0.1638   0.1839

###Balanced Accuracy      0.9959   0.9901   0.9831   0.9943   0.9997



## RF Predit with the  coursera test data - question######



predict_RF <- predict(RF, db_testing)

predict_RF

#[1] B A B A A E D B A A B C B A E E A B B B

#Levels: A B C D E


