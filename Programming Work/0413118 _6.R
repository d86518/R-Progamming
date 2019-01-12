data.file = "hw6_input.csv"
data <- read.csv(data.file, header=FALSE, sep=",")

ans.file = "hw6_answer.csv"
ans <- read.csv(ans.file, header=FALSE, sep=",")

recursive_fibonacci <- function(n) {
  if(n <= 2) {
    return('1')
  } else {
    return(recursive_fibonacci(n-1) + recursive_fibonacci(n-2))
  }
}

f <- array(0,dim=c(1,30))

for (n in c(1:30)){
  f[n] = recursive_fibonacci(n)
  my_ans = f[n]
  if(my_ans != ans[n]){
    print(c("error", n, my_ans, ans[n]))
  }
}              