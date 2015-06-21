Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#The attached R script (run_analysis.R) performs the following tasks to clean up the data:

1. Merges the training and test sets to create one data set of the following data files

 q. train/X_train.txt with test/X_test.txt resulting in a 10299x561 data frame. - contain the measurement data
 b. train/subject_train.txt with test/subject_test.txt, resulting in a  10299x1 data frame - contain subject data
 c. train/y_train.txt with test/y_test.txt,resulting in a  10299x1 data frame - contain activity data

    Number of Instances: 10299
    Number of Attributes: 561" 

 

2. Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. 
   giving 10299x66 data frame. Only 66 out of 561 attributes are measurements on the mean and standard deviation. 
    


3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set. The following activities were recorded in the datafile.

	sitting
	standing
	laying
	walking
	walkingupstairs
	walkingdownstairs


4. The script also appropriately labels the data set with descriptive names for the  feature names (variable) and activity names as recorded /provided by the dataset.

5. The script combines the 10299x66 data frame containing features with 10299x1 data frames of activity labels and subject IDs. 

6. The output  is written to merged_dataset.txt with the  the first column containing the subject Ids, second column activity names, and the rest are measurements. 
   Subject IDs are integers between 1 and 30 inclusive.



7. The script also creates a 2nd output which averages the measurements by subject and activit creating a separate file  tidy_dataset_averages.txt.
   This contain the mean of each measuremnet for each subject, activity group. The output has 180 records from 30 subjects and 6 activities grouping.

  