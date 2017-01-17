library(ggplot2)
set.seed(1400) # Make the sample reproducible

dsmall <- diamonds[sample(nrow(diamonds), 100), ]

qplot(carat, price, data = diamonds)

qplot(carat, price, data = diamonds, colors = color)

qplot(log(carat), log(price), data = diamonds) #ransformation of the variables.

qplot(carat, x * y * z, data = diamonds)


#Colour, size, shape and other aesthetic attributes
qplot(carat, price, data = dsmall, colour = color)  #Mapping point colour to diamond colour
qplot(carat, price, data = dsmall, shape = cut) #point shape to cut quality


library(reshape2)
head(tips)
library(ggplot2)
library(plotly)
sp <- ggplot(tips, aes(x=total_bill, y=tip/total_bill)) + geom_point(shape=2)
sp
sp + facet_grid(sex~.) #Divide by levels of "sex", in the vertical direction

sp + facet_grid(.~sex) #Divide by levels of "sex", in the Horizontal direction

sp + facet_grid(sex ~ day)
sp + facet_wrap(  ~day ,ncol =2)
ggplotly()

#Modifying facet label appearance
sp + facet_grid(sex ~ day) +
theme(strip.text.x = element_text(size=12, angle=30, face="bold"),
      strip.text.y = element_text(size=12, angle=60, face="bold"),
      strip.background = element_rect(colour="red", fill="cyan"))


library(reshape2)
head(tips)
library(ggplot2)
library(plotly)

# A histogram of bill sizes
hp <- ggplot(tips, aes(x=total_bill)) + geom_histogram(binwidth=2,colour="white")
ggplotly()

# Histogram of total_bill, divided by sex and smoker
hp + facet_grid(sex ~ smoker)
ggplotly()

# Same as above, with scales="free_y"
hp + facet_grid(sex ~ smoker, scales="free_y")

# With panels that have the same scaling, but different range (and therefore different physical sizes)
hp + facet_grid(sex ~ smoker, scales="free", space="free")
ggplotly()
