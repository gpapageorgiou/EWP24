library(survival)
aids.id <- JMbayes::aids.id

sfit <- survfit(Surv(Time, death) ~ gender, data = aids.id)


library(ggplot2)
ggplot() + 
  geom_step(aes(x = sfit$time[1:43], y = 1 - sfit$surv[1:43]), col = 'red') + 
  geom_step(aes(x = sfit$time[44:295], y = 1 - sfit$surv[44:295]), col = 'blue') + 
  xlab('Time to Death (years)') + 
  ylab('Cumulative Hazard')
  
ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q5_quest7_km_tests.png')
