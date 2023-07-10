data {
   int M; //number of years analyzed
   vector[M] climbers; // number of climbers going for expedition each year
}

generated quantities {
   real theta=fabs(normal_rng(0,0.0376));
   int y_sim[M];
   for (k in 1:M){
    y_sim[k] = poisson_rng(theta*climbers[k]);
   }
}