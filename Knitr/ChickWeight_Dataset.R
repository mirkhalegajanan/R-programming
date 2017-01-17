#ChickWeight Dataset
library(ggplot2)
library(reshape2)
library(plotly)
library(MASS) 
library(caret)

head(ChickWeight)
ls.str(ChickWeight)
levels(ChickWeight$Diet)
summary(ChickWeight)

pairs(ChickWeight)    #Scatterplot Matrix 
pairs(Diet~., data=ChickWeight, col=ChickWeight$Diet) #Scatterplot Matrix By Class

hist(ChickWeight$weight,col = "cyan")
hist(ChickWeight$Time,col = "cyan",breaks = 5)

unique(ChickWeight$Chick)
unique(ChickWeight$Diet)

# Growth curve for individual chicks
ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet, group=Chick)) +
  geom_line() +
  ggtitle("Growth curve for individual chicks")

# Growth curve per diet
ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, method="loess", size=1) +
  ggtitle("Fitted growth curve per diet")

# Final weight, by diet
ggplot(subset(ChickWeight, Time==21), aes(x=weight, fill=Diet)) +
  geom_histogram(colour="black", binwidth=50) +
  facet_grid(Diet ~ .) +
  ggtitle("Final weight, by diet") +
  theme(legend.position="none")


plot(ChickWeight$weight, type = "l")

with(ChickWeight, plot(Time, log(weight)))
plot(ChickWeight$Time, log(ChickWeight$weight))

# informative graph of a selection of the data frame (time point 10)
boxplot(weight ~ Diet,ChickWeight[ChickWeight$Time == 10,])
# take only part of the dataset
temp = ChickWeight[ChickWeight$Time > 15,]
# plot comparing weight vs 2 variables

boxplot(weight ~ Time * Diet,data=temp,col=c("gold","darkgreen"))


chick= ChickWeight$Chick
weight=ChickWeight$weight

plot(weight, chick )

abline(lm( chick ~ weight)) #generate a linear regression model of the two variables


