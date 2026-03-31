
# R как калькулятор -------------------------------------------------------


2 + 2 #сложение
2 - 1
2 - 1
3 * 4
99 / 9
20 / 3
13 %/% 3
13 %% 3
3 * 4
3 ** 4
3 ^ 4
2 - 1
(2 + 2) * 2

# Функции -----------------------------------------------------------------


16 ^ (1 / 2)
16 ^ .5

#SQRT(16) R -- case sensitive language
sqrt(16)
sqrt(100)
log(8)
?log

log(x = 8, base = 2)
log(8, 2)
log(8, sqrt(4))

?`+`
`+`(2, 3)

log(2176782336, 6)
sin(pi)
2 ^ 40
options(scipen = 999)
2 ^ 40
sin(pi)
typeof(0.5)

# Переменные --------------------------------------------------------------


# a = sqrt(4)
a <- sqrt(4)
b <- 3
d <- 4

# rm(d)
# rm(list = ls())

a ^ b - a / b
log(d, a)

a == b
a != b
?factorial
factorial(5)
5!=120


# Типы данных -------------------------------------------------------------


a > b #FALSE
a < b #TRUE
a < a #FALSE
a > a #FALSE
a <= b #TRUE
a >= b #FALSE
a <= a #TRUE
a >= a #TRUE
age <- 18
age >= 18
typeof(5+3i)
typeof(a)
typeof(as.integer(a))
a <- 2L
typeof(a)
as.double(a)
is.double(a)
is.integer(a)
is.numeric(b)

s <- "hi, everyone"
s
s <- 'hi, everyone'
s
s <- "Ктулху Ф'хтагн"
paste("I", "love", "R")
paste("I", "love", "R", sep = "❤️")
paste("I", "love", "R", sep = "")
paste0("I", "love", "R")

comparison <- a < b
t1 <- TRUE
f1 <- FALSE
t1
f1
!t1
!f1

t1 & t1 #TRUE
t1 & f1 #FALSE
f1 & t1 #FALSE
f1 & f1 #FALSE

t1 | t1 # TRUE
t1 | f1 #TRUE
f1 | t1 #TRUE
f1 | f1 #FALSE

#xor()

age <- 40
age >= 18
age <= 30
age >= 18 & age <= 30

age < 18
age > 30
age < 18 | age > 30

# Векторы -----------------------------------------------------------------

c(4, 8, 15, 16, 23, 42)
c("hey", "hey", "ha")
c(TRUE, FALSE)

c(3, 4)
length(c(4, 8, 15, 16, 23, 42))
lenght(c(4, 8, 15, 16, 23, 42))
lenght <- length
