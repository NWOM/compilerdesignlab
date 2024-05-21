# Load necessary libraries
install.packages(c("readr", "ggplot2"))
library(readr)
library(ggplot2)

# Read the dataset
dataset <- read_csv("path/to/your/dataset.csv")

# Ensure your data is numeric
numeric_dataset <- dataset[sapply(dataset, is.numeric)]

# Calculate the correlation matrix
cor_matrix <- cor(numeric_dataset, use = "complete.obs")
print(cor_matrix)

# Perform PCA
pca_result <- prcomp(numeric_dataset, scale. = TRUE)
summary(pca_result)

# Create a biplot
biplot(pca_result, scale = 0)

# Alternatively, use ggplot2 for more customization
pca_data <- as.data.frame(pca_result$x)
if("category_column" %in% colnames(dataset)) {
  pca_data$category <- dataset$category_column  # Adjust column name as necessary
}

ggplot(pca_data, aes(x = PC1, y = PC2, color = category)) +
  geom_point() +
  theme_minimal() +
  labs(title = "PCA Biplot",
       x = "Principal Component 1",
       y = "Principal Component 2")
