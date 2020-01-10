library(ggplot2)
# generate histograms for quiz 1
#FF5D29
#0DA36A
# NORMAL
set.seed(5423)
norm <- rnorm(1000, mean = 15, sd = 4)
ggplot() + 
  geom_histogram(aes(x = norm, y = ..count../sum(..count..)), 
                 bins = 30,  
                 color = "#000000", 
                 fill = "#0DA36A") + 
  ylab("Density") + 
  xlab("Time to Failure")

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q1_quest1_sym.png')

# left skewed
set.seed(5423)
lskew <- rbeta(1000, 8, 2)
ggplot() + 
  geom_histogram(aes(x = lskew * 22.3, y = ..count../sum(..count..)), 
                 bins = 30,  
                 color = "#000000", 
                 fill = "#0DA36A") + 
  ylab("Density") + 
  xlab("Time to Failure")

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q1_quest1_lskew.png')


# right skewed
set.seed(5423)
rskew <- rbeta(1000, 2, 8)
ggplot() + 
  geom_histogram(aes(x = rskew * 18.4, y = ..count../sum(..count..)), 
                 bins = 30,  
                 color = "#000000", 
                 fill = "#0DA36A") + 
  ylab("Density") + 
  xlab("Time to Failure")

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q1_quest1_rskew.png')
