library(tidyverse)
library(ggplot2)
library(stringi)
library(patchwork)
# data sorted by number of sequences
seq_number_seq_sort <- c("59",                            "92",
                            "104",                            "114",
                            "118",                            "118 ",
                            "119",                            "119 ",
                            "160",                            "197",
                            "244",                            "254",
                            "254 ",                            "255",
                            "667",                            "672",
                            "708",                            "736",
                            "833",                            "969",
                            "978",                            "998",
                            "1078",                            "1140",
                            "1141",                            "1157",
                            "1262",                            "1434",
                            "1437",                            "1443",
                            "1447",                            "1869",
                            "1985",                            "2094",
                            "3089")
seq_number_num_seq_sort <- c(59,                             92,
                             104,                             114,
                             118,                             118,
                             119,                             119,
                             160,                             197,
                             244,                             254,
                             254,                             255,
                             667,                             672,
                             708,                             736,
                             833,                             969,
                             978,                            998,
                             1078,                             1140,
                             1141,                             1157,
                             1262,                             1434,
                             1437,                             1443,
                             1447,                             1869,
                             1985,                             2094,
                             3089)
#anns
conventional_ann_seq_sort <- c(0.478,                      0.436,
                      0.522,                      0.576,
                      0.706,                      0.618,
                      0.629,                      0.727,
                      0.741,                      0.578,
                      0.727,                      0.618,
                      0.768,                      0.774,
                      0.732,                      0.635,
                      0.487,                      0.685,
                      0.564,                      0.725,
                      0.764,                      0.786,
                      0.614,                      0.715,
                      0.784,                      0.772,
                      0.818,                      0.771,
                      0.81,                      0.816,
                      0.801,                      0.808,
                      0.853,                      0.809,
                      0.872)
true_ann_seq_sort <- c(0.625,              0.466,
              0.617,              0.641,
              0.627,              0.716,
              0.536,              0.779,
              0.638,              0.565,
              0.685,              0.708,
              0.716,              0.734,
              0.799,              0.56,
              0.394,              0.685,
              0.526,              0.663,
              0.75,              0.725,
              0.532,            0.696,
              0.79,              0.805,
              0.793,              0.742,
              0.768,              0.809,
              0.817,              0.831,
              0.832,              0.812,
              0.853)
# ann errors
conventional_error_ann_seq_sort <- c(0.166,                                     0.055,
                                     0.051,                                     0.067,
                                     0.044,                                     0.063,
                                     0.033,                                     0.045,
                                     0.028,                                     0.043,
                                     0.021,                                     0.061,
                                     0.03,                                     0.008,
                                     0.035,                                     0.021,
                                     0.022,                                     0.011,
                                     0.024,                                     0.01,
                                     0.011,                                     0.013,
                                     0.02,                                     0.017,
                                     0.019,                                     0.021,
                                     0.005,                                     0.008,
                                     0.012,                                     0.008,
                                     0.007,                                     0.012,
                                     0.008,                                     0.008,
                                     0.004)
true_error_ann_seq_sort <- c(0.008,                             0.058,
                             0.034,                             0.029,
                             0.033,                             0.021,
                             0.036,                             0.033,
                             0.007,                             0.024,
                             0.013,                             0.027,
                             0.006,                             0.017,
                             0.003,                             0.014,
                             0.015,                             0.007,
                             0.01,                             0.008,
                             0.004,                             0.003,
                             0.006,                             0.003,
                             0.005,                             0.007,
                             0.003,                             0.005,
                             0.002,                             0.003,
                             0.004,                             0.004,
                             0.004,                             0.003,
                             0.003)
#ssms
conventional_smm_seq_sort <- c(0.441,                      0.427,
                      0.503,                      0.701,
                      0.657,                      0.567,
                      0.572,                      0.679,
                      0.664,                      0.566,
                      0.497,                      0.38,
                      0.619,                      0.628,
                      0.609,                      0.505,
                      0.324,                      0.583,
                      0.453,                      0.63,
                      0.671,                      0.663,
                      0.457,                      0.645,
                      0.712,                      0.534,
                      0.717,                      0.671,
                      0.734,                      0.74,
                      0.727,                      0.717,
                      0.757,                     0.669,
                      0.759)
true_smm_seq_sort <- c(0.414,                       0.581,
                       0.751,                       0.686,
                       0.334,                       0.608,
                       0.6,                       0.52,
                       0.708,                       0.548,
                       0.318,                       0.433,
                       0.536,                       0.472,
                       0.654,                       0.454,
                       0.284,                       0.533,
                       0.443,                       0.619,
                       0.687,                       0.597,
                       0.443,                       0.637,
                       0.734,                       0.637,
                       0.684,                       0.657,
                       0.703,                       0.746,
                       0.742,                       0.718,
                       0.738,                       0.701,
                       0.734)
# smm erros
conventional_error_smm_seq_sort <- c(0.101,                                     0.106,
                                     0.085,                                     0.038,
                                     0.078,                                     0.079,
                                     0.051,                                     0.054,
                                     0.033,                                     0.05,
                                     0.056,                                     0.055,
                                     0.018,                                     0.03,
                                     0.029,                                     0.023,
                                     0.017,                                     0.021,
                                     0.036,                                     0.014,
                                     0.015,                                     0.018,
                                     0.008,                                     0.016,
                                     0.02,                                     0.025,
                                     0.01,                                     0.018,
                                     0.013,                                     0.013,
                                     0.014,                                     0.007,
                                     0.01,                                     0.013,
                                     0.008)
true_error_smm_seq_sort <- c(0.054,                             0.058,
                             0.056,                             0.05,
                             0.043,                             0.068,
                             0.033,                             0.034,
                             0.015,                             0.055,
                             0.04,                             0.039,
                             0.019,                             0.015,
                             0.017,                             0.029,
                             0.033,                             0.017,
                             0.009,                             0.005,
                             0.01,                             0.012,
                             0.005,                             0.005,
                             0.009,                             0.008,
                             0.012,                             0.016,
                             0.007,                             0.01,
                             0.013,                             0.005,
                             0.004,                             0.005,
                             0.005)
# data sorted on number of binders
binder_number_bind_sort <- c("11",
                             "20",
                             "29",
                             "29 ",
                             "34",
                             "39",
                             "40",
                             "44",
                             "47",
                             "49",
                             "49 ",
                             "53",
                             "56",
                             "68",
                             "77",
                             "81",
                             "85",
                             "86",
                             "99",
                             "103",
                             "104",
                             "106",
                             "179",
                             "184",
                             "208",
                             "211",
                             "397",
                             "427",
                             "498",
                             "513",
                             "517",
                             "639",
                             "649",
                             "693",
                             "1181")
binder_number_num_bind_sort <- c(11,                                 20,
                                 29,                                 29,
                                 34,                                 39,
                                 40,                                 44,
                                 47,                                 49,
                                 49,                                 53,
                                 56,                                 68,
                                 77,                                 81,
                                 85,                                 86,
                                 99,                                 103,
                                 104,                                 106,
                                 179,                                 184,
                                 208,                                 211,
                                 397,                                 427,
                                 498,                                 513,
                                 517,                                 639,
                                 649,                                 693,
                                 1181)
#anns 
conventional_ann_bind_sort <- c(0.478,
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
true_ann_bind_sort <- c(0.625,
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
#smms 
conventional_smm_bind_sort <- c(0.441,
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
true_smm_bind_sort <- c(0.414,
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
# ann errors
conventional_error_ann_bind_sort <- c(0.166,
                                      0.022,
                                      0.055,
                                      0.061,
                                      0.045,
                                      0.063,
                                      0.02,
                                      0.033,
                                      0.044,
                                      0.051,
                                      0.067,
                                      0.021,
                                      0.01,
                                      0.028,
                                      0.035,
                                      0.008,
                                      0.021,
                                      0.024,
                                      0.043,
                                      0.021,
                                      0.013,
                                      0.03,
                                      0.011,
                                      0.017,
                                      0.005,
                                      0.011,
                                      0.008,
                                      0.012,
                                      0.019,
                                      0.012,
                                      0.008,
                                      0.008,
                                      0.007,
                                      0.008,
                                      0.004)
true_error_ann_bind_sort <- c(0.008,
                              0.015,
                              0.058,
                              0.027,
                              0.033,
                              0.021,
                              0.006,
                              0.036,
                              0.033,
                              0.034,
                              0.029,
                              0.014,
                              0.008,
                              0.007,
                              0.003,
                              0.017,
                              0.013,
                              0.01,
                              0.024,
                              0.007,
                              0.003,
                              0.006,
                              0.004,
                              0.003,
                              0.003,
                              0.007,
                              0.005,
                              0.004,
                              0.005,
                              0.002,
                              0.003,
                              0.003,
                              0.004,
                              0.004,
                              0.003)
# smm errors
conventional_error_smm_bind_sort <- c(0.101,
                                      0.017,
                                      0.106,
                                      0.055,
                                      0.054,
                                      0.079,
                                      0.008,
                                      0.051,
                                      0.078,
                                      0.085,
                                      0.038,
                                      0.023,
                                      0.014,
                                      0.033,
                                      0.029,
                                      0.03,
                                      0.056,
                                      0.036,
                                      0.05,
                                      0.025,
                                      0.018,
                                      0.018,
                                      0.015,
                                      0.016,
                                      0.01,
                                      0.021,
                                      0.018,
                                      0.007,
                                      0.02,
                                      0.013,
                                      0.013,
                                      0.013,
                                      0.014,
                                      0.01,
                                      0.008)
true_error_smm_bind_sort <- c(0.054,
                              0.033,
                              0.058,
                              0.039,
                              0.034,
                              0.068,
                              0.005,
                              0.033,
                              0.043,
                              0.056,
                              0.05,
                              0.029,
                              0.005,
                              0.015,
                              0.017,
                              0.015,
                              0.04,
                              0.009,
                              0.055,
                              0.008,
                              0.012,
                              0.019,
                              0.01,
                              0.005,
                              0.012,
                              0.017,
                              0.016,
                              0.005,
                              0.009,
                              0.007,
                              0.005,
                              0.01,
                              0.013,
                              0.004,
                              0.005)

### SEQUENCE SORTING ###
### ANN
# data 
data_ann_seq <- data.frame(
  seq_number_seq_sort,
  conventional_ann_seq_sort,
  true_ann_seq_sort)

plot_data_ann_seq <- data_ann_seq %>%
  as_tibble() %>% 
  pivot_longer(!seq_number_seq_sort,
               names_to = "model_type",
               values_to = "PCC")

# errors
errorbars_ann_seq <- paste(conventional_error_ann_seq_sort,true_error_ann_seq_sort,collapse = ' ')
errorbars_ann_seq <- stri_split_boundaries(errorbars_ann_seq, simplify = TRUE) %>% 
  as.numeric(unlist(.))

#plot
ANN_plot_seq <- plot_data_ann_seq %>% 
  ggplot(.,
         mapping = aes(x = seq_number_seq_sort,
                       y = PCC,
                       fill = model_type)) + 
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = PCC - errorbars_ann_seq,
                    ymax = PCC + errorbars_ann_seq),
                    width = 0.2,
                    position = position_dodge(0.9)) + 
  labs(title = "PCC score for ANN",
       fill = "Model type",
       x = "Number of sequences") +
  ylim(0,1) +
  theme_grey(base_size = 16) +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = -90, hjust = -0.2, vjust = 0.5)) + 
  scale_fill_manual(values = c("coral2", "cyan2")) + 
  scale_x_discrete(limits = seq_number_seq_sort)

### SMM
# data
data_smm_seq <- data.frame(
  seq_number_seq_sort,
  conventional_smm_seq_sort,
  true_smm_seq_sort)

plot_data_smm_seq <- data_smm_seq %>%
  as_tibble() %>% 
  pivot_longer(!seq_number_seq_sort,
               names_to = "model_type",
               values_to = "PCC")

#error
errorbars_smm_seq <- paste(conventional_error_smm_seq_sort,true_error_smm_seq_sort,collapse = ' ')
errorbars_smm_seq <- stri_split_boundaries(errorbars_smm_seq, simplify = TRUE) %>% 
  as.numeric(unlist(.))

#plot
SMM_plot_seq <- plot_data_smm_seq %>% 
  ggplot(.,
         mapping = aes(x = seq_number_seq_sort,
                       y = PCC,
                       fill = model_type)) + 
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = PCC - errorbars_smm_seq,
                    ymax = PCC + errorbars_smm_seq),
                width = 0.2,
                position = position_dodge(0.9)) + 
  labs(title = "PCC score for SMM",
       fill = "Model type",
       x = "Number of sequences",
       y = "") +
  ylim(0,1) +
  theme_grey(base_size = 16) +
  theme(axis.text.x = element_text(angle = -90, hjust = -0.2, vjust = 0.5)) + 
  scale_fill_manual(labels = c("Conventional", "True"), values = c("coral2", "cyan2")) + 
  scale_x_discrete(limits = seq_number_seq_sort)


  
### Bar plots 
ANN_plot_seq + SMM_plot_seq

### BINDER SORTING ###
### ANN
# data 
data_ann_bind <- data.frame(
  binder_number_bind_sort,
  conventional_ann_bind_sort,
  true_ann_bind_sort)

plot_data_ann_bind <- data_ann_bind %>%
  as_tibble() %>% 
  pivot_longer(!binder_number_bind_sort,
               names_to = "model_type",
               values_to = "PCC")

# errors
errorbars_ann_bind <- paste(conventional_error_ann_bind_sort,true_error_ann_bind_sort,collapse = ' ')
errorbars_ann_bind <- stri_split_boundaries(errorbars_ann_bind, simplify = TRUE) %>% 
  as.numeric(unlist(.))

#plot
ANN_plot_bind <- plot_data_ann_bind %>% 
  ggplot(.,
         mapping = aes(x = binder_number_bind_sort,
                       y = PCC,
                       fill = model_type)) + 
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = PCC - errorbars_ann_bind,
                    ymax = PCC + errorbars_ann_bind),
                width = 0.2,
                position = position_dodge(0.9)) + 
  labs(title = "PCC score for ANN",
       fill = "Model type",
       x = "Number of binders") +
  ylim(0,1) +
  theme_grey(base_size = 16) +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = -90, hjust = -0.2, vjust = 0.5)) + 
  scale_fill_manual(values = c("coral2", "cyan2")) + 
  scale_x_discrete(limits = binder_number_bind_sort)


### SMM
# data
data_smm_bind <- data.frame(
  binder_number_bind_sort,
  conventional_smm_bind_sort,
  true_smm_bind_sort)

plot_data_smm_bind <- data_smm_bind %>%
  as_tibble() %>% 
  pivot_longer(!binder_number_bind_sort,
               names_to = "model_type",
               values_to = "PCC")

#error
errorbars_smm_bind <- paste(conventional_error_smm_bind_sort,true_error_smm_bind_sort,collapse = ' ')
errorbars_smm_bind <- stri_split_boundaries(errorbars_smm_bind, simplify = TRUE) %>% 
  as.numeric(unlist(.))

#plot
SMM_plot_bind <- plot_data_smm_bind %>% 
  ggplot(.,
         mapping = aes(x = binder_number_bind_sort,
                       y = PCC,
                       fill = model_type)) + 
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = PCC - errorbars_smm_bind,
                    ymax = PCC + errorbars_smm_bind),
                width = 0.2,
                position = position_dodge(0.9)) + 
  labs(title = "PCC score for SMM",
       fill = "Model type",
       x = "Number of binders",
       y = "") +
  ylim(0,1) +
  theme_grey(base_size = 16) +
  theme(axis.text.x = element_text(angle = -90, hjust = -0.2, vjust = 0.5)) + 
  scale_fill_manual(labels = c("Conventional", "True"), values = c("coral2", "cyan2")) + 
  scale_x_discrete(limits = binder_number_bind_sort)

### Bar plots 
ANN_plot_bind + SMM_plot_bind


### Scatterplot ###
# data frame construction
#data imported by sorted in binder sort
seq_num_num_bind_sort <- c(59,                           708,                           92,                           254,
                           119,                           118,                           1078,                           119,
                           118,                           104,                           114,                           672,
                           969,                           160,                           667,                           255,
                           244,                           833,                           197,                           1157,
                           998,                           254,                           978,                           1140,
                           1262,                           736,                           1434,                           1869,
                           1141,                           1437,                           2094,                           1443,
                           1447,                           1985,                           3089)
names_bind_sort <- c("b5701",                     "b0801",                     "a3002",                     "a2403",
                     "b4403",                     "b4002",                     "b4001",                     "b4402",
                     "b1801",                     "a2301",                     "b4501",                     "a2601",
                     "b2705",                     "a2902",                     "a3001",                     "b5401",
                     "b5101",                     "a6901",                     "a2402",                     "a0101",
                     "b5801",                     "b5301",                     "b1501",                     "a3301",
                     "b0702",                     "b3501",                     "a6802",                     "a3101",
                     "a6801",                     "a0206",                     "a0301",                     "a0203",
                     "a0202",                     "a1101",                     "a0201")
scatter_data <- data.frame(binder_number_num_bind_sort,seq_num_num_bind_sort,names_bind_sort)
#color setup
scatter_data <- scatter_data %>% 
  dplyr::mutate(coloring_ids = case_when(str_detect(names, "a")~"HLA:A",
                                   str_detect(names, "b")~"HLA:B"))
#plot
ggplot(scatter_data,
       mapping = aes(x = binder_number_num_bind_sort,
                     y = seq_number_num_seq_sort,
                     label = names,
                     color = coloring_ids)) + 
  geom_point(size = 4,alpha = 0.7) + 
  labs(title = "Distribution of data set quality",
       color = "HLA type",
       x = "Number of binders",
       y = "Number of sequences") +
  theme_grey(base_size = 24)
  




### Point plots for comparing performance of True
#errors
errorbars_combined <- paste(true_error_ann_bind_sort,true_error_smm_bind_sort,collapse = ' ')
errorbars_combined <- stri_split_boundaries(errorbars_combined, simplify = TRUE) %>% 
  as.numeric(unlist(.))
# data og plot all in one
pointplot_bind <- data.frame(
  binder_number_num_bind_sort,
  true_ann_bind_sort,
  true_smm_bind_sort) %>% 
  as_tibble() %>% 
  pivot_longer(!binder_number_num_bind_sort,
               names_to = "model_type",
               values_to = "PCC") %>% 
  ggplot(.,
         mapping = aes(x = binder_number_num_bind_sort,
                       y = PCC,
                       color = model_type)) + 
  geom_point() + 
  labs(title = "PCC score for ANN and SMM",
       color = "Model type",
       x = "Number of binders") +
  ylim(0,1) +
  geom_errorbar(aes(ymin = PCC - errorbars_combined,
                    ymax = PCC + errorbars_combined),
                width = 20) +
  scale_color_discrete(labels = c("ANN","SMM"))

pointplot_bind

