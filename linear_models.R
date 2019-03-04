# This script includes a ggplot scatterplot with a trendline and many different linear models.

mydata <- read.csv("___")

# set the variable class to be a factor
mydata$class <- factor(mydata$class)

#set color palette
library(viridis)
palette(viridis(3))

# plot
library(ggplot2)
ggplot(mydata, aes(x = ____, y = ____, color = class, shape = class)) + #select data, include color-coding
  geom_point(size = 3.5) + #shape of the points, change size
  scale_color_viridis(discrete=TRUE) + #color of points
  stat_smooth(method = lm, se = FALSE, size = 1.2) + #trendline and get rid of shaded confidence region, change size
  xlab("___") + #x-axis label
  ylab("___") + #y-axis label
  theme(legend.title=element_blank()) + #legend label
  theme(legend.key=element_rect(fill="white")) + #background for legend
  theme(axis.line = element_line(colour = "black", size = 0.3)) + #line at the axes for when background in white
  theme(panel.background = element_rect(fill = "white"), text = element_text(size = 16)) #white background, text size


# run models
# fixed term model, assuming parallel lines
intercept_model <- glm(mydata$___ ~ mydata$___ + mydata$___)
summary(intercept_model)
rsd_intercept <- residuals(intercept_model)

# interaction term model, no assumption of paralell lines
slope_model <- glm(mydata$___ ~ mydata$___ * mydata$___)
summary(slope_model)

# Extract the residuals for easy recall
rsd <- residuals(intercept_model)

# Histogram of the residuals
hist(rsd,6)

# QQ plot of the residuals to assess how well the residuals
# compare with an ideal normal distribution

qqnorm(rsd)
qqline(rsd,col="red")

# Check for a trend in the residuals with the X axis variable
plot(Root,rsd)
abline(0,0,col="blue")
