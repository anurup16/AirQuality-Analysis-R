# Master script to run the entire air quality analysis pipeline
# This script runs all analysis steps in sequence

cat("========================================\n")
cat("Air Quality & Weather Analysis Pipeline\n")
cat("========================================\n\n")

# Step 1: Load data
cat("Step 1: Loading data...\n")
source("01_load_data.R")
cat("✓ Data loaded\n\n")

# Step 2: Explore data
cat("Step 2: Exploring data...\n")
source("02_explore_data.R")
cat("✓ Data exploration complete\n\n")

# Step 3: Analysis and visualization
cat("Step 3: Running analysis and creating visualizations...\n")
source("03_analysis_visualization.R")
cat("✓ Analysis complete\n\n")

# Step 4: Generate conclusions
cat("Step 4: Generating conclusions...\n")
source("04_conclusion_report.R")
cat("✓ Conclusions generated\n\n")

cat("========================================\n")
cat("Analysis pipeline completed successfully!\n")
cat("========================================\n")
cat("Check the following outputs:\n")
cat("  - output/city_aqi_trends.png\n")
cat("  - temp_aqi_correlation.png\n")
cat("  - correlationheatmap.png\n")
cat("========================================\n")