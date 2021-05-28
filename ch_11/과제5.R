# 실습 1

# 실습 : 인구통계학적 자료 분석
# 데이터 불러오기, factor 조정
organic = read.csv('../data/07.organic.csv', header = T, na.strings = '.')
str(organic)

organic$sex = factor(organic$sex, levels = c(1,2), labels = c("남자", "여자"))
organic$school = factor(organic$school, levels = c(1:4), labels = c("고졸이하", "대학재학", "대학졸업", "대학원 이상"))
str(organic)

# 도수분포표 만들기

attach(organic)

sex.n = table(sex)
sex.p = prop.table(sex.n)
sex.t = cbind(sex.n, sex.p)
sex.t

sex.a = addmargins(sex.t, margin = 1)
sex.a

detach(organic)

# 학력 성별 분할표 만들기
attach(organic)

organic.n = table(school, sex)
organic.p = prop.table(organic.n)
organic.t = cbind(organic.n, organic.p)
organic.a = addmargins(organic.n)
organic.a

detach(organic)

# 교차분석표 문할표 만들기
attach(organic)

sex.n = table(sex)
sex.p = prop.table(sex.n)
sex.t = cbind(sex.n, sex.p)
sex.t

organic.n = table(school, sex)
organic.t = addmargins(organic.n, margin = 1)
organic.t

library(gmodels)
CrossTable(organic.n)
detach(organic)
