# Set up test-data
rm(list = ls())

x <- list()
x[[1]] <- survival::veteran

for (i in 1:10) {
  x[[i + 1]] <- rbind(x[[i]], x[[i]])
}

dat <- x[[6]]

preds <- c("karno", "diagtime", "trt")
dat$time <- dat$time*8/365.25
dat$event_age <- dat$age + dat$time
dat$strat <- sample(c(0, 1), size = nrow(dat), replace = T)

n_cpus <- parallel::detectCores() - 1
num_trees <- 1000

rsf_model <- ranger::ranger(survival::Surv(time, status) ~ karno + diagtime + trt, 
               dat)
save(list = c("rsf_model"), file = paste0(here::here(),"/rsf_model.RData"))
rm(list = ls())  
