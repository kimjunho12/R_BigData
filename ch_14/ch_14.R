# 독립표본 (Independent Sample) t-test

# 01. 데이터 불러오기

tire = read.csv('../data/Ch10.tire.csv', header = T)
str(tire)

tire$t_group = factor(tire$t_group, levels = c(1,2), labels = c('H타이어', 'M타이어'))
str(tire)

# 02. 기술통계분석

library(psych)
describeBy(tire$t_time, tire$t_group, mat = T)

# 03. 그래프 그리기

rpar = par(no.readonly = T)
  layout(matrix(c(1,1,2,3), 2,2,byrow=T))
  boxplot(tire$t_time ~ tire$t_group)
  hist(tire$t_time[tire$t_group=='H타이어'])
  hist(tire$t_time[tire$t_group=='M타이어'])
par(rpar)

# 04. 통계분석

# 등분산 검정

var.test(tire$t_time ~ tire$t_group, data = tire) # p-value : 0.05보다 크면 귀무가설 채택 -> 등분산임

# t-검정
# 등분산이면 var.equal = True, 이분산이면 var.equal = False

options('scipen'=20)
t.test(tire$t_time ~ tire$t_group,
       data = tire,
       alternative = c("two.sided"),
       var.equal = T,
       conf.level = 0.95)

# 05. 통계결과 그래프

# H타이어 회사
x = 48670.57
se = 658.5
data = rnorm(1000, x, se)
data = sort(data)
plot(data,
     dnorm(data, x, se),
     col = 'blue',
     type = 'l',
     main = '회사 별 타이어 수명',
     xlim = c(45000, 55000),
     ylim = c(0,0.0006))
abline(v=x, col='blue', lty=3)

# 그래프 겹처서 표현하기

par(new=T)

# M타이어 회사
x = 51377.6
se = 766.37
data = rnorm(1000, x, se)
data = sort(data)
plot(data,
     dnorm(data, x, se),
     col = 'red',
     type = 'l',
     main = '회사 별 타이어 수명',
     xlim = c(45000, 55000),
     ylim = c(0,0.0006))
abline(v=x, col='red', lty=3)


# 대응표본 (Paired Sample) : 등분산 필요 X (동일 대상으로 반복 측정이니)

# 01. 데이터 불러오기

pst = read.csv('../data/Ch10.PST.csv', header = T)
str(pst)

# 02. 기술통계분석

library(psych)
describe(pst)

dif = c(pst$post-pst$pre)
describe(dif)

# 03. 그래프 그리기(상자그림, 히스토그램)

rpar = par(no.readonly = T)
  layout(matrix(c(1,2,3,3), 2,2,byrow = T))
  hist(pst$pre, main="복용 전 몸무게")
  hist(pst$post, main = "복용 후 몸무게")
  boxplot(dif, main='몸무게 차이')
par(rpar)


# 04. 통계분석
t.test(pst$post, pst$pre,    # 후를 먼저, 전을 뒤에
       alternative = c("two.sided"),
       paired = T,
       conf.level = 0.95)

# 05. 통계결과 그래프
mu = 0
se = 0.38
inter = qt(p=0.025, df = 60)

data = sort(rnorm(1000, mu, se))
plot(data,
     dnorm(data, mu, se),
     type = 'l',
     main = '몸무게 차이 검정',
     xlim = c(-3,3))
abline(v=mu, col='green', lty=5)
abline(v=mu + inter*se, col='blue', lty=5)
abline(v=mu - inter*se, col='blue', lty=5)
abline(v=-1.262295, col = 'red', lty=5)


# 실습 1

# 성별에 따라 만족도 차이가 있는지 분석

# 01. 데이터 불러오기
hospital = read.csv('../data/Ch10.hospital.csv', header = T)
str(hospital)

hospital$group = factor(hospital$group,
                        levels = c(1,2),
                        labels = c("남자", "여자"))
str(hospital)

# 02. 기술통계분석

library(psych)
describeBy(hospital$total,
           hospital$group, mat = T)

# 03. 그래프 그리기
rpar = par(no.readonly=T)
  layout(matrix(c(1,1,2,3), 2,2, byrow = T))
  boxplot(hospital$total ~ hospital$group)
  hist(hospital$total[hospital$group=='남자'])
  hist(hospital$total[hospital$group=='여자'])  
par(rpar)  

# 04. 통계분석

# 등분산 검정 (집단 간 분산값이 같은지 확인)
var.test(hospital$total ~ hospital$group, data= hospital)

# t-검정
t.test(hospital$total ~ hospital$group,
       data = hospital,
       alternaive = c('two.sided'),
       var.equal = T,
       conf.level = 0.95)

# 05. 통계 결과 그래프

# 남자
x = 67.812
se = 13.99018/(sqrt(50))
data = sort(rnorm(1000, x, se))
plot(data,
     dnorm(data, x, se),
     col='blue',
     type = 'l',
     main = '남자와 여자 간의 만족도 차이',
     xlim = c(55,90),
     ylim = c(0,0.25))
abline(v=x, col="blue", lty=3)

par(new=T)
# 여자
x = 78.546
se = 13.02626/(sqrt(50))
data = sort(rnorm(1000, x, se))
plot(data,
     dnorm(data, x, se),
     col='blue',
     type = 'l',
     main = '남자와 여자 간의 만족도 차이',
     xlim = c(55,90),
     ylim = c(0,0.25))
abline(v=x, col="blue", lty=3)

