library(tidyverse)
library(ggplot2)
library(stringi)
binder_number <- c('29', '211', '513', '693', '1181')
conventional <- c(0.726, 0.718, 0.818, 0.856, 0.872)
true <- c(0.774, 0.705, 0.805, 0.842, 0.861)
conventional_error <- c(0.012,
                        0.003,
                        0.01,
                        0.01,
                        0.094)
true_error <- c(0.005,
                0.002,
                0.002,
                0.003,
                0.023)

errorbars <- paste(conventional_error,true_error,collapse = ' ')
errorbars <- stri_split_boundaries(errorbars, simplify = TRUE) %>% 
  as.numeric(unlist(.))

#errorbars entered consecutively 
# zipper

data <- data.frame(
  binder_number,
  conventional,
  true
)

plot_data <- data %>%
  as_tibble() %>% 
  pivot_longer(!binder_number,
               names_to = "model_type",
               values_to = "PCC")

# plot_data <- factor(plot_data$binder_number, levels = c('58', '210', '317', '543', '789'))

PCC_plot <- plot_data %>% 
  ggplot(.,
         mapping = aes(x = binder_number,
                       y = PCC,
                       fill = model_type)) + 
  geom_col(position = "dodge") +
  geom_errorbar(aes(ymin = PCC - errorbars,
                    ymax = PCC + errorbars),
                    width = 0.2,
                    position = position_dodge(0.9)) + 
  labs(title = "PCC score as function of data set size",
       fill = "Model type",
       x = "Number of binders")
  

PCC_plot +
  scale_x_discrete(limits = c('29', '211', '513', '693', '1181'))
