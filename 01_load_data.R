library(tidyverse)
library(lubridate)

air_df <- read_csv("synthetic_air_quality_with_temp.csv")

air_df <- air_df %>%
  mutate(Date = as.Date(Date))

print(head(air_df))
summary(air_df)