## Step1: Get the test data ready for merging
## read test raw data
setwd("test")
rawtest<-read.table("X_test.txt", sep="", na.strings="NA")

## read activity data
activitylabeltest<-read.table("Y_test.txt", sep="", na.strings="NA", col.names="activity_label")

## read id data
idtest<-read.table("subject_test.txt", sep="", na.strings="NA",col.names="testee_ID")

## add colum names to the test raw data
setwd("..")
collabel<-read.table("features.txt",sep="")
colnames(rawtest) <-collabel[,2]

## Extracts only the measurements on the mean and standard deviation for each measurement
extractedid<-sort(c(grep("mean",collabel[,2]),grep("std",collabel[,2])))
newrawtest<-rawtest[,extractedid]

## add activity label and ID to the test data
newrawtest$activity_label<-activitylabeltest[,1]
newrawtest$testee_ID<-idtest[,1]

## Step2: Get the train data ready for merging
## read test raw data and extract necessary data
setwd("train")
rawtrain<-read.table("X_train.txt", sep="", na.strings="NA")
newrawtrain<-rawtrain[,extractedid]

## read activity data
activitylabeltrain<-read.table("Y_train.txt", sep="", na.strings="NA", col.names="activity_label")

## read id data
idtrain<-read.table("subject_train.txt", sep="", na.strings="NA",col.names="testee_ID")

## add activity label and ID to the train data
newrawtrain$activity_label<-activitylabeltrain[,1]
newrawtrain$testee_ID<-idtrain[,1]

## Step3: merge test data with train data
colnames(newrawtrain)=colnames(newrawtest)
mergeddata<-rbind(newrawtest,newrawtrain, deparse.level = 0)

## Uses descriptive activity names to name the activities in the data set
setwd("../")
activity_label<-read.table("activity_labels.txt", sep="")

for (i in 1:6)
{mergeddata$activity_label<-sub(activity_label[i,1],activity_label[i,2],mergeddata$activity_label)}


## Get the average of each variable for each activity and each subject.

cleandata<-aggregate(x = mergeddata[,1:79], by = list(mergeddata$testee_ID,mergeddata$activity_label), 
             FUN = "mean")
## Reorder and rename columns
cleandata<-cleandata[c(2,1,3:81)]
names(cleandata)[1:2]<-c("Activity","Testee_ID")

## Output the clean data and the codebook
write.table(cleandata,file="cleandata.md",row.name=FALSE)
write.table(colnames(cleandata),file="codebook.md",quote=F,col.names="Variables")




