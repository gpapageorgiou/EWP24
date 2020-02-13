library(survival)
library(ggplot2)
aids.id <- JMbayes::aids.id
sfit <- survfit(Surv(Time, death) ~ drug, data = aids.id)
table(aids.id$drug)

plotdat <- data.frame('Time' = sfit$time, "Survival" = sfit$surv, 'Drug' = rep(levels(aids.id$drug), times = sfit$strata))

ggplot(plotdat) + 
  geom_step(aes(x = Time, y = Survival, color = Drug), size = 1.2) + 
  ylim(0, 1) + 
  ylab('Survival Probability') + 
  xlab('Follow-up Time') + 
  scale_color_manual(values = c('ddC' = 'red', 'ddI' = 'blue'))

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\homeKM.png')
