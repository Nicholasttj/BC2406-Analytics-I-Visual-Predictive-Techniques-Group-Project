# Calculate overall average satisfaction
overall_average <- mean(average_satisfaction$Average_Satisfaction)

# Combine job title and average satisfaction for labels
average_satisfaction[, Label := paste(Job_Title, "(", round(Average_Satisfaction, 3), ")", sep = "")]

ggplot(average_satisfaction, aes(x = Average_Satisfaction, y = reorder(Job_Title, Average_Satisfaction))) +
  geom_point(size = 4, color = "blue") +  # Points for average satisfaction
  geom_vline(xintercept = overall_average, linetype = "dashed", color = "red", size = 1) +  # Reference line
  geom_smooth(aes(group = 1), method = "lm", color = "darkgreen", se = FALSE) +  # Trend line
  geom_segment(aes(x = 3, xend = Average_Satisfaction, 
                   y = reorder(Job_Title, Average_Satisfaction), 
                   yend = reorder(Job_Title, Average_Satisfaction)), 
               linetype = "dotted", color = "grey") +  # Dotted lines from y-axis to points
  geom_text(aes(label = Label), hjust = -0.2, size = 4, color = "black") +  # Combined labels
  labs(title = "Average Employee Satisfaction Score by Job Title (IT Department)", 
       x = "Average Satisfaction Score", 
       y = "Job Title") +
  theme_minimal(base_size = 15) +  # Increased base font size for readability
  theme(axis.text.x = element_text(size = 12),  # Adjust x-axis text size
        axis.text.y = element_text(size = 12),  # Adjust y-axis text size
        panel.grid.major.y = element_blank(),    # Remove y grid lines for clarity
        panel.grid.minor.y = element_blank())    # Remove minor y grid lines
