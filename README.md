# Athlete Optimism Suppression Paradox (N=739)

**Publication-ready secondary analysis** of real athlete data from OpenICPSR (DOI: [10.3886/E231941V1](https://doi.org/10.3886/E231941V1))

## Headline Findings
- 🧠 Mental well-being → Performance: **β=0.305*** (direct effect)
- ⚠️ **Optimism suppression paradox**: ACME=-0.051* (95% CI[-0.094,-0.008])
- 🏃 Team sports stronger (R²=0.138) vs individual (R²=0.080)

## 🔄 One-Click Full Replication
```r
# Install packages
install.packages(c("haven", "stargazer", "mediation"))

# Run complete analysis
source("analysis-complete.R")

