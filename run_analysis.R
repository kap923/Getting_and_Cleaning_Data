# Getting and Cleaning Data - Course Project
# Data Source - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Features
features <- read.table("features.txt",header=FALSE)
dim(features)

# Activity Labels
ActLabels <- read.table("activity_labels.txt",header=FALSE)
dim(ActLabels)
ActLabels

# Train Data
X_train <- read.table("./train/X_train.txt",header=FALSE)
dim(X_train)
colnames(X_train) <- features[,2] # Set the column names based on features
names(X_train)

Y_train <- read.table("./train/y_train.txt",header=FALSE)
dim(Y_train)
colnames(Y_train) <- "Label"
summary(Y_train)

subject_train <- read.table("./train/subject_train.txt",header=FALSE)
dim(subject_train)
colnames(subject_train) <- "Subject"
summary(subject_train)

train <- cbind(subject_train,X_train,Y_train) # Column Bind the three dataframe
dim(train)

# Test Data
X_test <- read.table("./test/X_test.txt",header=FALSE)
dim(X_test)
colnames(X_test) <- features[,2] # Set the column names based on features

Y_test <- read.table("./test/y_test.txt",header=FALSE)
dim(Y_test)
colnames(Y_test) <- "Label"
summary(Y_test)

subject_test <- read.table("./test/subject_test.txt",header=FALSE)
dim(subject_test)
colnames(subject_test) <- "Subject"
summary(subject_test)

test <- cbind(subject_test,X_test,Y_test) # Column Bind the three dataframe
dim(test)

# Merge training and testing dataset to create one dataset
FullData <- rbind(train,test)
dim(FullData)
rm(train)
rm(test)

# Extracts only the measurements on the mean and standard deviation for each measurement
select_Cols <- c(colnames(FullData)[1],grep("mean",colnames(FullData),value=TRUE),grep("std",colnames(FullData),value=TRUE),colnames(FullData)[ncol(FullData)])
FullData <- FullData[select_Cols]
dim(FullData)

# Uses descriptive activity names to name the activities in the data set
FullData$Label<-ActLabels[match(FullData$Label,ActLabels$V1),2]

# creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyData<- (FullData%>%
                        group_by(Subject,Label) %>%
                        summarise_each(funs( mean)))
tidyData

# Export the tidyData set 
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t')
