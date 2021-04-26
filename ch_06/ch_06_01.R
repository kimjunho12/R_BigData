# 제어문
x = 55
if (x >= 50) {
  print("PASS")
} else{
  print("FAIL")
}

v = c("Hello", "Loop")

cnt = 2

repeat {
  print(v)
  cnt = cnt + 1
  if (cnt > 5) {
    break()
  }
}

v = c("Hello", "while loop")
cnt = 2

while (cnt < 7) {
  print(v)
  cnt = cnt + 1
}

x = 1
while (x < 5) {
  x = x + 1
  if (x == 5)
    break
  print(x)
}

x = 1
while (x < 3) {
  x = x + 1
  if (x == 2)
    next # like python's continue
  print(x)
}

for (i in 1:5) {
  print("HAPPY NEW YEAR!")
}

v = LETTERS[1:6]
for (i in v) {
  if (i == 'D')
    next
  print(i)
}
