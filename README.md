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



Execution:
==================================================================
	Step 1:
		1.1 Load train and test data:
			1.1.1 Data sets:
				1.1.1.1 X_train.txt
				1.1.1.2 X_test.txt
			1.1.2 Data labels:
				1.1.2.1 y_train.txt
				1.1.2.2 y_test.txt
			1.1.3 Data sublect:
				1.1.3.1 subject_train.txt
				1.1.3.2 subject_tets.txt				
		1.2 Merge train and test data:
			1.2.1 Data sets to XStep1
			1.2.2 Data labels to yStep1
			1.2.3 Data subject to subjectStep1
		1.3 Save merged data:
			1.3.1 Data sets to XStep1.txt
			1.3.2 Data labels to yStep1.txt
			1.3.3 Data subject to subjectStep1.txt
	Step 2:
		2.1 Load complete list of variables features.txt
		2.2 Choose measurements from features list
		2.3 Choose variables of signals
		2.4 Find length of lists:
			2.4.1 complete feature
			2.4.2 chosen signals
			2.4.3 chosen variables
		2.5 Create empty vector for chosen index
		2.6 Find index of chosen variables of signal from complete list of variable ExtractsIndex 
		2.7 Find length of lists:
			2.7.1 Full Data Set (XStep1)
			2.7.2 Index of chosen variables
		2.8 Create empty vector for Chosen Data (Xstep1)
		2.9 Find Chosen Data from Data Set (XStep1)
		2.10 Create empty vector for chosen measurements labels
		2.11 Find measurements labels and change it a bit (featuresStep2)
		2.12 Save:
			2.12.1 Chosen Data to XStep2.txt
			2.12.2 Chosen measurements labels to featuresStep2.txt
	Step 3:
		3.1 Load Activity labels 
		3.2 Read Chosen Data to matrix by read.fwf
		3.3 Add 2 columns to matrix 1st activity labels and 2nd subject labels (XStep3)
		3.4 Merge activity names to data matrix
		3.5 Save matrix to XStep3.txt
	Step 4:
		4.1 Create same matrix XStep4 as XStep3
		4.2 Add names to columns of new matrix
		4.3 Save labeled matrix XStep4.txt
	Step 5:
		5.1 Split XStep4 by subject labels and activity labels
		5.2 Find number of splits
		5.3 Create empty matrix by size of number splited by 14 (12 data, activity names, subject lebel)
		5.4 Add names to columns of new matrix
		5.5 Calculate data means of each of data columns
		5.6 Replace column of activity labels by activity name
		5.7 Save final result to DataSet_Step5  


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
