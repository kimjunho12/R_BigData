# 데이터 불러오기
library(readxl)

read_excel('../data/customer_profile.xlsx')
read_excel(
  "../data/customer_profile.xlsx",
  sheet = NULL,
  range = 'B3:E13',
  col_names = T
)

read.csv(file = '../data/customer_profile.csv',
         header = T,
         stringsAsFactors = F)

test1 = c(1:10)
write.csv(test1, file = '../data/test1.csv')

save(test1, file = '../data/test1.rda')
rm(test1)

load('../data/test1.rda')

library(foreign)

iris_spss =  read.spss('../data/iris.sav',
                       to.data.frame = T,
                       use.value.labels = F) # factor 형태로 받기


head(iris_spss)
summary(iris_spss)
