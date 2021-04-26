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

# 실습 3

head(mpg)
mpg %>%
  group_by(manufacturer) %>%
  filter(class == 'suv') %>%
  mutate(total = (cty + hwy) / 2) %>%
  summarise(mean_total = mean(total)) %>%
  arrange(desc(mean_total)) %>%
  head(5)

# 실습 4

library(MASS)
head(Cars93)
Cars93

df = Cars93 %>%
  dplyr::select(Manufacturer, Model, MPG.highway)

df %>%
  filter(Manufacturer == 'Chevrolet') %>%
  arrange(desc(MPG.highway)) %>%
  head(5)

# 실습 5
UScereal %>%
  group_by(mfr) %>%
  summarise(mean_calories = mean(calories)) %>%
  arrange(desc(mean_calories)) %>%
  head(3)

UScereal %>%
  filter(vitamins == 'enriched') %>%
  group_by(mfr) %>%
  summarise(n = n()) %>%
  arrange(desc(n))

# 실습 6
library(ggplot2)

mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%  # Q1
  arrange(desc(mean_cty))             # Q2

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)         # Q3

mpg %>%
  group_by(manufacturer) %>%
  filter(class == 'compact') %>%
  summarise(N = n()) %>%
  arrange(desc(N))  # Q4

# 실습 7

library(dplyr)

head(starwars)

table(is.na(starwars$species))
table(is.na(starwars$mass))

mean_star = starwars %>%
  filter(!is.na(species)) %>%
  filter(!is.na(mass)) %>%
  group_by(species) %>%
  summarise(mean_star = mean(mass))

mean_star

# 실습 8
library(MASS)
head(survey)

? survey

old = survey %>%
  filter(Age > mean(Age))
young = filter(survey, Age <= mean(Age))


survey %>%
  filter(Age > mean(Age)) %>%
  summarise(mean_purse = mean(Pulse, na.rm = T))

mean(old$Pulse, na.rm = T)
young$Pulse %>% mean(na.rm = T)

male = survey %>% filter(Sex == 'Male')
female = survey %>% filter(Sex == 'Female')

mean(male$Height, na.rm = T)
mean(female$Height, na.rm = T)

smoke = filter(survey, Smoke == 'Heavy' | Smoke == 'Regul')
mean(smoke$Age, na.rm = T)

# 실습 9
mpg = as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), 'drv'] = 'k'
mpg[c(29, 43, 129, 203), 'cty'] = c(3, 4, 39, 42)
View(mpg)

table(mpg$drv)

mpg$drv = ifelse(mpg$drv == 'k', NA, mpg$drv)
mpg$drv = ifelse(mpg$drv %in% c('4', 'f', 'r'), mpg$drv, NA)

table(mpg$drv)

boxplot(mpg$cty)$stats

mpg$cty = ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

library(dplyr)
mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean_cty = mean(cty))
