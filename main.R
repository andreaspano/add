rm(list=ls(all.names=TRUE))
require(add)
x <- Sys.getenv("X")
x <- as.numeric(x)
y <- one(x)
write(y, '/data/y.txt')
