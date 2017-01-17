head(faithful) 
ls.str(faithful)
duration = faithful$eruptions 
range(duration)
hist(duration, right=FALSE)   # apply the hist function


#Break the range into non-overlapping sub-intervals

breaks = seq(1.5, 5.5, by=0.5)    # half-integer sequence 
breaks

duration.cut = cut(duration, breaks, right=FALSE)

duration.freq = table(duration.cut) # frequency distribution
duration.freq


cbind(duration.freq)  # print the result in column format

colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan") 

hist(duration,  right=FALSE, col=colors,  main="Old Faithful Eruptions", 
     xlab="Duration minutes")   # apply the hist function

# relative frequency distribution

duration.relfreq = duration.freq / nrow(faithful) 
duration.relfreq 


old = options(digits=1) # print with fewer digits
duration.relfreq

options(old)    # restore the old option 

old = options(digits=1) 
cbind(duration.freq, duration.relfreq) #cbind function to print the result in column format



duration = faithful$eruptions      # the eruption durations 
waiting = faithful$waiting       # the waiting interval 
plot(duration, waiting,  xlab="Eruption duration", ylab="Time waited") #apply the scatter function


abline(lm(waiting ~ duration)) #generate a linear regression model of the two variables


