# 변수 선언

test1= 5
test1

test2 = 10
test2

test2 = test1 + test2
test2

num.var = c(1,2,3,3,1,2)
fac.var = factor(c(1,2,3,3,1,2))

num.var
fac.var

class(num.var)
class(fac.var)

levels(fac.var)
levels(num.var)

mean(fac.var)
fac.var = as.numeric(fac.var)
fac.var


1:10
10:1

c('2','6','7','8')

seq(1, 10, 2) # like range(1,10,2) in python

seq(10, 1, -2)

rep(5, times=10)

rep(1:3, each=3)
rep(1:3, times=3)

num = 1:10
num

t(num)
