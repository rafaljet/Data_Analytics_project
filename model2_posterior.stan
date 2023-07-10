data {
    int M; //Number of years analyzed
    vector[M] climbers;
    int y[M]; //Number of fatal accidents
}

parameters {
    real<lower=0> theta;
}

model {
    theta ~ normal(0, 0.0376);
    for (k in 1:M) {
        y[k] ~ poisson(climbers[k] * theta);
    }
}

generated quantities {
    int y_sim[M];
    real log_lik[M];
    
    for (k in 1:M) {
        y_sim[k] = poisson_rng(climbers[k] * theta);
        log_lik[k] = poisson_lpmf(y[k] | climbers[k] * theta);
    }
}
