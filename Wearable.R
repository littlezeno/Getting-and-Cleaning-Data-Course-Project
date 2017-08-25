library(dplyr)
library(plyr)

## ============
# Merges the training and the test sets to create one data set
# # Read description data
actname<-read.table("./data/UCI HAR Dataset/activity_labels.txt",header=F)
actname<-rename(actname,c("V1"="actID", "V2"="actname")) # Rename the activity label list
featurelist<-read.table("./data/UCI HAR Dataset/features.txt",header=F)
featurelist<-rename(featurelist,c("V1"="featureID", "V2"="feature")) # Rename the feature list
featurelist$feature<-gsub("-","",featurelist$feature)
featurelist$feature<-sub("\\(","",featurelist$feature)
featurelist$feature<-sub("\\)","",featurelist$feature)
featurelist$feature<-gsub("\\,","",featurelist$feature)
#substuted special characters so I could use this feature list later to name variables in X



## Read Data
#--Test data-----
subtest<-read.table("./data/UCI HAR Dataset/test/subject_test.txt",header=F) #Subject ID list
actIDtest<-read.table("./data/UCI HAR Dataset/test/y_test.txt",header=F) # Action ID list
xtest<-read.table("./data/UCI HAR Dataset/test/x_test.txt",header=F) # Feasture numbers
#--Train data-----
subtrain<-read.table("./data/UCI HAR Dataset/train/subject_train.txt",header=F) #Subject ID list
actIDtrain<-read.table("./data/UCI HAR Dataset/train/y_train.txt",header=F) # Action ID list
xtrain<-read.table("./data/UCI HAR Dataset/train/x_train.txt",header=F) # Feasture numbers

## Aligh Data
test<-data.frame(cbind(subtest,actIDtest,xtest))
colnames(test)[1:2]<-c("subject","actID") # Assign names for the first two column
train<-data.frame(cbind(subtrain,actIDtrain,xtrain))
colnames(train)[1:2]<-c("subject","actID")

# combine train and test data
all<-rbind(test,train)
dim(all)[2]
colnames(all)[3:dim(all)[2]]<-featurelist$feature

##=========================
#Extracts only the measurements on the mean and standard deviation for each measurement.
## Identify the columns that has mean and standard deviation
colId<-grep("mean|std",featurelist$feature)
colId<-colId+2 # the old list did not consider subject and act ID
Sub.mean.std<-cbind(all[,1:2],all[,colId])

##=================
#Uses descriptive activity names to name the activities in the data set
out.temp<-arrange(join(actname,Sub.mean.std),actID)

##=============
#Appropriately labels the data set with descriptive variable names 
#Done above

#===============
##From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

out.temp<-group_by(out.temp,actID,actname,subject)
out<-summarise_all(out.temp, funs(mean)) # final output

#======
#output data
write.csv(out,"./data/UCI HAR Dataset/mean_std_by_activity_subject.csv")

