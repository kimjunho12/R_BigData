library(readxl)
library(foreign)
library(dplyr)
library(ggplot2)
library(MASS)
library(psych)

# 유의사항
# 학번 끝자리 -> 0 -> 2004년
# 업종 한글이 깨질때 산업코드(ind_code)를 이용해서 

# 1번문제


# 1-1
VA_16101350 = read_excel('../data/VA_data.xlsx', sheet = 10)
VA_16101350$SEX = factor(VA_16101350$SEX, levels = c(1,2), labels = c("남자", "여자"))
EYE_16101350 = filter(VA_16101350, VA_16101350$VA_LT != 9.9)
EYE_16101350 = filter(VA_16101350, VA_16101350$VA_RT != 9.9)
str(VA_16101350)

VA_16101350$AVE_16101350 = (VA_16101350$VA_LT + VA_16101350$VA_RT) / 2

# 1-2
describeBy(VA_16101350$AVE_16101350, VA_16101350$SEX)

# 1-3
boxplot(VA_16101350$AVE_16101350)
# 1-4
t.test(VA_16101350$AVE_16101350 ~ VA_16101350$SEX,
       data = VA_16101350,
       alternative = c("two.sided"),
       var.equal = T,
       conf.level = 0.95)

# 2번 문제
# 2-1
com_16101350 = read.csv('../data/company_KOSPI.csv', header = T, na.strings = '.')

# 2-2
com_16101350$ROE_16101350 = (com_16101350$earning / com_16101350$equity) * 100
com_16101350$GR_16101350 = ifelse(com_16101350$ROE_16101350 >= mean(com_16101350$ROE_16101350), "high", "low")
str(com_16101350)

# 2-3
mean(com_16101350$ROE_16101350)

table(com_16101350$GR_16101350)

# 2-4 2004년
com2004_16101350 = filter(com_16101350, com_16101350$YEAR == 2004)

com2004_group_16101350 = group_by(com2004_16101350, com2004_16101350$ind_code)
com2004_group_16101350$ROA_16101350 = com2004_group_16101350$earning / com2004_group_16101350$asset * 100
describe(com2004_group_16101350$ROA_16101350)

sort(com2004_group_16101350$ROA_16101350, decreasing = T)

# 3번 문제
# 3-1
EYE_16101350 = read_excel('../data/VA_data.xlsx', sheet = 1)
EYE_16101350 = filter(EYE_16101350, EYE_16101350$VA_LT != 9.9)
EYE_16101350 = filter(EYE_16101350, EYE_16101350$VA_RT != 9.9)

# 3-2
describe(EYE_16101350)

describe(EYE_16101350$VA_LT)
describe(EYE_16101350$VA_RT)

# 3-3
t.test(EYE_16101350$VA_LT, EYE_16101350$VA_RT,
       alternative = c("two.sided"),
       var.equal = T,
       conf.level = 0.95)
