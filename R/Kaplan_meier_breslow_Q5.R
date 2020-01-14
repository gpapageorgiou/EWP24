library(survival)
aids.id <- JMbayes::aids.id
sfit <- survfit(Surv(Time, death) ~ 1, data = aids.id)
sfit_bres <- survfit(Surv(Time, death) ~ 1, data = aids.id, type = "fleming-harrington")
plot(sfit)
summary(sfit, times = 11.3)

quantile(sfit, 1 - c(0.25, 0.5, 0.75))

ggplot() + 
  geom_step(aes(x = sfit$time, y = sfit$surv), col = 'red') + 
  geom_step(aes(x = sfit_bres$time, y = sfit_bres$surv), col = 'blue') +
  ylim(0, 1) + 
  xlim(0, 20) + 
  ylab('Survival Probability') + 
  xlab('Time to Death (years)')

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q5_quest1_bres_zout.png')

ggplot() + 
  geom_step(aes(x = sfit$time, y = sfit$surv), col = 'red') + 
  geom_step(aes(x = sfit_bres$time, y = sfit_bres$surv), col = 'blue') +
  ylim(0.55, 0.6) + 
  xlim(15, 18) + 
  ylab('Survival Probability') + 
  xlab('Time to Death (years)')

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q5_quest1_bres_zin.png')
