# Desarrollo
# Dada una muestra aleatoria de tama帽o n = 10 de una distribuci贸n normal

set.seed(124)
muestra <- rnorm(n = 10, mean = 110, sd = 7) # muestra peque帽a, por lo tanto se usa t-student

# tail(as.data.frame(muestra))
# estamos interesados en contrastar las hip贸tesis H0: mu = 120 vs H1: mu < 120 (contraste de cola inferior).


# -> H0: mu = 120 vs H1: mu < 120 

# 1 Decida si rechazar o no la hip贸tesis nula si el nivel de significancia es alpha = 0.05

#z0 <- (mean(muestra)-0.1)/(sd(muestra)/sqrt(40)) 

t0 <- (mean(muestra)-120)/(sd(muestra)/sqrt(length(muestra)))

# t0 <- -4.4449

t <- qt(0.05, 9)
# t <- -1.8331

t0 < t
# t0 < t, por lo tanto se rechaza la hip髎tesis nula

# 2 Obtenga el p-value de la prueba

(valor_p <- pt(t0,9))
# Es 0.0008, es decir, la media ser韆 = 120 con una probabilidad de 0.0008

# 3 Lleve a cabo la prueba con la funci贸n t.test

t.test(x = muestra, 
       alternative = "less",
       mu = 120)

#### OUT

# data:  muestra
# t = -4.4449, df = 9, p-value = 0.000806
# alternative hypothesis: true mean is less than 120
# 95 percent confidence interval:
#   -Inf 115.0074
# sample estimates:
#   mean of x
# 111.5034
