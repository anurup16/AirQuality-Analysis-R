# Load libraries
library(dplyr)
library(readr)

# Simulate air quality data for multiple cities
set.seed(123)

cities <- c("London", "Delhi", "New York", "Beijing")
dates <- seq.Date(from = as.Date("2024-01-01"), to = as.Date("2024-12-31"), by = "day")

# Create synthetic data
air_df <- expand.grid(Date = dates, City = cities) %>%
  mutate(
    PM2.5 = round(runif(n(), 10, 250), 1),
    PM10 = round(runif(n(), 20, 400), 1),
    NO = round(runif(n(), 5, 150), 1),
    NO2 = round(runif(n(), 10, 200), 1),
    SO2 = round(runif(n(), 5, 100), 1),
    CO = round(runif(n(), 0.5, 5), 2),
    O3 = round(runif(n(), 10, 180), 1),
    AQI = round(runif(n(), 50, 400)),
    AQI_Bucket = case_when(
      AQI <= 50 ~ "Good",
      AQI <= 100 ~ "Moderate",
      AQI <= 200 ~ "Unhealthy",
      AQI <= 300 ~ "Very Unhealthy",
      TRUE ~ "Hazardous"
    ),
    # Add realistic synthetic temperature patterns per city
    Temp = case_when(
      City == "London" ~ 5 + 10 * sin(2 * pi * as.numeric(format(Date, "%j")) / 365) + rnorm(n(), 0, 2),
      City == "Delhi" ~ 20 + 15 * sin(2 * pi * as.numeric(format(Date, "%j")) / 365) + rnorm(n(), 0, 2),
      City == "New York" ~ 0 + 12 * sin(2 * pi * as.numeric(format(Date, "%j")) / 365) + rnorm(n(), 0, 2),
      City == "Beijing" ~ -5 + 18 * sin(2 * pi * as.numeric(format(Date, "%j")) / 365) + rnorm(n(), 0, 2)
    )
  )

# Save to CSV for later use
write_csv(air_df, "synthetic_air_quality_with_temp.csv")

# View summary
print(head(air_df))