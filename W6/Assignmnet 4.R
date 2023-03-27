# api: Student performance in California schools

# The Academic Performance Index is computed for all California  schools based on standardised testing of students. The data sets  contain information for all schools with at least 100 students and  for various probability samples of the data. Please see the following website for the columns definitions:
  # https://www.rdocumentation.org/packages/survey/versions/4.1-1/topics/api 

## Details

# "apipop" is the entire population, 
# "apisrs" is a simple random sample, 
# "apiclus1" is a cluster sample of school districts, 
# "apistrat" is a sample stratified by stype, and 
# "apiclus2" is a two-stage cluster sample of schools within districts. 
# The sampling weights in apiclus1 are incorrect (the weight should be 757/15) but are as obtained from UCLA.

# Assignment 4
# To use the "apipop" dataframe please run the following syntaxes. The dataframe for all parts is "apipop".
# ========================================================================
library(tidyverse)
library(survey)
data(api)

# ========================================================================

## Part a) 
# create a bar plot to show the number of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================
library(tidyverse)
library(survey)
data(api)
View(apipop)
g0 <- ggplot(apipop, aes(stype));
g1 <- g0+geom_bar()
g2 <- g1+labs(y= "Count", x = "School Type")
g2

# ========================================================================

## Part b) 
# create a bar plot to show the percentage of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================

apipop %>% count(stype) %>%
  mutate(perc = n/nrow(apipop)) -> apipopper
g0 <- ggplot(apipopper, aes(x = stype, y = perc))+geom_bar(stat = "identity")
g1 <- g0+labs(y= "Percentage", x = "School Type")
g1


# ========================================================================

## Part c) 
# create a bar plot to show the number of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  
# ========================================================================


g0 <- ggplot(apipop, aes(awards))
g1 <- g0+ geom_bar()
g2 <- g1+labs(y= "Totals", x = "Eligiblity")
g2

# ========================================================================

## Part d) 
# create a bar plot to show the percentage of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  

# ========================================================================

apipop %>% count(awards) %>%
  mutate(perc = n/nrow(apipop)) -> apipopper
g0 <- ggplot(apipopper, aes(x = awards, y = perc))+geom_bar(stat = "identity")
g1 <- g0+labs(y= "Percentage", x = "Eligiblity")
g1


# ========================================================================

## Part e) 
# use facet to create two histogram to show the distributions of the "number of students enrolled" in all school whether are "Eligible for awards program" or not (bins=30).
# ========================================================================

apipop %>% group_by(awards) %>%
  ggplot(aes(x = enroll))+geom_histogram(aes(y = ..density..), binwidth = 100) + facet_grid(cols = vars(awards))


# ========================================================================
