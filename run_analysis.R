##Download dataset into R
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ", dest="dataset.zip", mode="wb")
unZipped <- unzip("dataset.zip")

##Read Test and Training measurements and combine into one dataframe
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
combinedSet <- rbind(xTest, xTrain)

##Extract relevant columns (mean and standard deviation for each measurement)
tBodyAcc <- combinedSet[1:6]
tGravityAcc <- combinedSet[41:46]
tBodyAccJerk <- combinedSet[81:86]
tBodyGyro <- combinedSet[121:126]
tBodyGyroJerk <- combinedSet[161:166]
tBodyAccMag <- combinedSet[201:202]
tGravityAccMag <- combinedSet[214:215]
tBodyAccJerkMag <- combinedSet[227:228]
tBodyGyroMag <- combinedSet[240:241]
tBodyGyroJerkMag <- combinedSet[253:254]
fBodyAcc <- combinedSet[266:271]
fBodyAccJerk <- combinedSet[345:350]
fBodyGyro <- combinedSet[424:429]
fBodyAccMag <- combinedSet[503:504]
fBodyBodyAccJerkMag <-combinedSet[516:517]
fBodyBodyGyroMag <- combinedSet[529:530]
fBodyBodyGyroJerkMag <- combinedSet[542:543]

##Read subject and activity info for Test and Train sets and create vectors for each 
yTest <- scan("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- scan("./UCI HAR Dataset/test/subject_test.txt")
yTrain <- scan("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- scan("./UCI HAR Dataset/train/subject_train.txt")
combinedActivities <- c(yTest, yTrain)
combinedSubjects <-c(subjectTest, subjectTrain)

activityLabels <- read.csv("./UCI HAR Dataset/activity_labels.txt", header=FALSE)

##Create dataframe with only relevant info and name columns
df <- data.frame(combinedSubjects, combinedActivities, tBodyAcc, tGravityAcc,tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc,fBodyAccJerk, fBodyGyro, fBodyAccMag,fBodyBodyAccJerkMag,fBodyBodyGyroMag, fBodyBodyGyroJerkMag)
colnames(df) <- c("Subjects","Activities", "tBodyAcc-X-Mean", "tBodyAcc-Y-Mean","tBodyAcc-Z-Mean","tBodyAcc-X-STD", "tBodyAcc-Y-STD", "tBodyAcc-Z-STD", "tGravityAcc-X-Mean", "tGravityAcc-Y-Mean","tGravityAcc-Z-Mean","tGravityAcc-X-STD", "tGravityAcc-Y-STD", "tGravityAcc-Z-STD", "tBodyAccJerk-X-Mean", "tBodyAccJerk-Y-Mean","tBodyAccJerk-Z-Mean","tBodyAccJerk-X-STD", "tBodyAccJerk-Y-STD", "tBodyAccJerk-Z-STD","tBodyGyro-X-Mean", "tBodyGyro-Y-Mean","tBodyGyro-Z-Mean","tBodyGyro-X-STD", "tBodyGyro-Y-STD", "tBodyGyro-Z-STD", "tBodyGyroJerk-X-Mean", "tBodyGyroJerk-Y-Mean","tBodyGyroJerk-Z-Mean","tBodyGyroJerk-X-STD", "tBodyGyroJerk-Y-STD", "tBodyGyroJerk-Z-STD", "tBodyAccMag-Mean", "tBodyAccMag-STD", "tGravityAccMag-Mean", "tGravityAccMag-STD","tBodyAccJerkMag-Mean", "tBodyAccJerkMag-STD","tBodyGyroMag-Mean", "tBodyGyroMag-STD","tBodyGyroJerkMag-Mean", "tBodyGyroJerkMag-STD", "fBodyAcc-X-Mean", "fBodyAcc-Y-Mean","fBodyAcc-Z-Mean","fBodyAcc-X-STD", "fBodyAcc-Y-STD", "fBodyAcc-Z-STD", "fBodyAccJerk-X-Mean", "fBodyAccJerk-Y-Mean","fBodyAccJerk-Z-Mean","fBodyAccJerk-X-STD", "fBodyAccJerk-Y-STD", "fBodyAccJerk-Z-STD", "fBodyGyro-X-Mean", "fBodyGyro-Y-Mean","fBodyGyro-Z-Mean","fBodyGyro-X-STD", "fBodyGyro-Y-STD", "fBodyGyro-Z-STD", "fBodyAccMag-Mean", "fBodyAccMag-STD", "fBodyAccJerkMag-Mean", "fBodyAccJerkMag-STD", "fBodyGyroMag-Mean", "fBodyGyroMag-STD", "fBodyGyroJerkMag-Mean", "fBodyGyroJerkMag-STD")
dfMeans <- subset(df, select = c(1:5,9:11,15:17,21:23,27:29,33,35,37,39,41,43:45,49:51,55:57,61,63,65,67))

##Subset by activity
walking <- subset(dfMeans, Activities == 1)
walkingUpstairs <- subset(dfMeans, Activities == 2)
walkingDownstairs <- subset(dfMeans, Activities == 3)
sitting <- subset(dfMeans, Activities == 4)
standing <- subset(dfMeans, Activities == 5)
laying <- subset(dfMeans, Activities == 6)

##Compute mean for each activity by subject
walkingMeans <- sapply(split(walking[3:35], walking$Subjects), function(x) mean(rowMeans(x)))
walkingUpstairsMeans <- sapply(split(walkingUpstairs[3:35], walkingUpstairs$Subjects), function(x) mean(rowMeans(x)))
walkingDownstairsMeans <- sapply(split(walkingDownstairs[3:35], walkingDownstairs$Subjects), function(x) mean(rowMeans(x)))
sittingMeans <- sapply(split(sitting[3:35], sitting$Subjects), function(x) mean(rowMeans(x)))
standingMeans <- sapply(split(standing[3:35], standing$Subjects), function(x) mean(rowMeans(x)))
layingMeans <- sapply(split(laying[3:35], laying$Subjects), function(x) mean(rowMeans(x)))

##Create simplified dataset with only single mean for each activity per subject
simplified <- data.frame(walkingMeans, walkingUpstairsMeans, walkingDownstairsMeans, sittingMeans, standingMeans, layingMeans)
write.table(simplified, "smartphoneData.txt", row.names = FALSE)