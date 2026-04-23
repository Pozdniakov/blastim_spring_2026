library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-", "-99", " ", "NA"))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

mean(weight)
mean(c(weight, 100500))

median(weight)
median(c(weight, 100500))
sort(weight)

heroes %>%
  count(Weight, sort = TRUE)

heroes %>%
  count(`Eye color`, sort = TRUE)

?mean

mean(weight, trim = .1)
mean(c(weight, 100500), trim = .1)
mean(weight, trim = .5)
