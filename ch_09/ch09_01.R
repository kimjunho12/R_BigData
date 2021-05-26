# 한국복지패널데이터 불러오기


# 필요 라이브러리 불러오기
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)


# 데이터 불러오기
raw_welfare = read.spss(file = "../data/Koweps_c10_2015_beta1/Koweps_hpc10_2015_beta1.sav",
                        to.data.frame = T)

welfare = raw_welfare

# 데이터 검토
head(welfare)
tail(welfare)
#View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

# 변수(column)명 바꾸기
welfare = rename(welfare,
                  sex = h10_g3, # 성별
                  birth = h10_g4, # 태어난 연도
                  marriage = h10_g10, # 혼인 상태
                  religion = h10_g11, # 종교
                  income = p1002_8aq1, # 월급
                  code_job = h10_eco9, # 직종 코드
                  code_region = h10_reg7) # 지역 코드

# 성별에 따른 월급 차이
# 1. 변수 검토하기

# 이상치 확인
table(welfare$sex)
class(welfare$sex)

# 이상치 결측 처리
welfare$sex = ifelse(welfare$sex == 9, NA, welfare$sex)

# 결측치 확인
table(is.na(welfare$sex))

# 성별 항목 이름 부여
welfare$sex = ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

# 그래프 출력
qplot(welfare$sex)


# 월급 변수 검토 및 전처리
# 1. 변수 검토하기

class(welfare$income)
summary(welfare$income)

qplot(welfare$income)

qplot(welfare$income) + xlim(0,1000)

# 2. 전처리
# 이상치 확인

welfare$income = ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))

# 성별에 따른 월급 차이 분석
# 1. 성별 월급 평균표 만들기
sex_incom = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))

sex_incom


# 2. 그래프 만들기
ggplot(data = sex_incom, aes(x=sex, y=mean_income)) + geom_col()



# 몇살때 월급을 가장 많이 받을까?
# 1. 변수 검토하기

# 이상치 확인
class(welfare$birth)
summary(welfare$birth)

# 결측치 확인
table(is.na(welfare$birth))

# 3. 파생변수 만들기 - 나이
welfare$age = 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)


#나이와 월급의 관계 분석하기
# 1. 나이에 따른 월급 평균표 만들기

age_income = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))

head(age_income)

# 2. 그래프 만들기
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()

# 연령대 파생변수 만들기
welfare = welfare %>% 
  mutate(ageg = ifelse(age < 30, "young", ifelse(age <= 59, "middle", "old")))

table(welfare$ageg)
qplot(welfare$ageg)

# 연령대별 월급 차이분석
# 1. 연령대별 월급 평균표 만들기

ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

ageg_income

# 2. 그래프 만들기
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
  geom_col() + scale_x_discrete(limits = c("young", "middle", "old"))


# 연령대 및 성별 월급차이 분석
# 1. 연령대 및 성별 월급 평균표 만들기

sex_incom = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income = mean(income))

sex_incom

# 2. 그래프 만들기
ggplot(data = sex_incom, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() + scale_x_discrete(limits = c("young", "middle", "old"))

# 성별 막대 분리 : geom_col(position = "dodge")
ggplot(data = sex_incom, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") + scale_x_discrete(limits = c("young", "middle", "old"))


# 나이 및 성별 월급 차이 분석하기
# 성별 연령별 월급 평균표 만들기
sex_age = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age, sex) %>% 
  summarise(mean_income = mean(income))

head(sex_age)

# 2. 그래프 만들기
ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) + geom_line()

# 직업별 월급 차이
# 어떤 직업이 월급을 가장 많이 받을까?

# 1. 변수 검토하기
class(welfare$code_job)
table(welfare$code_job)

# 2. 전처리
# 직업분류코드 목록 불러오기
list_job = read_excel("../data/Koweps_c10_2015_beta1/Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)
dim(list_job)

# welfare에 직업명 결합
welfare = left_join(welfare, list_job, id = "code_job")

welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)

# 직업별 월급 차이 분석하기
# 1. 직업별 월급 평균표 만들기

job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

# 2. 상위 10개 추출
top10 = job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
top10

# 3. 그래프 만들기
ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) +
  geom_col() + coord_flip()

# 4. 하위 10위 추출
bottom10 = job_income %>% 
  arrange(mean_income) %>% 
  head(10)
bottom10

# 5. 그래프 만들기
ggplot(data = bottom10, aes(x = reorder(job, -mean_income),y = mean_income)) +
  geom_col() + coord_flip() + ylim(0, 850)

