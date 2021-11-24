library(tibble)
library(ggplot2)

# create the lines dataset
lines = tibble(
  x = seq(0, 19, by = .5),
  xend = x,
  y =  rep(0, 39),
  yend = c(rep(c(5, 10), 19), 5))

# create the dots at the end of the lines
dots = lines %>%
  select(x, yend)

# create cool plor
ggplot() +
  geom_segment(data = lines,
               aes(x = x, xend = xend,
                   y = y, yend = yend),
               color = "white") + #<<
  geom_point(data = dots,
             aes(x = x, y = yend),
             color = "white") + #<<
  scale_y_continuous(limits = c(-5, 10)) +
  coord_polar() +
  theme(
    plot.background = element_rect(
      fill = "#75926f"),
    panel.background = element_rect(
      fill = "#75926f"),
    panel.grid = element_blank(),
    plot.caption = element_text(
      family = "Open Sans",
      size = 6,
      color = "white"),
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  ) 
