==================================================================
Analysis of the data provided by Human Activity Recognition Using Smartphones Dataset

==================================================================
Seema Garg
==================================================================


The input dataset includes the following files:
===============================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The output goals were:
=======================
Create one R script called run_analysis.R that does the following --
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Process Method:
================
Reference Data:
- Read the reference files first in DF - activity_labels.txt and features.txt

Subject Data:
- read the subject_test.txt and assign a name header
- read the subject_train.txt and assign a name header
- merge the subject DF created from the subject_test.txt and subject_train.txt
- remove the DF created from the subject_test.txt and subject_train.txt

Activities Data:
- read the y_test.txt and assign a name header
- read the y_train.txt and assign a name header
- merge the activities DF created from the y_test.txt and y_train.txt
- remove the DF created from the y_test.txt and y_train.txt
- Used descriptive activity (from DF created by activity_labels) names to name the activities in this data set

Measurement Data:
- read the X_test.txt and assign a name header created from features.txt
- read the X_train.txt and assign a name header created from features.txt
- merge the measurement DF created from the X_test.txt and X_train.txt
- remove the DF created from the X_test.txt and X_train.txt

Select:
- select only the measurement data for mean and Standard deviation by grepping "mean" and "std" in headers 

Merge:
- cbind the data created by subject, activities and selected measurement data

Mean of each variable for each activity and subject:
- group the above data based on subject and activity
- summarize the grouped data for average (mean
- arrange them in ascending order of activity and subject

Save:
- write the output data in output.txt file


# runAnalysis
