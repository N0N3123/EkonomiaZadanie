#1
numbers <- c(12, 5, 20, 18, 8.5, 10, 4, 101, -2)
print(sum(numbers[numbers < 10]))

#2
numbers <- seq(2,28/3,2/3)
print(numbers*c(T,F,F))
#3
a <- c(2,3,7,8,2)
b <- c(9,1, 2, 0, 2)
result = a<=b
print(typeof(result))
#typ logiczny
#4
letters_with_polish <- c(letters, "ą", "ć", "ę", "ł", "ń", "ó", "ś", "ź", "ż")
print(length(letters_with_polish))
#35 dlugosci
#5
if (!require(e1071)) install.packages('e1071')
set.seed(76)
losy <- rnorm(1000)
library(e1071)
print(kurtosis(losy))


#Macierze
#1
a <-  matrix(1:4, nrow=2, ncol=2)
print(a%*%solve(a))
#macierz jednostkowa
#2
x0 <- rep(1, 10)
x1 <- c(2, 4, 1, 6, 9, 3, 2, 9, 10, 7)
x2 <- c(1.5, 0.2, 0.1, 2, 3.1, 1.2, 0.4, 2.9, 2.5, 1.9)
y <- c(12, 15, 10, 19, 26, 13, 13, 21, 29, 18)
X <- cbind(x0, x1, x2)
b <- solve(t(X) %*% X) %*% t(X) %*% y
print(b)

#1
data("ChickWeight")
chick15 <- ChickWeight[ChickWeight$Chick==15,]
print(nrow(chick15))
#kurczak nr 15 był karmiony 8 razy
#2
chick35 <- ChickWeight[ChickWeight$Chick==35,]
print(chick35)
print(median(chick35$weight))
#3
diet1 <- ChickWeight[ChickWeight$Diet==1,]
print(mean(diet1$weight))
diet2 <- ChickWeight[ChickWeight$Diet==2,]
print(mean(diet2$weight))
#na diecie 1 srednia waga to 102.6455, na diecie 2 to 122.616