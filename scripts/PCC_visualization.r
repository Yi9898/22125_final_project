library(tidyverse)
library(ggplot2)
library(stringi)
binder_number <- c('29', '211', '513', '693', '1181')
conventional <- c(0.721,
                  0.719,
                  0.819,
                  0.857,
                  0.872)
true <- c(0.739,
          0.691,
          0.793,
          0.836,
          0.855)
conventional_error <- c(0.094,
                        0.012,
                        0.01,
                        0.01,
                        0.003)
true_error <- c(0.023,
                0.005,
                0.003,
                0.002,
                0.002)

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
  labs(title = "ANN PCC score as function of binders in data set",
       fill = "Model type",
       x = "Number of binders")
  

PCC_plot +
  scale_x_discrete(limits = c('29', '211', '513', '693', '1181'))
