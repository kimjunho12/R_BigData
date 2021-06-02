# 일표본

# 01. 데이터 불러오기

RTD = read.csv('../data/Ch09.RTD.csv', header = T)

head(RTD)

RTD = round(RTD, digits = 2)
head(RTD)

# 02. 기술통계량 확인
attach(RTD)

library(psych)

describe(RTD)

# 03. 그래프 그리기

rpar = par(no.readonly = T) # 디폴트 par 값을 미리 할당

par(mfrow = c(1, 2))

boxplot(weight)
hist(
  weight,
  breaks = 10,
  col = "red",
  xlab = "커피 용량",
  ylab = "개수",
  ylim = c(0, 25),
  main = "커피 용량에 대한 히스토그램 및 정규 분포"
)

par(rpar)

# 04. 통계 분석

options("scipen" = 20) # 지수 표기법 수정

t.test(
  RTD,
  alternative = c("two.sided"),
  mu = 275.0,
  conf.level = 0.95
)
# p-value > 0.05 일때 귀무가설이 맞다는 뜻

# 05. 통계결과 그래프

mu=275
se=1.6

inter = qt(p=0.025, df=99) # 95% 신뢰구간

data = rnorm(1000, mu, se)
data = sort(data)

plot(data,
     dnorm(data, mu, se), # 확률분포그래프를 그려라
     type = 'l',
     main = "커피용량(mu=275) 검정",
     xlim = c(220,285))

abline(v=mu, col="green", lty = 5)
abline(v=mu+inter*se, col="blue", lty = 5)
abline(v=mu-inter*se, col="blue", lty = 5)
abline(v=236.35, col='red', lty=5)

detach(RTD)
