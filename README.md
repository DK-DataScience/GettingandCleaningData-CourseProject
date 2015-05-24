==================================================================
Coursera Getting and Cleaning Data Course Project
==================================================================
Bassed on:
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Motivation:
==================================================================

The purpose of this project is to demonstrate me ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The code have a file run_analysis.R in the main directory that may be run as long as the Samsung data is in working directory. The result of the code including eash step results can be found in Results directory if this not exists in you working directory the code will create one.


The Project includes the following files:
==================================================================

- 'README.md'

- 'run_analysis.R': R code script.

- 'CodeBook.md': Include data to indicate all the variables and summaries that calculated, along with units, and any other relevant information.


run_analysis.R script does the following: 
==================================================================

    Step1. Merges the training and the test sets to create one data set.
    Step2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    Step3. Uses descriptive activity names to name the activities in the data set
    Step4. Appropriately labels the data set with descriptive variable names. 
    Step5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



The Results includes the following files:
==================================================================

Step1:

- 'XStep1.txt': merge of data sets.

- 'yStep1.txt': merge of data labels.

- 'subjectStep1.txt': merge of subject labels.


Step2:

- 'XStep2.txt': measurements of the mean and standard deviation data sets.

- 'featuresStep2.txt': measurements name list.


Step3:

- 'XStep3.txt': activity names and subject labels added to data sets.


Step4:

- 'XStep4.txt': descriptive variable names added to data sets.


Step5:

- 'DataSet_Step5.txt': new tidy data sets with final the average of each variable for each activity and each subject - final result of the project.

Notes: 
==================================================================
- Features are normalized and bounded within [-1,1].
- First column of final result is Activity names include: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- Second column of final result is Subject labels (identifies of the subject who performed the activity) range 1 to 30
- Each average of measurement is a column 3 to 14 on the text file.

- For line by line explanation please read comments in run_analysis.R script file.

For more information about this dataset contact me.
