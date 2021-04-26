# 함수 작성

new.function = function(a = 3, b = 6) {
  result = a * b
  print(result)
}

new.function(9, 5)

new.function = function() {
  for (i in 1:5){
    print(i^2)
  }
}
new.function()
