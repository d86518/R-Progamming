data <- iris
datasplit <- split(data, sample(rep(1:2, 75)))
morning <- datasplit[1]
evening <- datasplit[2]
print(morning)
print(evening)
