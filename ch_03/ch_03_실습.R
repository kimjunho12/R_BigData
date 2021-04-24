# 실습 1
test = c(70, 85, 95, 65, 92, 68, 78, 45, 50, 60)

test_mean = mean(test)
test_sd = sd(test)

test_mean
test_sd

test = as.character(test)
test

test[5:7]
test[c(-5,-6,-7)]
test[-c(5:7)]

test[-seq(3, 7, 2)]

# 실습 2

sales = data.frame(c('스노우맨', '연금술사', '벚꽃동산 '),
                    + c(12000,10000,9000),
                    + c(50,78,35))
names(sales) = c('book', 'price', 'volume')

sales

mean(sales$price)
mean(sales[,2])
mean(sales$volume)
mean(sales[,3])

# 실습 3
library(readxl)
LE = read_excel('./data/WorldBank_LE_GDP_2015.xlsx', sheet = 1)
GDP = read_excel('./data/WorldBank_LE_GDP_2015.xlsx', sheet=2)

head(LE)
head(GDP)

sales = read.csv('./data/citysales.csv')

library(foreign)
titanic = read.spss('./data/titanic.sav', to.data.frame=TRUE, use.value.labels=FALSE)

View(titanic)


# 실습 5

library(ggplot2)
as.data.frame(mpg)
colnames(mpg)
nrow(mpg)
dim(mpg)
head(mpg)
str(mpg)
summary(mpg)

# 실습 6

a = as.data.frame(midwest)
head(a)
colnames(a)

library(dplyr)
a = rename (a, total = poptotal, asian = popasian)
View(a)

a$ratio = a$asian/a$total*100
View(a)

mean(a$ratio)

a$gr = ifelse(a$ratio > 0.4872462, "large", "small")
View(a)

a$gr2 = ifelse(a$ratio > mean(a$ratio), "large", "small")
