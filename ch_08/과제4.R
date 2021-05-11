library(survival)
library(survminer)
library(dplyr)

dog = read.csv("../data/dog_lifespan.csv")
head(dog)

# 이상치 제거
dog_sex = filter(dog, Sex %in% c(1:4))
dog_sex

# 성별 개체수 구하기
sex_count = dog_sex %>%
  group_by(Sex) %>%
  summarise(n = n())
sex_count

library(plotrix)

# 그래프 1 : pie & pie3D
png('./plot/pie/강아지 성별.png')
par(mfrow = c(1, 2), oma = c(0.5, 0.5, 0.1, 0.1))
pct = round(sex_count$n / sum(sex_count$n) * 100)
lab = paste(c("수컷", "암컷", "수컷중성화", "암컷중성화"), '\n', pct, '%')
pie(sex_count$n,
    radius = 1 ,
    labels = lab,
    main = '전체 강아지의 성별 분포')
pie3D(
  sex_count$n ,
  main = '전체 강아지의 성별 분포',
  cex = 0.5,
  labels = pct,
  explode = 0.05
)
legend(0.5,
       1,
       c("수컷", "암컷", "수컷중성화", "암컷중성화"),
       cex = 0.6,
       fil = rainbow(4))
dev.off()


# 그래프 2 : boxplot
for (i in distinct(dog, dog$Name)[, 1]) {
  tmp = dog %>%
    group_by(Year) %>%
    filter(Name == i)
  jpeg(paste('./plot/boxplot/', i, '.jpeg', sep = ""))
  boxplot(tmp$VT_BW, main = paste(i, '의 몸무게'))
  dev.off()
}

# 그래프 3 : geom_col

library(ggplot2)
dog_year = dog %>%
  group_by(Year) %>%
  filter(Year >= 0) %>%
  summarise(n = n())
png('./plot/강아지의 나이 분포.png')
ggplot(data = dog_year, aes(x=Year, y=n)) + geom_col() + labs(title = '강아지의 나이 분포')
dev.off()

# 그래프 4 : geom_point
png('./plot/견종-나이 별 강아지 무게.png')
dog_year = dog %>%
  filter(Year >= 0)
ggplot(data = dog_year, aes(x = Year, y = VT_BW, color = Name)) + geom_point() + ylim(0,55) + labs(title = '견종-나이 별 강아지 무게')
dev.off()

dog_sex$Sex = factor(dog_sex$Sex) # 범주형 데이터로 변환
head(dog_sex)

#0이 중도절단, 1이 관심 event(사망)임
dog_sex$Last_Status[(dog_sex$Last_Status == 2)] = 1
head(dog_sex)

time = dog_sex$Year
status = dog_sex$Last_Status

#time과 event를 알려줌
Y = Surv(time, status)

#KM estimation
fit = survfit(Y ~ dog_sex$Sex, data = dog_sex)

png('./plot/')
#생존곡선그리기
ggsurvplot(
  fit,
  data = dog_sex ,
  risk.table = T,
  conf.int = F,
  tables.theme = theme_cleantable(),
  xlab = "Year"
)

#종을 기준으로 곡선을 그릴거임 (4개) - 종을 factor로 만들어주자
dog_sex$Name <- factor(dog_sex$Name)

#time과 event를 알려줌
Y = Surv(time, status)

#KM estimation
fit_1 = survfit(Y ~ dog_sex$Name, data = dog_sex)

#생존곡선그리기
ggsurvplot(
  fit_1,
  data = dog_sex ,
  risk.table = T,
  conf.int = F,
  tables.theme = theme_cleantable(),
  xlab = "Year"
)

