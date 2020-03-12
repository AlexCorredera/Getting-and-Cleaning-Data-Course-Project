==================================================================
Coursera Getting and Cleaning Data Course Project - CodeBook
March 2020
Alex Corredera
==================================================================
This codebook describes the variables of the tidy dataset, the data and transformations to clean the data for the Coursera Getting and Cleaning Data Course Project

There are two datasets which were created for this Course Project ('df' and 'df2'). The first, 'df', is a tidy data set which combines test and train sets (excluding all measurements other than mean and standard deviation), with subject and activity labels, as well as descriptive variable names. See below for descriptions of these various files (test, train, subject, activity, etc.).

The second dataset, 'df2, is created from 'df'. It gives the average of each variable for each activity and subject.

Both datasets are tidy, as each column represents a variable (subject, activity, or a measurement) and each row represents an observation. 

Variables description:
=================

- 'subject' : Integer identifying the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'activity' : Factor variable labeling the activity name of each observation.
        1. 'walking'
        2. 'walking_upstairs'
        3. 'walking_downstairs'
        4. 'sitting'
        5. 'standing'
        6. 'laying'

- **All other variables are a combination of one signal and one measurement (mean or standard deviation).** See below for description and the complete list of signals and measurements. See the following section for the complete list of variables in the datasets ('df' and 'df2'). 
        
        -- Signals: As described in the original text file describing the           data, these signals were used to estimate variables of the feature          vector for each pattern: '.XYZ' is used to denote 3-axial signals          in the X, Y and Z directions.

                tBodyAcc.XYZ
                tGravityAcc.XYZ
                tBodyAccJerk.XYZ
                tBodyGyro.XYZ
                tBodyGyroJerk.XYZ
                tBodyAccMag
                tGravityAccMag
                tBodyAccJerkMag
                tBodyGyroMag
                tBodyGyroJerkMag
                fBodyAcc.XYZ
                fBodyAccJerk.XYZ
                fBodyGyro.XYZ
                fBodyAccMag
                fBodyAccJerkMag
                fBodyGyroMag
                fBodyGyroJerkMag

        -- Measurements:
                mean..: Mean value
                std..: Standard deviation

Complete list of Variables:
=================
- "subject"                     - "activity"                   
- "tBodyAcc.mean...X"           - "tBodyAcc.mean...Y"          
- "tBodyAcc.mean...Z"           - "tGravityAcc.mean...X"       
- "tGravityAcc.mean...Y"        - "tGravityAcc.mean...Z"       
- "tBodyAccJerk.mean...X"       - "tBodyAccJerk.mean...Y"      
- "tBodyAccJerk.mean...Z"       - "tBodyGyro.mean...X"         
- "tBodyGyro.mean...Y"          - "tBodyGyro.mean...Z"         
- "tBodyGyroJerk.mean...X"      - "tBodyGyroJerk.mean...Y"     
- "tBodyGyroJerk.mean...Z"      - "tBodyAccMag.mean.."         
- "tGravityAccMag.mean.."       - "tBodyAccJerkMag.mean.."     
- "tBodyGyroMag.mean.."         - "tBodyGyroJerkMag.mean.."    
- "fBodyAcc.mean...X"           - "fBodyAcc.mean...Y"          
- "fBodyAcc.mean...Z"           - "fBodyAccJerk.mean...X"      
- "fBodyAccJerk.mean...Y"       - "fBodyAccJerk.mean...Z"      
- "fBodyGyro.mean...X"          - "fBodyGyro.mean...Y"         
- "fBodyGyro.mean...Z"          - "fBodyAccMag.mean.."         
- "fBodyBodyAccJerkMag.mean.."  - "fBodyBodyGyroMag.mean.."    
- "fBodyBodyGyroJerkMag.mean.." - "tBodyAcc.std...X"           
- "tBodyAcc.std...Y"            - "tBodyAcc.std...Z"           
- "tGravityAcc.std...X"         - "tGravityAcc.std...Y"        
- "tGravityAcc.std...Z"         - "tBodyAccJerk.std...X"       
- "tBodyAccJerk.std...Y"        - "tBodyAccJerk.std...Z"       
- "tBodyGyro.std...X"           - "tBodyGyro.std...Y"          
- "tBodyGyro.std...Z"           - "tBodyGyroJerk.std...X"      
- "tBodyGyroJerk.std...Y"       - "tBodyGyroJerk.std...Z"      
- "tBodyAccMag.std.."           - "tGravityAccMag.std.."       
- "tBodyAccJerkMag.std.."       - "tBodyGyroMag.std.."         
- "tBodyGyroJerkMag.std.."      - "fBodyAcc.std...X"           
- "fBodyAcc.std...Y"            - "fBodyAcc.std...Z"           
- "fBodyAccJerk.std...X"        - "fBodyAccJerk.std...Y"       
- "fBodyAccJerk.std...Z"        - "fBodyGyro.std...X"          
- "fBodyGyro.std...Y"           - "fBodyGyro.std...Z"          
- "fBodyAccMag.std.."           - "fBodyBodyAccJerkMag.std.."  
- "fBodyBodyGyroMag.std.."      - "fBodyBodyGyroJerkMag.std.." 

*Note that two dots ('.') are used after the measurement and one is used before the axial signal in the X, Y or Z directions. In the original Human Activity Recognition Using Smartphones Dataset (see below), special characters are used instead of the dots. Here dots are used for simplicity.

**Furthermore, note that only the mean and standard deviation measurements were used. The original Human Activity Recognition Using Smartphones Datasets includes many other measurements which were excluded in this dataset.

Data:
=================
The two datasets ('df' and 'df2') used for this Course Project were transformed from the Human Activity Recognition Using Smartphones Dataset (Version 1) as provided by the Coursera course.

The original data Human Activity Recognition Using Smartphones Dataset (Version 1) is the data from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Here is the link to where the data was obtained, as provided by the course:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the link to the zip file which contains the data, as provided by the course:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In particular, the following files from the Human Activity Recognition Using Smartphones Dataset (Version 1) were consulted, transformed or manipulated:

- 'features.txt': List of all features.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

- 'activity_labels.txt': Links the class labels with their activity name.


Data Transformations:
=====================
To create the final tidy dataset 'df' for the course project, as well as the second, independent tidy data set giving the variable means for each group and subject 'df2', the following transformations were executed (these transformations are also detailed in the run_analysis.R file).

First, the 'features.txt' file was read into R (only extracting the second column), this was then used as the column names for the test and train sets.

Second, the test and train sets ('test/X_test.txt' and 'train/X_train.txt') were read into R, using the 'features' vector as column names. The test and train lables ('test/y_test.txt' and 'train/y_train.txt') were also read into R, using "activity" as the column name.

Third, the two subject datasets were read into R and saved as objects named "subject_test" and "subject_train". The column was named as "subject".

Fourth, the cbind function was used to clip together the various test objects (subject_test, y_test, X_test) in a complete "test" data frame. The same was done for the train objects to clip together a complete "train" data frame. The results were saved to two new objects named "test" and "train", respectively.

Fifth, the rbind function was used to clip together the test and train dataframes to a new object 'df'.

Sixth, descriptive activity names were added to the activities in the dataset. This was done by converting the activity variable to a factor variable and passing the names as labels in the function argument.

Seventh, the first tidy data set meeting the course specifications was created by extracting only the mean and standard deviation measurements (as well as the activity and subect columns). These measurements were identified by using the grep function on the names of 'df', the results were used to subset 'df' and create the specified data frame.

Eight and finally, the second independent tidy dataset with the average for each measurement for each activity and each subject was created by running 'df' through a chain command first grouping 'df' by activity and subject and then using the summarize_all function to generate a data frame calculating the mean of each measurement by activity and subject. This second dataset was saved as the object 'df2'.