library(data.table)
library(dplyr)


# Data Source https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Working directory should be at the unzip dataset directory level
# 1.Merges the training and the test sets to create one data set


x.train <- read.table("train/X_train.txt") 
x.test  <- read.table("test/X_test.txt") 
x <- rbind(x.train, x.test) 


s.train <- read.table("train/subject_train.txt") 
s.test <- read.table("test/subject_test.txt") 
s <- rbind(s.train, s.test) 

y.train <- read.table("train/y_train.txt") 
y.test <- read.table("test/y_test.txt") 
y <- rbind(y.train, y.test) 


# 2.Extracts only the measurements on the mean and standard deviation for each measurement.


features <- read.table("features.txt")
names(x) = features[,2]
#  ** select the features with mean , std text and get its row #  
r <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) 
# subset the x dataset for only mean and std dev measurements /features
xms <- x[,r]
# remove () text from the variable /column names

names(xms) <- gsub("\\(|\\)", "", names(xms)) 


# 3.Uses descriptive activity names to name the activity in the data set


activities <- read.table("activity_labels.txt")
# change to lower case 
activities[, 2] =  tolower(as.character(activities[, 2]))
# change y activity column ode to description 
names(y) <- "activity" 
y[,"activity"] = activities[Y[,"activity"], 2] 

names(s) <- "subject" 

# 4.Appropriately labels the data set with descriptive variable names.


#  Merge into 1 dataset 
m <- cbind(s, y, xms)

# Output the single dataset 
write.table(m, "merged_dataset.txt",row.name = FALSE) 


41 # 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject. 

m2 <- m %>% group_by(subject,activity) %>% summarise_each(funs(mean))
write.table(m2, "tidy_dataset_averages.txt",row.name=FALSE) 

