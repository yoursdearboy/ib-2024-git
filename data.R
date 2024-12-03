library(dplyr)
library(readr)

top <- read_csv("data/billboard200.csv", na = c(" ", "-"))

top <- top %>%
  select(-`Image URL`) %>%
  select(-c(`Rank`, `Last Week`, `Peak Position`, `Weeks in Charts`)) %>%
  distinct()

write_csv(top, "data/billboard200.csv")

top100 <- top %>%
  group_by(Date) %>%
  filter(row_number() <= 100) %>%
  ungroup()

write_csv(top100, "data/billboard100.csv")

top20 <- top %>%
  group_by(Date) %>%
  filter(row_number() <= 20) %>%
  ungroup()

write_csv(top20, "data/billboard20.csv")
