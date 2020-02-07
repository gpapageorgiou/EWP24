x <- seq(10, 30, length.out = 500)

y1 <- 10 + 5*x
y2 <- 20 + 5*x

y3 <- 10 + 2.5*x
y4 <- 40 + 5*x

y5 <- 10 - 0.5*x
y6 <- 80 - 0.5*x

y7 <- 10 + 5*x
y8 <- 30 - 2*x

plotdat <- data.frame("x" = rep(x, 8), 
                      "y" = c(y1, y2, y3, y4, y5, y6, y7, y8), 
                      "pair" = rep(c(1, 2, 3, 4), each = 500*2), 
                      "sex" = rep(rep(c("Females", "Males"), each = 500), 8))

library(ggplot2)

ggplot(plotdat) + 
  geom_line(aes(x = x, y = y, color = sex)) + facet_wrap(~ pair) + 
  ylab("Outcome") + xlab("Age")

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q12_interacts2.png')
