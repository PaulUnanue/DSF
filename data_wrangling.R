############################
### PACKAGE INSTALLATION ###
############################

library("dplyr")
library("tidyr")

############################
### DATA LOAD ###
############################



setwd("C:/Users/paunanue/Dropbox/Data Science & Analytics/Courses/Data Science Foundation_Springboard_R/Projects/Data Wrangling/Data Wrangling 1")
refine_original <- read.csv("refine_original.csv")

#1 relabel by row number
refine_original[c(1:6,14:16), 1] <- "philips"
refine_original[7:13, 1] <- "akzo"
refine_original[17:21, 1] <- "van houten"
refine_original[22:25, 1] <- "unilever"

#2  seperate product code
refine <- separate(refine_original, Product.code...number, c("product_code", "product_number"),
         sep = "-")


#3 Add Product Category

for (i in 1:length(refine[, 1])) {
           if (refine[i, 2] == "p") {
        refine$product_cat[i] <- "Smartphone"
    } else if (refine[i, 2] == "v") {
        refine$product_cat[i] <- "TV"
    } else if (refine[i, 2] == "x") {
        refine$product_cat[i] <- "Laptop"
    } else if (refine[i, 2] == "q") {
        refine$product_cat[i] <- "Tablet"
    } else {
        refine$product_cat[i] <- "b"
    }
}


# 4 Full Address for geocoding

refine <- mutate(refine, full_address = paste(address,",",city,",",country))

# 5 Create dummy variable for company and product category

refine$company_philips <- c(1:25)

for (i in 1:length(refine$company)) {
 if (refine$company[i] == "philips") {
    refine$company_philips[i] <- 1 
   } else { refine$company_philips[i] <- 0 
  }                            
}

refine$company_akzo <- c(1:25)

for (i in 1:length(refine$company)) {
  if (refine$company[i] == "akzo") {
    refine$company_akzo[i] = 1
  } else {
    refine$company_akzo[i] = 0
  }
}

refine$company[17] == "van houten"

for (i in 1:length(refine$company)) {
  if (refine$company[i] == "van houten") {
           refine$company_van_houten[i] = 1 
  } else { 
           refine$company_van_houten[i] = 0
 }
}

for (i in 1:length(refine$company)) {
  if (refine$company[i] == "unilever") {
    refine$company_unilever[i] = 1
  } else { refine$company_unilever[i] = 0
 }
}


for (i in 1:length(refine$product_cat)) {
  if (refine$product_cat[i] == "Laptop") {
    refine$product_laptop[i] = 1 
  } else {
    refine$product_laptop[i] = 0
  }
}

for (i in 1:length(refine$product_cat)) {
  if (refine$product_cat[i] == "Smartphone") {
    refine$product_smartphone[i] = 1
  } else {
    refine$product_smartphone[i] = 0
  }
}

for (i in 1:length(refine$product_cat)) {
  if (refine$product_cat[i] == "TV") {
    refine$product_tv[i] = 1
  } else {
    refine$product_tv[i] = 0
  }
}

for (i in 1:length(refine$product_cat)) {
  if (refine$product_cat[i] == "Tablet") {
    refine$product_tablet[i] = 1
  } else {
    refine$product_tablet[i] = 0
  }
}

# 6 Save File

write.csv(refine, "refine_clean.csv")

glimpse(refine)





