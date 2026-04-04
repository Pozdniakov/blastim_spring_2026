
# Работа с логическими векторами ------------------------------------------

eyes <- c("green", "blue", "blue", "brown", "green", "blue")
sum(eyes == "blue")
#sum(eyes == "blue")/length(eyes == "blue")
paste0(mean(eyes == "blue") * 100, "%")

# all() and any()
all(eyes == "blue")
any(eyes == "blue")

#which()

which(eyes == "blue")
#seq_along(eyes == "blue")[eyes == "blue"]

eyes[eyes == "blue"]
eyes[eyes == "green"]

#eyes[eyes == c("green", "blue")]

eyes[eyes == "blue" | eyes == "green"]

eyes[eyes %in% c("green", "blue")]

respondents <- c("Москва", "Санкт-Петербург", "Москва", "Москва",
                 "Тула", "Новосибирск", "Москва", "Киров", "Воронеж",
                 "Ростов-на-Дону", "Саратов", "Нижний Новгород")

big_cities <- c("Москва", "Санкт-Петербург", "Новосибирск", "Екатеринбург")

respondents[respondents %in% big_cities]


# Пропущенные значения (NA и его друзья) ----------------------------------

#NA = Not Available

missed <- NA
missed == "NA"
missed == 0
missed == ""
missed == character(length = 0)
missed == NA
NA == NA

Bob <- NA
Mary <- NA
Bob == Mary
30 == NA

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[5] <- NA
n
mean(n)
n != NA
is.na(n)
mean(n[!is.na(n)])
?mean
mean(n, na.rm = TRUE)

typeof(n)
as.character(n)

typeof(NA)
NA_integer_
NA_real_
NA_character_
NA_complex_
typeof(n[5])

typeof(as.character(n)[5])
NA

1/0
-1/0
max(Inf, 1000000000000)
0/0
#NaN = Not a Number

mean(c(NA, NA, NA), na.rm = TRUE)

is.nan(NaN)
is.nan(NA)
is.na(NA)
is.na(NaN)

length(NULL)
length(character())
typeof(NULL)


# Матрица -----------------------------------------------------------------

A <- matrix(1:12, nrow = 4)
matrix(1:12, ncol = 3, byrow = TRUE)

A[2, 3]
A[1:2, 2:3]

A[c(1,3), c(3, 1)]

A[c(FALSE, TRUE, TRUE, TRUE), c(3, 1)]
A > 10
A[1:2, ]
A[, c(1, 3)]
A[1:2, 1:2] <- 100
A
matrix(c("Welcome", "to", "the", "matrix", "Neo", 1999),
       nrow = 2)

A
attributes(A)
attr(A, "dim") <- c(2, 6)
A
attributes(A) <- NULL
typeof(A)
attr(A, "dim") <- c(3, 2, 2)
A

rep(1:9, rep(9, 9))
rep(1:9, each = 9)
matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)

outer(1:9, 1:9)
1:9 %o% 1:9


# Списки ------------------------------------------------------------------

simple_list <- list(42, "hey", TRUE)
simple_list

complex_list <- list(letters, 1:10,
                     simple_list, A, mean, '[')

#`[`(n, 3)

complex_list
str(complex_list)

named_list <- list(name = "Veronika",
                   age = 25,
                   student = TRUE)
named_list
named_list$name
named_list[1]
class(named_list$name)
class(named_list[1])
named_list[[1]]
named_list["name"]
named_list[["name"]]

list1 <- list(numbers = 1:5, letters = letters, logic = TRUE)
list1
list2 <- list(pupa = list1, lupa = list1)
list2
list2[[1]][[2]][3]
n
list2
is.list(list2)
is.list(n)

is.vector(n)
is.vector(list2)

is.atomic(n)
is.atomic(list2)

is.recursive(n)
is.recursive(list2)
