library(readr)
train <- read_csv("C:/Users/Innova/Downloads/WorkSpace/Titanic Machine Learning from Disaster/train.csv")

test <- read_csv("C:/Users/Innova/Downloads/WorkSpace/Titanic Machine Learning from Disaster/test.csv")
test.Survived <- data.frame(Survived = rep("Home",nrow(test)),test[,])
data.combined <-rbind(train,test.Survived)
data.combined

str(data.combined)
data.combined$Survived<-as.factor(data.combined$Survived)
data.combined$Pclass<-as.factor(data.combined$Pclass)
table(data.combined$Survived)
table(data.combined$Pclass)

library("ggplot2")

train$Pclass <-as.factor(train$Pclass)
str(train$Pclass)


ggplot(train, aes(x = Pclass, fill = factor(Survived)))+
  geom_bar(width = 0.5) +
  xlab("Pclass")+
    ylab("Total Count")+
  labs(fill ="survived")


ggplot(train, aes(x = factor(Survived))) + 
  geom_bar(width=0.5,fill = "lightblue", color = "black") + 
  ggtitle("Survived") + 
  xlab("Survived") 


