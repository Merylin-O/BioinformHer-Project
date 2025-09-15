# Load dataset from URL
url <- "https://gist.githubusercontent.com/stephenturner/806e31fce55a8b7175af/raw/1a507c4c3f9f1baaa3a69187223ff3d3050628d4/results.txt"

# Read and inspect the first few lines of the dataset
raw_lines <- readLines(url, n = 5)
raw_lines

# Read the dataset into a data frame
dumbseq_data <- read.table(url, header = TRUE, sep = "", stringsAsFactors = FALSE)

#Check the structure of the data
colnames(dumbseq_data)
head(dumbseq_data)
str(dumbseq_data)

# Install ggplot2 and ggrepel 
install.packages(c("ggplot2", "ggrepel"))

# Load ggplot2 and ggrepel libraries
library(ggplot2)
library(ggrepel)

# Create volcano plot
ggplot(dumbseq_data, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point(alpha = 0.5) +
  theme_minimal() +
  labs(title = "Volcano Plot",
       x = "Log2 Fold Change",
       y = "-Log10 Adjusted P-value") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "red") +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "blue") +
  theme(legend.position = "none")

# pick top 10 by adjusted p-value
topGenes <- dumbseq_data[order(dumbseq_data$padj), ][1:10, ]

ggplot(dumbseq_data, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point(alpha = 0.5) +
  geom_text_repel(data = topGenes,
                  aes(label = Gene),
                  size = 3,
                  max.overlaps = 10) +
  theme_minimal() +
  labs(title = "Volcano Plot with Gene Labels",
       x = "Log2 Fold Change",
       y = "-Log10 Adjusted P-value") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "red") +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "blue") +
  theme(legend.position = "none")



# Upregulated genes (Log2FC > 1 & pvalue < 0.01)
upregulated <- subset(dumbseq_data, log2FoldChange > 1 & pvalue < 0.01)

# Downregulated genes (Log2FC < -1 & pvalue < 0.01)
downregulated <- subset(dumbseq_data, log2FoldChange < -1 & pvalue < 0.01)

# Get top 5 (ranked by smallest p-value)
top5_up <- head(upregulated[order(upregulated$pvalue), ], 5)
top5_down <- head(downregulated[order(downregulated$pvalue), ], 5)

# Print results
top5_up
top5_down