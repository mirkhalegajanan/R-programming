#InsectSprays Datset
library(ggplot2)
library(reshape2)
library(plotly)
library(MASS) 
library(caret)

data("InsectSprays")
head(InsectSprays)
ls.str(InsectSprays)
summary(InsectSprays)

table(InsectSprays$spray)
insect=InsectSprays #assign the data values to an object called 'insect'
library(data.table) #load in the necessary libraries

#find the mean, standard deviation, and standard error of each group (type of insect repellent) in the 'insect' data set
insect_table = data.table(insect)

tapply(InsectSprays$count, InsectSprays$spray, mean)
tapply(InsectSprays$count, InsectSprays$spray, quantile)

library(Amelia)
library(mlbench)
missmap(InsectSprays, col=c("black", "grey"), legend=FALSE)

pairs(InsectSprays)  ##Scatterplot Matrix 
pairs(spray~., data = InsectSprays, col=InsectSprays$spray)

mean(InsectSprays$count, na.rm = TRUE)


# plot
boxplot(count ~ spray, data = InsectSprays)
boxplot(count ~ spray, data = InsectSprays, col = "lightgray", main="Insect spray trial", xlab="Insecticide", ylab="Insect count")

count = InsectSprays$count
spray = InsectSprays$spray
hist(count,col = "cyan")

qplot(InsectSprays$spray, InsectSprays$count)

#Create a boxplot to compare the different groups in dataset
ggplot(InsectSprays,aes(x=spray,y=count,fill=spray))+geom_boxplot()+guides(fill=FALSE)

model<-glm(count ~ spray - 1, data=InsectSprays, family = "poisson")
model
summary(model)




