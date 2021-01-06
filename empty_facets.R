# Script for creating empty facets for making figures with images to match the
# ggplot facets

library(ggplot2)

# Create fake dataset for each of of the facets
one <- c("A", 1, 1)
two <- c("B", 1, 1)

all <- as.data.frame(rbind(one, two))
colnames(all) <- c("boxes", "x", "y")

# Create faceted ggplot with no axis marks or text
empty <- ggplot(all, aes(x = x, y = y)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title.x = element_blank(), axis.title.y = element_blank(),
        axis.text.x = element_blank(), axis.text.y = element_blank(),
        axis.ticks.x = element_blank(), axis.ticks.y = element_blank()) +
  xlab(" ") +
  ylab(" ") +
  facet_wrap(~boxes, scale="free")

# Save empty plot to desktop
ggsave(filename="~/Desktop/empty.pdf", plot=empty,
       width=250, height=100, units="mm", dpi=300)
