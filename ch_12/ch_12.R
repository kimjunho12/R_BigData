# 01. 산술평균

wgt = read.csv('../data/08.wgt.csv', header = T, na.strings = '.')

str(wgt)

wgt$sex =  factor(wgt$sex, levels = c(1,2), labels = c("남자", "여자"))
str(wgt)

attach(wgt)

# 기본 함수 이용
mean(weight)
mean(weight, na.rm = T) # 결측지 제외 평균계산
median(weight)
summary(wgt)

# 절단평균
mean(weight, trim = 0.1)

detach(wgt)

# 02. 가중평균

avg = c(90, 85, 80)
wt = c(40,27,33)
mean(avg)
weighted.mean(avg, wt)

# 03. 기하평균

# 식으로 계산
(2567/515)^(1/4) - 1

# 비율로 계산
cagr = c((998/515), (1156/998), (1826/1156), (2567/1826))
prod(cagr)^(1/length(cagr))-1

# psych 통계 패키지 이용

library(psych)

# geometric.mean의 입력은 비율자료여야 함

geometric.mean(cagr)-1

# 04.분포

attach(wgt)

min(weight)
max(weight)
diff(range(weight)) # 범위 : 최대 - 최소
quantile(weight, c(0.25,0.5,0.75,1))
var(weight) # 분산
sd(weight)  # 표준편차
skew(weight)
kurtosi(weight)

detach(wgt)

# 05. 표준화 자료로 변환

attach(wgt)
library(dplyr)

wgt = transform(wgt, weight.z = scale(weight))
wgt

detach(wgt)

# 06. 기술통계

attach(wgt)
summary(weight)

describe(weight)
# 07. 이상치 제거

boxplot(weight)
wgt = wgt[!(weight > 80),] # 80kg 이상인 데이터 제거
detach(wgt)


attach(wgt)
describe(weight)
detach(wgt)

# 08. 그룹별 수치 자료 비교
attach(wgt)

tapply(weight, sex, mean)
tapply(weight, sex, sum)

describeBy(wgt[c("weight")], sex, mat=T)
describeBy(wgt[c("weight")], sex, mat=F)

detach(wgt)
