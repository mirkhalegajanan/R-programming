#infert Datset

library(ggplot2)
library(reshape2)
library(plotly)
library(MASS) 
library(caret)

head(infert)
data("infert")
names(infert) 
ls.str(infert)                  #Overview of the data

summary(infert)                 #summary of the dta
table(infert$case)


#Checking out the missing values
sapply(infert, function(x) sum(is.na(x))) #No missing values

# load libraries
library(Amelia)
library(mlbench)
# create a missing map
missmap(infert, col=c("black", "grey"), legend=FALSE)

pairs(infert)
pairs(education~., data = infert, col=infert$education)

par(mfrow=c(2,2),
plot(infert$pooled.stratum),
plot(infert$parity),
plot(infert$age),
plot(table(infert$parity)))
dev.off()

hist(infert$age)

require(stats)
model1 <- glm(case ~ spontaneous+induced, data = infert, family = binomial())
summary(model1)
model1


library(survival)
 data(infert)
model2 <- glm(case ~ age+parity+education+spontaneous+induced,
                               data = infert, family = binomial())
summary(model2)

spontaneous = infert$spontaneous
age = infert$age
stratum = infert$stratum


plot( stratum, age )
abline(lm( age ~ stratum)) #generate a linear regression model of the two variables

library('epiDisplay')

model1 <- glm(case ~ induced + spontaneous, data=infert, family=binomial)
logistic.display(model1)

# Having two spontaneous abortions is quite close to being infertile!
# This is actually not a causal relationship
layout(matrix(1, ncol = 1))
lroc(model1, title=TRUE, auc.coords=c(.5,.1))

# For PowerPoint presentation, the graphic elements should be enhanced as followed 
lroc(model1, title=TRUE, cex.main=2, cex.lab=1.5, col.lab="blue", cex.axis=1.3, lwd=3)
lroc1 <- lroc(model1) # The main title and auc text have disappeared

model2 <- glm(case ~ spontaneous, data=infert, family=binomial)
logistic.display(model2)

lroc2 <- lroc(model2, add=TRUE, line.col="brown", lty=2)
legend("bottomright",legend=c(lroc1$model.description, lroc2$model.description),
       lty=1:2, col=c("red","brown"), bg="white")
title(main="Comparison of two logistic regression models")
lrtest(model1, model2) 

