library(tidyverse)

# Check missing values
colSums(is.na(air_df))

# Average AQI by city
city_aqi <- air_df %>%
  group_by(City) %>%
  summarise(mean_AQI = mean(AQI, na.rm = TRUE)) %>%
  arrange(desc(mean_AQI))
print(city_aqi)

# Plot average AQI by city
ggplot(city_aqi, aes(x = reorder(City, -mean_AQI), y = mean_AQI, fill = City)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Air Quality Index by City", x = "City", y = "Average AQI") +
  theme_minimal()

ggsave("output/city_aqi_trends.png")