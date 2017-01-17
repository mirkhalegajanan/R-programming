library(ggplot2)
library(reshape2)
library(plotly)
library(MASS) 
library(caret)


#Iris Dataset
head(iris)
ls.str(iris)
levels(iris$Species)
summary(iris)

library(Amelia)
library(mlbench)
missmap(iris, col=c("black", "grey"), legend=FALSE)


# pair-wise scatterplots of all 5 attributes
pairs(iris)

pairs(Species~., data=iris, col=iris$Species)

Species =iris$Species
Species.freq = table(Species)   # apply the table function 
Species.freq
barplot(Species.freq, col = c("red","green","cyan"))

Species.relfreq = Species.freq / nrow(iris)
Species.relfreq

par(mfrow=c(2,2))
hist(iris$Sepal.Length,col = "red",breaks = 5)
hist(iris$Sepal.Width,col = "green", breaks = 5)
hist(iris$Petal.Length,col = "blue",breaks = 6)
hist(iris$Petal.Width,col = "yellow", breaks = 5)


# box and whisker plots for each attribute by class value
x <- iris[,1:4]
y <- iris[,5]
featurePlot(x=x, y=y, plot="box")


Sepal.Length = iris$Sepal.Length   # the sepal length interval 
Sepal.Width = iris$Sepal.Width     # the sepal width interval 
Petal.Length = iris$Petal.Length   # the Petal length interval 
Petal.Width = iris$Petal.Width     # the Petal width interval 

plot(Sepal.Length, Sepal.Width) #apply the scatter function

abline(lm(Sepal.Width ~ Sepal.Length)) #generate a linear regression model of the two variables

plot(Petal.Length, Petal.Width )
abline(lm( Petal.Width ~ Petal.Length)) #generate a linear regression model of the two variables


library(survival)
data("iris")
model1 <- glm(Species ~ Petal.Length + Petal.Width +Sepal.Length+Sepal.Width,
              data = iris, family = binomial())
summary(model1)

sp <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point(shape=2)
print(sp)

sp1 <- ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point(shape=3)
print(sp1)
sp + facet_grid(Species ~.)  #Divide by levels of "Species", in the vertical direction

sp1 + facet_grid(.~ Species) #Divide by levels of "Species", in the horizontal direction


#Modifying facet label appearance
sp + facet_grid(.~Species) +
  theme(strip.text.x = element_text(size=12, angle=30, face="bold"),
        strip.text.y = element_text(size=12, angle=60, face="bold"),
        strip.background = element_rect(colour="red", fill="yellow"))



