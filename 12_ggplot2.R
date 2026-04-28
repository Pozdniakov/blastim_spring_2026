library(tidyverse)

install.packages("palmerpenguins")
palmerpenguins::penguins
library(palmerpenguins)
penguins
ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm,
                 size = bill_length_mm))

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm),
             size = 3)

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm,
                 shape = species), size = 2)

ggplot() +
  geom_point(data = penguins, aes(x = flipper_length_mm,
                                  y = bill_length_mm),
             shape = "🐧", size = 5)

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm),
             size = 3,
             alpha = 0.5)

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm,
                 colour = species),
             size = 3) +
  scale_colour_manual(values = c("Adelie" = "red",
                                 "Chinstrap" = "green",
                                 "Gentoo" = "blue"))

ggplot(data = penguins, aes(x = flipper_length_mm,
                            y = bill_length_mm,
                            colour = bill_length_mm)) + 
  geom_point(size = 3) +
  scale_colour_viridis_c(option = "inferno", end = .7) +
  scale_y_log10()

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm,
                 colour = species),
             size = 3) +
  scale_colour_brewer(palette = "Set1")

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm,
                 colour = bill_length_mm),
             size = 3)

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm),
             size = 3, color = "salmon1")

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm),
             size = 3, color = "#1e8a56", alpha = .5)

?geom_point

ggplot() +
  geom_histogram(data = penguins, aes(x = body_mass_g),
                 fill = "#992176", linewidth = 3, colour = "orange")

penguins_species <- penguins %>%
  count(species) 

ggplot() +
  geom_col(data = penguins_species, aes(x = species, y = n))

ggplot() +
  geom_bar(data = penguins, aes(x = species))

ggplot() +
  geom_bar(data = penguins_species, aes(x = species, y = n),
           stat = "identity")

ggplot() + 
  geom_boxplot(data = penguins,
               aes(x = species, y = body_mass_g))

ggplot() +
  geom_point(data = penguins,
             aes(x = flipper_length_mm,
                 y = bill_length_mm,
                 colour = species),
             size = 3, alpha = .5) +
  geom_smooth(data = penguins,
              aes(x = flipper_length_mm,
                  y = bill_length_mm,
                  colour = species), method = "lm") +
  coord_fixed()

ggplot() +
  geom_point(data = penguins,
             aes(x = species,
                 y = bill_length_mm), alpha = .8, size = 2,
             position = position_jitter(width = .1, height = 0))

ggplot() +
  geom_bar(data = penguins %>% drop_na(sex),
           aes(x = species, fill = sex),
           position = "dodge")

ggplot() +
  geom_bar(data = penguins %>% drop_na(sex),
           aes(x = species, fill = sex),
           position = "fill") +
  coord_flip()

ggplot() +
  geom_point(data = penguins,
             aes(x = species,
                 y = bill_length_mm), alpha = .8, size = 2,
             position = position_jitter(width = .1, height = 0)) +
  geom_boxplot(data = penguins,
               aes(x = species, y = bill_length_mm),
               width = .2, alpha = .9, outliers = FALSE)

ggplot() + 
  geom_density(data = penguins, aes(x = bill_length_mm, fill = species), adjust = .3)


ggplot() + 
  geom_violin(data = penguins, aes(x = species, y = bill_length_mm, fill = species), adjust = .3)

penguins %>%
  ggplot(aes(x = species, y = bill_length_mm)) +
  geom_violin(aes(fill = species)) +
  geom_point(alpha = .8, size = 2,
             position = position_jitter(width = .1, height = 0)) +
  geom_boxplot(width = .2, alpha = .9, outliers = FALSE) +
  hrbrthemes::theme_ipsum()

ggplot(data = penguins ) +
  geom_bar(aes(x = "", fill = species)) +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Set2")

ggplot(data = penguins %>% drop_na(sex), 
       aes(x = flipper_length_mm,
           y = bill_length_mm,
           colour = species)) +
  geom_point(size = 3, alpha = .5) +
  geom_smooth(method = "lm") +
  facet_wrap(sex~species, nrow = 2, scales = "free") +
  labs(title = "Длины клювов и плавников у пингвинов",
       subtitle = "Длины различаются по полу и по виду",
       caption = "Blastim, 2026", 
       x = "Длина плавника, мм",
       y = "Длина клюва, мм",
       colour = "Вид пингвина") +
  hrbrthemes::theme_ipsum()
