# 열 합치기 : left_join()

library(dplyr)

test1 = data.frame(id = c(1:5), midterm = c(80, 70, 89, 94, 92))
test2 = data.frame(id = c(1:5), final = c(97, 83, 91, 80, 79))

left_join(test1, test2, by = 'id')


test = data.frame(
  eng = c(7, 8, 7, 8, 9, 6, 9, 9, 8, 9),
  math = c(6, 5, 6, 7, 6, 5, 4, 3, 5, 6),
  class = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
)

teacher = data.frame(class = c(1:5),
                     teacher = c('강지민', '최다경', '김경훈', '황샛별', '정준호'))
left_join(test, teacher, by = 'class')

# 행 합치기 : bind_rows() // 열이름이 모두 같아야 함

group1 = data.frame(id = c(1:5), test = c(60, 70, 80, 90, 90))
group2 = data.frame(id = c(6:10), test = c(70, 70, 80, 80, 90))

all = bind_rows(group1, group2)
all

# 고유값 추출 : distinct()

distinct(iris, Species)
distinct(iris, Petal = round(Petal.Length / Petal.Width))

# 결측치 처리
library(readxl)
Life.Expectancy = read_excel('../data/WorldBank_LE_GDP_2015.xlsx', sheet = 1)
head(Life.Expectancy)

Life.Expectancy = select(Life.Expectancy, 1, 5)

Life.Expectancy = rename(Life.Expectancy, x2015 = '2015')
View(Life.Expectancy)

is.na(Life.Expectancy$x2015)
head(is.na(Life.Expectancy$x2015), 10)
table(is.na(Life.Expectancy$x2015))

Le_non = Life.Expectancy %>%
  filter(!is.na(x2015))
table(is.na(Le_non))

Le_non2 = na.omit(Life.Expectancy)
table(is.na(Le_non2))

Le_mean = mean(Life.Expectancy$x2015, na.rm = T)

Life.Expectancy$x2015 = ifelse(is.na(Life.Expectancy$x2015), Le_mean, Life.Expectancy$x2015)
Life.Expectancy

