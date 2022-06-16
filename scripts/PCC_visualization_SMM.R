library(tidyverse)
library(ggplot2)
library(stringi)

binder_number <- c('29', '211', '513', '693', '1181')
conventional <- c(0.38,
                  0.583,
                  0.734,
                  0.757,
                  0.759)
true <- c(0.433,
          0.533,
          0.703,
          0.738,
          0.734)

conventional_error <- c(0.055,
                        0.021,
                        0.013,
                        0.01,
                        0.008)
true_error <- c(0.039,
                0.017,
                0.007,
                0.004,
                0.005)

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
  labs(title = "SMM PCC score as function of data set size",
       fill = "Model type",
       x = "Number of binders")


PCC_plot +
  scale_x_discrete(limits = c('29', '211', '513', '693', '1181'))