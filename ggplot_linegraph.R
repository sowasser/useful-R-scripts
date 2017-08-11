# General line plot in ggplot, white background, black axes, no gridlines

library(ggplot2)

ggplot() + 
  theme_bw() + 
  geom_line(data= , aes(x= , y= ), colour="blue", size = 2) +  # line
  geom_point(data= , aes(x= , y= ), colour="black", size = 3) +  # points on the line
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +  # no gridlines
  theme(axis.text.y = element_text(size = 12),  # axis text size
        axis.text.x = element_text(size = 12)) + 
  theme(axis.line = element_line(color="black", size = 1)) +  # line at the axes
  xlab(" ") + ylab(" ") +  # axis labels
  theme(text = element_text(colour = 'black', size = 14, face = 'bold')) +  # label text
  theme(panel.border = element_rect(colour = 'white',size = 1))  # no plot border (white border)
