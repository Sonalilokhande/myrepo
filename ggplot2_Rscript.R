
library(ggplot2)
library(ggdendro)
hc <- hclust(dist(USArrests), "ave")
hcdata <- dendro_data(hc, type="rectangle")
ggplot() + 
  geom_segment(data=segment(hcdata), aes(x=x, y=y, xend=xend, yend=yend)) +
  geom_text(data=label(hcdata), aes(x=x, y=y, label=label, hjust=0), size=3) +
  coord_flip() + scale_y_reverse(expand=c(0.2, 0))

### demonstrate plotting directly from object class hclust
ggdendrogram(hc, rotate=FALSE)
ggdendrogram(hc, rotate=TRUE)
### demonstrate converting hclust to dendro using dendro_data first
hcdata <- dendro_data(hc)
ggdendrogram(hcdata, rotate=TRUE) + labs(title="Dendrogram in ggplot2")