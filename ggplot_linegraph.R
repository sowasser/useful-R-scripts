# General line plot in ggplot, white/transparent background, black axes, no gridlines

library(ggplot2)

# Load funciton for multiple plots in one image. File needs to be in the same 
# Directory, or need to add path to the file.
source("multiplot.R")  

plot <- ggplot() + 
  theme_classic() + 
  geom_line(data= , aes(x= , y= ), colour="blue", size = 2) +  # line
  geom_point(data= , aes(x= , y= ), colour="black", size = 3) +  # points on the line
  theme(axis.text.y = element_text(size = 12),  # axis text size
        axis.text.x = element_text(size = 12)) + 
  theme(axis.line = element_line(color="black", size = 1)) +  # line at the axes
  scale_y_continuous(limits = c( , )) +  # y-axis scale
  scale_x_continuous(limits = c( , )) +  # x-axis scale
  xlab(" ") + ylab(" ") +  # axis labels
  theme(text = element_text(colour = 'black', size = 14, face = 'bold')) +  # label text
  # If you want a transparent background
  theme(
    panel.background = element_rect(fill = "transparent"),
    plot.background = element_rect(fill = "transparent")
  )


# High resolution photo export w/ transparent background
png("path/filename.png", width = , height = , units = , bg = 'transparent', res = 300)
# Call multiplot function. Fills in plots column-wise:
# Plot 1  Plot3
# Plot 2  Plot4
multiplot(plot, cols=1)
dev.off()