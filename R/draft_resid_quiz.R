library(survival)
?lung
?survreg
lapply(lung, FUN = function(x) sum(is.na(x)))
lung.cc <- lung[which(!is.na(lung$ph.karno)), ]
lung.cc$status <- ifelse(lung.cc$status == 1, 0, 1)
lung.cc$status <- as.numeric(lung.cc$status)
fit.weib <- survreg(Surv(time, status) ~ age + sex + ph.karno, data = lung.cc, 
                    dist = 'weibull')
fit.exp <- survreg(Surv(time, status) ~ age + sex + ph.karno, data = lung.cc, 
                    dist = 'exponential')
fit.gaus <- survreg(Surv(time, status) ~ age + sex + ph.karno, data = lung.cc, 
                    dist = 'gaussian')

res.weib <- (log(fit.weib$y[, 1]) - fit.weib$linear.predictors) / fit.weib$scale
res.exp <- (log(fit.exp$y[, 1]) - fit.exp$linear.predictors) / fit.exp$scale
res.gaus <- (log(fit.gaus$y[, 1]) - fit.gaus$linear.predictors) / fit.gaus$scale


resKM.weib <- survfit(Surv(res.weib, status) ~ age + sex + ph.karno, data = lung.cc)
resKM.weib$time <- sort(resKM.weib, decreasing = T)

resKM.exp <- survfit(Surv(res.exp, status) ~ age + sex + ph.karno, data = lung.cc)
resKM.gaus <- survfit(Surv(res.gaus, status) ~ age + sex + ph.karno, data = lung.cc)

xx.weib <- seq(min(res.weib), max(res.weib), length.out = 228)
yy.weib <- exp(-exp(xx.weib))
xx.exp <- seq(min(res.exp), max(res.exp), length.out = 228)
yy.exp <- exp(-exp(xx.exp))
xx.gaus <- seq(min(res.gaus), max(res.gaus), length.out = 228)
yy.gaus <- exp(-exp(xx.gaus))

plotdat <- data.frame("y" = c(resKM.weib$surv, resKM.exp$surv, resKM.gaus$surv), 
                      "x" = c(resKM.weib$time, resKM.exp$time, resKM.gaus$time), 
                      'dist' = rep(c("Weibul", "Exponential", "Gaussian"), 
                                   times = c(length(resKM.weib$time), length(resKM.exp$time), length(resKM.gaus$time))))

library(ggplot2)

ggplot() + 
  geom_step(aes(x = sort(resKM.weib$time), y = sort(resKM.weib$surv, decreasing = T)))

plot(resKM.weib)
?survf


# fit the model
library(JMbayes)
fit.weib <- survreg(Surv(Time, death) ~ drug, data = aids.id,
                    dist = "weibull")
# extract fitted values
fits <- fit.weib$linear.predictors
# compute the AFT residuals
resids <- (log(fit.weib$y[, 1]) - fits) / fit.weib$scale

resKM <- survfit(Surv(resids, death) ~ drug, data = aids.id)
# plot the KM estimate
plot(resKM, mark.time = FALSE)
# superimpose the survival function of the assumed
# extreme value distribution
xx <- seq(min(resids), max(resids), length.out = 35)
yy <- exp(- exp(xx))
lines(xx, yy, col = "red", lwd = 2)
