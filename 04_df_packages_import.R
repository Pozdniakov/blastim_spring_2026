
# Датафреймы --------------------------------------------------------------



str(
  list(name = c("Veronika", "Roman", "Sveta", "Julia", "Valentin"),
     age = c(25, 37, 25, 80, 44),
     student = c(TRUE, TRUE, FALSE, TRUE, FALSE)))

str(
  data.frame(name = c("Veronika", "Roman", "Sveta", "Julia", "Valentin"),
       age = c(25, 37, 25, 80, 44),
       student = c(TRUE, TRUE, FALSE, TRUE, FALSE)))

df <- data.frame(name = c("Veronika", "Roman", "Sveta", "Julia", "Valentin"),
             age = c(25, 37, 25, 80, 44),
             student = c(TRUE, TRUE, FALSE, TRUE, FALSE))

df$name
df[1:2, 1:2]
df[df$age <= 30, ]
df[df$age <= 30, "student"]
df$age[2:3]
mean(df$age)
df$lovesR <- TRUE
df
df[1:2, c("student", "lovesR")]
sort(df$age)
df[order(df$age), ]

df[df$age > mean(df$age)]

mtcars

?mean
?median

#installed.packages(priority = "base")

install.packages("beepr")

library(beepr)
beep(sound = 4)

#chooseCRANmirror()

detach("package:beepr", unload = TRUE)
beep()
beepr::beep()

install.packages("pak")
pak::pkg_install("brooke-watson/BRRR")
BRRR::skrrrahh_list()
BRRR::skrrrahh(47)

pak::pkg_install("flowCore")

install.packages("rdracor")
library(rdracor)
corpora <- get_dracor_meta()
summary(corpora)
#> DraCor hosts 17 corpora comprising 3184 plays.
#> 
#> The last updated corpus was German Drama Corpus (2024-04-03 10:50:28).
plot(corpora)


# Импорт данных -----------------------------------------------------------

# read.csv("~/Desktop/heroes_information.csv")

getwd()

read.csv("heroes_information.csv")

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na.strings = c("-", "-99", " ", "NA"))

?read.csv
