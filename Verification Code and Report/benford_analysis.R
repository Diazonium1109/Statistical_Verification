# Load ggplot2
library(ggplot2)

# --- 1. LOAD DATA ---
# Read the file, skipping the first 4 metadata rows
raw_data <- read.csv("gdp_data.csv", skip = 4, stringsAsFactors = FALSE)

# --- 2. PREPARE GLOBAL DATA (The "Control" Group) ---
# Extract ALL numeric year columns (col 5 to end) for ALL countries
global_gdp_values <- as.matrix(raw_data[, 5:ncol(raw_data)])
global_gdp_values <- as.numeric(global_gdp_values)

# Remove NAs and zeros
global_gdp_values <- global_gdp_values[!is.na(global_gdp_values) & global_gdp_values > 0]

# Extract first digits
global_digits <- as.numeric(substr(as.character(global_gdp_values), 1, 1))

# Calculate frequencies
global_counts <- table(factor(global_digits, levels = 1:9))
global_freq <- as.numeric(global_counts) / sum(global_counts)

# --- 3. PREPARE UZBEKISTAN DATA ---
uzb_row <- subset(raw_data, Country.Name == "Uzbekistan")
uzb_values <- as.numeric(uzb_row[5:ncol(uzb_row)])
uzb_values <- uzb_values[!is.na(uzb_values) & uzb_values > 0]

# Extract first digits
uzb_digits <- as.numeric(substr(as.character(uzb_values), 1, 1))

# Calculate frequencies
uzb_counts <- table(factor(uzb_digits, levels = 1:9))
uzb_freq <- as.numeric(uzb_counts) / sum(uzb_counts)

# --- 4. COMBINE FOR PLOTTING ---
# We create one big table with both datasets
plot_data <- rbind(
  data.frame(Digit = 1:9, Frequency = global_freq, Type = "Global Average"),
  data.frame(Digit = 1:9, Frequency = uzb_freq, Type = "Uzbekistan")
)

# Theoretical Benford's Law Data (for the line)
benford_vals <- log10(1 + 1/(1:9))
theory_data <- data.frame(Digit = 1:9, Frequency = benford_vals)

# --- 5. PLOT ---
ggplot() +
  # Layer 1: The Bars (Side-by-Side)
  geom_bar(data = plot_data, aes(x = factor(Digit), y = Frequency, fill = Type), 
           stat = "identity", position = "dodge", width = 0.7, alpha = 0.8) +
  
  # Layer 2: The Theoretical Line
  geom_line(data = theory_data, aes(x = Digit, y = Frequency, group = 1, color = "Benford's Law"), 
            linewidth = 1.2, linetype = "dashed") +
  geom_point(data = theory_data, aes(x = factor(Digit), y = Frequency, color = "Benford's Law"), 
             size = 3) +
  
  # Styling
  scale_fill_manual(values = c("Global Average" = "gray50", "Uzbekistan" = "orange")) +
  scale_color_manual(values = c("Benford's Law" = "blue")) +
  
  labs(
    title = "Benford's Law: Global vs. Uzbekistan GDP",
    subtitle = "Comparing global adherence vs. local anomaly",
    x = "Leading Digit",
    y = "Frequency",
    fill = "Data Source",
    color = "Theoretical Reference"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    legend.position = "top"
  )
