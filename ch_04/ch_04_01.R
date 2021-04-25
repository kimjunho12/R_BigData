install.packages("dplyr")
library(dplyr)

iris_select = select(iris, 1:2, 5)
head(iris_select)

select(iris, Sepal.Length, 1:2, 4)
select(iris, starts_with('pe'))
select(iris, ends_with('h'))
select(iris, contains('p'))

select(iris, -starts_with("pe"), -1, -Species)

iris_filter = filter(iris, iris$Species != "setosa")
head(iris_filter)


# 열 추가 : mutate()

iris_mutate = mutate(iris, Sepal = iris$Sepal.Length / iris$Sepal.Width)
head(iris_mutate)

iris_mutate = mutate(iris, Petal = ifelse(
  Petal.Length / Petal.Width > 5,
  'Large',
  ifelse(Petal.Length / Petal.Width > 3,
         'Middle', 'Small')
))
View(iris_mutate)


# 실습 1

library(MASS)
head(UScereal)
View(UScereal)

? UScereal

more.sugar = filter(UScereal, UScereal$sugars > mean(UScereal$sugars))
less.sugar = filter(UScereal, UScereal$sugars <= mean(UScereal$sugars))

mean(more.sugar$sugars)
mean(less.sugar$sugars)

shelf_3 = filter(UScereal, UScereal$shelf == 3)
shelf_1 = filter(UScereal, UScereal$shelf == 1)

mean(shelf_3$fat)
mean(shelf_1$fat)

v.cereal = filter(UScereal, vitamins == "enriched" |
                    vitamins == "100%")
v.cereal <- filter(UScereal, vitamins %in% c("enriched", "100%"))
mean(v.cereal$calories)

# 실습 2

head(Animals)

? Animals

new_animals = mutate(Animals, ratio = (brain / (body * 1000) * 100))

new_animals = mutate(new_animals, size = ifelse(brain > mean(brain), 'big', 'small'))
