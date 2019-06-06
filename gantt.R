# Script for creating a Gantt chart with ggplot2
# Following this tutorial: https://stats.andrewheiss.com/misc/gantt.html

library(tidyverse)
library(lubridate)
library(scales)


# path <- "~/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Local/Progress Reports/GRC"  # on laptop
setwd("______")  # on desktop

# Create dataframe of all tasks. Can have as many as desired in as many projects as desired.
tasks <- tribble(
  ~Start,       ~End,         ~Project,          ~Task,
  "2019-06-10", "2019-08-01", "Topic 1", "Task 1",
  "2019-06-13", "2019-07-04", "Topic 2", "Task 2",
  "2019-08-01", "2019-08-31", "Topic 3", "Task 3",
)

# Convert data to long for ggplot
tasks.long <- tasks %>%
  mutate(Start = ymd(Start),
         End = ymd(End)) %>%
  gather(date.type, task.date, -c(Project, Task)) %>%
  arrange(date.type, task.date) %>%
  mutate(Task = factor(Task, levels=rev(unique(Task)), ordered=TRUE))

# Custom theme for making a clean Gantt chart
theme_gantt <- function(base_size=11) {
  ret <- theme_bw()
  theme(panel.background = element_rect(fill="#ffffff", colour=NA),
        axis.title.x=element_text(vjust=-0.2), axis.title.y=element_text(vjust=1.5),
        title=element_text(vjust=1.2),
        panel.border = element_rect(colour = "black", fill=NA, size=1),
        axis.line=element_blank(),
        axis.ticks=element_blank(),
        legend.position="bottom", 
        axis.title=element_text(size=rel(0.8)),
        strip.text=element_text(size=rel(1)),
        strip.background=element_rect(fill="#ffffff", colour=NA),
        panel.spacing.y=unit(1.5, "lines"),
        legend.key = element_blank())
  
  ret
}

# Build plot
timeline <- ggplot(tasks.long, aes(x=Task, y=task.date, colour=Project)) + 
  geom_line(size=6) + 
  guides(colour=guide_legend(title=NULL)) +
  labs(x=NULL, y=NULL) + coord_flip() +
  scale_y_date(date_breaks="2 months", labels=date_format("%b ‘%y")) +
  theme_gantt() + theme(axis.text.x=element_text(angle=45, hjust=1))
timeline

# Change units here to make sure it works with the dimensions of the chart
ggsave(timeline, filename = "gantt.png", width = 250, height = 120, units = "mm", 
       dpi = 300, bg = "transparent")
