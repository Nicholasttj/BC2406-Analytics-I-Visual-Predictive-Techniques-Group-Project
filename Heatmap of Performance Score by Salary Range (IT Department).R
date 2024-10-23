# Load necessary packages
library(ggplot2)
library(data.table)
library(viridis)
library(RColorBrewer)

# Load the dataset
employee_data <- fread("C:/Users/nicho/OneDrive/NTU/2.1/BC2406/Extended_Employee_Performance_and_Productivity_Data.csv")

# Filter the dataset for the IT department
employee_data_it <- employee_data[Department == "IT"]

# Create Salary_Range
breaks <- seq(4000, 9000, by = 500)
labels <- paste(head(breaks, -1), tail(breaks, -1), sep = "-")
employee_data_it[, Salary_Range := cut(Monthly_Salary, breaks = breaks, include.lowest = TRUE, labels = labels)]

# Create heatmap data
heatmap_data_it <- employee_data_it[, .N, by = .(Salary_Range, Performance_Score)]

# --------------------------------------------
# Example 3: Using RColorBrewer for IT Department
# --------------------------------------------
# Example: Custom Gradient Emphasizing the 300 Range
ggplot(heatmap_data_it, aes(x = Salary_Range, y = Performance_Score)) +
  geom_tile(aes(fill = N), color = "white") +
  scale_fill_gradientn(colors = c("blue", "cyan", "green", "yellow", "orange", "red"), na.value = "grey") +  # More transition emphasis
  labs(title = "Heatmap of Performance Score by Salary Range (IT Department)", x = "Salary Range", y = "Performance Score", fill = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(aes(label = N), color = "black", size = 3)












