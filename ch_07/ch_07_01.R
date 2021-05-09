palot(cars$speed)
plot(cars$speed ~ cars$dist) # 수식기반 방식
plot(cars$speed, cars$dist) # vector기반 방식

var1 = c(1:5)
plot(var1)

var2 = c(2, 2, 2)
plot(var2)

x = 1:3
y = 3:1
plot(x, y)

plot(x, y, xlim = c(1, 10), ylim = c(1, 5))

plot(
  x,
  y,
  xlim = c(1, 10),
  ylim = c(1, 5),
  xlab = 'X축 값',
  ylab = 'Y축 값',
  main = 'Plot Test'
)

plot.new() # plot 창 초기
dev.new() # 별도 창에서 그래프 출력

v1 = c(100, 130, 120, 160, 150)
plot(
  v1,
  type = 'o',
  col = 'red',
  ylim = c(0, 200),
  axes = FALSE,
  ann = FALSE
)

axis(1,
     at = 1:5,
     lab = c("MON", "TUE", "WED", "THU", "FRI"))
axis(2, ylim = c(0, 200))

title(main = "FRUIT",
      col.main = 'red',
      font.main = 4)

title(xlab = "Day", col.lab = 'black')
title(ylab = 'PRICE', col.lab = 'blue')

# 그래프 배치 조정

v1

par(mfrow = c(1, 3))
plot(v1, type = 'o')
plot(v1, type = 's')
plot(v1, type = 'l')

par(mfrow = c(1, 3))
pie(v1)
plot(v1, type = 'o')
barplot(v1)

# plot type : p, l, b, c, o, h, s, S, n

par(mfrow = c(3, 3))

x = -5:5
y = x ^ 2
plot(x, y, type = 'p', main = 'type=p')
plot(x, y, type = 'l', main = 'type=l')
plot(x, y, type = 'b', main = 'type=b')
plot(x, y, type = 'c', main = 'type=c')
plot(x, y, type = 'o', main = 'type=o')
plot(x, y, type = 'h', main = 'type=h')
plot(x, y, type = 's', main = 'type=s')
plot(x, y, type = 'S', main = 'type=S')
plot(x, y, type = 'n', main = 'type=n')

# 그래프 여백 조정

plot.new()
par(mfrow = c(1, 1))

a = c(1, 2, 3)
plot(a, xlab = "aaa")

par(mgp = c(0, 1, 0))  # 여백 지정
plot(a, xlab = "aaa")

par(mgp = c(3, 1, 0))  # 여백 지정
plot(a, xlab = "aaa")

par(mgp = c(3, 2, 0))  # 여백 지정
plot(a, xlab = "aaa")

par(mgp = c(3, 2, 1))  # 여백 지정
plot(a, xlab = "aaa")

par(oma = c(2, 1, 0, 0))  # 여백 지정
plot(a, xlab = "aaa")

# 여러 그래프 중첩으로 그리기 : par(new=T)
par(mfrow = c(1, 1))

v1 = c(1:5)
v2 = c(5:1)
v3 = c(3:7)

plot(v1,
     type = 's',
     col = 'red',
     ylim = c(1, 5))
par(new = T)
plot(v2,
     type = 'o',
     col = 'blue',
     ylim = c(1, 5))
par(new = T)
plot(v3, type = 'l', col = 'green')

plot(v1,
     type = 's',
     col = 'red',
     ylim = c(1, 10))
lines(v2,
      type = 'o',
      col = 'blue',
      ylim = c(1, 5))
lines(v3,
      type = 'l',
      col = 'green',
      ylim = c(1, 15))

# 그래프에 범례 추가 legend()

plot(v1,
     type = 's',
     col = 'red',
     ylim = c(1, 10))
lines(v2,
      type = 'o',
      col = 'blue',
      ylim = c(1, 5))
lines(v3,
      type = 'l',
      col = 'green',
      ylim = c(1, 15))

legend(
  4,
  9,
  c('v1', 'v2', 'v3'),
  cex = 0.9,
  col = c('red', 'blue', 'green'),
  lty = 1
)

# 실습 1

plot(
  cars$dist ~ cars$speed,
  main = "Car distance & speed",
  xlab = "Speed",
  ylab = "Distance travelled",
  xlim = c(0, 30),
  ylim = c(0, 150),
  xaxs = "i",
  yaxs = "i",
  col = "red",
  pch = 19
)

plot(
  cars$dist ~ cars$speed,
  type = "l",
  main = "Car distance & speed",
  xlab = "Speed",
  ylab = "Distance travelled"
)

# 실습 2

plot.new()

data(iris)

with(iris, plot(Petal.Length, Petal.Width))
with(iris, plot(Petal.Length, Petal.Width, pch = 1))
with(iris, plot(Petal.Length, Petal.Width, pch = 2))
with(iris, plot(Petal.Length, Petal.Width, pch = 3))

as.integer(iris$Species)

f.int <- as.integer(iris$Species)
f.col <- c('red', 'blue', 'green')[f.int]

with(iris,
     plot(
       Petal.Length,
       Petal.Width,
       pch = as.integer(iris$Species),
       col = c("red", "blue", "green")[f.int]
     ))

legend(
  1.5,
  2.5,
  unique(iris$Species),
  pch = 1:3,
  col = c("red", "blue", "green")
)

grid(col = 'red')

library(dplyr)

data.iris = select(iris, 1:4)
data.f = select(iris, 5)

f.int = as.integer(data.f$Species)
f.col = c("red", "blue", "green")[f.int]

plot(data.iris, pch = f.int, col = f.col)
plot(data.iris)

# 막대그래프 barplot()

x = 1:5
barplot(x)
barplot(x, horiz = T)

x = matrix(c(5, 4, 3, 2), 2, 2)

barplot(
  x,
  beside = T,
  names = c(5, 3),
  col = c('green', 'yellow')
)

barplot(x,
        names = c(5, 3),
        col = c('green', 'yellow'))

par(oma = c(1, 0.5, 1.0, 5))
barplot(
  x,
  names = c(5, 3),
  beside = T,
  col = c('green', 'yellow'),
  horiz = T
)

barplot(
  x,
  horiz = T,
  names = c(5, 3),
  col = c('green', 'yellow'),
  xlim = c(0, 12)
)


v1 <- c(100, 120, 140, 160, 180)
v2 <- c(120, 130, 150, 140, 170)
v3 <- c(140, 170, 120, 110, 160)

qty = data.frame(BANANA = v1,
                 CHERRY = v2,
                 ORANGE = v3)

barplot(
  as.matrix(qty),
  main = "Fruit's Sales QTY",
  beside = T,
  col = rainbow(nrow(qty)),
  ylim = c(0, 400)
)

legend(14,
       400,
       c('MON', 'TUE', 'WED', 'THU', 'FRI'),
       cex = 0.8,
       fil = rainbow(nrow(qty)))

t(qty)

barplot(
  t(qty),
  main = 'Fruits Sales QTY',
  ylim = c(0, 900),
  col = rainbow(length(qty)),
  space = 0.1,
  cex.axis = 0.8,
  las = 1,
  names.arg = c('MON', 'TUE', 'WED', 'THU', 'FRI'),
  cex = 0.8
)

legend(0.2, 800, names(qty), cex = 0.7, fill = rainbow(length(qty)))


peach <- c(180, 200, 250, 198, 170)

colors = c()
for (i in 1:length(peach)) {
  if (peach[i] >= 200) {
    colors = c(colors, 'red')
  } else if (peach[i] >= 180) {
    colors = c(colors, 'yellow')
  } else {
    colors = c(colors, 'green')
  }
}

barplot(
  peach,
  main = 'Peach Sales QTY',
  names.arg = c('MON', 'TUE', 'WED', 'THU', 'FRI'),
  col = colors
)

# 실습 3

sales = read.csv('../data/citysales.csv')

sales

barplot(sales$ProductA,
        names.arg = sales$City)

barplot(
  as.matrix(sales[, 2:4]),
  beside = T,
  legend = sales$City,
  col = terrain.colors(5),
  border = 'white'
)

barplot(
  as.matrix(sales[, 2:4]),
  beside = T,
  legend = sales$City,
  col = terrain.colors(5),
  border = 'white',
  horiz = T
)

# 히스토그램 : hist()

hist(
  iris$Petal.Length,
  freq = F,
  breaks = 5,
  border = 'blue'
)

lines(density(iris$Petal.Length), col = 'red')

hist(iris$Petal.Length ,
     freq = F,
     xlab = "Petal Length",
     main = "distribution of Petal Length")
lines(density(iris$Petal.Length), col = 'red')
