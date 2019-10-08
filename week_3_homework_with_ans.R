#read in the casualties again 
casualties <- read.csv(file.choose())
#remember when you're answering to talk about what the data means. Refer to the codebook where necessary
#available here: http://data.dft.gov.uk/road-accidents-safety-data/Brief-guide-to%20road-accidents-and-safety-data.doc

#Subset to create a dataframe of only fatal collisions

fatals <- casualties[casualties$Casualty_Severity==1,]

#Q1 Visually explore the relationship of sex with age using some of the graphical tools we introduced in week 2.
library(ggplot2)

fatals$Sex_of_Casualty <- as.factor(fatals$Sex_of_Casualty)

means <- aggregate(Age_of_Casualty ~  Sex_of_Casualty, fatals, mean)

ggplot(fatals, aes(x=Age_of_Casualty, fill=Sex_of_Casualty)) +
  geom_histogram(binwidth = 5)+
  facet_wrap(~Sex_of_Casualty) + 
  ggtitle("Title") + 
  labs(x="x", 
       fill="fill")

ggplot(fatals, aes(x=Age_of_Casualty, fill=Sex_of_Casualty)) +
  geom_histogram(binwidth = 5, position="identity", alpha=0.4)+
  ggtitle("Title") + 
  labs(x="x", 
       fill="fill")



ggplot(fatals, aes(x=Sex_of_Casualty, y=Age_of_Casualty)) +
  geom_boxplot()+
  stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show.legend = FALSE) + 
  geom_text(data = means, aes(label = round(Age_of_Casualty, digits = 0), y = Age_of_Casualty + 5))

#Q2 Use error bars, as descirbed in week 3, to compare the treatment and no treatment group in real earnings in 1975.
ggplot(fatals, aes(x=Sex_of_Casualty, y=Age_of_Casualty)) +
  stat_summary(fun.data = "mean_cl_normal", geom = "pointrange") #this function ask to display summary statistics as pointrange (the point is the mean and the lines end at the upper and lower CI limits). The "mean_cl_normal" uses the CI assuming normality.
#So if you prefer the bootstrapped confidence interval rather than assuming normality, you could use:
ggplot(fatals, aes(x=Sex_of_Casualty, y=Age_of_Casualty)) +
  stat_summary(fun.data = "mean_cl_boot", geom = "crossbar") #Here we are using a different geom just to show you the range of options, but you could also have used "pointrange". Or finally, you could also use "errorbars"
ggplot(fatals, aes(x=Sex_of_Casualty, y=Age_of_Casualty)) +
  stat_summary(fun.data = "mean_cl_boot", geom = "errorbar") +
  stat_summary(fun.y = mean, geom = "point")


#Q3 Use the t.test function to obtain the confidence intervals for the age of fatalities for each of these two groups (men and women).

t.test(Age_of_Casualty ~ Sex_of_Casualty , data = fatals)

casualties$Sex_of_Casualty <- as.factor(casualties$Sex_of_Casualty)

#Q4 How does this compare with difference between the age of the two groups in all casualties, with all severities?
#Hint: you might run into trouble as there are 3 categories in the total casualties data, 1 and 2 for male/female, but also -1 for missing data
#To replace a value with another value, you can assign with an ifelse conditional
#For example, in this case, the below code will replace -1 with NA values. Make sure to replace the dataframe name with whatever you've named your dataframe!
casualties$Sex_of_Casualty <- ifelse(casualties$Sex_of_Casualty=="-1", NA, casualties$Sex_of_Casualty)
#You should now be able to proceed
#Make sure to discuss your findings

t.test(Age_of_Casualty ~ Sex_of_Casualty , data = casualties)

ggplot(casualties, aes(x=Sex_of_Casualty, y=Age_of_Casualty)) +
  stat_summary(fun.data = "mean_cl_boot", geom = "errorbar") +
  stat_summary(fun.y = mean, geom = "point")

casualties2 <- casualties[!is.na(casualties$Sex_of_Casualty),]

ggplot(casualties2, aes(x = Sex_of_Casualty, y = Age_of_Casualty)) +
  stat_summary(fun.data = "mean_cl_normal", geom = "pointrange")



ggplot(casualties, aes(x=Sex_of_Casualty, y=Age_of_Casualty))+
  stat_summary(fun.data = "mean_cl_normal", geom="pointrange")


head(casualties$Age_of_Casualty)

casualties$Age_of_Casualty_Factor <- as.factor(casualties$Age_of_Casualty)
  
  
ggplot(casualties, aes(x=Sex_of_Casualty)) +
  geom_histogram(binwidth = 1) + 
  facet_grid(lowval~.)

table(casualties$Sex_of_Casualty)

