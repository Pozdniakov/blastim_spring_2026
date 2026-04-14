library(tidyverse)

sum(log(abs(sin(1:20))))
#{magrittr}
1:20 %>% 
  sin() %>% 
  abs() %>% 
  log() %>% 
  sum()

1:20 %>% 
  sin() %>% 
  abs() %>% 
  log(base = 2) %>% 
  sum()
log(8, 2)

1:20 %>% 
  sin() %>% 
  abs() %>% 
  log(10, base = .) %>% 
  sum()

1:20 |>
  sin() |>
  abs() |>
  log(10, base = _) |>
  sum()

B <- matrix(10:39, nrow = 5)
apply(B, 1, mean)
10:39 %>%
  matrix(nrow = 5) %>%
  apply(1, mean)


# Работа с колонками ------------------------------------------------------


heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
         na = c("-", "-99", " ", "NA"))


heroes %>%
  select(1, 5)

heroes_selected_columns <- heroes %>%
  select(name, Race, Publisher, `Eye color`)

heroes %>%
  select(name:Publisher)

heroes %>%
  select(name:`Eye color`, Publisher:Weight)

heroes %>%
  select(!...1)

heroes %>%
  select(!Gender:Height)

heroes %>%
  select(!c(Gender, Height))

heroes %>%
  select(name:last_col())
# last_col(heroes) #doesn't work!

heroes %>%
  select(everything())

heroes %>%
  select(name, Weight, everything())

heroes %>%
  select(ends_with("color"))

heroes %>%
  select(starts_with("H"))

heroes %>%
  select(starts_with("H") & ends_with("color"))

heroes %>%
  select(starts_with("H") | ends_with("color"))

heroes %>%
  select(contains("eigh"))

heroes %>%
  select(where(is.numeric))

heroes %>%
  select(where(is.character))

heroes %>%
  select(where(function(x) !any(is.na(x)) ))

heroes %>%
  select(where(function(x) mean(is.na(x)) < .1 ))

heroes %>%
  select(id = ...1, name, Publisher)

heroes %>%
  rename(id = ...1)

#names(heroes) <- make.names(names(heroes))

heroes %>%
  rename_with(make.names)

heroes %>%
  rename_with(str_to_lower)

heroes %>%
  rename_with(str_to_upper)

heroes %>%
  rename_with(str_to_camel)

heroes %>%
  rename_with(str_to_kebab)

heroes %>%
  relocate(Publisher)

heroes %>%
  relocate(Publisher, .after = name)

heroes %>%
  relocate(Publisher, .before = name)

heroes %>%
  relocate(Universe = Publisher, .before = name)

heroes %>%
  relocate(Publisher, where(is.numeric), ends_with("color"), .after = name)

heroes %>%
  select(name)

#heroes$name

iris[,2, drop = FALSE]

heroes %>%
  select(name) %>%
  pull()

heroes %>%
  pull(name)

heroes %>%
  pull(Weight, name)


# Работа со строками ------------------------------------------------------

heroes %>%
  slice(1:3)

heroes %>%
  slice(1, 10, 100)

heroes %>%
  filter(Publisher == "DC Comics")

heroes %>%
  filter_out(Publisher == "Marvel Comics")

tidyverse_update()
heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE)

heroes %>%
  slice_min(Weight, n = 10)

heroes %>%
  slice_sample(n = 3)

heroes %>%
  slice_sample(prop = .01)

heroes %>%
  slice_sample(prop = 1)

heroes %>%
  drop_na()

heroes %>%
  drop_na(Weight, Height)

heroes %>%
  drop_na(where(is.numeric))


# Сортировка строк --------------------------------------------------------

heroes %>%
  arrange(Weight)

heroes %>%
  arrange(desc(Weight))

heroes %>%
  arrange(desc(`Eye color`), Weight)


# Создание колонок -------------------------------------------------------

heroes %>%
  mutate(height_m = Height/100)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .before = name)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name)

heroes %>%
  transmute(imt = Weight/(Height/100)^2, name, Gender, Publisher)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name)

number <- -1
if (number > 0) "Positive number"

if (number > 0) {
  "Positive number"
} else {
  "Negative number or zero"
}

number <- 0
# number <- -2:2
if (number > 0) {
  "Positive number"
} else if (number < 0) {
  "Negative number"
} else {
  "Zero"
}

number
if_else(number > 0, "Positive number", "Negative number or zero")

#if_else(number > 0, TRUE, FALSE)
number > 0

# if_else(number > 0,
#         "Positive number",
#         if_else(number < 0,
#                 "Negative number",
#                 "Zero"))

case_when(
  number > 0 ~ "Positive number", #if
  number < 0 ~ "Negative number", #else if
  .default = "Zero" #else
)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name) %>%
  mutate(imt_group = if_else(imt >= 30, "Overweight", "Not overweight"), .after = imt)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name) %>%
  mutate(imt_group = case_when(
    is.na(imt) ~ NA_character_, #if
    imt >= 40 ~ "overweight", # else if
    imt >= 25 ~ "a bit overweight", #else if
    imt <= 18.5 ~ "underweight", #else if
    .default = "normal weight"), #else
    .after = imt)
