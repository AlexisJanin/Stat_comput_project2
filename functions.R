

piece_linear <- function(x, c1, c2, c3){
  #c1 are the thresholds, c2 are the coefficients, c3 are the added terms
  y <- rep(0, length(x))
  
  for (i in seq(1, length(c1) +1)){
    if (i==1){y[x < c1[i]] = c2[i]*(x[x<c1[i]]) + c3[i]}
    else if (i == length(c1)+1){y[x >= c1[i-1]] = c2[i]*(x[x>=c1[i-1]]) + c3[i]}
    else{y[(x < c1[i]) & (x>=c1[i-1])] = c2[i]*(x[(x < c1[i]) & (x>=c1[i-1])]) + c3[i]}
  }
  return(y)
}
  
sinx_1 <- function(x, a=1){
  #smaller a means a smoother arround 0 (won't ever be smooth arround 0)
  y <- sin(a/x)*(sqrt(x))
  return(y)
}

weiertrass <- function(x, a=0.9, b=9){
  #TODO comment how the behaviour of the function
  y <- rep(0, length(x))
  for (i in seq(0, 200)){
    y = y + (a^i)*cos(pi*x*(b^i))
  }
  return(y)
}

dmixnorm <- function(x, mu1 = 0, mu2 = 2, sigma1 = 1, sigma2 = 3, tau = 0.7){   
  #Argument are self explanatory : tau*N(mu1,sigma1)+(1-tau)*N(mu2,sigma2)
  #Rather very smooth function
  y <- tau*dnorm(x,mu1,sigma1) + (1-tau)*dnorm(x,mu2,sigma2)
  return(y)
}

log_sin <- function(x,a = 5, b = 1.05){  
  #Not smooth at all  the smaller a is, the smoother it is
  #b HAS to be bigger than 1, to have the log of something always positive.
  #Lower b and higher a means less smooth function
  if(b<1){print('b>1 or error!!')
    break}
  return(log(sin(a*x)+b))
}