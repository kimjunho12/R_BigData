# 파이차트 : pie()

par(mfrow = c(1, 1), oma = c(0.5, 0.5, 0.1, 0.1))
p1 = c(10, 20, 30, 40)
pie(p1, radius = 1)

# 시작 각도를 90도로 지정
pie(p1, radius = 1, init.angle = 90)

#색깔과 label명 지정
pie(
  p1,
  radius = 1,
  init.angle = 90,
  col = rainbow(length(p1)),
  label = c('w1', 'w2', 'w3', 'w4')
)

pct = round(p1 / sum(p1) * 100)
lab = paste(pct, '%')  # 문자 합치기
pie(
  p1,
  radius = 1,
  init.angle = 90,
  col = rainbow(length(p1)),
  label = lab
)

# 범례 지정
legend(
  1,
  1.1,
  c('Week 1', 'Week 2', 'Week 3', 'Week 4'),
  cex = 0.5,
  fill = rainbow(length(p1))
)

# 범례 대신 값으로 넣어주기
lab1 = c('Week 1', 'Week 2', 'Week 3', 'Week 4')
lab2 = paste(lab1, '\n', pct, '%')
pie(
  p1,
  radius = 1,
  init.angle = 90,
  col = rainbow(length(p1)),
  label = lab2
)

# pie3D 활용

library(plotrix)

p1 = c(10, 20, 30, 40, 50)
f_day = round(p1 / sum(p1) * 100)
f_label = paste(f_day, '%')

pie3D(
  p1,
  main = '3D Pie Chart',
  col = rainbow(length(p1)),
  cex = 0.5,
  labels = f_label,
  explode = 0.05
)

legend(
  0.5,
  1,
  c("Week 1", 'Week 2', 'Week 3', 'Week 4', 'Week 5'),
  cex = 0.6,
  fil = rainbow(length(p1))
)

# boxplot()

v1 <- c(10, 12, 15, 11, 20)
v2 <- c(5, 7, 15, 8, 9)
v3 <- c(11, 20, 15, 18, 13)

boxplot(
  v1,
  v2,
  v3,
  col = c('blue', 'yellow', 'pink'),
  name = c('Blue', 'Yellow', 'Pink'),
  horizontal = T
)

Metals = read.csv('../data/metals.csv')
head(Metals)

boxplot(Metals$Cu)
boxplot(Metals)

boxplot(Metals$Mn ~ Metals$Source)
boxplot(Mn ~ Source,
        data = Metals,
        horizontal = T,
        outline = F)

boxplot(
  Mn ~ Source,
  data = Metals,
  border = "blue",
  col = "gray",
  cex = 0.5,
  outpch = 19,
  outcol = "red"
)

grid(nx = NA,
     ny = NULL,
     col = "gray",
     lty = "dashed")