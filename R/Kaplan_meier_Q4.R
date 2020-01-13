library(survival)
aids.id <- JMbayes::aids.id
sfit <- survfit(Surv(Time, death) ~ 1, data = aids.id)
plot(sfit)
summary(sfit, times = 11.3)

quantile(sfit, 1 - c(0.25, 0.5, 0.75))

ggplot() + 
  geom_step(aes(x = sfit$time, y = sfit$surv)) + 
  geom_step(aes(x = sfit$time, y = sfit$lower), lty = 3) +
  geom_step(aes(x = sfit$time, y = sfit$upper), lty = 3) +
  ylim(0, 1) + 
  xlim(0, 20) + 
  geom_hline(aes(yintercept = 0.5), col = 'red') + 
  geom_segment(aes(x = 19.07, xend = 19.07, y = 0, yend = 0.5), col = 'red', alpha = 0.6, lty = 2) + 
  geom_segment(aes(x = 17.80, xend = 17.80, y = 0, yend = 0.492), col = 'red', alpha = 0.6, lty = 2) + 
  geom_hline(aes(yintercept = 0.75), col = 'green') + 
  geom_segment(aes(x = 10.30, xend = 10.30, y = 0, yend = 0.75), col = 'green', alpha = 0.6, lty = 2) + 
  geom_segment(aes(x = 9.37, xend = 9.37, y = 0, yend = 0.748), col = 'green', alpha = 0.6, lty = 2) + 
  geom_segment(aes(x = 11.3, xend = 11.3, y = 0, yend = 0.75), col = 'green', alpha = 0.6, lty = 2) + 
  geom_hline(aes(yintercept = 0.25), col = 'blue') + 
  ylab('Survival Probability') + 
  xlab('Time to Death (years)')

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q4_quest4_kmquants.png')
