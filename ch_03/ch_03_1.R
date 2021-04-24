a <- c(3, 12, 4, 27, 21, 6, 15, 9)

a[5]  # 0부터 시작 X !!!!!! 1 부터 시작

a[c(2, 5, 6)]
a[seq(1, 7, 2)]

a[-8] # 제외할 위치 빼고 모두 출력
a[-c(1, 3, 5, 7, 9)]

a[a > 20]
a[a > 10 & a < 20]

# 실습 1
test = c(70, 85, 95, 65, 92, 68, 78, 45, 50, 60)

test_mean = mean(test)
test_sd = sd(test)

test = as.character(test)

test[c(5, 6, 7)]

test[-c(5:7)]

test[-seq(3, 7, 2)] # 셋 다 동일
test[-c(3, 5, 7)]
test[c(-3, -5, -7)]

movie1 = c(5, 4, 3, 5)
movie2 = c(2, 3, 4, 2)
movie3 = c(3, 2, 5, 4)
movie4 = c(2, 2, 3, 5)
data <- data.frame(movie1, movie2, movie3, movie4)

data[1, 1]

data[3] # 3열 전체 출력

data[1, ] # 1행 출력
data[3:4,] # 3,4행 출력

data$movie3 # $열의 변수 출력
data[, 'movie3'] # 위와 동일

# 데이터 프레임에 열(column) 추가
data$log1 = log(data$movie1)
data$log1 = with(data, log(movie1)) # 위와 동일

data = transform(data, log1 = log(movie1), log2 = log(movie2))
data

# 열 합치기 : cbind
test1 = data.frame(id = c(1:5), midterm = c(90, 80, 70, 80, 70)) # id열 = 1~5로 df 만들기
test2 = data.frame(id = c(1:5), final = c(50, 60, 70, 60, 70))

total = cbind(test1, test2) # 행(row)이 동일해야

# 행 합치기 : rbind

test1 = data.frame(id = c(1:5), score = c(90, 80, 70, 80, 70)) # id열 = 1~5로 df 만들기
test2 = data.frame(id = c(1:5), score = c(50, 60, 70, 60, 70))

total = rbind(test1, test2) # 열(column)의 '이름'이 같아야함

# 동일한 열 이름 기준으로 병합 : merge

test1 <- data.frame(id = c(3:6), midterm = c(90, 80, 70, 80))
test2 <- data.frame(id = c(1:4), final = c(60, 70, 60, 70))

total = merge(test1, test2, by = 'id') # id를 기준으로 병합
total = merge(test1, test2, by = 'id', all = T) # Outet Join

total = merge(test1, test2, by = 'id', all.x = T) # Left Outer Join
total = merge(test1, test2, by = 'id', all.y = T) # Right Outer Join
