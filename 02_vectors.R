
# Создание векторов -------------------------------------------------------


c(1, 3)
3:10
5:-3
#10:10:100 так это не работает
seq(10, 100, by = 10)
seq(1, 13, length.out = 4)
seq(1, 14, length.out = 10)

seq_len(6)
seq_along(c(3, 5, 8))
seq_along(c())

rep(1, 5)
rep("hey", 10)
rep(1:3, 3)
rep(1:3, each = 3)
rep(1:3, c(10, 3, 5))

sum(1:100)
mean(1:100)

c(1, 4, 5)
c(1:4, 100:110)
seq(10, 100, 10)
seq(10, 100, by = 10)
seq(from = 10, to = 100, by = 10)
roots <- sqrt(1:10)
roots
rep(1:9, 1:9)

# Приведение типов --------------------------------------------------------


c(FALSE, 2)
2 + TRUE
2 + as.integer(TRUE)
2 + TRUE
c(TRUE, 2, "три")
c(c(TRUE, 2), "три")

as.character(as.integer(c(TRUE, FALSE, FALSE)))
as.integer(c("1", "2", "три"))

a <- 1
typeof(a)
b <- "1"
typeof(b)

# Векторизация ------------------------------------------------------------


n <- 1:4
n
m <- c(10, 100, 1000, 10000)
m
n + m
m + n
m - n
m * n
m / n
options(scipen = 999)
m ^ n
sqrt(1:10)
log(1:10)
log(2, base = 1:10)

# Ресайклинг --------------------------------------------------------------


k <- c(10, 100)
n
k
n + k
n * 2
n * c(10, 100, 1000)

10 ^ 0
10 ^ 1
10 ^ 2
10 ^ 3
10 ^ 4

1:20 

10 ^ (0:4)

1:20 * rep(0:1, 10)
1:20 * 0:1
sum(1/(2 ^ (0:200)))
sum(2^(0:-20))
seq(1, 28, by = 3)
3 ^(0:9)
sum(seq(1, 28, by = 3) / 3 ^(0:9) > .5)

# Индексирование ----------------------------------------------------------


n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
n[10]
n[length(n)]
head(n, n = 1)
tail(n)
tail(n, n = 1)
n[3] <- 20
n
n[4:7]
n[length(n):1]
rev(n)
n
n[4:6] <- 0
n

n[-1]
n[-3:-7]
n[c(-2, -5, -7)]
# n[-2, -5, -7]
n[c(2, 5, 7)]
n[c(TRUE, FALSE, TRUE, FALSE, TRUE, 
    FALSE, TRUE, FALSE, TRUE, FALSE)]

n[c(TRUE, FALSE)]

n
n[n > 10]
n[n > mean(n)]

my_named_vector <- c(first = 1, second = 2, third = 3)
my_named_vector
attributes(my_named_vector)

my_named_vector["first"]
my_named_vector[c("third", "first")]
names(my_named_vector)
pi
month.name
month.abb
letters
LETTERS
LETTERS[1:3]

names(my_named_vector) <- LETTERS[1:3]
my_named_vector
my_named_vector["B"]
(1:10)[3:5]


# 2 4 6 8 10 12 14 16 18 20 -----------------------------------------------

#1
seq(2, 20, by = 2)
#2
(2:20)[c(TRUE, FALSE)]
#3
(2:20)[seq(1, 20, 2)]
#4
x <- 2:20; x[x %% 2 == 0]
#5
1:10 * 2
#6
(2:20)[-seq(2, 20, 2)]
#7
c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)
#8
c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) * 2
#9
c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) *(TRUE + TRUE)
#10
rep(1:10, times = 1) * 2
#11
(1:20)[c(FALSE, TRUE)]
#12
(1:20)[-(1+2*(0:10))]
#13
seq(2, 20, length.out = 10)
#14
(1:20)[!(1:20)%%2 > 0]
