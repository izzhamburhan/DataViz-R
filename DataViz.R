#Topic 4 : Data Visualization

############################################

#1) Graphical presentation for Numeric Data

# STEM AND LEAF PLOT using stem(var) function

library(MASS)
data(road)
str(road)
attach(road)
stem(temp)
sort(temp)
stem(temp,scale=0.5)

############################################

# BOX AND WHISKER PLOT  using boxplot(var) function ~numerical
library(foreign)
bmi=read.spss(file.choose(),to.data.frame=TRUE)
str(bmi)
attach(bmi)

par(mfrow=c(1,2))
boxplot(height) #basic function
boxplot(weight) #basic function

par(mfrow=c(1,2))
boxplot(height,main="Height of Student",ylab="Height(cm)",col="red")
boxplot(weight,main="Weight of Student",ylab="Weight(kg)",col="purple")

#fixing the data that have duplication data
rm(height)
rm(weight)
rm(gender)

boxplot(height~gender) #basic func
boxplot(weight~gender) #basic func

par(mfrow=c(1,2))
boxplot(height~gender,main="Height",ylab="Height(cm)",col=c("cyan","pink"))
boxplot(weight~gender,main="Weight",xlab="Weight(kg)",col=c("cyan","pink"),horizontal=T)


############################################


#HISTOGRAM using hist(var) function

par(mfrow=c(1,2))
hist(height) #basic function
hist(weight) #basic function

par(mfrow=c(1,2))
hist(height, ylab="Student",xlab="Height(cm)",col="blue",ylim=c(0,14)) 
hist(weight, ylab="Student",xlab="Weight(cm)",col="green") 

##adding the normal curve

par(mfrow=c(1,2))
hist(height,prob=T,ylim=c(0,0.04),xlab="Height(cm)",main="Height Distribution of Students",col="purple")
curve(dnorm(x,mean=mean(height),sd=sd(height)),add=T,col="red",lwd=1,lt=2)

hist(weight,prob=T,ylim=c(0,0.04),xlab="Weight(kg)",main="Weight Distribution of Students",col="maroon")
curve(dnorm(x,mean=mean(weight),sd=sd(weight)),add=T,col="red",lwd=1,lt=2)


############################################


#NORMAL DISRIBUTION CURVE using plot() function

plot(density(weight),main="Density Estimate of Weight",xlab="Weight(kg)",lwd=2,lt=1,ylim=c(0,0.03)) 
curve(dnorm(x,mean=mean(weight),sd=sd(weight)),add=T,col="red",lt=2)


############################################


#SCATTER DIAGRAM using plot() function

ozone=read.csv(file.choose(),header=T,sep=",")
str(ozone)
attach(ozone)
#plot(x,y)

plot(wind,temp) #basic

plot(wind,pch=4,temp,ylab="Temperature",xlab="Wind Speed",main="The Relationship Wind And Temperature")
abline(lm(temp~wind),col="red",lwd=1,lt=4)



############################################


#NORMAL Q-Q Plot using qqnorm() function

qqnorm(wind)
qqline(wind,col="pink",lwd=1)

#Since, most of the points lie on the straight line. Thus, wind dataset are normally distributed.


############################################


#OGIVE using plot() function

plot(ecdf(wind),col.hor="white",main="Cumulative Distributin For Wind", xlab="Wind Speed",ylab="Standard Noraml Deviate")
range=seq(0,20)
distr=pnorm(range,mean=mean(wind),sd=sd(wind))
lines(range,distr,col="red")

#adding text label

x1=c(124,118,130,123,104,151,111)
x2=c(75,80,95,77,68,105,84)

diastolic = 
systolic = 

plot(x1,x2,ylab="Diastolic",xlab="Systolic")
text(x1,x2,c("A","B","C","D","E","F","G"),pos=2)