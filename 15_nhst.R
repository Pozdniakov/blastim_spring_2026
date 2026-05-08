iq <- 50:150
dnorm(100, mean = 100, sd = 15)
dnorm(115, mean = 100, sd = 15)
dnorm(85, mean = 100, sd = 15)
plot(iq, dnorm(iq, mean = 100, sd = 15))

pnorm(100, mean = 100, sd = 15)
options(scipen = 999)
1 - pnorm(169, mean = 100, sd = 15)
pnorm(85, mean = 100, sd = 15)
plot(iq, pnorm(iq, mean = 100, sd = 15))
pnorm(120, mean = 100, sd = 15)
pnorm(0, mean = 100, sd = 15)
qnorm(0.5, mean = 100, sd = 15)

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
hist(samp, breaks = 50)
hist(rnorm(100, mean = 100, sd = 15), breaks = 30)

mean(samp)
sqrt(sum((samp - mean(samp))^2)/length(samp))

many_means <- replicate(1000000, mean(rnorm(100, mean = 100, sd = 15)))
hist(many_means, breaks = 100)
mean(many_means)
sd(many_means)
sd(samp)/sqrt(length(samp))

hist(rlnorm(1000), breaks = 100)
many_means2 <- replicate(1000000, mean(rlnorm(100)))
hist(many_means2, breaks = 100)
mean(samp) - qnorm(.975) * sd(samp)/sqrt(length(samp))
mean(samp) + qnorm(.975) * sd(samp)/sqrt(length(samp))

mu_h0 <- 100
z_emp <- (mean(samp) - mu_h0)/(15/sqrt(length(samp)))

(1 - pnorm(z_emp)) * 2
 