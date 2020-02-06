x <- seq(0, 12, length.out = 1000)
y1 <- rep(0.8, 1000)
y2 <- 0.5 + 0.000005*x^(2) + 0.005*x^(3)

ggplot() + 
  geom_line(aes(x = x, y = y1), color = 'red') + 
  geom_line(aes(x = x, y = y2), color = 'green') + 
  ylab("HR") + 
  xlab("Follow-up Time") + 
  ylim(0, 5) + 
  theme_bw()

ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q11_quest6_ph.png')
