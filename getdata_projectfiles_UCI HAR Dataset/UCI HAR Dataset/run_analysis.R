#Read in all of the necessary data
activity <- read.table("activity_labels.txt")
features <- read.table("features.txt")

subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt", col.names = features[,2])
X_train <- read.table("train/X_train.txt", col.names = features[,2])

Y_test <- read.table("test/Y_test.txt")
Y_train <- read.table("train/Y_train.txt")

#Merge the data
subject <- rbind(subject_test, subject_train)
X <- rbind(X_test, X_train)
Y <- rbind(Y_test, Y_train)

#Subset only mean and std columns
x_mean_std <- X[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 294:296, 345:350, 373:375, 424:429, 452:454, 503:504, 513, 516:517, 526, 529:530, 539, 542:543, 552, 556:561)]

#Give descriptive activity labels
activity_Y <- c()
for (i in 1:dim(Y)[1])
{
  t <- ""
  if (Y[i,1] == 1)
    t <- as.character(activity[1,2])
  else if (Y[i,1] == 2)
    t <- as.character(activity[2,2])
  else if (Y[i,1] == 3)
    t <- as.character(activity[3,2])
  else if (Y[i,1] == 4)
    t <- as.character(activity[4,2])
  else if (Y[i,1] == 5)
    t <- as.character(activity[5,2])
  else if (Y[i,1] == 6)
    t <- as.character(activity[6,2])
  activity_Y <- c(activity_Y, t)
}

#Combine final table and correct headers
final_table <- cbind(subject, activity_Y, x_mean_std)
colnames(final_table) <- c("subjects", "activity", colnames(x_mean_std))
write.table(final_table, "experiment_data.txt", sep="\t", row.names=FALSE)

#Calculate mean for all columns
avg_table <- aggregate(final_table[,3:dim(final_table)[2]], by=list(final_table$subjects, final_table$activity), FUN=mean)
colnames(avg_table) <- c("subjects", "activity", colnames(avg_table)[3:dim(avg_table)[2]])

#Write to a file
write.table(avg_table, "activity_experiment_mean_data.txt", sep="\t", row.names=FALSE)

#output table
final_table