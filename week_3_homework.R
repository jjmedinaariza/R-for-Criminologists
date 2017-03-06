#read in the casualties again 

#remember when you're answering to talk about what the data means. Refer to the codebook where necessary
#available here: http://data.dft.gov.uk/road-accidents-safety-data/Brief-guide-to%20road-accidents-and-safety-data.doc

#Subset to create a dataframe of only fatal collisions


#Q1 Visually explore the relationship of sex with age using some of the graphical tools we introduced in week 2.


#Q2 Use error bars, as descirbed in week 3, to compare the age of male and female fatalities.


#Q3 Use the t.test function to obtain the confidence intervals for the age of fatalities for each of these two groups (men and women).


#Q4 How does this compare with difference between the age of the two groups in all casualties, with all severities?
#Hint: you might run into trouble as there are 3 categories in the total casualties data, 1 and 2 for male/female, but also -1 for missing data
#To replace a value with another value, you can assign with an ifelse conditional
#For example, in this case, the below code will replace -1 (as a factor, notice its in quotes) with NA values. Make sure to replace the dataframe name with whatever you've named your dataframe!
casualties$Sex_of_Casualty <- ifelse(casualties$Sex_of_Casualty=="-1", NA, casualties$Sex_of_Casualty)
#You should now be able to proceed
#Make sure to discuss your findings

