
# create a simple data frame
a <- c(1,2,3,4,5)
b <- c(1,2,3,4,4)
df <-data.frame(a,b)

# plot 3 lines
pdf("c:/Users/Innova/Downloads/plot.pdf", width=8,height=11)
par(mfrow=c(2,2),mar=c(4,4,0.5,0.5), oma=c(1.5,2,1,1))
plot(df$a,df$b, type="l")
plot(df$a,df$b, type="l")
plot(df$a,df$b, type="l")

dev.off()