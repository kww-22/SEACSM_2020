# ---
# Title: Humeral Segment Energy and it Relationship to Clincal Glenohumeral Measures in Youth Baseball Pitchers
# Authors: Kyle Wasserberger, Jessica Downs, Gretchen Oliver
# 
# Sports Medicine & Movement Lab
# School of Kinesiology
# Auburn University
#
# Plotting & diagnostic code for abstract to be presented at 2020 Annual Meeting of the Southeast Chapter of American College of Sports Medicine
# Last updated 11 December, 2019.
# ---

# Custom residual plot function 
my.resid.plot <- function(mod, main){
  par(pty = "s")
  resids.mod <- resid(mod)
  preds.mod <- predict(mod)
  sig.mod <- sigma(mod)
  
  residual.plot(preds.mod,resids.mod,sig.mod,
                main = main, cex = 1.1)
}

par(mfrow = c(1,2))
# Inflow model residuals
my.resid.plot(mod = if.mod.step, main = "Inflow Model Residuals")

# Outflow model residuals
my.resid.plot(mod = of.mod.step, main = "Outflow Model Residuals")

# ---

resids.if <- residuals(if.mod.step)
resids.of <- residuals(of.mod.step)

residhist.if <- hist(resids.if, breaks = 'fd', main = 'Inflow Model Residuals', ylab = '', xlab = 'p = .54', col = 'skyblue', yaxt = 'n')
residhist.of <- hist(resids.of, breaks = 'fd', main = 'Outflow Model Residuals', ylab = '', xlab = 'p = .07', col = 'skyblue', yaxt = 'n')


par(mfrow = c(1,1),
    pty = 'm')

# Inflow plot

plot.if <- plot(predictors$velo, HumWork.in.norm,
     xlab = "Velo (mph)", ylab = "Humeral IF (J/kg)",
     main = "Humeral Energy Inflow")
# curve(cbind(1,x) %*% coef(if.mod.null), lwd = 2, col = "purple", add = TRUE)
curve(cbind(1, x, mean(data_master$ROM_IR_d)) %*% coefficients(if.mod.step), lwd = 2, col = "black", add = TRUE)
curve(cbind(1, x, mean(data_master$ROM_IR_d) + sd(data_master$ROM_IR_d)) %*% coefficients(if.mod.step), lwd = 2, col = "green", add = TRUE)
curve(cbind(1, x, mean(data_master$ROM_IR_d) - sd(data_master$ROM_IR_d)) %*% coefficients(if.mod.step), lwd = 2, col = "red", add = TRUE)

legend('topleft', legend = c("-1SD", "Mean", "+1SD"),
       col = c("red", "black", "green"),
       title = "IR ROM",
       box.lty = 0,
       lwd = 2,
       cex = .6,
       bg = 'transparent')
# ---

# Outflow plot
plot(predictors$velo, HumWork.out.norm,
     xlab = "Velo (mph)", ylab = "Humeral of (J/kg)",
     main = "Humeral Energy Outflow")
# curve(cbind(1,x) %*% coef(of.mod.null), lwd = 2, col = "purple", add = TRUE)
curve(cbind(1, x, mean(data_master$ROM_IR_d)) %*% coefficients(of.mod.step), lwd = 2, col = "black", add = TRUE)
curve(cbind(1, x, mean(data_master$ROM_IR_d) + sd(data_master$ROM_IR_d)) %*% coefficients(of.mod.step), lwd = 2, col = "green", add = TRUE)
curve(cbind(1, x, mean(data_master$ROM_IR_d) - sd(data_master$ROM_IR_d)) %*% coefficients(of.mod.step), lwd = 2, col = "red", add = TRUE)

legend('topleft', legend = c("-1SD", "Mean", "+1SD"),
       col = c("red", "black", "green"),
       title = "IR ROM",
       box.lty = 0,
       lwd = 2,
       cex = .6,
       bg = 'transparent')

# ---