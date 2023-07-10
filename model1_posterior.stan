data {
  int M; // Number of years analyzed
  int y[M]; // Number of fatal accidents
}

parameters {
  real<lower=0> lambda;
}

model {
  lambda ~ normal(0, 13.325);
  y ~ poisson(lambda);
}

generated quantities {
  int y_sim[M];
  real log_lik[M];

  for (k in 1:M) {
    y_sim[k] = poisson_rng(lambda);
    log_lik[k] = poisson_lpmf(y[k] | lambda);
  }
}