# • 모집단과 표본
#  • 관심의 대상이 되는 모든 개체의 집합  : 모집단
#  • 모집단에서 조사대상으로 채택된 일부  : 표본

# • 모수와 통계량
#  • 모집단의 특성을 수치로 나타낸 것 : 모수
#  • 표본의 특성을 수치로 나타낸 것   : 통계량

# 데이터 내보내기 : write.csv

grade.csv = read.csv('../data/07.grade.csv', header = T, na.strings = '.')

grade.csv$sex = factor(grade.csv$csex, levels = c(1,2), labels = c("남자", "여자"))

str(grade.csv)

write.csv(grade.csv, file = "../data/grade_csv.csv", row.names = F)

grade.csv

# 기술통계분석(범주형)

# 데이터 가져오기
freq = read.csv('../data/07.frequency.csv', header = T, na.strings = '.')
freq

freq$grade = factor(freq$grade, levels = c(1:5), labels = c("F","D","C","B","A"))
str(freq)

# 도수분표포 만들기

#attach / detach : dataframe 사용
attach(freq)

# 빈도 계산
grade.n = table(grade)
grade.n

# 상대 빈도(%)
grade.p = prop.table(grade.n)
grade.p

# 빈도 + 상대빈도
grade.t = cbind(grade.n, grade.p)
grade.t

# 합계
# 빈도 + 상대빈도 + 합계
# margin = 1 : 열 합계
# margin = 2 : 행 합계
# margin = NULL : 전체 합계
grade.a = addmargins(grade.t, margin = 1)
grade.a

detach(freq)

grade.b = as.data.frame(grade.a)

grade.b$grade.cmp = cumsum(grade.b$grade.p)
grade.b

grade.b$grade.cmp = ifelse(grade.b$grade.cmp == 2, 1, grade.b$grade.cmp)
grade.b

# 사전 실험 설계 분할표 만들기

pre = read.csv("../data/07.pre.csv", header = T, na.strings = '.')
str(pre)

pre$treat = factor(pre$treat, levels = c(1,2), labels = c("비타민", "Placebo"))
pre$cold = factor(pre$cold, levels = c(1,2), labels = c("Cold", "nCold"))
str(pre)

attach(pre)

pre.n = table(treat, cold)
pre.n
pre.p = prop.table(pre.n)
pre.p
pre.t = cbind(pre.n, pre.p)
pre.t
pre.a = addmargins(pre.n)
pre.a

# 교차분석용 라이브러리 이용
install.packages("gmodels")
library(gmodels)
pre = CrossTable(treat, cold)


detach(pre)

post = read.csv("../data/07.post.csv", header = T, na.strings = '.')
str(post)

post$smoking = factor(post$smoking, levels = c(1,2), labels = c("smok", "nsmok"))
post$cancer = factor(post$cancer, levels = c(1,2), labels = c("cancer", "health"))
str(post)

attach(post)
post.n = xtabs(observation ~ cancer + smoking, data = post)
post.n

CrossTable(post.n)
detach(post)