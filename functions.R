# Ctrl+f : TODO to see what's left to do here

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

################################################################################
##############################NOISE FUNCTIONS###################################

Noise_induction <- function(Y,type = 'gauss',uniform = TRUE,sig_gauss = 1, mu_gauss = 0,r_unif = 0.25){
  #Add noise to Y: return a noisy Y
  
  #type (default='gauss') : Type of the noise considered: 'gauss'; see below for params
  #type = 'unif' : Uniform noise, see below for params
  #Uniform (=TRUE) : False if the noise is growing (in variance) along with X-axis growing
  #sig_gauss, mu_gauss (=(0,1)): in case of gaussian noise
  #r_unif (=0.25): range of uniform noise in case of type='unif' : [-r_unif,r_unif]
  
  if(!uniform){
    stop("TODO implement non uniform noise")
  }
  
  if(type=='gauss'){
    if(uniform){
      n <- rnorm(length(X),mu_gauss,sig_gauss)
      return(Y+n)
    }
    #if uniform = False fill
  }
  
  if(type=='unif'){
    if(uniform){
      n <- runif(length(X),min = -r_unif,max = r_unif)
      return(Y+n)
    }
    #if uniform = False fill
  }
  
  return(Y)
}


