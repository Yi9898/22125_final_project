library(tidyverse)
library(ggplot2)
library(stringi)
library(patchwork)

binder_number <- c('29', '211', '513', '693', '1181')
binder_number_num <- c(29, 211, 513, 693, 1181)

conventional_ann <- c(0.721,0.719,0.819,0.857,0.872)
true_ann <- c(0.739,0.691,0.793,0.836,0.855)
conventional_error_ann <- c(0.094,0.012,0.01,0.01,0.003)
true_error_ann <- c(0.023,0.005,0.003,0.002,0.002)

conventional_smm <- c(0.38,0.583,0.734,0.757,0.759)
true_smm <- c(0.433,0.533,0.703,0.738,0.734)
conventional_error_smm <- c(0.055,0.021,0.013,0.01,0.008)
true_error_smm <- c(0.039,0.017,0.007,0.004,0.005)

errorbars_combined <- paste(true_error_ann,true_error_smm,collapse = ' ')
errorbars_combined <- stri_split_boundaries(errorbars_combined, simplify = TRUE) %>% 
  as.numeric(unlist(.))

### ANN 
# data 
data_ann <- data.frame(
  binder_number,
  conventional_ann,
  true_ann)

plot_data_ann <- data_ann %>%
  as_tibble() %>% 
  pivot_longer(!binder_number,
               names_to = "model_type",
               values_to = "PCC")

# errors
errorbars_ann <- paste(conventional_error_ann,true_error_ann,collapse = ' ')
errorbars_ann <- stri_split_boundaries(errorbars_ann, simplify = TRUE) %>% 
  as.numeric(unlist(.))

#plot
ANN_plot <- plot_data_ann %>% 
  ggplot(.,
         mapping = aes(x = binder_number,
                       y = PCC,
                       fill = model_type)) + 
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = PCC - errorbars_ann,
                    ymax = PCC + errorbars_ann),
                    width = 0.2,
                    position = position_dodge(0.9)) + 
  labs(title = "(A) PCC score for ANN",
       fill = "Model type",
       x = "Number of binders") +
  ylim(0,1) +
  theme(legend.position = "none") + 
  scale_x_discrete(limits = c('29', '211', '513', '693', '1181'))


### SMM
# data
data_smm <- data.frame(
  binder_number,
  conventional_smm,
  true_smm)

plot_data_smm <- data_smm %>%
  as_tibble() %>% 
  pivot_longer(!binder_number,
               names_to = "model_type",
               values_to = "PCC")

#error
errorbars_smm <- paste(conventional_error_smm,true_error_smm,collapse = ' ')
errorbars_smm <- stri_split_boundaries(errorbars_smm, simplify = TRUE) %>% 
  as.numeric(unlist(.))

#plot
SMM_plot <- plot_data_smm %>% 
  ggplot(.,
         mapping = aes(x = binder_number,
                       y = PCC,
                       fill = model_type)) + 
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = PCC - errorbars_smm,
                    ymax = PCC + errorbars_smm),
                width = 0.2,
                position = position_dodge(0.9)) + 
  labs(title = "(B) PCC score for SMM",
       fill = "Model type",
       x = "Number of binders",
       y = "") +
  ylim(0,1) +
  scale_fill_discrete(labels = c("Conventional","True")) + 
  scale_x_discrete(limits = c('29', '211', '513', '693', '1181'))
  
### Bar plots 
ANN_plot + SMM_plot

### Point plots for comparing performance of True
# data og plot all in one
pointplot <- data.frame(
  binder_number_num,
  true_ann,
  true_smm) %>% 
  as_tibble() %>% 
  pivot_longer(!binder_number_num,
               names_to = "model_type",
               values_to = "PCC") %>% 
  ggplot(.,
         mapping = aes(x = binder_number_num,
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

pointplot

### Scatterplot 
#data
names <- c("a0101",
           "a0201",
           "a0202",
           "a0203",
           "a0206",
           "a0301",
           "a1101",
           "a2301",
           "a2402",
           "a2403",
           "a2601",
           "a2902",
           "a3001",
           "a3002",
           "a3101",
           "a3301",
           "a6801",
           "a6802",
           "a6901",
           "b0702",
           "b0801",
           "b1501",
           "b1801",
           "b2705",
           "b3501",
           "b4001",
           "b4002",
           "b4402",
           "b4403",
           "b4501",
           "b5101",
           "b5301",
           "b5401",
           "b5701",
           "b5801")
sequence_lengths <- c(1157,
                      3089,
                      1447,
                      1443,
                      1437,
                      2094,
                      1985,
                      104,
                      197,
                      254,
                      672,
                      160,
                      667,
                      92,
                      1869,
                      1140,
                      1141,
                      1434,
                      833,
                      1262,
                      708,
                      978,
                      118,
                      969,
                      736,
                      1078,
                      118,
                      119,
                      119,
                      114,
                      244,
                      254,
                      255,
                      59,
                      998)
binders <- c (103,
              1181,
              649,
              639,
              513,
              517,
              693,
              49,
              99,
              29,
              53,
              68,
              77,
              29,
              427,
              184,
              498,
              397,
              86,
              208,
              20,
              179,
              47,
              56,
              211,
              40,
              39,
              44,
              34,
              49,
              85,
              106,
              81,
              11,
              104)
# data frame construction
scatter_data <- data.frame(binders,sequence_lengths,names)
#color setup
scatter_data <- scatter_data %>% 
  dplyr::mutate(coloring_ids = case_when(str_detect(names, "a")~"HLA:A",
                                   str_detect(names, "b")~"HLA:B"))

#plot
ggplot(scatter_data,
       mapping = aes(x = binders,
                     y = sequence_lengths,
                     label = names,
                     color = coloring_ids)) + 
  geom_point(size = 4,alpha = 0.7) + 
  labs(title = "Distribution of data set quality",
       color = "HLA type",
       x = "Number of binders",
       y = "Number of sequences") +
  theme_grey(base_size = 24)
  

