## step 0
# check if Result folder exists if not create one
if(!file.exists("./Results")){dir.create("./Results")}

## step 1
# load data sets
Xtrain <- readLines("./train/X_train.txt")
Xtest <- readLines("./test/X_test.txt")
ytrain <- readLines("./train/y_train.txt")
ytest <- readLines("./test/y_test.txt")
subjecttrain <- readLines("./train/subject_train.txt")
subjecttest <- readLines("./test/subject_test.txt")
# merge data sets into one data set for each type
XStep1 <- c(Xtrain,Xtest)
yStep1 <- c(ytrain,ytest)
subjectStep1 <- c(subjecttrain,subjecttest)
# save data sets
write.table(XStep1, file="./Results/XStep1.txt", row.names=FALSE, col.names=FALSE)
write.table(yStep1, file="./Results/yStep1.txt", row.names=FALSE, col.names=FALSE)
write.table(subjectStep1, file="./Results/subjectStep1.txt", row.names=FALSE, col.names=FALSE)


##step 2
# AS I understood from features_info.txt this data come from 2 sensores: Accelerometer and Gyroscope so it's my measured data
# "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ"
# all other data signals not requested in the tack
# load features list
featuresList <- readLines("./features.txt")
# define which signals required
measurementsToGet  <- c("tBodyAcc-","tBodyGyro-")
# define which set of variables required
variablesToGet  <- c("mean()","std()")
# find length of features
lengthOfFeatures <- length(featuresList)
# find length of signals required
lengthOfMeasurements <- length(measurementsToGet)
# find length of set of variables required
lengthOfVariables <- length(variablesToGet)
# create empty vector
ExtractsIndex <- vector()
# run on all features.txt file and find INDEX of all required signals with required set of variables
for(i in 1:lengthOfFeatures){
    for (j in 1:lengthOfMeasurements){
        if (grepl(measurementsToGet[j],featuresList[i])){
            for (l in 1:lengthOfVariables){
                # each time that features include requited measurement it's index added to ExtractsIndex vector
                if (grepl(variablesToGet[l],featuresList[i])) ExtractsIndex <- c(ExtractsIndex,i) 
            }
        }
    }
}

# find length of full data set
lengthOfData <- length(XStep1)
# find length of requited index set
lengthOfExtracts <- length(ExtractsIndex)
# create empty vector
XStep2  <- vector()
# get only requited measurement by ExtractsIndex vector for each line of data
# the data set build in fixed width format by at this point too big to run read.fwf so the script copy/paste only index of requited measurements
for (i in 1:lengthOfData){
    # find position of end of first measurement
    endlocation  <- ExtractsIndex[1]*16
    # find position of start of first measurement
    startlocation  <- endlocation - 15
    # add first requited measurement to result vector of step 2
    XStep2[i] <- paste("",substr(XStep1[i],startlocation,endlocation),sep = "", collapse = NULL)
    for (j in 2:lengthOfExtracts){
        # find position of end of jst measurement
        endlocation  <- ExtractsIndex[j]*16
        # find position of start of jst measurement
        startlocation  <- endlocation - 15
        # add jst requited measurement to result vector of step 2
        XStep2[i] <- paste(XStep2[i],substr(XStep1[i],startlocation,endlocation),sep = "", collapse = NULL)
    }
}

# create empty vector
featuresStep2 <- vector()
for (i in 1:lengthOfExtracts){
    # get only featuresList in Extracts Indexs
    featuresStep2[i]  <- substring(strsplit(featuresList[ExtractsIndex[i]], split=" ", fixed = FALSE, perl = FALSE, useBytes = FALSE)[[1]][2],2,)
}

# save data sets
fileConn<-file("./Results/XStep2.txt")
writeLines(XStep2, fileConn)
close(fileConn)
# save features of requided data
fileConn<-file("./Results/featuresStep2.txt")
writeLines(featuresStep2, fileConn)
close(fileConn)


## step 3
# load activities names
activityLabels <- read.csv("activity_labels.txt",sep=" ",header=FALSE)
# create numerical matrix from file
XStep2Matrix <- read.fwf("./Results/XStep2.txt",skip=0,widths=rep.int(16, 12))
# add index of activity and subject labels to matrix
XStep3 <- cbind(yStep1,subjectStep1,XStep2Matrix)
# add activty names to matrix
XStep3 <- merge(XStep3,activityLabels,by.x=1,by.y=1,sort=FALSE)
# save data set
write.table(XStep3, file="./Results/XStep3.txt", row.names=FALSE, col.names=FALSE)


## step 4
XStep4 <- XStep3
# add descriptive variable names
colnames(XStep4) <- c("activity_labels","subject_labels",featuresStep2,"activity_names")
# save data set
write.table(XStep4, file="./Results/XStep4.txt", row.names=FALSE, col.names=FALSE)


## step 5
# split by subject_labels & activity_labels 
# include all measured data (3:14) subject_labels (2) and activity_name (15) 
XStep4_splited <- split(XStep4[2:15],list(XStep4$subject_labels,XStep4$activity_labels))
# find length of splited data set
n_split <- length(XStep4_splited)
# create empty data frame
DataSet_Step5 <- data.frame(matrix(nrow = n_split, ncol = 14))
# add names from data frame
colnames(DataSet_Step5) <- c(colnames(XStep4[15]),colnames(XStep4[2:14]))
# calculate means for each of the split datas 
for (i in 1:n_split) {
    # set activity for final data 
    DataSet_Step5[i,1] <- XStep4_splited[[i]][[14]][1]
    # set subject index for final data
    DataSet_Step5[i,2] <- XStep4_splited[[i]][[1]][1]
    # calculate and set average of each column of data set 
    DataSet_Step5[i,3:14] <- colMeans (XStep4_splited[[i]][2:13], na.rm = FALSE, dims = 1)
}
# set activity names for final data
DataSet_Step5[,1] <- merge(DataSet_Step5,activityLabels,by.x=1,by.y=1,sort=FALSE)[15]
# save final data set
write.table(DataSet_Step5, file="./Results/DataSet_Step5.txt", row.names=FALSE)