# RNA-seq Differential Expression Analysis

This project demonstrates a workflow for analysing RNA-seq differential expression results in **R**.  
The focus is on identifying significantly **upregulated** and **downregulated** genes and visualising them with a volcano plot.  

---

## Workflow Overview
1. **Data Import**  
   - RNA-seq results were loaded from a public dataset.  
   - The table includes:  
     - `Gene`: gene identifier  
     - `log2FoldChange`: change in expression (positive = upregulated, negative = downregulated)  
     - `pvalue` and `padj`: statistical significance measures  

2. **Exploratory Analysis**  
   - The dataset structure was inspected to confirm the columns and check distributions.  

3. **Visualisation (Volcano Plot)**  
   - A volcano plot was generated using **ggplot2**.  
   - **Blue dashed lines** mark thresholds for log2FC ±1.  
   - The **red dashed line** shows the adjusted p-value cutoff (padj = 0.05).  
   - **ggrepel** was used to label the top 10 most significant genes for clarity.  

4. **Gene Selection**  
   - **Upregulated genes**: log2FC > 1 and p-value < 0.01  
   - **Downregulated genes**: log2FC < -1 and p-value < 0.01  
   - The top 5 most significant genes (smallest p-values) were extracted for each category.  

---

## Results

**Top 5 Upregulated Genes**  
- **EMILIN2** – strongly upregulated (log2FC ~1.5); associated with extracellular matrix and vascular biology.  
- **POU3F4** – transcription factor, may regulate neural development.  
- **LOC285954** – uncharacterized, potential novel regulator.  
- **VEPH1** – involved in cell signalling and development.  
- **DTHD1** – function not fully understood, requires further study.  

**Top 5 Downregulated Genes**  
- **TBX5** – strongly downregulated (log2FC ~-2.1); a transcription factor critical for heart and limb development.  
- **LAMA2** – extracellular matrix protein; mutations linked to muscular dystrophy.  
- **CAV2** – caveolin family, involved in membrane signalling.  
- **IFITM1** – immune-related, typically upregulated during interferon response.  
- **TNN** – tenascin, an  extracellular matrix glycoprotein important in tissue structure.  

---

## 📈 Volcano Plot

The volcano plot highlights the distribution of differential expression results.  
Significant genes are labelled for clarity:

<img width="613" height="351" alt="image" src="https://github.com/user-attachments/assets/e832cffb-d8c2-4c89-98df-4b658bb47001" />

---

## 🔧 Tools Used
- **R** for analysis  
- **ggplot2** for visualization  
- **ggrepel** for labelling significant genes  

---

## 🧾 Interpretation

- The **most downregulated gene** was **TBX5**, suggesting strong suppression of a transcription factor known for roles in development.  
- The **most upregulated gene** was **EMILIN2**, indicating potential extracellular matrix remodeling or vascular involvement.  
- Several significant genes (e.g., **LAMA2**, **CAV2**) point toward changes in structural and signaling pathways.  
- Together, these results suggest that both **developmental regulators** and **extracellular matrix components** are significantly altered in this dataset.  

---

✅ This workflow demonstrates how to process, visualise, and interpret RNA-seq differential expression data, linking statistical findings to potential biological insights.
