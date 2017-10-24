---
title: "assignment cleaning data"
output: html_document
---

## Data sets

features.txt': List of all features.

activity_labels.txt': Links the class labels with their activity name.

train/X_train.txt': Training set.

train/y_train.txt': Training labels.

test/X_test.txt': Test set.

test/y_test.txt': Test labels.

### Merging

Values of Varible Activity_id > Y_train.txt” + “Y_test.txt”

values of Varible Subject_id  > subject_train.txt” + subject_test.txt"

Values of Varibles Features> X_train.txt + X_test.txt

Names of Varibles Features >>>> “features.txt”

levels of Varible Activity >>> “activity_labels.txt”


### features/variables: https://github.com/emiliamcl/datasciencecoursera/blob/master/Getting-and-cleaning-data/assignment_variables

#### Read all datasets

```{r cars}
trainx <- read.table("file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Geting and cleaning data quiz project/UCI HAR Dataset_assigment_gettingcleaningdata/train/X_train.txt")
trainy <- read.table("file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Geting and cleaning data quiz project/UCI HAR Dataset_assigment_gettingcleaningdata/train/Y_train.txt",col.names=c("activity_ID"))
train_subj <- read.table("file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Geting and cleaning data quiz project/UCI HAR Dataset_assigment_gettingcleaningdata/train/subject_train.txt",col.names=c("subject_ID"))


# 
head(trainx)
names(trainx)
head(trainx)
head(train_subj)
nrow(trainx)

## Reading test
testx <- read.table("file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Geting and cleaning data quiz project/UCI HAR Dataset_assigment_gettingcleaningdata/test/X_test.txt")
testy <- read.table("file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Geting and cleaning data quiz project/UCI HAR Dataset_assigment_gettingcleaningdata/test/Y_test.txt",col.names=c("activity_ID"))
test_subj <- read.table("file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Geting and cleaning data quiz project/UCI HAR Dataset_assigment_gettingcleaningdata/test/subject_test.txt",col.names=c("subject_ID"))

# 
head(testx)
head(testy)
head(test_subj)
names(testx)
nrow(testx)

## Reading feature
features <- read.table('file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Geting and cleaning data quiz project/UCI HAR Dataset_assigment_gettingcleaningdata/features.txt',, col.names=c("feature_index", "feature_labels"))
head(features)

## Reading labels
activity_labels = read.table('file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Geting and cleaning data quiz project/UCI HAR Dataset_assigment_gettingcleaningdata/activity_labels.txt',col.names=c("activity_ID","activityType"))
head(activity_labels)

## name x variables with the vector feature
colnames(trainx) <- features[,2] 
names(trainx)
colnames(testx) <- features[,2] 
names(testx)


```

### 1.Merge the training and test sets to create one data set




```{r pressure, echo=FALSE}
## Merging
all_train <- cbind(trainy, train_subj, trainx)
head(all_train,3)
names(all_train)
all_test <- cbind(testy, test_subj, testx)
names(all_test)

## all_data
all_data <- rbind(all_train, all_test)

#
names(all_data)
summary(all_data)

```


### 2 Extract only the measurements on the mean and standard deviation for each measurement

```{r}
MeanStd <- grep("mean\\(\\)|std\\(\\)",features$feature_labels,value=TRUE) #var name
MeanStd <- union(c("subject_ID","activity_ID"), MeanStd)
head(MeanStd)
new_alldata<- subset(all_data,select=MeanStd) 
head(new_alldata)
names(new_alldata)
head(str(new_alldata),2)

```


### 3 Use descriptive activity names to name the activities in the data set

```{r}
names(activity_labels)
# merge by activity_ID
finalData = merge(new_alldata,activity_labels,by='activity_ID',all.x=TRUE);
names(finalData)
head(str(finalData),2)
```

### 4 Appropriately label the data set with descriptive variable names

prefix t > is replaced by time

Acc > is replaced by Accelerometer

Gyro > is replaced by Gyroscope

prefix f > is replaced by frequency

Mag > is replaced by Magnitude

BodyBody > is replaced by Body


```{r}
names(finalData)<-gsub("^t", "time", names(finalData))
names(finalData)<-gsub("^f", "frequency", names(finalData))
names(finalData)<-gsub("Acc", "Accelerometer", names(finalData))
names(finalData)<-gsub("Gyro", "Gyroscope", names(finalData))
names(finalData)<-gsub("Mag", "Magnitude", names(finalData))
names(finalData)<-gsub("BodyBody", "Body", names(finalData))
names(finalData)
(finalData)
head(str(finalData),2)
```

### 5.Create a second, independent tidy data set with the average of each variable
```{r}
write.table(finalData, "TidyData.txt", row.name=FALSE)
```


