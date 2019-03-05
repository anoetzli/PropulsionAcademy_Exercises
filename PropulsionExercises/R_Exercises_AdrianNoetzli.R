# Q1. Suppose there are twelve multiple choice questions in an English class quiz. Each question has five 
# possible answers, and only one of them is correct. Find the probability of having four or less correct answers 
# if a student attempts to answer every question at random. (Hint : dbinom/pbinom)
# n = 12 trials
# probability of success in each trial is 20%
q1 <- sum(dbinom(0:4,12,0.2)) # Sum of individual binomial probabilities for 0 up to 4 successes
pbinom(4,12,0.2) # Alternative solution using cumulative binomial probability function

# Q2. Suppose the mean checkout time of a supermarket cashier is three minutes. Find the probability of a customer 
# checkout being completed by the cashier in less than two minutes (Hint : exponential distribution).
# The rate is 1/3.  Use pexp to get the probability of checkout in 2 minutes or less
q2 <- pexp(2, rate = 1/3)

# Q3. Find the 2.5th and 97.5th percentiles of the Student t distribution with 5 degrees of freedom.
q3_025q <- qt(.025,df = 5)
q3_975q <- qt(.975,df = 5)

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
q4_sample_mean = 9900
q4_pop_mean = 10000
q4_pop_sd = 120
q4_sample_size = 30
q4_alpha = 0.05 # significance interval
q4_z <- (q4_sample_mean - q4_pop_mean)/(q4_pop_sd/sqrt(q4_sample_size)) # z-test
q4_num_sd = qnorm(0.05,,) #Number of standard deviations from the normal distribution with mean 0 and SD = 1 to compare against the z value
if (q4_z < q4_num_sd) {
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
q5_voters_sample_mean = 85/148
q5_voters_pop_mean = 0.6
# voters_pop_sd = unknown
q5_voters_sample_size = 148
q5_alpha = 0.5 # significance interval - assume 0.5 mentioned in original question is a typo
q5_z = (q5_voters_sample_mean - q5_voters_pop_mean)/(sqrt((q5_voters_pop_mean * (1 - q5_voters_pop_mean))/q5_voters_sample_size))
q5_num_sd = qnorm(0.05,,) #Number of standard deviations from the normal distribution with mean 0 and SD = 1 to compare against the z value

if (q5_z < q5_num_sd) {
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
q6_df <- immer
q6_df
summarise(immer,mean(Y1),mean(Y2))

q6_1931Mean <- mean(q6_df$Y1)
q6_1932Mean <- mean(q6_df$Y2)
q6_1931SD <- sd(q6_df$Y1)
q6_1932SD <- sd(q6_df$Y2)

# Use dplyr built in Two Sample t-test
t.test(q6_df$Y1,q6_df$Y2,paired=TRUE)

# CONCLUSION: From 1931 to 1932 the barley yield fell an average of 15.9 units. With 95% confidence, the reduction in harvest from 1931 to 1932 
#             was between 6.12 and 25.7 units.


##################################-------IGNORE------########################################
## q6_n <- count(q6_df)
## two sample z-test
## q6_t = (q6_1931Mean - q6_1932Mean)/sqrt(q6_1931SD^2/q6_n + q6_1932SD^2/q6_n)
#############################################################################################


#Q7 Please use data mtcars data (help(mtcars)) in R to answer following
# Assuming that the data in mtcars follows the normal distribution, find the 95% confidence interval estimate of the difference between the mean 
# gas mileage of manual and automatic transmissions.
q7_df <- mtcars
automatic <- mtcars[ (mtcars$am == 0),]
manual <- mtcars[ (mtcars$am == 1),]
q7_auto_mean = mean(automatic$mpg)
q7_auto_sd = sd(automatic$mpg)
q7_man_mean = mean(manual$mpg)
q7_man_sd = sd(manual$mpg)

t.test(manual$mpg,automatic$mpg)
q7_man_mean - q7_auto_mean

# CONCLUSION: The mpg of automatic cars is on average 7.24 mpg less than manual cars. With 95% confidence, the reduction in fuel consumption of an automatic 
#             car is between 3.2 and 11.3 mpg.

#Q8. Please use data immer from library Mass in R to answer following
#    Without assuming the data to have normal distribution, test at .05 significance level if the barley yields of 1931 and 1932 in data set immer 
#    have identical data distributions.

library(MASS)
library(dplyr)
q8_df <- immer
q8_df
summarise(immer,mean(Y1),mean(Y2))

q8_1931Mean <- mean(q8_df$Y1)
q8_1932Mean <- mean(q8_df$Y2)
q8_1931SD <- sd(q8_df$Y1)
q8_1932SD <- sd(q8_df$Y2)

# The Wilcoxon signed-rank test can be used when we cannot assume the populations to be normally distributed.
# The null hypothesis is that the distributions are the same. The alternative hypothesis is that the distributions are different. If the p-value 
# is greater than 0.05, we can conclude the distributions are the same
wilcox.test(q8_df$Y1,q8_df$Y2,paired=TRUE)

# The p value of 0.00532 is significantly less than the 0.05 significance level, so we reject the null hypothesis and conclude that the distributions are different.