# 그룹화 : group_by()
iris_group = group_by(iris, Species)

# 통계치 산출 : summarise()
iris_summarise = summarise(
  iris,
  SL_Median = median(Sepal.Length),
  SL_Mean = mean(Sepal.Length),
  SL_Min = min(Sepal.Length)
)

head(iris_summarise)

iris_summarise = summarise(
  iris_group,
  SL_Median = median(Sepal.Length),
  SL_Mean = mean(Sepal.Length),
  SL_Min = min(Sepal.Length),
  SL_N = n()
)

head(iris_summarise)

# 정렬 : arrange()
iris_arrange = arrange(iris, Petal.Width)
head(iris_arrange)

iris_arrange = arrange(iris, desc(Petal.Width))
head(iris_arrange)

# 파이프 연산자 : %>% (ctrl+shift+m)
iris_arrange = iris %>% arrange(desc(Petal.Width))

iris_chain = iris %>%
  select(5, 3:4) %>%
  filter(Petal.Length > 1.5) %>%
  group_by(Species) %>%
  summarise(Mean = mean(Petal.Length), Num = n())


exam = read.csv('../data/exam.csv')
head(exam)

exam %>% summarise(mean_math = mean(exam$math))
exam %>% group_by(exam$class) %>%
  summarise(mean_math = mean(math))


exam %>%
  group_by(class) %>% # class별로 분리
  summarise(
    mean_math = mean(math),
    sum_math = sum(math),
    median_math = median(math),
    n = n() # 학생 수
  )

library(ggplot2)

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)
