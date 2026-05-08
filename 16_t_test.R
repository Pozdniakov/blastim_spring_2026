set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
mu_h0 <- 100
t_emp <- (mean(samp) - mu_h0)/(sd(samp)/sqrt(length(samp)))
t_emp
options(scipen = 999)
(1 - pt(t_emp, df = length(samp) - 1))*2                      

t.test(samp, mu = 100)

library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-", "-99", " ", "NA"))

t.test(heroes$Weight, mu = 100)
t.test(heroes$Height, mu = 185)

diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet1 <- diet %>%
  filter(Diet == 1)

diet1$weight6weeks - diet1$pre.weight
#t.test(diet1$weight6weeks - diet1$pre.weight, mu = 0)
t.test(diet1$weight6weeks, diet1$pre.weight, paired = TRUE)

diet2 <- diet %>%
  filter(Diet == 2)

t.test(diet2$weight6weeks, diet2$pre.weight, paired = TRUE)

diet3 <- diet %>%
  filter(Diet == 3)
t.test(diet3$weight6weeks, diet3$pre.weight, paired = TRUE)

library(magrittr)
diet %>%
  filter(Diet == 3) %$%
  t.test(weight6weeks, pre.weight, paired = TRUE)

diet %>%
  filter(Diet == 3) %>%
  {t.test(.$weight6weeks, .$pre.weight, paired = TRUE)}

diet12 <- diet %>%
  filter(Diet %in% 1:2)

diet %>%
  count(Diet)

t.test(weight6weeks ~ Diet, data = diet12)
t.test(diet12$weight6weeks ~ diet12$Diet)
diet %>%
  group_by(Diet) %>%
  summarise(mean(weight6weeks), sd(weight6weeks))

t.test(weight6weeks ~ Diet, data = diet12, var.equal = TRUE)

heroes_white_black <- heroes %>%
  filter(`Eye color` %in% c("white", "black"))
t.test(Weight ~ `Eye color`, data = heroes_white_black)

shapiro.test(samp)

shap <- shapiro.test(rnorm(30))
str(shap)
class(shap)
shap$p.value
many_p <- replicate(100000, shapiro.test(rnorm(30))$p.value)
hist(many_p)
mean(many_p < .05)
qqnorm(samp)
qqnorm(rlnorm(100))

hist(samp)
hist(diet1$weight6weeks)
qqnorm(diet1$weight6weeks)
hist(rnorm(length(diet1$weight6weeks)))
qqnorm(rnorm(length(diet1$weight6weeks)))
