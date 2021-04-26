# 퀴즈 1

val1 = c('감자', '고구마', '버섯', '당근', '토마토', '양배추', '오이')

for (i in val1) {
  ifelse(i != '당근', print(i), next)
}

# 실습 1

score = 85

if (score >= 90) {
  print('A')
} else if (score >= 80) {
  print('B')
} else if (score >= 70) {
  print('C')
} else {
  print('D')
}

# 실습 2
input = function(x) {
  if (x > 0) {
    print(x)
  } else {
    print(-x)
  }
}
input(50)
input(-50)

# 실습 3

input = function(x) {
  if (x > 0) {
    print(x * 2)
  } else {
    x = 0
    print(x)
  }
}
input(5)
input(0)
input(-5)

# 실습 4

input = function(x) {
  if (x == 0) {
    print(x)
  } else{
    print(x * 2)
  }
}
input(0)
input(-5)
input(5)

input = function(x) {
  if (x > 0) {
    print(x * 2)
  } else if (x == 0) {
    print(x)
  } else{
    print(x * -2)
  }
}
input(3)
input(0)
input(-3)

# 실습 5
f = function(x) {
  for (i in 1:x) {
    print(i)
  }
}
f(5)
f(10)
f(20)

# 실습 6
f2 = function(x) {
  i = 0
  for (j in 1:x) {
    i = i + j
  }
  print(i)
}
f2(10)
f2(100)

# 실습 7

f3 = function(a, b) {
  if (a > 1 & b > 1) {
    c = a * b
    print(c)
  } else{
    c = a + b
    print(c)
  }
}
f3(2, 3)
f3(1,-1)

# 퀴즈 2

c2f = function(c) {
  return((c * 1.8) + 32)
}
f2c = function(f) {
  return((f - 32) / 1.8)
}
c2f(100)
f2c(212)
