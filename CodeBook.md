# Getting and Cleaning Data Project
1. Read "features.txt" to variable "features"
2. Read "activity_labels.txt" to variable "ActLabels"
3. Read "X_train.txt" and store it in a dataframe "X_train"
4. Set the column names for "X_train" from "features"
5. Read "y_train.txt", and store it in a dataframe called "Y_train", and set the column name to "Label"
6. Read "subject_train.txt", and store it in a dataframe "subject_train", and set the column name to "Subject"
7. Column bind  the dataframes - subject_train,X_train,Y_train, and assign it to a dataframe called "train"
8. Repeat Steps 3-7 for the Test Data, and we will have another dataframe called "test"
9. Merge "train" and "test" dataframe using the rbind command, and store it in a dataframe called "FullData"
10. Using the "grep" command select the column names from "FullData" that has either "mean" or "std" as part of the column string
11. Use the activity labels stored in "ActLabels" as a lookup for the Activity codes in the "FullData", and assign the appropritae descriptive activity names.
12. Create a second, independent dataset with the average of each variable for each activity and subject using the "group_by" and "summarize_each" functions.

