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
