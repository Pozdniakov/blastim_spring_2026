pow <- function(x, p) {
  power <- x ^ p
  return(power)
}
pow(x = 3, p = 2)
pow(3, 2)

pow

pow <- function(x, p) {
  power <- x ^ p
  power
}
pow(10, 3)

# pow <- function(x, p) {
#   power <- x ^ p
# }
# pow(12, 2)

pow <- function(x, p) {
  x ^ p
}
pow(12, 2)

pow <- function(x, p) x ^ p

pow(12, 2)


pow <- function(x, p = 2) x ^ p

pow(9)
pow(9, 1)

w <- 80
h <- 1.71
w/h^2

imt <- function(weight, height) weight/height^2
imt(100, 2.1)

v <- letters
c("***", v, "***")
highlighter <- function(x) c("***", x, "***")
highlighter(c("hey", "hey", "ha", "etodissnafeduka"))

mean(1:10)

list(mean, min, `[`, pow)
