# Covariance first
# Load data sets of ANN and SMM PCC values for Number of Binders (NoB).
ann_t_nob <- c(0.625,
               0.394,
               0.466,
               0.708,
               0.779,
               0.716,
               0.532,
               0.536,
               0.627,
               0.617,
               0.641,
               0.56,
               0.663,
               0.638,
               0.799,
               0.734,
               0.685,
               0.526,
               0.565,
               0.805,
               0.725,
               0.716,
               0.75,
               0.696,
               0.793,
               0.685,
               0.742,
               0.831,
               0.79,
               0.768,
               0.812,
               0.809,
               0.817,
               0.832,
               0.853)

smm_t_nob <- c(0.414,
               0.284,
               0.581,
               0.433,
               0.52,
               0.608,
               0.443,
               0.6,
               0.334,
               0.751,
               0.686,
               0.454,
               0.619,
               0.708,
               0.654,
               0.472,
               0.318,
               0.443,
               0.548,
               0.637,
               0.597,
               0.536,
               0.687,
               0.637,
               0.684,
               0.533,
               0.657,
               0.718,
               0.734,
               0.703,
               0.701,
               0.746,
               0.742,
               0.738,
               0.734)

ann_f_nob <- c(0.478,
               0.487,
               0.436,
               0.618,
               0.727,
               0.618,
               0.614,
               0.629,
               0.706,
               0.522,
               0.576,
               0.635,
               0.725,
               0.741,
               0.732,
               0.774,
               0.727,
               0.564,
               0.578,
               0.772,
               0.786,
               0.768,
               0.764,
               0.715,
               0.818,
               0.685,
               0.771,
               0.808,
               0.784,
               0.81,
               0.809,
               0.816,
               0.801,
               0.853,
               0.872)
  
smm_f_nob <- c(0.441,
               0.324,
               0.427,
               0.38,
               0.679,
               0.567,
               0.457,
               0.572,
               0.657,
               0.503,
               0.701,
               0.505,
               0.63,
               0.664,
               0.609,
               0.628,
               0.497,
               0.453,
               0.566,
               0.534,
               0.663,
               0.619,
               0.671,
               0.645,
               0.717,
               0.583,
               0.671,
               0.717,
               0.712,
               0.734,
               0.669,
               0.74,
               0.727,
               0.757,
               0.759)

# Load data sets of ANN and SMM PCC values for Number of Sequences (NoS).

ann_t_nos <- c(0.625,
               0.466,
               0.617,
               0.641,
               0.716,
               0.627,
               0.779,
               0.536,
               0.638,
               0.565,
               0.685,
               0.708,
               0.716,
               0.734,
               0.799,
               0.56,
               0.394,
               0.685,
               0.526,
               0.663,
               0.75,
               0.725,
               0.532,
               0.696,
               0.79,
               0.805,
               0.793,
               0.742,
               0.768,
               0.809,
               0.817,
               0.831,
               0.832,
               0.812,
               0.853)
  
smm_t_nos <- c(0.414,
               0.581,
               0.751,
               0.686,
               0.608,
               0.334,
               0.52,
               0.6,
               0.708,
               0.548,
               0.318,
               0.433,
               0.536,
               0.472,
               0.654,
               0.454,
               0.284,
               0.533,
               0.443,
               0.619,
               0.687,
               0.597,
               0.443,
               0.637,
               0.734,
               0.637,
               0.684,
               0.657,
               0.703,
               0.746,
               0.742,
               0.718,
               0.738,
               0.701,
               0.734)
  
ann_f_nos <- c(0.478,
               0.436,
               0.522,
               0.576,
               0.618,
               0.706,
               0.727,
               0.629,
               0.741,
               0.578,
               0.727,
               0.618,
               0.768,
               0.774,
               0.732,
               0.635,
               0.487,
               0.685,
               0.564,
               0.725,
               0.764,
               0.786,
               0.614,
               0.715,
               0.784,
               0.772,
               0.818,
               0.771,
               0.81,
               0.816,
               0.801,
               0.808,
               0.853,
               0.809,
               0.872)
  
smm_f_nos <- c(0.441,
               0.427,
               0.503,
               0.701,
               0.567,
               0.657,
               0.679,
               0.572,
               0.664,
               0.566,
               0.497,
               0.38,
               0.619,
               0.628,
               0.609,
               0.505,
               0.324,
               0.583,
               0.453,
               0.63,
               0.671,
               0.663,
               0.457,
               0.645,
               0.712,
               0.534,
               0.717,
               0.671,
               0.734,
               0.74,
               0.727,
               0.717,
               0.757,
               0.669,
               0.759)

# Load data sets with numbers of peptides (NoP) and number of binders (NoB).
nos <- c(59,
         92,
         104,
         114,
         118,
         118,
         119,
         119,
         160,
         197,
         244,
         254,
         254,
         255,
         667,
         672,
         708,
         736,
         833,
         969,
         978,
         998,
         1078,
         1140,
         1141,
         1157,
         1262,
         1434,
         1437,
         1443,
         1447,
         1869,
         1985,
         2094,
         3089)

nob <- c(11,
         20,
         29,
         29,
         34,
         39,
         40,
         44,
         47,
         49,
         49,
         53,
         56,
         68,
         77,
         81,
         85,
         86,
         99,
         103,
         104,
         106,
         179,
         184,
         208,
         211,
         397,
         427,
         498,
         513,
         517,
         639,
         649,
         693,
         1181)


################################################################################
## Correlation tests (Linear fit)

# ANN True
fit_ann_t_nob <- lm(ann_t_nob ~ nob)
summary(fit_ann_t_nob)

fit_ann_t_nos <- lm(ann_t_nos ~ nos)
summary(fit_ann_t_nos)

# SMM True
fit_smm_t_nob <- lm(smm_t_nob ~ nob)
summary(fit_smm_t_nob)

fit_smm_t_nos <- lm(smm_t_nos ~ nos)
summary(fit_smm_t_nos)


# ANN conventional (F)
fit_ann_f_nob <- lm(ann_f_nob ~ nob)
summary(fit_ann_f_nob)

fit_ann_f_nos <- lm(ann_f_nos ~ nos)
summary(fit_ann_f_nos)

# SMM conventional (F)
fit_smm_f_nob <- lm(smm_f_nob ~ nob)
summary(fit_smm_f_nob)

fit_smm_f_nos <- lm(smm_f_nos ~ nos)
summary(fit_smm_f_nos)


# lm fit of seq to binder
fit_nos_nob <- lm(nos ~ nob)
summary(fit_nos_nob)



################################################################################
## T tests

## ANN NoB
# Whole set
t.test(ann_f_nob, ann_t_nob, paired = TRUE)
# Top half of set
t.test(ann_f_nob[16:35], ann_t_nob[16:35], paired = TRUE)

## SMM NoB
# Whole set
t.test(smm_f_nob, smm_t_nob, paired = TRUE)
# Top half of set
t.test(smm_f_nob[16:35], smm_t_nob[16:35], paired = TRUE)


## ANN NoS
# Whole set
t.test(ann_f_nos, ann_t_nos, paired = TRUE)
# Top half of set
t.test(ann_f_nos[16:35], ann_t_nos[16:35], paired = TRUE)

## SMM NoS
# Whole set
t.test(smm_f_nos, smm_t_nos, paired = TRUE)
# Top half of set
t.test(smm_f_nos[16:35], smm_t_nos[16:35], paired = TRUE)

  

################################################################################
## Binominal test

# ANN NoB
dif <- ann_f_nob - ann_t_nob
n <- length(dif)
x <- length(dif[dif > 0])
binom.test(x, n, p = 0.5)

dif <- ann_f_nob[16:35] - ann_t_nob[16:35]
n <- length(dif)
x <- length(dif[dif > 0])
binom.test(x, n, p = 0.5)


# SMM NoB
dif <- smm_f_nob - smm_t_nob
n <- length(dif)
x <- length(dif[dif > 0])
binom.test(x, n, p = 0.5)

dif <- smm_f_nob[16:35] - smm_t_nob[16:35]
n <- length(dif)
x <- length(dif[dif > 0])
binom.test(x, n, p = 0.5)


# ANN NoS
dif <- ann_f_nos - ann_t_nos
n <- length(dif)
x <- length(dif[dif > 0])
binom.test(x, n, p = 0.5)

dif <- ann_f_nos[16:35] - ann_t_nos[16:35]
n <- length(dif)
x <- length(dif[dif > 0])
binom.test(x, n, p = 0.5)


# SMM NoS
dif <- smm_f_nos - smm_t_nos
n <- length(dif)
x <- length(dif[dif > 0])
binom.test(x, n, p = 0.5)

dif <- smm_f_nos[16:35] - smm_t_nos[16:35]
n <- length(dif)
x <- length(dif[dif > 0])
binom.test(x, n, p = 0.5)
