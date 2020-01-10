library(ggplot2)
library(ggstance)
# Create fictional data
# generate patient names
pat_nams <- sapply(1:10, FUN = function (x) paste("Patient", x, sep = " "))
dat <- data.frame("Patient" = pat_nams, 
                  "Start" = NA, 
                  "End" = NA, 
                  "Time" = NA, 
                  "Event" = NA)

dat$Start <- c(2000, 2000, 2000, 2002, 2000, 
               2003, 2000, 2000, 2000, 2000)


dat$End <- c(2004, 2003, 2005, 2005, 2000, 
             2004, 2002, 2000, 2004, 2003)


dat$Time <- c(2004, 2004, 2007, 2007, 1999, 
              2004, 2004, 1998, 2005, 2003)

dat$Event <- c(1, 0, 0, 0, 0, 
               1, 0, 0, 0, 1)


dat$Patient <- factor(dat$Patient, levels = pat_nams, 
                      labels = pat_nams)

ggplot(dat) + 
  geom_linerangeh(aes(y = Patient, xmin = Start, xmax = End), size = 1.2) + 
  geom_vline(aes(xintercept = 2000), color = "#0DA36A", size = 1.2, alpha = 0.5) + 
  geom_vline(aes(xintercept = 2005), color = "#0DA36A", size = 1.2, alpha = 0.5) + 
  geom_point(aes(y = Patient, x = Time), shape = 8, size = 3, color = "red", stroke = 1.5) + 
  geom_point(aes(y = Patient, x = End, shape = factor(Event)), show.legend = FALSE, size = 3, stroke = 1.5) + 
  scale_shape_manual(values = c(1, NA)) + 
  geom_linerangeh(aes(y = Patient, xmin = End, xmax = Time), size = 1, lty = 3) + 
  geom_linerangeh(aes(y = Patient, xmin = rep(2000, 10), xmax = Start), size = 1, lty = 3) + 
  scale_x_continuous(breaks = c(2001, 2002.5, 2004), labels = c("Visit 1", "Visit 2", "Visit 3")) + 
  geom_vline(aes(xintercept = 2001), color = "#FF5D29", size = 1, alpha = 0.8, lty = 2) + 
  geom_vline(aes(xintercept = 2002.5), color = "#FF5D29", size = 1, alpha = 0.8, lty = 2) + 
  geom_vline(aes(xintercept = 2004), color = "#FF5D29", size = 1, alpha = 0.8, lty = 2)


ggsave(filename = 'D:\\gpapageorgiou\\Github_Repos\\EWP24\\Quizzes\\Q2_quest1_intcenstypes.png')
