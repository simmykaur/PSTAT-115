data {
  int<lower=0> J;         
  int y[J];              
  int n[J];
}

parameters {
  real mu;                
  vector[J] eta;          
  real<lower=0> tau;      
}

transformed parameters {
  vector[J] theta = mu + tau * eta; 
}

model {
  eta ~ normal(0, 1);       
  y ~ binomial_logit(n,theta); 
  tau~cauchy(0,1);
}
