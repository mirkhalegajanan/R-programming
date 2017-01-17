library(MASS)      # load the MASS package 
painters 
painters$School 

school = painters$School
school.freq = table(school)   # apply the table function 

#frequency distribution
school.freq 

#cbind function to print the result in column format
cbind(school.freq)
barplot(school.freq)
pie(school.freq)


# relative frequency distribution

school.relfreq = school.freq / nrow(painters) 
school.relfreq 
barplot(school.relfreq)
pie(school.relfreq)


c_school = school == "C"      # the logical index vector

c_painters = painters[c_school, ]  # child data set

mean(c_painters$Composition) #mean composition score of school C. 

tapply(painters$Composition, painters$School, mean) #mean composition score for each school 


