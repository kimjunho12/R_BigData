# 데이터 파악

colnames(iris) # 열 정보

nrow(iris) # 행 정보

View(iris) # 첫글자 대문자!!!!
dim(iris) # 형태(차원) 확인

table(iris$Species)

head(iris, 3)
tail(iris)

str(iris)   # 데이터 속성 확인 like python's info()

summary(iris) # 데이터 요약 like pythin's mean()

# 파생변수 만들기
library(ggplot2)
mpg$total = (mpg$cty + mpg$hwy) / 2

mean(mpg$total)

mpg$test = ifelse(mpg$total >= 20, "pass", "fail") # 3항 연산자와 비슷 (조건 ? trueCase : falseCase)

mpg$grade = ifelse(mpg$total >= 30, "A",
                   ifelse(mpg$total >= 20, "B", "C"))

library(dplyr)

df_raw = data.frame(var1 = c(1, 2, 1), var2 = c(2, 3, 2))

df_new = df_raw
df_new = rename(df_new, v2 = var2)

# 실습 2

sales <-
  data.frame(
    item = c('사과', '오렌', '수박'),
    price = c(12000, 10000, 9000),
    volume = c(50, 78, 35)
  )

sales

test1 = mean(sales$price)
test2 = mean(sales$volume)


# 실습 3
library(readxl)
LE = read_excel('../data/WorldBank_LE_GDP_2015.xlsx', sheet = 1)
GDP = read_excel('../data/WorldBank_LE_GDP_2015.xlsx', sheet = 2)

head(LE)
head(GDP)

sales = read.csv('../data/citysales.csv')

library(foreign)
titanic = read.spss('../data/titanic.sav',
                    to.data.frame = T,
                    use.value.labels = F)
head(titanic)
View(titanic)

# 실습 4
library(MASS)
str(survey)

str(MASS::survey)

? MASS::survey

# 실습 5
library(ggplot2)
as.data.frame(mpg)
colnames(mpg)
dim(mpg)
head(mpg)
str(mpg)
summary(mpg)

# 실습 6
a = as.data.frame(midwest)
head(a)
colnames(a)

library(dplyr)
a = rename(a, total = poptotal, asian = popasian)
colnames(a)

a$ratio = a$asian/a$total*100


mean(a$ratio)

a$gr = ifelse(a$ratio >= mean(a$ratio), "large", "small")
View(a)
