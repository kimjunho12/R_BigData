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

sales <- data.frame(c('스노우맨', '연금술사', '벚꽃동산 '), 
                    + c(12000,10000,9000),
                    + c(50,78,35))
mean(sales$pric)