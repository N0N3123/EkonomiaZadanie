library(tidyverse)

films <- read_csv("http://wawrowski.edu.pl/data/movies.csv")
ggplot(films, aes(x=rating, y=duration)) +
  geom_point() +
  xlab("Ocena filmu") +
  ylab("Długość filmu (w minutach") +
  xlim(0,10) +
  theme_light()

wybrane_filmy <- filmy %>%
  filter(genre %in% c("Action", "Comedy", "Drama"))
  
ggplot(data = wybrane_filmy, mapping = aes(x = rating)) +
  geom_histogram(binwidth = 0.5, fill = "blue") +
  xlim(0,10) +
  xlab("Ocena filmu") +
  ylab("Liczba filmów") +
  facet_wrap(~ genre) +
  theme_bw()

filmy %>%
  count(director) %>%
  top_n(10, n) %>%
  mutate(director = fct_reorder(director,n)) %>%
  ggplot(aes(x = n, y = director)) +
  geom_col(fill = "#8856a7") +
  geom_text(aes(label = n), hjust = 1.5, color = "white") +
  xlab("Liczba filmów") +
  ylab("Reżyser") +
  theme_classic()

filmy %>%
  filter(year %in% 2014:2016) %>%
  group_by(year) %>%
  top_n(5, rating) %>%
  ungroup() %>%
  mutate(title = fct_reorder(title, rating)) %>%
  ggplot(aes(y = title, x = rating, fill = as.factor(year))) +
  geom_col() +
  xlab("Ocena filmu") +
  ylab("Tytuł filmu") +
  scale_fill_discrete(name = "Rok") +
  theme_light() +
  theme(legend.position = "top")
filmy %>%
  mutate(year_decade=cut(year, seq(1920, 2020, 10), include.lowest=T, dig.lab=4)) %>%
  ggplot(aes(x=duration, y=year_decade)) +
  geom_boxplot() +
  xlab("Długość filmu (w minutach)") +
  ylab("Dekada") +
  theme_minimal()