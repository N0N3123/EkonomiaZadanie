#1
if (!require(readxl)) install.packages('readxl')
library(readxl)
rossman <- read_xlsx("rossmann.xlsx")
subset_data <- subset(rossman, data == "2014-02-25" & sklep_asort == "Rozszerzony")
print(nrow(subset_data))
#513 sklepów z asortymentem rozszerzonym w dniu 2014-02-25
#2
shop101 <- subset(rossman, sklep_id == 101)
mean_clients <- aggregate(shop101$liczba_klientow, by = list(shop101$dzien_tyg), FUN = mean)
max_day <- mean_clients$Group.1[which.max(mean_clients$x)]
print(max_day)
#Poniedziałek
#3
median_sales <- aggregate(rossman$sprzedaz, by = list(rossman$sklep_typ), FUN = median)
max_type <- median_sales$Group.1[which.max(median_sales$x)]
print(max_type)
#Największa mediana sprzedaży w sklepach typu b
#4
if (!require(tidyverse)) install.packages('tidyverse')
library(tidyverse)
changed_stores <- rossman %>%
  group_by(sklep_id) %>%
  summarise(n_unique = n_distinct(sklep_konkurencja)) %>%
  filter(n_unique > 1) %>%
  pull(sklep_id)

print(changed_stores)
#nie zmienilo sie w zadnym ze sklepów
#5
library(lubridate)

rossmann <- read_excel("rossmann.xlsx")
kursy <- read_excel("kursy.xls")
origin <- as.Date("1899-12-30")
kursy$data <- as.numeric(kursy$data)
kursy$data <- origin + kursy$data
kursy <- select(kursy, data, `1 EUR`)
combined_data <- merge(rossmann, kursy, by = "data")
combined_data <- arrange(combined_data, data)
combined_data$sprzedaz <- as.numeric(combined_data$sprzedaz)
combined_data$`1 EUR` <- as.numeric(combined_data$`1 EUR`)
combined_data <- mutate(combined_data, sprzedaz_PLN = sprzedaz * `1 EUR`)
print(head(combined_data))