# 실습 1

# 01. 데이터 불러오기

satisfaction.df = read.csv('../data/Ch09.satisfaction.csv', header = T)

str(satisfaction.df)

# 02. 기술통계분석
library(psych)

describe(satisfaction.df)

# 03. 그래프 그리기
rpar = par(no.readonly = T)

par(mfrow=c(1,2))
boxplot(satisfaction.df$satis)
hist(satisfaction.df$satis,
     breaks = 10,
     col='red',
     xlab = '점수', ylab = '개수',
     ylim = c(0,25),
     main = '만족도 점수')
par(rpar)

# 04. 통계분석
options('seipen'=20)
t.test(satisfaction.df$satis,
       alternative = c('two.sided'),
       mu = 50,
       conf.level = 0.95)

# 05. 통계결과 그래프

mu=50
se=1.15
inter = qt(p=0.025, df=199)
data = rnorm(1000, mu, se)
data = sort(data)
plot(data,
     dnorm(data, mu, se),
     type = 'l',
     main = '만족도점수(mu=50) 검정',
     xlim=c(45,55))
abline(v=mu, col='green', lty=5)
abline(v=mu+inter*se, col='blue', lty=5)
abline(v=mu-inter*se, col='blue', lty=5)
abline(v=49.54, col='red', lty=5)

# 실습 2 : 왼쪽 단측 검증

# 01. 데이터 불러오기

calorie.df = read.csv('../data/Ch09.calorie.csv', header = T)

str(calorie.df)

# 02. 기술통계분석
library(psych)

describe(calorie.df)

# 03. 그래프 그리기
rpar = par(no.readonly = T)

par(mfrow=c(1,2))
boxplot(calorie.df$cal)
hist(calorie.df$cal,
     breaks = 10,
     col='red',
     xlab = 'kcal', ylab = '개수',
     ylim = c(0,25),
     main = '칼로리')
par(rpar)

# 04. 통계분석
options('seipen'=20)
t.test(calorie.df$cal,
       alternative = c('less'), # 왼쪽 단측 검증
       mu = 500,                # 검증 기준
       conf.level = 0.95)

# 05. 통계결과 그래프

mu=500
se=0.82
inter = qt(p=0.05, df=39, lower.tail = T) # 95% 신뢰구간
data = rnorm(1000, mu, se)
data = sort(data)
plot(data,
     dnorm(data, mu, se),
     type = 'l',
     main = '칼로리(mu<=500) 검정')
abline(v=mu, col='green', lty=5)
abline(v=mu+inter*se, col='blue', lty=5)

abline(v=498.48, col='red', lty=5)

# 실습 3 : 오른쪽 단측 검증

# 01. 데이터 불러오기

effect = read.csv('../data/Ch09.effect.csv', header = T)

str(effect)

# 02. 기술통계분석
library(psych)

describe(effect)

# 03. 그래프 그리기
rpar = par(no.readonly = T)

par(mfrow=c(1,2))
boxplot(effect$time)
hist(effect$time,
     breaks = 10,
     col='red',
     xlab = '지속시', ylab = '개수',
     ylim = c(0,25),
     main = '진통제 지속시간')
par(rpar)

# 04. 통계분석
options('seipen'=20)
t.test(effect$time,
       alternative = c('greater'), # 오른쪽 단측 검증
       mu = 5,                # 검증 기준
       conf.level = 0.95)

# 05. 통계결과 그래프

mu=5
se=0.05
inter = qt(p=0.05, df=39, lower.tail = F) # 95% 신뢰구간 lower.tail = F : 오른쪽

data = rnorm(1000, mu, se)
data = sort(data)

plot(data,
     dnorm(data, mu, se),
     type = 'l',
     main = '진통제 지속시간(mu>=5) 검정')
abline(v=mu, col='green', lty=5)
abline(v=mu+inter*se, col='blue', lty=5)

abline(v=5.07, col='red', lty=5)
