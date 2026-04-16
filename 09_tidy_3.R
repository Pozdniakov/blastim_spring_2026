library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-", "-99", " ", "NA"))

powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")

new_diet <- tribble(
  ~student, ~before_r_course, ~after_r_course,
  "Ross", 80, 70,
  "Spok", 78, 75,
  "Sheldon", 73, 72
)

new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course,
               names_to = "time", values_to = "weight") %>%
  pivot_wider(names_from = time, values_from = weight)


# across() ----------------------------------------------------------------

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(height = mean(Height),
            weight = mean(Weight))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(ends_with("eight"), mean))

heroes %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), mean, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), function(x) mean(x,  na.rm = TRUE)))

heroes %>%
  group_by(Gender) %>%
  summarise(across(where(is.character),
                   function(x) mean(nchar(x), na.rm = TRUE)),
            across(where(is.numeric), function(x) mean(x, na.rm = TRUE)))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), list(minimum = min,
                                           average = mean,
                                           maximum = max)))

heroes %>%
  mutate(across(where(is.character), as.factor))

heroes %>%
  mutate(across(where(is.numeric), as.character ))

iris %>%
  mutate(across(where(is.numeric), function(x) x/max(x) * 100))

heroes %>%
  group_by(Gender) %>%
  mutate(across(c(Height, Weight),
                function(x) if_else(x > mean(x, na.rm = TRUE),
                                    str_glue("Выше среднего по {Gender}"),
                                    str_glue("Ниже среднего по {Gender}")))) %>%
  select(name, Height, Weight, Gender)


# List-columns and nesting ------------------------------------------------

nested_heroes <- heroes %>%
  nest(data = !Gender)

heroes %>%
  group_by(Gender) %>%
  nest()

heroes %>%
  nest(data = !Gender) %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest(cols = c(dim))
  
heroes %>%
  nest(data = !Gender) %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest_wider(col = dim, names_sep = "_")

films <- 
  tribble(
    ~film, ~genres,
    "Primal Fear", "Triller, Criminal",
    "Lord of the Rings", "Fantasy",
    "Viva la Vida", "Melodrama, Drama",
    "O, Brother, where art thou?", "History, Comedy",
    "Dracula", "Horror, Melodrama, Fantasy",
    "Monty Python and the Holy Grail", "Comedy, History"
  )
films %>%
  filter(genres == "Fantasy")

films %>%
  filter(str_detect(genres, fixed("Fantasy") ))

films %>%
  count(genres)

films
str_split(films$genres, pattern = ", ")

films %>%
  mutate(genres = str_split(genres, pattern = ", ")) %>%
  unnest() %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres, values_from = value, values_fill = FALSE)

films %>%
  separate_longer_delim(genres, delim = ", ") %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres, values_from = value, values_fill = FALSE)
