#Week 5: Assessing the relationship across factors

#The US elections are coming up, and some of you will have seen the debates between Clinton and Trump, or at least read about them
#The transcripts of these data are available from the data science challenge site kaggle
#You can see here if interested: 

#I downloaded this data, and created a few dichotomous variables using regex (text processing). 
#Here is my codebook: 
#candidatesOnly$Text = what the candidate said transcribed 
#candidatesOnly$Speaker = the candidate who said that bit of text
#candidatesOnly$interrupted = score 1 for the sentence being interrupted, 0 if not (denoted by '...' in the text)
#candidatesOnly$jobs = score 1 for the word job mentioned in that sentence, 0 if not
#candidatesOnly$women = score 1 for the word women or woman mentioned in that sentence, 0 if not

#The debates are meant to serve as a sample of the candidates' approach to presidency. 
#Based on this sample, answer the following questions: 

#Q1: One of the issues which Hillary Clinton emphasises in her campaign is Women's rights. 
#Is there a relationship between candidates and mentioning women in their talks?

#Q2: Jobs and wages is an issue which both candidates address in their campaigns
#Is there a relationship between candidate and speaking about jobs?

#Q3: Trump claims that he was very often interrupted by debate moderator. However Hillary is also interrupted, mostly by trump.
#Is there a relationship between candidate and being interrupted?

#Discuss and interpret the results

#OK now something more closely related to criminology
#We've been using BCS2007/8 in lecture. Let's look at more recent figures. 
#Go to the UK Data Service website, register, and download the following data set: 
#Crime Survey for England and Wales, 2011-2012: Teaching Dataset
#(if you're really struggling to find it, the link is here: https://discover.ukdataservice.ac.uk/catalogue/?sn=7401&type=Data%20catalogue)
#You will have to register to download this data.
#When downloading the file you will be given the choise of different formats. 
#Save the file in .tab delimited format. Then you could adapt the code below to read it into R.
csew1112 <- read.table("csew1112.tab", sep="\t", header=TRUE)
#You'll need to refer to the documentation for the data
#I want you to examine the relationship that exist:

#Q4: between victimisation and gender, a dichotomous nomimal measure, for which I will expect you to compute the odds ratio

#Q5: between experience of any crime in the previous 12 months (bcsvictim) and respondent’s understanding of how much crime rate has changed in area since 2 years ago (crimrat2)

#For both above questions, discuss and aim to interpret your findings in a way that is consistent with theory and common sense.

