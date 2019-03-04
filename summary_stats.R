#Author: Andrew L Jackson
# Date 30/08/2012
# Data Handling Course BD7054
# How to calculate summary statistics of variables, which also includes
# a quick explanation of how to write your own functions in R.

# -------------------------------------------------------------------
# Enter or read in your data from a file

# use the in-built "iris" data
data <- read.csv("___")

# --------------------------------------------------------------------
# Plot and explore your data

head(data)

# generate some summary statistics on the Petal Lengths
mu <- mean(data$___)  # mean
med <- median(data$___)  # median
variance <- var(data$Petal.___)  # variance
stan.dev <- sd(data$___)  # standard deviation
n <- length(data$___)  # the number of observations
standard.error <- sd(data$___) / sqrt(length(data$___))  # SE of the mean
maximum <- max(data$___, na.rm=T)
minimum <- min(data$___, na.rm=T)

# But... we probably want to calculate these metrics for each of the 
# three species seperately. Use the function aggregate() to collect the data
# into subsets associated with each species, and apply a given function 
# to the subset.
# It probably helps if we have a quick graph of the data as a reference point
# for these summary statistics. A boxplot does this and i refer you to the
# associated podcast on boxplots for more information

dev.new()
boxplot(data$___ ~ data$___)

mu <- aggregate(data$___, by=list(data$___), mean)

# we could repeat this for all the metrics, but instead, we can write
# our own function that calculates a series of useful summary statistics
# on the data.

# specify our own function
summary.stats <- function (x,...) {
  
  # "out" will be a vector with names assigned to each entry.
  out <- c(n.obs = length(x),
           min = min(x),
           quantile(x, c(0.25, 0.5, 0.75)),
           max = max(x),
           mean = mean(x),
           sd = sd(x),
           var = var(x),
           se = sd(x) / sqrt(length(x))
  )
  
  return(out)  # this tells the function what to return as "the answer"
} # end of function

# now apply our summary.stats() function to the Petal Length data by Species
summaries <- aggregate(data$___, by=list(iris$Species), summary.stats)

# --------------------------------------------------------------------
# Analyse your data
# e.g. a t-test, or linear regression, or ANOVA, or whatever



# --------------------------------------------------------------------

# 
# --------------------------------------------------------------------
# Save your data (only if you want)

# The "list=" command tells us which variables we want to save
# The "file=" option tells us what file to save the data to

# save( list=ls(), file="grazing_data.rdata" )

# -------------------------------------------------------------------





