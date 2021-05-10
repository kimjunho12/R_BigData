# treemap()

library(treemap)
library(readxl)

total = read_excel('../data/score.xlsx')
head(total)
View(total)

treemap(total, vSize = '점수', index = c('점수', '이름'))
treemap(total, vSize = '점수', index = c('조', '이름'))
treemap(total, vSize = '점수', index = c('점수', '조', '이름'))

# 스타차트, 나이팅게일 차트 : stars()

total = read.csv('../data/score_10.csv')
head(total)

row.names(total) = total$'이름'
total

total = total[, 2:7]
total

stars(
  total,
  flip.labels = F,
  draw.segments = F,
  frame.plot = F,
  full = T,
  main = '학생 별 과목 별 분석 - STAR Chart'
)

savePlot('star_1.png', type = 'png') # ERROR


lab = names(total)
value = table(lab)

pie(
  value,
  labels = lab,
  radius = 0.1,
  cex = 0.6,
  col = NA
)

stars(
  total,
  flip.labels = F,
  draw.segments = T,
  frame.plot = T,
  full = T,
  main = '학생 별 과목 별 분석 - STAR Chart'
)

label = names(total)
value = table(label)
color <- c('black', 'red', 'green', 'blue', 'cyan', 'violet')
pie(
  value,
  labels = label,
  col = color,
  radius = 0.1,
  cex = 0.6
)
savePlot('star_4.png', type = 'png')

stars(
  total,
  flip.labels = F,
  draw.segments = T,
  frame.plot = T,
  full = F,
  main = '학생 별 과목 별 분석 - STAR Chart'
)

# 레이더 차트 : radarchart()

library(fmsb)

layout = data.frame(
  '분석력' = c(5, 1),
  '창의력' = c(15, 3),
  '판단력' = c(3, 0),
  '리더쉽' = c(5, 1),
  '사교성' = c(5, 1)
)

layout

set.seed(123)

data1 = data.frame(
  '분석력' = runif(3, 1, 5),
  '창의력' = rnorm(3, 10, 2),
  '판단력' = c(0.5, NA, 3),
  '리더쉽' = runif(3, 1, 5),
  '사교성' = c(5, 2.5, 4)
)
data1

data2 = rbind(layout, data1) # df 합치
data2

op = par(mar = c(1, 0.5, 3, 1),
         mfrow = c(2, 2))

radarchart(
  data2,
  axistype = 1,
  seg = 5,
  plty = 1,
  title = '첫번째 타입'
)


# ggplot2
## ggplot2 레이어 구조 1 : 배경, 2: 그래프 추가, 3 : 설정 추가

library(ggplot2)

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)
