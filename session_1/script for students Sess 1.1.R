###############################################
###### Session 1.1 Introduction to R #####
#####  LSHTM Welcome week 2021 ############
###############################################


# A fully noted version is available as HTML file - recommend working from this file to run the code and refer to the other 
# file for further information (sections are numbered the same). 
# The exercises and further resources are at the end of the htlm file. 

# writing which is hashed out like this are notes/comments and not run by R. everything else is Run. You can type directly
# into the console or you can write in a script like this. To run the code below just select the lines and press 'run' above. 
# You can run line by line, or select it all at once. Selecting and pressing control/command + enter also works. 

#############################################################
########           Abbey's section             ######## 
#############################################################

#### 1.1.0 R as  a calculator ##### 

# As you expect the operations are the same as they would be anywhere else so + stands for 
# sum, * for multiplications, ^ for power and / for divide. You can also do some more complicated calculations 
# using exp() and sqrt() which shows how brackets are used similar to when you work in excel for instance. 

51 + 6 

57*6 

6^4

12/2 

exp(6) 

sqrt(405)

### 1.1.1 Basic R expressions #####

# <- is the assignment operator in R (not =) 

x <- 10 # telling R that x now equals 10  (this FYI is an example of a comment on code - the right of the # is ignored)
print (x) # printing this in the console

y <- 10 + 20 # telling R that y now equals 10 + 20
print (y)  # printing this in the console

z <- "hello" # telling R that z now equals "hello"
print(z) # printing this in the console

# you can also get R to print by highlighting the text and press enter/run (called auto-printing) which is often easier to do!

a <- 1:50 # making a vector (one-dimensional array data structure)
a # auto-print by press enter/run - note that in the console you can see the printed output with numbers in square brackets - this
# is not part of the vector but something to make the output more friendly. It means that number 1 is the first number of the first 
# line, and the second number in brackets (for me 38) is the first number of the second line. This is just a feature of printed
# output. 

#############################################################
########            Anushe's section         ######## 
#############################################################

##### 1.1.2 Working directory ####
# Check what the current working directory (wd) is:
getwd()

# Check what folders/files are in this directory:
dir()

# Change working directory using a MacBook:
# setwd("/Users/anushe/Dropbox/Intro to R course")
# setwd("/Users/anushe/Dropbox/Intro to R course/2. Anushé")

# Change working directory using a Windows computer:
# setwd("C:/Users")

##### 1.1.3  Working directory ####

# In breakout rooms: 
#             1. download the child_mortality.csv file
#             2. Save it to your working directory
#             3. Read it in to R using the read.csv command

# Read in a .csv file 
childmort <- read.csv(file="0. Data/child_mortality.csv")

# If this were a text file, we would have used the command:
childmorttxt <- read.table(file="0. Data/child_mortality.txt")

######--------------------------------------------------######
# TIP: read.csv and read.table are two different 'functions'
######--------------------------------------------------######

# Reading in specific parts of the data using different 'arguments'
# Arguments:
#     1. 'header': variable names included in the top of each column or not (TRUE or FALSE)
#     2. 'nrows': specifies the maximum number of rows to read in

childmort2 <- read.csv(file="Data/child_mortality.csv", header=TRUE, nrows=10)

# Examine the first 6 rows of the data
head(childmort)
head(childmort2)

######----------------------------------------------------######
# Exercise: Row 4 in 'childmort' is Andorra: what does NA mean?
######----------------------------------------------------######

##### 1.1.3  Writing data ####

# We will learn to 'write' data using data that is already built into R
# The dataset we will use today is called 'iris'

# Load 'iris' data
data("iris")

# You can now see 'iris' under the 'Data' section in your 'Environment'
# It has 150 observations and 5 variables
# Let's look at this dataset quickly before we work with it

# Print the first 6 rows as we just learnt above
head(iris)

# You can also view the dataset by clicking on it in your Environment
# It has a total of 150 rows but the 'head' function only showed you the first 6

# Write this data as a text file using the function write.table()
write.table(x=iris, file="MyData_Iris.txt", col.names=TRUE)

# Check the directory to see if it was written
dir()

# Write this data as a csv file
write.table(x=iris, file="MyData_Iris.csv", col.names=TRUE)

# Again, check the directory to see if it was written
dir()

######--------------------------------------------------######
# Exercise: Go explore the .csv file and see if it looks okay
######--------------------------------------------------######

# Ask R to save the .csv file again asking it to separate the columns
# We do this by using the argument 'sep'

######--------------------------------------------------######
# Exercise: What do you think the following arguments mean?
#         1. sep=","
#         2. sep="\t"
######--------------------------------------------------######

# Write the Iris data as a .csv file again, separating columns appropriately
write.table(x=iris, file="MyData_Iris2.csv", sep="\t")

##### 1.1.4. Data Types and Objects  #####

# Main Data Types
#         1. Character
#         2. Numeric
#         3. Integer
#         4. Logical (where have we seen this before in today's session!)
#         5. Complex

# Create objects with different data types
# Once you have created an object, you can 'call' it with the 'name' you gave it

char1 <- "a"
char1

char2 <- "LSHTM"
char2 

num1  <- 2
num1

num2  <- 2.1
num2

int1  <- 2L
int1

int2  <- 9:100
int2

logi1 <- TRUE
logi1

logi2 <- FALSE
logi2

comp1 <- 1+0i
comp1

comp2 <- 2+4i
comp2

# You can check what data type (or 'class') these objects are using the function class(). 
# The code below asks R to print the 'class' for each object that we just created

class(char1)
class(char2)

class(num1)
class(num2)

class(int1)
class(int2)

class(logi1)
class(logi2)

class(comp1)
class(comp2)

#############################################################
########            Claire's section             ######## 
#############################################################

#### 1.1.5 Datasets ##### 

# R is really useful for handling and managing datasets which is often needed before carrying out analyses
# In this section, we look at different datasets and carry out some data handling operations. 

# You can read in your own datasets or create them from scratch in R
# for example earlier you created the vector data object 'a':
a <- 1:50
a

# Summary statistics can be easily generated for vectors
# Consider a study where you collected heights of children in a class and you want to calculate the mean
# First, create a vector of the heights data using the function 'c' to combine the values
# The object name here is 'heights' but you could call it any name you like
# Next, use the mean() function to calculate the mean of the heights 


heights <- c(95,82,88,101,78,69,88,105,106,81) # heights of 10 children. 'c' is used to combine values into a vector
mean(heights) # mean() is what we call a function. A function applies a specific operation to whatever is inside the brackets
?mean # for more information about any function in R you can use ? followed by the function name, details appear in the help box
median(heights) # here's another example of a function


heights2 <- c(95,82,88,101,78,69,88,105,106,81, NA)
mean(heights2, na.rm = TRUE)
is.na(heights2)


# R also has some internal datasets
# We'll use the Iris dataset

data(iris) # load the iris dataset
?iris # this displays information about the dataset in the help box


#### 1.1.5 Variables ##### 

# before any data analysis, you'll need to know details about your dataset, e.g. number of variables, sample size, etc

ncol(iris) # this tells you how many columns the Iris data set has
names(iris) # this tells you the names of the columns. In this case, the columns are the variables included in the Iris dataset
nrow(iris) # this tells you how many rows there are. In this case this is the total sample size

# getting a feel for the data is important
# there are a number of ways to look at the data to see what it contains

head(iris) # head() displays the first 6 items of an object. For the iris data, this is the first 6 rows
#compare to:
head(heights) # where head() displays the first 6 values

# by looking at the first few items of a dataset, you can begin to see what data has been collected
# e.g. lengths and widths are numbers with one decimal place, and species is a name (i.e. characters rather than numbers)

# to look at individual columns or variables you can use $
iris$Sepal.Length

# to think about the operations you can carry out on different variables, it helpful to look at their 'class'
class(iris$Sepal.Length)
class(iris$Species)

# because sepal lengths are numeric, you can do things like calculate the mean and median 
mean(iris$Sepal.Length) 
median(iris$Sepal.Length)

# R has lots of other useful operations...
min(iris$Sepal.Length)
max(iris$Sepal.Length)
range(iris$Sepal.Length)
sum(iris$Sepal.Length)


#### 1.1.6 Plots #####

# plots are an excellent way of visualising your data
# first, let's look at histograms of individual variables
# histograms show the frequency of different values in a variable, and help us understand the spread of data across a range of values

hist(iris$Sepal.Length) 
hist(iris$Petal.Length)

# R will automatically assign the number of breaks for displaying the frequencies. For Sepal.Length it's 4.0-4.4, 4.5-4.9, 5.0-5.4, etc
# but you can also provide the numbers of breaks
hist(iris$Sepal.Length, breaks=20) 
# you can change other aspects of the plot so that they are more suitable for including in reports, essays, etc
hist(iris$Sepal.Length, breaks=20, main='Sepal Length',xlab='sepal length') 

# plots can help visualise the relationships between variables
plot(iris$Sepal.Length~iris$Petal.Length)
# again, you can change how it looks
plot(iris$Sepal.Length~iris$Petal.Length, pch=16, xlab='petal length', ylab='sepal length')

# the last example plots two numerical variables against each other
# you can also plot a numerical variable by categories of a categorical variable using boxplot()
boxplot(iris$Sepal.Length~iris$Species)
boxplot(iris$Sepal.Length~iris$Species, xlab='plant species', ylab='sepal length')


##### 1.1.7 Optional, if you have time... #####

# Using the Iris dataset, obtain the mean, median, minimum, maximum, range and sum for sepal widths, petal lengths and petal widths.

# Using the Iris dataset, generate boxplots for sepal widths, petal lengths and petal widths, categorised by species.

