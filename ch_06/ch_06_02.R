# 반복문 for 문 연습

for (i in 1:10) {
  print(i)
}

for (i in 1:10) {
  cat('2*', i, '=', 2 * i, '\n')  # cat 여러개 여러개 출력시 사용 (변수 계산 출력)
}

for (i in 1:20) {
  if (i %% 2 == 0) {
    print(i)
  }
}

v1 = 101:200
for (i in 1:length(v1)) {
  if (v1[i] %% 2 == 0) {
    print(v1[i] * 2)
  } else{
    print(v1[i] + 2)
  }
}

sum = 0
for (i in 1:100) {
  sum = sum + i
}

for (i in 1:9) {
  result = 2 * i
  print(result)
}

for (i in 2:9) {
  for (j in 1:9) {
    print(paste(i, '*', j, '=', i * j))
  }
}

# 반복문 while문 연습

i = 1
while (i < 10) {
  result = 2 * i
  print(result)
  i = i + 1
}

i = 1
while (i) {
  i = i * 2
  print(i)
  if (i > 100)
    break
}
