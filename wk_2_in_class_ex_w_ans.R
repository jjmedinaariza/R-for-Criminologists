
#Load up ggplot2() package. 
library(ggplot2)

#you also have to install and load up the "jsonlite" package
library(jsonlite)

#There is currently a petition to Make it illegal for a company to require women to wear high heels at work
#The UK government petitions release their data in JSON format
#Don't worry too much about what that is, I'll give you code to read it here
data1 <- fromJSON("https://petition.parliament.uk/petitions/129823.json")
#This is essentially a data format that's pretty messy, but there are ways of extracting information from it
#For example, you can get the signatures by country of origin of the signatory
signByCountry <- as.data.frame(data1$data$attributes$signatures_by_country)
#now have a look at this dataframe

#Are signatures from the UK only?
unique(signByCountry$name)

#Create a graph that shows how many signatures are from each country. 


ggplot(signByCountry, aes(x=name, y=signature_count)) + 
  geom_bar(stat="identity")

#Make sure that your graph is presentable and carries some useful information 

ggplot(signByCountry, aes(x=name, y=signature_count)) + 
geom_bar(stat="identity") + coord_flip() + 
  xlab("Name of country") +
  ylab("Number of signatures from country")

#See if you can order this graph in decreasing order

signByCountry <- transform(signByCountry, name = reorder(name, signature_count))
ggplot(signByCountry, aes(x=name, y=signature_count)) + 
  geom_bar(stat="identity") + coord_flip() + 
  xlab("Name of country") +
  ylab("Number of signatures from country")

#Within the UK you can get into finer geographical resolution in this data
#So we can also look at number of signatures by constituency
#To get this dataframe from the JSON file use the below code:
signByConst <- as.data.frame(data1$data$attributes$signatures_by_constituency)
#Now you have a new dataframe signByConst
#We can also download data about the general elections 2015 results with this code: 
X <- read.csv(url("http://researchbriefings.files.parliament.uk/documents/CBP-7186/hocl-ge2015-results-summary.csv"))

#and combine this with the signature data 
#by using the constituency name as the link to join the two datasets
#with this code:
names(X)[names(X)=="ons_id"] <- "ons_code"
signAndVote <- merge(signByConst, X, by="ons_code")
#now you have a dataframe called signAndVote which has the number of signatures per
#constituency but also the party that the majority in that constutuency voted for

#Do you think there is a difference between the number of votes by region?
#Make a graph that helps you begin to answer this question

ggplot(data = signAndVote, aes(x = region_name, y = signature_count)) + 
  geom_boxplot() +            
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
#Is the result surprising?

#Do you think there is a difference between the number of votes by party of the MP of the constituency?
#Make a graph that helps you begin to answer this question

ggplot(data = signAndVote, aes(x = first_party, y = signature_count)) + 
  geom_boxplot() +            
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 





###########




ggplot(data = signByCountry, aes(x = name, y = signature_count)) +
  coord_cartesian(ylim = c(0, 500)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  geom_bar(stat = "identity") +
  geom_point() +
  geom_smooth(colour="red", size=1, se=FALSE)

ggplot(data = cars, aes(x = speed, y = dist)) +
  coord_cartesian(ylim = c(0, 500)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
 # geom_bar(stat = "identity") +
  geom_point() +
  geom_smooth(colour="red", size=1, se=FALSE)





