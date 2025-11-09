library(tidyverse)
library(GGally)
library(corrplot)

# Correlation between Temp and AQI
correlation <- cor(air_df$Temp, air_df$AQI, use = "complete.obs")
print(paste("Correlation between Temperature and AQI:", round(correlation, 3)))

# Scatter plot: Temp vs AQI by city
ggplot(air_df, aes(x = Temp, y = AQI, color = City)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Temperature vs AQI Across Cities",
       x = "Temperature (°C)", y = "Air Quality Index") +
  theme_minimal()

ggsave("temp_aqi_correlation.png")

# Correlation heatmap for pollutants + Temp
num_cols <- air_df %>%
  select(PM2.5, PM10, NO, NO2, SO2, CO, O3, Temp, AQI) %>%
  cor(use = "complete.obs")

corrplot(num_cols, method = "color", type = "upper",
         title = "Correlation Heatmap: Pollutants, Temp, and AQI")

ggsave("correlation_heatmap.png")