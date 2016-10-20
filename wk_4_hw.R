#Week 4: Contrasting means.
#For this exercise you need to download a dataset available from Open Justice, which is a
#transparency initiative led by the California Department of Justice that publishes criminal justice data 
#The dataset in question is about deaths in Death in Custody & Arrest-Related Deaths.
#You can access this data set, and others here: https://openjustice.doj.ca.gov/data

#As it is readily available in .csv format online, you can read this data in directly from the web. 
#Do this using read.csv() function. You have to pass it the value of the URL. 
#The data can be found here: 'https://openjustice.doj.ca.gov/downloads/ca_doj_deaths_in_custody_raw_1980-2015_05-14-2016.csv'
#Q1: Read in the data to R and have a look at it.
#Also take a look at the Readme file: https://openjustice.doj.ca.gov/downloads/death-in-custody-readme.pdf
#and the data dictionary: https://openjustice.doj.ca.gov/downloads/ca_doj_county_deaths_in_custody_summary_data_dictionary_02-17-2016.pdf
#Note: be patient! This is a large dataset so it might take a while to load


#At this point, have a look at the data, see all the variables. We are mainly interested in gender and ethnicity, to see any relationship between these variables and the number of deaths in custody.
#So to do this, we will subset the dataframe, using the data wrangling package dplyr.
#Install and load up the dplyr package
library(dplyr)
#create a new count column, that counts each death incident. At this point, each value should be 1, as each row is one death instance
#note: the below code assumes your df is called 'prisonDeaths'. If you name it something else change below
prisonDeaths$numDeaths <- 1
#then use the pipelines (%>%) to summarise the data
groupedData <- prisonDeaths %>%
  group_by(date_of_death_yyyy, race) %>%
  summarize(deaths = sum(numDeaths))
#If you want to learn more about dplyr, see here: https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
#Now have a look at your new dataframe called 'groupedData'

#Q2: Prisons in California are notorious for their terrible condtions. 
#In 2004, a Corrections Independent Review Panel appointed by Governor Arnold Schwarzenegger set out to review the state of California's correctional system.
#We might want to see, whether anything changed after this review in terms of number of deaths in prisons?
#To answer this question, you need to first create a new factor variable within the dataframe, using the year column (date_of_death_yyyy), to group each incident
#into either before 2004, or 2004 and after, based on when they took place.
#Hint: To create a new column, create a variable name for the new column and pass in its value
#For example, dataframe$newColumn <- "I am some data" will create a new column where every row will say "I am some data"
#You can use the ifelse command, like we did last weeks homework, to first test whether a criteria is met, and then assign value to your new column.
#Example: dataframe$newColumn <- ifelse(dataframe$otherColumn <= some number, "one value", "other value")
#If you're confused, this stackoverflow question might help: http://stackoverflow.com/questions/16570302/how-to-add-a-factor-column-to-dataframe-based-on-a-conditional-statement-from-an

#Q3: In a few questions, we will also be interested to see the difference in number of deaths by race. 
#If we look at the data, we can see the race column has a lot of values with small counts. We just want to focus on the top three represented race categories here
#Subset your dataframe so you only include cases where ethnicity is either "White" or "Black" or "Hispanic". 

#Now the data cleaning is done, let's get to analysis!

#Q4: Is there a difference in the number of deaths in arrest or custody between the pre and post 2004 groups? Is this significant? Is it large or small? Discuss. 

#Q5: Is there a relationship between ethnicity and number of deaths in arrest or custody? 
#Ie: is there a difference in number of deaths between different race or ethnic groups? Is this difference significant? Is it large or small? 
#Discuss & illustrate with visualisations. 



