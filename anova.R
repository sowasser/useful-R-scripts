# General script for running an ANOVA. Includes a simple bloxplot in ggplot.

df <- read.csv("naoise2.csv")

library(ggplot2)

# Make sure data categories are correct
levels(df$treatment)

# Visualize data with a basic boxplot
ggplot(df, aes(x=treatment, y=value)) + theme_classic() +  geom_boxplot()

# Run one-way ANOVA
res.aov <- aov(value ~ treatment, data = df)  # runs actual ANOVA test
summary(res.aov)  # provides summary with p-value

# Run pairwise tests of significance to determine which groups are different
TukeyHSD(res.aov)  # gives adjusted p-values
