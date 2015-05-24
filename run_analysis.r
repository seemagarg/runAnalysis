library(dplyr)

## read the activity label file
activity_labels <- read.table("activity_labels.txt", header=F)
names(activity_labels) <- c("Activity")

## read the features name file
features_rows <- read.table("features.txt", header=F)
features_cols <- t(features_rows$V2)

 
# reads the test subject  file
subject_test <- read.table("test/subject_test.txt", header=F)
names(subject_test) <- c("Subject")

# reads the train subject file
subject_train <- read.table("train/subject_train.txt", header=F)
names(subject_train) <- c("Subject")


## get all the subject data in one DF
subject <- rbind(subject_test, subject_train);
rm(subject_test)
rm(subject_train)

## read the activity data file
activity_test <- read.table("test/y_test.txt", header=F)
names(activity_test) <- c("Activity")


## read the activity data file
activity_train <- read.table("train/y_train.txt", header=F)
names(activity_train) <- c("Activity")


## get all the activity data in one DF
activity <- rbind(activity_test, activity_train);
rm(activity_test)
rm(activity_train)

## replace the column # by column name in activity data
activity <- merge(activity, activity_labels)[-1]
names(activity) <- c("Activity")

#this is to read measurement data faster
#Read X_test data
initial <- read.table("test/X_test.txt", nrows=10)
classes <- sapply(initial, class)
measurementData_test <- read.table("test/X_test.txt", header=F, colClasses=classes)
features_cols <-gsub("[^[:alnum:] ]", "", features_cols)
names(measurementData_test) <- features_cols

#Read X_Train data
initial <- read.table("train/X_train.txt", nrows=10)
classes <- sapply(initial, class)
measurementData_train <- read.table("train/X_train.txt", header=F, colClasses=classes)
names(measurementData_train) <- features_cols


## get all the measurement data in one DF
measurementData <- rbind(measurementData_test, measurementData_train);
rm(measurementData_test)
rm(measurementData_train)

## get only the mean and std columns from measurementdata
meansdData <- measurementData[,grep("mean|std", colnames(measurementData))]
rm(measurementData)

## merge all the three data frames subject, activies and mean and sd
completeData <- do.call(cbind, list(subject, activity, meansdData))


## Group completeData by Activity and Subject
groupData <- group_by(completeData, Activity, Subject)


## summarize the data by finding mean of all the colums except activity and subject 
finalData <- summarise_each(groupData, funs(mean))
arrange(finalData, Activity, Subject)


write.table(finalData, file = "output.txt", row.name=FALSE);

