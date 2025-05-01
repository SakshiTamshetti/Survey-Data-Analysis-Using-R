# Load Libraries
library(dplyr)
library(ggplot2)

# Create output directory
output_dir <- file.path(Sys.getenv("USERPROFILE"), "Downloads", "Survey_Analysis_Graphs")
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# Load Data
survey_data <- read.csv("E:/projects/R_project/survey.csv")

# -----------------------------
# Data Manipulation
# -----------------------------

selected_data <- survey_data %>%
  select(Agent.Name, Rating, Review.Text, Delivery.Time..min., Location, Order.Type, Customer.Feedback.Type)

high_rating <- filter(survey_data, Rating >= 4)

negative_feedback <- filter(survey_data, Customer.Feedback.Type == "Negative")

avg_rating <- survey_data %>%
  group_by(Agent.Name) %>%
  summarise(Average_Rating = mean(Rating, na.rm = TRUE))

avg_delivery <- survey_data %>%
  group_by(Location) %>%
  summarise(Avg_Delivery_Time = mean(Delivery.Time..min., na.rm = TRUE))

# -----------------------------
# Statistical Summary
# -----------------------------

mean_rating <- mean(survey_data$Rating, na.rm = TRUE)
median_rating <- median(survey_data$Rating, na.rm = TRUE)
variance_rating <- var(survey_data$Rating, na.rm = TRUE)
range_delivery <- range(survey_data$Delivery.Time..min., na.rm = TRUE)

summary_text <- paste(
  "Survey Data Summary:\n",
  "---------------------\n",
  paste("Mean Rating:", mean_rating),
  paste("Median Rating:", median_rating),
  paste("Rating Variance:", variance_rating),
  paste("Delivery Time Range:", paste(range_delivery, collapse = " - ")),
  sep = "\n"
)

writeLines(summary_text, file.path(output_dir, "summary_report.txt"))

# -----------------------------
# Data Visualization
# -----------------------------

p1 <- ggplot(survey_data, aes(x = Location)) +
  geom_bar(fill = "skyblue") +
  theme_minimal() +
  ggtitle("Order Count by Location")
ggsave(file.path(output_dir, "barplot_orders_by_location.png"), plot = p1)

p2 <- ggplot(survey_data, aes(x = Delivery.Time..min.)) +
  geom_histogram(fill = "orange", bins = 10) +
  ggtitle("Delivery Time Distribution")
ggsave(file.path(output_dir, "histogram_delivery_time.png"), plot = p2)

p3 <- ggplot(survey_data, aes(x = Order.Type, y = Rating)) +
  geom_boxplot(fill = "lightgreen") +
  ggtitle("Rating by Order Type")
ggsave(file.path(output_dir, "boxplot_rating_by_order_type.png"), plot = p3)

feedback_counts <- survey_data %>%
  count(Customer.Feedback.Type)
p4 <- ggplot(feedback_counts, aes(x = "", y = n, fill = Customer.Feedback.Type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  ggtitle("Customer Feedback Distribution") +
  theme_void()
ggsave(file.path(output_dir, "piechart_feedback_distribution.png"), plot = p4)

# -----------------------------
# Rating Classification
# -----------------------------

label_rating <- function(r) {
  if (is.na(r)) return(NA)
  if (r >= 4) return("High")
  if (r >= 2.5) return("Medium")
  return("Low")
}
survey_data$Rating_Label <- sapply(survey_data$Rating, label_rating)

# -----------------------------
# Export Processed Data
# -----------------------------

write.csv(survey_data, file.path(output_dir, "processed_survey_data.csv"), row.names = FALSE)
