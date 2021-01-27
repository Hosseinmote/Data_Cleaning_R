## Load the data into the R

# Test data: x, y, and subject
xTest <- read.table(paste0(getwd(),'/','test/X_test.txt'),header=FALSE)
yTest <- read.table(paste0(getwd(),'/','test/Y_test.txt'),header=FALSE)
subjectTest <- read.table(paste0(getwd(),'/','test/subject_test.txt'),header=FALSE)

# Train data: x, y, and subject
xTrain <- read.table(paste0(getwd(),'/','train/X_train.txt'),header=FALSE)
yTrain <- read.table(paste0(getwd(),'/','train/Y_train.txt'),header=FALSE)
subjectTrain <- read.table(paste0(getwd(),'/','train/subject_train.txt'),header=FALSE)

## 1) Merges the training and the test sets to create one data set :
xData <- rbind(xTrain,xTest)
yData <- rbind(yTrain,yTest)
subjectData <- rbind(subjectTrain,subjectTest)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement:
features <- read.table(paste0(getwd(),'/',"features.txt"),header=FALSE) 
indexMeanSTD  <- grep("(mean|std)\\(\\)",features[,2])
xData_MeanSTD <- xData[,indexMeanSTD]
names(xData_MeanSTD) <- features[indexMeanSTD,2] 

# 3) Uses descriptive activity names to name the activities in the data set:
activity <- read.table(paste0(getwd(),'/','activity_labels.txt'),header=FALSE)

## The factor class categorize the data into 6 levels (1,2,3,4,5,6) with lables 1,2,3,4,5,6
## and then overwritten by the lables we specify according to the activities
yData[,1] <- factor(yData[,1],labels=activity[,2]) # alternative: yData[,1] <- activities[yData[,1],2]
names(yData) <- "Activity"

# 4) Appropriately labels the data set with descriptive variable names. 
names(subjectData) <- "Subject"
fullData <- cbind(xData_MeanSTD,yData,subjectData)

# It is easier to rename the columns via dplyr package
names(fullData) <- gsub("-", "\\.", names(fullData))
names(fullData) <- gsub("\\(\\)", "", names(fullData))
names(fullData) <- gsub("^t", "TimeDomain.", names(fullData))
names(fullData) <- gsub("^f", "FrequencyDomain.", names(fullData))
names(fullData) <- gsub("Acc", "Acceleration", names(fullData))
names(fullData) <- gsub("GyroJerk", "AngularAcceleration", names(fullData))
names(fullData) <- gsub("Gyro","AngularSpeed",names(fullData))
names(fullData) <- gsub("Mag","Magnitude",names(fullData))
names(fullData) <- gsub("mean","Mean",names(fullData))
names(fullData) <- gsub("std","StandardDeviation",names(fullData))

# 5) From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
library(dplyr)
tidydata <- fullData %>% group_by(Subject,Activity) %>% summarise_all(mean)
write.table(tidydata, file = "tidydata_mean.txt",row.name=FALSE)
