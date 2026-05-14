
# Немного симуляций про нормальность --------------------------------------



tt <- t.test(rnorm(30), rnorm(30), var.equal = TRUE)
class(tt)
str(tt)
tt$p.value

hist(rlnorm(30))
many_p <- replicate(100000, t.test(rlnorm(30), rlnorm(30), var.equal = TRUE)$p.value)
mean(many_p < .05)
hist(many_p)

# Непараметрические тесты -------------------------------------------------


library(tidyverse)
diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet1 <- diet %>%
  filter(Diet == 1)
options(scipen = 999)
t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)
wilcox.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

diet12 <- diet %>%
  filter(Diet %in% 1:2)

t.test(diet12$weight6weeks ~ diet12$Diet)
wilcox.test(diet12$weight6weeks ~ diet12$Diet)

diet2 <-  diet %>%
  filter(Diet == 2)

t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)
wilcox.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

diet13 <- diet %>%
  filter(Diet %in% c(1, 3))
t.test(diet13$weight6weeks ~ diet13$Diet)
wilcox.test(diet13$weight6weeks ~ diet13$Diet)


# Тест хи-квадрат ---------------------------------------------------------

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-", "-99", " ", "NA"))

gender_publisher <- heroes %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  select(Gender, Publisher) %>%
  drop_na()

61/(61 + 153)
111/(111 + 252)

61/(61 + 111)
153/(153 + 252)

table(gender_publisher) %>% summary()
table(gender_publisher) %>% chisq.test()
table(gender_publisher) %>% fisher.test()

table(gender_publisher) %>%
  mosaicplot(shade = TRUE, color = TRUE)

heroes %>%
  count(Publisher, sort = TRUE)

gender_publisher_large <- heroes %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics", "NBC - Heroes")) %>%
  select(Gender, Publisher) %>%
  drop_na()

table(gender_publisher_large) %>% chisq.test(correct = FALSE)


# Ковариация и корреляция -------------------------------------------------

install.packages("Stat2Data")
library(Stat2Data)
data(Backpack)
?Backpack

back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592)

back

back %>%
  select(body_kg, backpack_kg) %>%
  cov()

back %>%
  select(body_kg, backpack_kg) %>%
  var()
?cov
