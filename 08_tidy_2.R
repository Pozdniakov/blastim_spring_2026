library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-", "-99", " ", "NA"))

heroes %>%
  mutate(
    height_m = Height / 100,
    height_group = case_when(
      height_m < 1 ~ "очень низкий",
      height_m < 1.5 ~ "низкий",
      height_m > 2 ~ "высокий",
      is.na(height_m) ~ NA_character_,
      .default = "нормальный рост"
    ),
    .after = Height
  )


heroes %>%
  mutate(`Hair color` = if_else(`Hair color` == "No Hair", "Bold", `Hair color`))

heroes %>%
  mutate(`Hair color` = `Hair color` %>% recode_values(from = "No Hair", to = "Bold"))

heroes %>%
  mutate(`Hair color` = `Hair color` %>% replace_values(from = "No Hair", to = "Bold"))

heroes %>%
  mutate(`Hair color` = `Hair color` %>% replace_values("No Hair" ~ "Bold"))

heroes %>%
  mutate(`Hair color` = `Hair color` %>% replace_values(c("Blond", "White") ~ "light color")) %>%
  print(n = 20)

heroes %>%
  mutate(Weight = if_else(Weight < 17, NA, Weight)) %>%
  arrange(Weight)

heroes %>%
  mutate(Weight = Weight %>% replace_values(c(2, 4, 14, 16) ~ NA)) %>%
  arrange(Weight)

# агрегация ---------------------------------------------------------------


heroes %>%
  summarise(height_m = mean(Height, na.rm = TRUE))

heroes %>%
  summarise(height_min = min(Height, na.rm = TRUE),
            height_max = max(Height, na.rm = TRUE),
            height_first = first(Height), #Height[1]
            height_last = last(Height), #Height[length(Height)]
            height_10th = nth(Height, n = 10)) #Height[10]

mean(heroes$Height, na.rm = TRUE)

range(1:10)
heroes %>%
  reframe(range(Height, na.rm = TRUE))

heroes %>%
  group_by(Gender)

heroes %>%
  group_by(Gender) %>%
  summarise(height_m = mean(Height, na.rm = TRUE))


heroes %>%
  group_by(Gender) %>%
  summarise(height_min = min(Height, na.rm = TRUE),
            height_max = max(Height, na.rm = TRUE),
            height_first = first(Height), #Height[1]
            height_last = last(Height), #Height[length(Height)]
            height_10th = nth(Height, n = 10)) #Height[10]

heroes %>%
  group_by(Gender) %>%
  reframe(range(Height, na.rm = TRUE))

heroes %>%
  group_by(is_heavy = Weight > mean(Weight, na.rm = TRUE), Gender) %>%
  summarise(height_m = mean(Height, na.rm = TRUE)) %>%
  ungroup()

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  count(Gender)

heroes %>%
  count(Race, sort = TRUE)

heroes %>%
  group_by(Race) %>%
  filter(n() > 10)

heroes %>%
  group_by(Race) %>%
  filter(n() == 1) 

heroes %>%
  mutate(height_m = mean(Height, na.rm = TRUE))
  
heroes %>%
  group_by(Gender) %>%
  mutate(height_m_by_gender = mean(Height, na.rm = TRUE),
         .after = Height) %>%
  ungroup() %>%
  mutate(diff_height_by_gender = Height - height_m_by_gender, .after = height_m_by_gender) #%>%
  #summarise(median(diff_height_by_gender, na.rm = TRUE))

heroes %>%
  summarise(mean(Height, na.rm = TRUE), .by = Gender)

# Объединение датафреймов -------------------------------------------------

band_members
band_instruments

#cbind() rbind()

bind_cols(band_members, band_instruments)

bind_rows(band_members, band_instruments)

list_of_df <- list(members = band_members, instruments = band_instruments)
bind_rows(list_of_df, .id = "from")

band_members
band_instruments

#merge

left_join(band_members, band_instruments)

band_members %>%
  left_join(band_instruments)

names(band_members)
names(band_instruments)
intersect(names(band_members), names(band_instruments))

band_members %>%
  left_join(band_instruments, by = "name")

band_instruments2

band_members %>%
  left_join(band_instruments2, by = c("name" = "artist"))

band_members %>%
  right_join(band_instruments)

band_instruments %>%
  left_join(band_members)

band_members %>%
  full_join(band_instruments)

band_members %>%
  inner_join(band_instruments)

# band_members %>%
#   filter(name %in% band_instruments$name)

band_members %>%
  semi_join(band_instruments, by = "name")

# band_members %>%
#   filter(!name %in% band_instruments$name)

band_members %>%
  anti_join(band_instruments, by = "name")

band_instruments %>%
  anti_join(band_members, by = "name")


powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")


heroes %>%
  semi_join(powers %>% filter(`Web Creation`), by = c("name" = "hero_names"))

heroes %>%
  anti_join(powers, by = c("name" = "hero_names")) %>%
  pull(name)

new_diet <- tribble(
  ~student, ~before_r_course, ~after_r_course,
  "Ross", 80, 70,
  "Spok", 78, 75,
  "Sheldon", 73, 72
)

new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course,
               names_to = "time",
               values_to = "weight") %>%
  pivot_wider(names_from = time, values_from = weight)
