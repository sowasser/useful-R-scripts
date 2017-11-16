# General line plot in ggplot, white background, black axes, no gridlines

library(ggplot2)

# Load funciton for multiple plots in one image. File needs to be in the same 
# Directory, or need to add path to the file.
source("multiplot.R")  

ggplot() + 
  theme_classic() + 
  geom_line(data= , aes(x= , y= ), colour="blue", size = 2) +  # line
  geom_point(data= , aes(x= , y= ), colour="black", size = 3) +  # points on the line
  theme(axis.text.y = element_text(size = 12),  # axis text size
        axis.text.x = element_text(size = 12)) + 
  theme(axis.line = element_line(color="black", size = 1)) +  # line at the axes
  xlab(" ") + ylab(" ") +  # axis labels
  theme(text = element_text(colour = 'black', size = 14, face = 'bold'))  # label text