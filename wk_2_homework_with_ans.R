#Load up the data into R. Download the casualities data from Blackboard
casualties <- read.csv(file.choose())
View(casualties)

#Look through the codebook
#Available here: 
#To see what the different codings and variable names mean

#Q1: Display a histogram for the age of casuaty variable. Discuss. Try to identify the identify of any outliers and discuss. Are these errors?

ggplot(casualties, aes(x=Age_of_Casualty)) + 
  geom_bar()  

#There is an age of -1, this appears to be how they coded when they didn't know the age of the casuality

#Q2: Produce density estimates and boxplots to compare the age of casualtiy according to various categories of the level of the severity of the casualty. Discuss.
ggplot(casualties, aes(x=Age_of_Casualty)) + 
  geom_density() +
  facet_wrap(~Casualty_Severity)

#More serious peaks at younger ages. 

#Q3: Are men or women involved with more casualties in this dataset?
ggplot(casualties, aes(x=Sex_of_Casualty)) + 
  geom_bar()

#OK now let have a look at some of the gapminder data. If you watched the initial Hans Rosling video I recommeed, you will be somewhat familiar with this data
#Load up the gapminder package 
library(gapminder)

#Now you have the gapminder data. Check by trying to View it
View(gapminder)

#Q4: Produce a scatterplot with a smoothed line to examine the relationship between life expectancy and GDP per capita. Discuss.
library(ggplot2)
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_point() + 
  geom_smooth()

#Q5: Produce a scatterplot matrix to examine the relationship between life expectancy and GDP per capita and population size. Discuss.

pairs(gapminder[,4:6])


