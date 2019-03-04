# Q1. Suppose there are twelve multiple choice questions in an English class quiz. Each question has five 
# possible answers, and only one of them is correct. Find the probability of having four or less correct answers 
# if a student attempts to answer every question at random. (Hint : dbinom/pbinom)
# n = 12 trials
# probability of success in each trial is 20%
sum(dbinom(0:4,12,0.2)) # Sum of individual binomial probabilities for 0 up to 4 successes
pbinom(4,12,0.2) # Alternative solution using cumulative binomial probability function

# Q2. Suppose the mean checkout time of a supermarket cashier is three minutes. Find the probability of a customer 
# checkout being completed by the cashier in less than two minutes (Hint : exponential distribution).
# The rate is 1/3.  Use pexp to get the probability of checkout in 2 minutes or less
pexp(2, rate = 1/3)

# Q3. Find the 2.5th and 97.5th percentiles of the Student t distribution with 5 degrees of freedom.
qt(.025,df = 5)
qt(.975,df = 5)

# pt(.025,df = 5)
# pt(.975,df = 5)
# 
# dt(.025,df = 5)
# dt(.975,df = 5)

# Q4. Q4. Suppose the manufacturer claims that the mean lifetime of a light bulb is more than 10,000 hours. In a sample of
# 30 light bulbs, it was found that they only last 9,900 hours on average. Assume the population standard deviation is 
# 120 hours. At .05 significance level, can we reject the claim by the manufacturer?

print("Let H0 by the null hypotheses that the population mean is greater than 10000 hours.")
print("Let Ha by the alternative hypthesis that the population mean is less than or equal to 10000 hours.")
print("Assume the light bulb lifetime follows a normal distribution.")
sample_mean = 9900
pop_mean = 10000
pop_sd = 120
sample_size = 30
alpha = 0.05 # significance interval
z <- (sample_mean - pop_mean)/(pop_sd/sqrt(sample_size)) # z-test
z
num_sd = qnorm(0.05,,) #Number of standard deviations from the normal distribution with mean 0 and SD = 1 to compare against the z value
num_sd
if (z < num_sd) {
  print("At 0.05 significance level, the z-test indicates that we can reject the Null hypthesis that the mean lifetime of lifebulb is greater than 10,000 hours")
  } else {
  print("At 0.05 significance level, the z-test indicates that we can accept the Null hypthesis that the mean lifetime of lifebulb is greater than 10,000 hours")
  }



# Q5. Suppose 60% of citizens voted in last election. 85 out of 148 people in a telephone survey said that they 
# voted in current election. At 0.5 significance level, can we reject the null hypothesis that the proportion of 
# voters in the population is above 60% this year?
# Let H0 by the null hypotheses that the proportion of voters is greater than 60%.
# Let Ha by the alternative hypthesis that the population mean is less than or equal to 60%.
# Assume the number of voters follows a normal distribution.
voters_sample_mean = 85/148
voters_pop_mean = 0.6
# voters_pop_sd = unknown
voters_sample_size = 148
alpha = 0.5 # significance interval - assume 0.5 mentioned in original question is a typo
z = (voters_sample_mean - voters_pop_mean)/(sqrt((voters_pop_mean * (1 - voters_pop_mean))/voters_sample_size))
z
num_sd = qnorm(0.05,,) #Number of standard deviations from the normal distribution with mean 0 and SD = 1 to compare against the z value
num_sd

if (z < num_sd) {
  print("At 0.05 significance level, the z-test indicates that we can reject the Null hypthesis that the proportion of voters is greater than 60%.")
} else {
  print("At 0.05 significance level, the z-test indicates that we can accept the Null hypthesis that the proportion of voters is greater than 60%.")
}


# Q6. Please use data immer from library Mass in R to answer following
# Assuming that the data in immer follows the normal distribution, find the 95% confidence interval estimate of the difference between the mean barley 
# yields between years 1931 and 1932.
# install.packages("MASS")
library(MASS)
library(dplyr)
df <- immer
df
summarise(immer,mean(Y1),mean(Y2))
Year1931 <- sd(df$Y1)
Year1931
Year1932 <- sd(df$Y2)
Year1932