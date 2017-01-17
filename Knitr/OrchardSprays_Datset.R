#OrchardSprays Datset

library(ggplot2)
library(reshape2)
library(plotly)
library(MASS) 
library(caret)


head(OrchardSprays)
ls.str(OrchardSprays)
names(OrchardSprays)
library(Amelia)
library(mlbench)
missmap(OrchardSprays, col=c("black", "grey"), legend=FALSE)

unique(OrchardSprays$rowpos)
unique(OrchardSprays$colpos)
unique(OrchardSprays$treatment)

mn <- tapply(OrchardSprays$decrease, OrchardSprays$treatment, mean)
mn
sd <- tapply(OrchardSprays$decrease, OrchardSprays$treatment, sd)
sd


pairs(OrchardSprays)         ##Scatterplot Matrix 
pairs(treatment~., data = OrchardSprays, col=OrchardSprays$treatment)#Scatterplot Matrix By Class

hist(OrchardSprays$decrease,col = "cyan")
hist(OrchardSprays$rowpos, col = "blue")
hist(OrchardSprays$colpos,col = "red")

treatment = OrchardSprays$treatment
treatment.freq = table(treatment)
treatment.freq
barplot(treatment.freq)


plot(decrease ~ rowpos + colpos + treatment, data=OrchardSprays)

stripchart(OrchardSprays$decrease ~ OrchardSprays$treatment,
           main = "stripchart(Orchardsprays)", ylab = "decrease",
           vertical = TRUE)

library(RColorBrewer)
jBrewColors <- brewer.pal(n = 8, name = "Dark2")


with(OrchardSprays, interaction.plot(treatment, colpos, decrease, col = jBrewColors))
with(OrchardSprays, interaction.plot(treatment, rowpos, decrease, col = jBrewColors))




