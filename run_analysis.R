
library(doBy)

#Start by selecting the features I want
#These should then be the columns chosen from the y_train.txt and y_test.txt files
featinfo <- read.table("features.txt", header = FALSE, sep = " ")
myfeatmean <- featinfo[grep("mean\\(\\)",featinfo$V2), ]
myfeatstd <- featinfo[grep("std\\(\\)",featinfo$V2), ]
myfeat <- rbind(myfeatmean, myfeatstd)
fullist <- as.character(featinfo$V2)
wanted <- as.character(myfeat$V2)

#Make my first, combined dataset: columns need to be matched 
#subjectID from files subject_train.txt and subject_test.txt
#activityID from files y_train.txt and y_test.txt
#need to be matched to X_train.txt and X_test.txt
#Then, train and test sets should be combined
Xtest <- data.frame(read.table("./test/X_test.txt"))
Ytest <- data.frame(read.table("./test/y_test.txt"))
Stest <- data.frame(read.table("./test/subject_test.txt"))

names(Ytest)[names(Ytest)=="V1"] <- "activity"
names(Stest)[names(Stest)=="V1"] <- "subjectID"

compltest <- cbind(Xtest, Ytest, Stest)


#Now, repeat these steps for the training dataset:

Xtrain <- data.frame(read.table("./train/X_train.txt"))
Ytrain <- data.frame(read.table("./train/y_train.txt"))
Strain <- data.frame(read.table("./train/subject_train.txt"))

names(Ytrain)[names(Ytrain)=="V1"] <- "activity"
names(Strain)[names(Strain)=="V1"] <- "subjectID"

compltrain <- cbind(Xtrain, Ytrain, Strain)

#Question 1:
#Generate complete data file
completedata <- rbind(compltrain, compltest)

#Question 2:
#Now, extract only the mean and std columns: first, rename columns accordingly
#then, pull out all entries that are in my "wanted" list

fullist[[562]] = "activity"
fullist[[563]] = "subjectID"
wanted[[67]] = "activity"
wanted[[68]] = "subjectID"
dfcompletedata <- setnames(dtcompletedata,1:563,fullist)
dfsubdata <- subset(dfcompletedata,select = names(dfcompletedata) %in% wanted)


#Questions 3 and 4:
#Rename activities (use names in table), use meaningful column headers etc
#(remove the special symbols "(", ")", "-", "," which are currently
#in the column names)
wanted <- gsub("\\(","",wanted)
wanted <- gsub("\\)","",wanted)
wanted <- gsub("\\-","",wanted)
wanted <- gsub("\\,","",wanted)
dfsubdata <- setnames(dfsubdata,1:68,wanted)

dfsubdata$activity[(dfsubdata$activity) == 1] <- "WALKING"
dfsubdata$activity[(dfsubdata$activity) == 2] <- "WALKING_UPSTAIRS"
dfsubdata$activity[(dfsubdata$activity) == 3] <- "WALKING_DOWNSTAIRS"
dfsubdata$activity[(dfsubdata$activity) == 4] <- "SITTING"
dfsubdata$activity[(dfsubdata$activity) == 5] <- "STANDING"
dfsubdata$activity[(dfsubdata$activity) == 6] <- "LAYING"

#Question 5:
#Calculate the average for each subjectID-activity-measurement combination
#Generate clean dataset output file
dfsubdata$actsubjID = as.factor(paste(dfsubdata$activity, dfsubdata$subjectID, sep="_"))
dfsubdata$subjectID = as.character(dfsubdata$subjectID)
subdatameans <- data.frame(summaryBy(.~actsubjID, data = dfsubdata, FUN = mean))

write.table(subdatameans, "subdatameans.txt", sep = "\t")
