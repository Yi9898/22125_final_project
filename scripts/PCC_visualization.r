library(tidyverse)
library(ggplot2)
library(stringi)
library(patchwork)
binder_number <- c('29', '211', '513', '693', '1181')
conventional_ann <- c(0.721,0.719,0.819,0.857,0.872)
true_ann <- c(0.739,0.691,0.793,0.836,0.855)
conventional_error_ann <- c(0.094,0.012,0.01,0.01,0.003)
true_error_ann <- c(0.023,0.005,0.003,0.002,0.002)
conventional_smm <- c(0.38,0.583,0.734,0.757,0.759)
true_smm <- c(0.433,0.533,0.703,0.738,0.734)
conventional_error_smm <- c(0.055,0.021,0.013,0.01,0.008)
true_error_smm <- c(0.039,0.017,0.007,0.004,0.005)

errorbars_ann <- paste(conventional_error_ann,true_error_ann,collapse = ' ')
errorbars_ann <- stri_split_boundaries(errorbars_ann, simplify = TRUE) %>% 
  as.numeric(unlist(.))

errorbars_smm <- paste(conventional_error_smm,true_error_smm,collapse = ' ')
errorbars_smm <- stri_split_boundaries(errorbars_smm, simplify = TRUE) %>% 
  as.numeric(unlist(.))

data_ann <- data.frame(
  binder_number,
  conventional_ann,
  true_ann)

plot_data_ann <- data_ann %>%
  as_tibble() %>% 
  pivot_longer(!binder_number,
               names_to = "model_type",
               values_to = "PCC")

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

data_smm <- data.frame(
  binder_number,
  conventional_smm,
  true_smm)

plot_data_smm <- data_smm %>%
  as_tibble() %>% 
  pivot_longer(!binder_number,
               names_to = "model_type",
               values_to = "PCC")

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
# first calculate errorbars
errorbars_combined <- paste(true_error_ann,true_error_smm,collapse = ' ')
errorbars_combined <- stri_split_boundaries(errorbars_combined, simplify = TRUE) %>% 
  as.numeric(unlist(.))
#and some formatting
binder_number_num <- c(29, 211, 513, 693, 1181)

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
  scale_color_discrete(labels = c("ANN","SMM")) #+ 
  #scale_x_discrete(limits = c('29', '211', '513', '693', '1181'))

pointplot
