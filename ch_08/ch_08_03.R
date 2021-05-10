# ggplot2 : 산점도 geom_point()

ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() +
  xlim(0, 500000) +
  ylim(0, 10000)

options(scipen = 99) # 정수로 표현
options(scipen = 0)  # 지수로 표현


# gglot2 : 막대그래프 geom_col() or geom_bar()

library(dplyr)

df_mpg = mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy))
df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

# 크기순 정렬
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

# 빈도 막대 그래프 : 값의 개수로 막대 길이 표현

# X축 범주 변수 -> y축 빈도
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# X축 연속 변수 -> y축 빈도
ggplot(data = mpg, aes(x = hwy)) + geom_bar()


# geom_col() VS geom_bar()
# • 평균 막대 그래프 : 데이터를 요약한 평균표를 먼저 만든 후 평균 표를 이용해 그래프 생성 - geom_col()
# • 빈도 막대 그래프 : 별도로 표를 만들지 않고 원자료를 이용해 바로 그래프 생성 - geom_bar()

# 실습 2

df = mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)
df

ggplot(data = df, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()

ggplot(data = mpg, aes(x = class)) + geom_bar()

# ggplot2: 선 그래프 geom_line()

head(economics)

ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

# 실습 3

ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()

# ggplot2 : 상자 그림 geom_boxplot()
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

# 실습 5

class_mpg = mpg %>%
  filter(class %in% c("compact", 'subcompact', 'suv'))
class_mpg

ggplot(data = class_mpg, aes(x = class, y = cty)) + geom_boxplot()
