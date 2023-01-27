---
  title: "R Notebook"
output: html_notebook
---
#  Lab 1
#Jon Matkin
#1-20-2023

library(readxl)
epi_data_full <- readxl::read_excel("2010EPI_data.xls", 
                                    sheet = "EPI2010_onlyEPIcountries")
gpw_full <- read.csv(file.choose(),header=TRUE)

str(epi_data_full)
str(gpw_full)

epi <- epi_data_full$EPI
summary(epi)
fivenum(epi, na.rm=TRUE)
stem(epi)
hist(epi)
hist(epi,seq(30,95,1),prob=TRUE)
lines(density(epi,na.rm=TRUE,bw=1))
rug(epi)


plot(ecdf(epi),do.points=FALSE,verticals=TRUE)

par(pty="s")
qqnorm(epi)
qqline(epi)

x <- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)


daly = epi_data_full$DALY
wh = epi_data_full$WATER_H

summary(daly)
summary(wh)

fivenum(daly)
fivenum(wh)

stem(daly)
stem(wh)

hist(daly)
hist(wh)

# Histogram with density curve for daly variable

hist(daly,seq(0,92,1),prob=TRUE)
lines(density(daly,na.rm=TRUE,bw=1))
rug(daly)


# Histogram with density curve for water health (wh) variable

hist(wh,prob=TRUE)
lines(density(wh,na.rm=TRUE,bw=1))
rug(wh)

plot(ecdf(daly),do.points=FALSE,verticals=TRUE)

par(pty="s")
qqnorm(daly)
qqline(daly)

x <- seq(0,92,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)

plot(ecdf(wh),do.points=FALSE,verticals=TRUE)

par(pty="s")
qqnorm(wh)
qqline(wh)

x <- seq(0,100,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)

boxplot(epi, daly, wh, main="Boxplots of EPI, DALY, Water Health")

# Exercise 2

epi_land <- epi_data_full[!Landlock]
e_land <- epi_land[!is.na(epi_land)]

hist(e_land)
hist(e_land,seq(30,95,1),prob=TRUE)

unique(epi_data_full$EPI_regions)

# We see that there are 8 distinct regions

# How to filter these regions?

regions <- epi_data_full$EPI_regions
reg_unique <- unique(regions)

epi_data_full[,reg_unique='Europe']

We can follow this model to find anything in the specific regions
We would follow a similar model for the GEO_subregion column

gpw_full <- read.csv(file.choose())

head(gpw_full)
str(gpw_full)

d90 <- gpw_full$Diff90
d95 <- gpw_full$Diff95

summary(d90)
fivenum(d90)

summary(d95)
fivenum(d95)

hist(d90)
hist(d95)

boxplot(d90, main = 'Boxplot of diff90')
boxplot(d95, main = 'Boxplot of diff95')
