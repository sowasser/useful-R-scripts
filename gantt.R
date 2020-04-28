# Script for creating a Gantt chart with ggplot2
# Following this tutorial: https://stats.andrewheiss.com/misc/gantt.html

library(tidyverse)
library(lubridate)
library(scales)


tasks <- tribble(
  ~Start,       ~End,         ~Project,          ~Task,
  "2020-05-01", "2020-06-01", "Topic 1", "Description 1",
  "2020-06-01", "2020-07-01", "Topic 2", "Description 2",
  "2020-07-01", "2020-08-01", "Topic 3", "Description 3",
)

# Convert data too long for ggplot
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
        axis.title.x=element_text(vjust=-0.2), 
        axis.title.y=element_text(vjust=1.5),
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
  scale_y_date(date_breaks="1 month", labels=date_format("%b ‘%y")) +  # Change how the dates on x-axis display
  theme_gantt() + theme(axis.text.x=element_text(angle=45, hjust=1)) + 
  scale_color_viridis_d()  # change colors to colorblind-friendly
timeline

# TODO: Change units to make plot display well.
ggsave(timeline, filename = "filename.png", 
       width = 250, height = 120, units = "mm", 
       dpi = 300, bg = "transparent")