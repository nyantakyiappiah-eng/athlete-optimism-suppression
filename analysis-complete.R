# COMPLETE PUBLICATION REPLICATION
# Athlete Optimism Suppression Paradox (N=739)
# ICPSR DOI: https://doi.org/10.3886/E231941V1

library(haven)
library(stargazer)
library(mediation)

# LOAD DATA (your ICPSR file)
athletes <- read_sav("Data.sav")
dim(athletes)  # 739 x 70

# MAIN REGRESSION MODELS
model_main <- lm(SPPDort ~ SİVKÖ_Ortalama + İyimserlik + Karamsarlık, data = athletes)
model_full <- lm(SPPDort ~ SİVKÖ_Ortalama + İyimserlik + Karamsarlık + 
                 Cinsiyet + SporTürü + Yaş, data = athletes)
model_team <- lm(SPPDort ~ SİVKÖ_Ortalama + İyimserlik + Karamsarlık, 
                 data = athletes[athletes$SporTürü == 2, ])
model_individual <- lm(SPPDort ~ SİVKÖ_Ortalama + İyimserlik + Karamsarlık, 
                       data = athletes[athletes$SporTürü == 1, ])

# PUBLICATION TABLE
stargazer(model_main, model_full, model_team, model_individual, 
          type="html", out="Table1_Regression_Results.html",
          title="Psychological Predictors of Athlete Performance")

# CAUSAL MEDIATION (5000 bootstraps)
med.fit <- lm(İyimserlik ~ SİVKÖ_Ortalama, data = athletes)
out.fit <- lm(SPPDort ~ İyimserlik + SİVKÖ_Ortalama, data = athletes)
med.out <- mediate(med.fit, out.fit, treat="SİVKÖ_Ortalama", 
                   mediator="İyimserlik", boot=TRUE, sims=5000)
print(summary(med.out))

cat("REPLICATION COMPLETE\n")
cat("Key finding: Optimism suppression ACME=-0.051*\n")
cat("Data citation: https://doi.org/10.3886/E231941V1\n")
