## Step 1: Merge the training and test sets to create one data set

## Load the Test and Training files (data, labels, and subjects)
## Add the Test labels and Test subject IDs to the Test data, and
## similarly for the Training data.

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

Train_data <- cbind(X_train, subject_train, Y_train)
Test_data <- cbind(X_test, subject_test, Y_test)

## Append the Test data to the Train data to make one data set

Combined_data <- rbind(Train_data, Test_data)

## Step 2: Extract only the measurements on the mean and sd for each measurement

## Load the features labels and identify the elements of the features vector that
## should be extracted (those providing the means and standard deviations for
## each measurement)

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
features$Mean <- grepl("mean()", features[, 2], fixed = TRUE)
features$SD <- grepl("std()", features[, 2], fixed = TRUE)
features$MeanOrSD <- (features$Mean | features$SD)

## Create the extract with only these means and sd's of measurements,
## along with the the subject and Activity IDs (the last two variables in the frame)

keep_indicator <- features[features$MeanOrSD, 1]
data_extract <- Combined_data[, c(keep_indicator, 562, 563)]

## Step 3: Use descriptive activity names to name the activities in the data set
## Replace the Y_test and Y_train IDs with the corresponding activity description
## from the activity_labels.txt file

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

for (i in 1:6) {
        data_extract[data_extract[ , 68] == i, 68] <- activity_labels[i, 2]
}

## Step 4: Appropriately label the data set with descriptive variable names

## Variable names are based on the descriptive names in the features.txt file,
## with some necessary and helpful modifications (removing parentheses and hyphens).
## Means are indicated by .mean and SD's by .sd.  Additional detail is available
## in the codebook.

features$V2 <- gsub("-mean()-", ".mean.", features$V2, fixed = TRUE)
features$V2 <- gsub("-std()-", ".sd.", features$V2, fixed = TRUE)
features$V2 <- gsub("-mean()", ".mean", features$V2, fixed = TRUE)
features$V2 <- gsub("-std()", ".sd", features$V2, fixed = TRUE)
features$V2 <- gsub("BodyBody", "Body", features$V2, fixed = TRUE)
clean_names <- features[features$MeanOrSD, 2]

## Add these cleaned descriptive names to the data set extract, including names
## for the Subject and Activity IDs

colnames(data_extract) <- c(clean_names, "subject", "activity")

## Step 5: From this data set in Step 4, create a second, independent tidy data set
## with the average of each variable for each activity and each subject

## This tidy data set will be a wide data set with the average value for 
## each of the 66 measurements in the data extract for each subject and activity.
## This uses melt and cast from the reshape library.

library(reshape)
melted <- melt(data_extract, id = c("subject", "activity"))
tidy_data <- cast(melted, fun.aggregate = mean)

write.table(tidy_data, file ="tidy_data.txt", row.names = FALSE)
