install.packages(c("dplyr", "ggplot2", "lubridate", "corrplot", "readr"))

library(dplyr)
library(ggplot2)
library(lubridate)
library(corrplot)
library(readr)

cat("Loading dataset...\n")

# Load dataset
air <- read_csv("air_quality.csv")

cat("✅ Data loaded. Cleaning and formatting...\n")

# Rename columns (adjust to match your dataset)
air <- air %>%
  rename(
    datetime = Date,
    pm25 = `PM2.5`,
    pm10 = PM10,
    no2 = NO2,
    temperature = Temp,
    humidity = Humidity,
    windspeed = WindSpeed
  ) %>%
  mutate(datetime = ymd_hms(datetime)) %>%
  arrange(datetime)

# Remove missing or invalid entries
air_clean <- na.omit(air)

# Save cleaned data
if (!dir.exists("data")) dir.create("data")
write_csv(air_clean, "data/air_quality_clean.csv")

cat(" Cleaned dataset saved as data/air_quality_clean.csv\n")