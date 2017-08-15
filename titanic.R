############################
### PACKAGE INSTALLATION ###
############################

library("dplyr")
library("tidyr")

############################
### DATA LOAD & PREPARATION ###
############################

setwd("C:/Users/paunanue/Dropbox/Data Science & Analytics/Courses/Data Science Foundation_Springboard_R/Projects/Data Wrangling/Data Wrangling 2")
titanic_original <- read.csv("titanic_original.csv")



titanic$embarked <- as.character(titanic$embarked)

titanic$embarked <- as.factor(titanic$embarked)

#1: Port of Embarkation

titanic <- titanic_original

for (i in 1:length(titanic$embarked)) {
  if (titanic$embarked[i] == "") {
    titanic$embarked[i] <- "S"
  } 
}

#2: Age

avg_age <- mean(titanic$age, na.rm = TRUE)

for (i in 1:length(titanic$age)) {
  if(is.na(titanic$age[i] == TRUE)) {
     titanic$age[i] <- avg_age
  }
}

#3: Lifeboat


for (i in 1:length(titanic$boat)) {
  if (titanic$boat[i] == "") {
    titanic$boat[i] <- NA
  }
}

# This creates NA's instead of "None". Not if it's because it is a factor
#for (i in 1:length(titanic$boat)) {
#  if (titanic$boat[i] == "") {
#    titanic$boat[i] <- "None"
#  }
#}


#4: Cabin

for (i in 1:length(titanic$cabin)) {
  if (titanic$cabin[i] == "") {
    titanic$has_cabin_number[i] <- 0
  } else {
    titanic$has_cabin_number[i] <- 1
  }
}

#5: Create Doc

write.csv(titanic, "titanic_clean.csv")

