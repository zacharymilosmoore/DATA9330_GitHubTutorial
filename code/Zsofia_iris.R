# data exploration
# he goal is explore the iris dataset
# name: Zsofia Szabo
# date: may 11, 2026


# call iris dataset
iris

# review the dimensions
nrow(iris)
ncol(iris)
dim(iris)

# review the structure of the data
str(iris)

#get the first 5 rows of data
iris[1:5,]
iris[22:26,]
# individual columns
iris$Petal.Length


# get som summaries
summary(iris)
min(iris$Sepal.Length)
mean(iris$Petal.Length)

# example correlation
cor(iris$Sepal.Length, iris$Petal.Length)

# pie chart of species
pie(table(iris$Species))


# histogram of petal length

hist(iris$Petal.Length)

?hist

