n <- c(1, 2, 4, 5, 8, 12, 14, 30)
?quantile
seq(0, 1, 0.25)
quantile(n)
quantile(n, type = 9)

library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-", "-99", " ", "NA"))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

diff(range(weight))

options(scipen = 999)

sum((weight - mean(weight))^2)/(length(weight) - 1)
var(weight)

mean(weight)
sqrt(sum((weight - mean(weight))^2)/(length(weight) - 1))
sd(weight)
var(c(weight, 100500))
sd(c(weight, 100500))
sd(weight)

z <- function(x) (x - mean(x))/sd(x)
z(weight)
scale(weight) %>% c()

median(abs(weight - median(weight))) * 1.4826
mad(weight)
mad(c(weight, 100500))
IQR(weight)

install.packages("psych")
psych::skew(weight)
sort(weight)
psych::kurtosi(weight)

summary(weight)
summary(heroes)

psych::describe(weight)

heroes %>%
  group_by(Gender) %>%
  summarise(psych::describe(Weight))

install.packages("skimr")
skimr::skim(weight)

heroes %>%
  group_by(Gender) %>%
  skimr::skim(where(is.numeric))

install.packages("DescTools")
DescTools::Desc(weight)
DescTools::Desc(heroes)

xxx
summary(xxx)
psych::describe(xxx)

IQR(xxx$x)
IQR(xxx$y)
cor(xxx$x, xxx$y)

plot(xxx)
plot(heroes$Height, heroes$Weight)
iris %>%
  select(!Species)
plot(iris[, -5])

hist(weight)
hist(weight, breaks = 30)
hist(weight, breaks = 100)

boxplot(weight)
boxplot(iris$Sepal.Length ~ iris$Species)

n <- c(1, 2, 4, 5, 8, 12, 14, 30)
boxplot(n)


# ggplot2 -----------------------------------------------------------------


