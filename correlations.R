# Script to create a nifty little plot to visualise correlations so you don't
# include those factors in the Same model, for funsies.

# Data needs to be coded, i.e. factors need to be represented by numbers
# instead of strings (letters)

data <- read.csv("____")

#create coding
coded_status <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
data_coded <- cbind(data, coded_status) #bind our new coding to the old dataframe


data_cor <- cor(na.omit(data_coded)) # get correlations (returns matrix)

library(corrplot) #library used for the plot...might need to download it, go to "Packages", press "Install",
                  #search for "corrplot", and press "Install" and you're done!

col4 <- colorRampPalette(c("#7F0000", "red", "#FF7F00", "yellow", "#7FFF7F", 
                           "cyan", "#007FFF", "blue", "#00007F")) #colorway for plot

dev.new()
corrplot(data_cor, type = "upper", col = col4(10)) #create the correlations plot
