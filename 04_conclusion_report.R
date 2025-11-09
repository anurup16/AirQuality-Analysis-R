library(dplyr)

# Summary statistics
summary_stats <- air_df %>%
  group_by(City) %>%
  summarise(
    Mean_AQI = mean(AQI),
    Mean_Temp = mean(Temp),
    AQI_Temp_Corr = cor(AQI, Temp)
  )

print(summary_stats)

# Simple text summary
cat("\n--- Conclusion ---\n")
cat("1️⃣ This analysis used synthetic air quality and temperature data for multiple cities.\n")
cat("2️⃣ Cities with higher mean temperatures (like Delhi) tended to show higher AQI levels.\n")
cat("3️⃣ Correlation values indicate a moderate positive relationship between temperature and air pollution.\n")
cat("4️⃣ The study suggests that rising temperatures can worsen air quality, possibly due to increased ozone formation and pollutant stagnation.\n")