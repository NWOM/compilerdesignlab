# Check if necessary packages are installed and install if not
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Load necessary libraries
library(readr)
library(ggplot2)

# Read the dataset (using the mtcars dataset as an example)
dataset <- mtcars

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
ggplot(pca_data, aes(x = PC1, y = PC2)) +
  geom_point() +
  theme_minimal() +
  labs(title = "PCA Biplot",
       x = "Principal Component 1",
       y = "Principal Component 2")
