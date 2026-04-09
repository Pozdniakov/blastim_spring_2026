
# Семейство функций apply() -----------------------------------------------


A <- matrix(1:12, 3)
A
rowSums(A)
colSums(A)
rowMeans(A)
colMeans(A)

apply(A, 2, sum)
A[2, 2] <- NA
A
apply(A, 2, sum, na.rm = TRUE)

neo <- c("Welcome", "to", "the", "matrix", "Neo", "!")
mean(nchar(neo))
B <- matrix(neo, ncol = 3)
B
mean(nchar(B))
mean_nchar <- function(x) mean(nchar(x))
apply(B, 2, mean_nchar)

apply(B, 2, function(x) mean(nchar(x)))
apply(B, 2, \(x) mean(nchar(x)))

iris
as.matrix(iris)
?t
t(iris)

some_list <- list(some = 1:10, list = letters)
some_list
length(some_list)
lapply(some_list, length)
sapply(some_list, length)
sapply(iris, typeof)
lapply(iris, typeof)


v1 <- log(seq_len(10000000))
v2 <- sapply(seq_len(10000000), log)

is_prime <- function(x) sum(x %% seq_len(x) == 0) == 2
is_prime(2027)

is_prime(2:7)
sapply(2:7, is_prime)
?read.csv
is_prime_vectorised <- Vectorize(is_prime)
is_prime_vectorised(2:7)

many_means <- replicate(1000, mean(rlnorm(100)))
hist(many_means)

install.packages("tidyverse")
library(purrr)
map(iris, typeof)
map(some_list, length)
map(some_list, 2)

map_int(some_list, length)
#map_chr(some_list, length)

list3 <- list(
  a = 1:5,
  b = 0:20,
  c = 4:24,
  d = 6:3,
  e = 6:25
)
list3
which.max(c(3, 5, 4, 5, 3))

max_item <- function(x) x[[which.max(map_int(x, length))]]
max_item(list3)

is_prime <- function(x) sum(x %% seq_len(x) == 0) == 2
prime_numbers <- function(x) which(map_lgl(seq_len(x), is_prime))
prime_numbers(1000)

install.packages("data.table")
library(data.table)
heroes_dt <- fread("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
      na.strings = c("-", "-99", " ", "NA"))

class(heroes_dt)
heroes_dt
print
methods(print)
heroes_dt

heroes_dt
heroes_dt[Alignment == "good",
          .(mean_height = mean(Height, na.rm = TRUE)),
          by = Gender][order(-mean_height),]

install.packages("tidyverse")
library(tidyverse)

heroes_tbl <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
         na = c("-", "-99", " ", "NA"))
class(heroes_tbl)
heroes_tbl
gender_factor <- as.factor(heroes_tbl$Gender)
attributes(gender_factor) <- NULL
gender_factor
gender_factor <- as.factor(heroes_tbl$Gender)
as.integer(gender_factor)
as.character(gender_factor)

heroes_dt[Alignment == "good",
          .(mean_height = mean(Height, na.rm = TRUE)),
          by = Gender][order(-mean_height),]

heroes_tbl %>%
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(mean_Height = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(mean_Height))
