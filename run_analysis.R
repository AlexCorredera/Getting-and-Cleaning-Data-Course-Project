# This is code to replicate the analyses and figures for the Gettting and
# Cleaning Data Course Project. Data from the UCI HAR Dataset zip file provided
# by the course is used. The Explanations are included to resume all of the various 
# steps taken to complete the analyses.

# In summary, the following code (1) merges the training and test sets to create 
# one data set, steps 1-7, (2) extracts only measurements on the mean and standard
# deviation for each measurement, step 7, (3) uses descriptive activity labels to       
# name the activities in the data set, step 6, (4) labels the data set with descriptive
# variable names, steps 1-2, (5) creates a second tidy data set with the average 
# of each variable for each activity and each subject, step 8.

# 1. First, read the features dataset into R and store this as an object ("features")
# This will be used as the column names when reading the test and train  
# sets (X_test, X_train) into R. Furthermore, only read the second column of the 
# data frame into R, as this is the column which contains the names of the 
# features. By only reading in this second column, the resulting object will be 
# a factor vector which can be directly used as the column names for test and 
# train sets.

features <- read.table("./UCI HAR Dataset/features.txt")[, 2]

# 2. Read the test and train data sets and labels into separate data frames in R.
# Store the four data frames into separate objects (X_test, y_test, X_train, 
# y_train). Use the features list as column names for the sets and "activity" 
# for the lable column name.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")

# 3. Read the two subject datasets into R and save this as objects named 
# "subject_test" and "subject_train". Name the column as "subject".
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# 4. Use the cbind function to clip together the various test objects (subject_test,
# y_test, X_test) in a complete "test" data frame. Do the same for the train 
# objects to clip together a complete "train" data frame. Store these two new 
# data frames into objects named "test" and "train", respectively. Clipping together
# the subject and activity data sets to the test / train data frames before merging
# the test and train data frames will ensure that the subject and activity values 
# assigned to the propper test / train observation.
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)

# 5. Use the rbind function to clip together the test and train dataframes. As both
# of these datasets have the same variable names, the rbind function will create 
# unified dataset without introducing any NAs. Save the dataset as object "df".
df <- rbind(train, test)

# 6. Add descriptive activity names to the activities in the dataset. The activity 
# names are found in the "activity_labels" text file in the zip file. Include these
# names as labels by converting the activity variable to a factor varaible and 
# including the 'labels =' argument of the function. Pass the labels in the order
# corresponding to the smallest level (1) to the largest level (6). Hence, "walking"
# is the first label to be passed and "laying" is the last label to be included 
# in this character vector. Save the resulting factor variable to the data frame.
df$activity <- factor(df$activity, labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))

# 7. Create the final data set which only extracts the measurements on the mean and
# the standard deviation for each measurement. 

# 7a. First identify which variables represent measurements on the mean and 
# standard deviation with the grep function using regular expressions. Save the 
# results to objects "means" and "stds", respectively. Reference for the names of 
# variables is found in the "features.txt" file in the zip file. Mean measurements
# can be identified searching for names which include "mean" (with a lower case "m")
# followed by a period. Other incstances of mean (with an upper case "M" or not
# followed by a period) refer to other variable names which are not mean measurements.
# Standard deviation measurements can be identified searching for neames with 
# include "std".
means <- grep("mean\\.", names(df)) # <two forward slashes are used to identify 
# an actual period.>
stds <- grep("std", names(df))

# 7b. subset the 'df' data frame with, '1' (subject column), '2' (activity column) 
# and the 'means' and 'stds' objects to the right of the comma in the subset brackets. 
# Save the result to the 'df' object. This is now the final tidy data set with 
# descriptive variable and activitiy names and which only extracts measurements 
# on the mean and standard devaition for each measurement.
df <- df[, c(1, 2, means, stds)]

# 8. Create a second independent tidy data set with the average for each 
# measurement for each activity and each subject. This is done by running the df
# data frame through a chain which first groups df by subject and activity and then
# uses the summarise_all function, passing mean as the argument, which will calculate
# the mean of each variable in df by subject and activity. Save the resulting 
# tidy data set to a new object 'df2'.
library (dplyr) #<make sure the dplyr package is loaded>
df2 <- df %>% group_by(subject, activity) %>% summarise_all(mean)

