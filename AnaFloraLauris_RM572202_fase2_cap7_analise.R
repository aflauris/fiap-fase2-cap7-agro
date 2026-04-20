# AnaFloraLauris_RM572202_fase2_cap7

# =============================================================================
# ANÁLISE ESTATÍSTICA DE DADOS DO AGRONEGÓCIO
# Tema: Produção de Soja por Município Brasileiro – Safra 2022/2023
# Fonte: CONAB / IBGE – Levantamento de Safras 2022/2023
# =============================================================================


# -----------------------------------------------------------------------------
# 0. DADOS
# -----------------------------------------------------------------------------

# Variável Quantitativa Discreta: Número de Propriedades Rurais (und.)
num_propriedades <- c(
  3420, 2875, 1540, 4100, 2210,
  3780, 2950, 1680,  980, 3200,
  2640, 1920,  760, 3310, 1450,
  2870, 1630,  840, 3050, 1980,
  2420, 1760,  690, 3140, 1520,
   580, 2730, 1340,  470, 2180,
   890, 1670,  520
)

# Variável Quantitativa Contínua: Produtividade (ton/ha)
produtividade <- c(
  3.82, 3.91, 3.67, 4.05, 3.55,
  3.98, 3.74, 3.40, 3.12, 3.85,
  3.60, 3.45, 2.98, 3.79, 3.22,
  3.88, 3.50, 3.05, 3.72, 3.41,
  3.65, 3.33, 2.88, 3.81, 3.28,
  2.75, 3.70, 3.18, 2.62, 3.48,
  2.95, 3.35, 2.70
)

# Variável Qualitativa Nominal: Estado
estado <- c(
  "MT","MT","MT","MT","MT",
  "PR","PR","PR","PR","PR",
  "RS","RS","RS","RS","RS",
  "GO","GO","GO","GO","GO",
  "MS","MS","MS","BA","BA",
  "BA","TO","TO","TO","MA",
  "MA","PI","PI"
)

# Variável Qualitativa Ordinal: Nível Tecnológico
nivel_tec <- factor(
  c(
    "Alto","Alto","Médio","Alto","Médio",
    "Alto","Alto","Médio","Baixo","Alto",
    "Alto","Médio","Baixo","Alto","Médio",
    "Alto","Médio","Baixo","Alto","Médio",
    "Alto","Médio","Baixo","Alto","Médio",
    "Baixo","Alto","Médio","Baixo","Médio",
    "Baixo","Médio","Baixo"
  ),
  levels = c("Baixo", "Médio", "Alto"),
  ordered = TRUE
)

regiao <- c(
  rep("Centro-Oeste", 5),
  rep("Sul", 5),
  rep("Sul", 5),
  rep("Centro-Oeste", 5),
  rep("Centro-Oeste", 3),
  rep("Nordeste", 2), "Nordeste",
  rep("Norte", 3),
  rep("Nordeste", 2),
  "Nordeste", "Nordeste"
)


# =============================================================================
# 1. ANÁLISE EXPLORATÓRIA – VARIÁVEL QUANTITATIVA CONTÍNUA
#    Produtividade (ton/ha)
# =============================================================================

cat("\n")
cat("=============================================================\n")
cat("  ANÁLISE EXPLORATÓRIA – PRODUTIVIDADE DA SOJA (ton/ha)\n")
cat("=============================================================\n\n")


# --- 1.1  Medidas de Tendência Central ----------------------------------------

cat("--- Medidas de Tendência Central ---\n")

media    <- mean(produtividade)
mediana  <- median(produtividade)

# Moda (função manual — R base não tem moda)
calc_moda <- function(x) {
  tb <- table(x)
  as.numeric(names(tb[tb == max(tb)]))
}
moda <- calc_moda(produtividade)

cat(sprintf("  Média   : %.4f ton/ha\n", media))
cat(sprintf("  Mediana : %.4f ton/ha\n", mediana))
cat(sprintf("  Moda    : %.2f ton/ha\n", moda[1]))


# --- 1.2  Medidas de Dispersão ------------------------------------------------

cat("\n--- Medidas de Dispersão ---\n")

variancia  <- var(produtividade)
desv_pad   <- sd(produtividade)
amplitude  <- max(produtividade) - min(produtividade)
cv         <- (desv_pad / media) * 100          # Coeficiente de Variação (%)

cat(sprintf("  Variância            : %.4f\n", variancia))
cat(sprintf("  Desvio Padrão        : %.4f ton/ha\n", desv_pad))
cat(sprintf("  Amplitude Total      : %.4f ton/ha\n", amplitude))
cat(sprintf("  Coef. de Variação    : %.2f %%\n", cv))
cat(sprintf("  Valor Mínimo         : %.2f ton/ha\n", min(produtividade)))
cat(sprintf("  Valor Máximo         : %.2f ton/ha\n", max(produtividade)))


# --- 1.3  Medidas Separatrizes ------------------------------------------------

cat("\n--- Medidas Separatrizes ---\n")

q1  <- quantile(produtividade, 0.25)
q2  <- quantile(produtividade, 0.50)
q3  <- quantile(produtividade, 0.75)
iqr <- IQR(produtividade)

p10 <- quantile(produtividade, 0.10)
p90 <- quantile(produtividade, 0.90)

cat(sprintf("  Q1  (25%%)  : %.4f ton/ha\n", q1))
cat(sprintf("  Q2  (50%%)  : %.4f ton/ha\n", q2))
cat(sprintf("  Q3  (75%%)  : %.4f ton/ha\n", q3))
cat(sprintf("  IQR         : %.4f ton/ha\n", iqr))
cat(sprintf("  P10 (10%%)  : %.4f ton/ha\n", p10))
cat(sprintf("  P90 (90%%)  : %.4f ton/ha\n", p90))


# --- 1.4  Análise Gráfica – Produtividade (ton/ha) ---------------------------

# Paleta verde temática
verde1 <- "#2E7D32"
verde2 <- "#66BB6A"
verde3 <- "#C8E6C9"

par(mfrow = c(2, 2),
    mar   = c(4.5, 4.5, 3.5, 1.5),
    oma   = c(0, 0, 3, 0),
    bg    = "#F9FBF9")

# -- Histograma
hist(produtividade,
     breaks  = 8,
     col     = verde2,
     border  = verde1,
     main    = "Histograma – Produtividade",
     xlab    = "Produtividade (ton/ha)",
     ylab    = "Frequência",
     las     = 1)
abline(v = media,   col = "#B71C1C", lwd = 2, lty = 2)
abline(v = mediana, col = "#1565C0", lwd = 2, lty = 3)
legend("topright",
       legend = c(sprintf("Média = %.2f", media),
                  sprintf("Mediana = %.2f", mediana)),
       col    = c("#B71C1C", "#1565C0"),
       lwd    = 2, lty = c(2, 3), bty = "n", cex = 0.85)

# -- Boxplot
boxplot(produtividade,
        col      = verde2,
        border   = verde1,
        main     = "Boxplot – Produtividade",
        ylab     = "Produtividade (ton/ha)",
        las      = 1,
        notch    = FALSE)
stripchart(produtividade, method = "jitter", vertical = TRUE,
           pch = 19, col = adjustcolor(verde1, 0.5), add = TRUE)

# -- Densidade
plot(density(produtividade),
     col  = verde1,
     lwd  = 2,
     main = "Densidade – Produtividade",
     xlab = "Produtividade (ton/ha)",
     ylab = "Densidade",
     las  = 1)
polygon(density(produtividade), col = adjustcolor(verde2, 0.4), border = NA)
abline(v = media, col = "#B71C1C", lwd = 2, lty = 2)

# -- QQ-Plot (normalidade)
qqnorm(produtividade,
       main  = "QQ-Plot – Produtividade",
       pch   = 19,
       col   = verde1,
       las   = 1)
qqline(produtividade, col = "#B71C1C", lwd = 2)

mtext("Análise Gráfica – Produtividade da Soja (ton/ha) | Safra 2022/23",
      outer = TRUE, cex = 1.1, font = 2, col = "#1B5E20")

par(mfrow = c(1, 1))


# =============================================================================
# 2. ANÁLISE GRÁFICA – VARIÁVEL QUALITATIVA ORDINAL
#    Nível Tecnológico
# =============================================================================

cat("\n")
cat("=============================================================\n")
cat("  ANÁLISE GRÁFICA – NÍVEL TECNOLÓGICO\n")
cat("=============================================================\n\n")

freq_nivel <- table(nivel_tec)
prop_nivel <- round(prop.table(freq_nivel) * 100, 1)

cat("Frequências absolutas:\n")
print(freq_nivel)
cat("\nFrequências relativas (%):\n")
print(prop_nivel)

# Cores por nível
cores_nivel <- c("Baixo" = "#EF9A9A", "Médio" = "#FFE082", "Alto" = "#A5D6A7")

par(mfrow = c(1, 2),
    mar   = c(5, 5, 4, 2),
    oma   = c(0, 0, 3, 0),
    bg    = "#F9FBF9")

# -- Gráfico de barras
barras <- barplot(freq_nivel,
                  col    = cores_nivel[names(freq_nivel)],
                  border = "#2E7D32",
                  main   = "Frequência por Nível Tecnológico",
                  xlab   = "Nível Tecnológico",
                  ylab   = "Número de Municípios",
                  ylim   = c(0, max(freq_nivel) * 1.25),
                  las    = 1)
text(x      = barras,
     y      = freq_nivel + 0.4,
     labels = paste0(freq_nivel, "\n(", prop_nivel, "%)"),
     cex    = 0.9,
     font   = 2,
     col    = "#1B5E20")

# -- Gráfico de pizza
pie(freq_nivel,
    labels = paste0(names(freq_nivel), "\n", prop_nivel, "%"),
    col    = cores_nivel[names(freq_nivel)],
    border = "white",
    main   = "Distribuição – Nível Tecnológico",
    cex    = 0.95)

mtext("Análise Gráfica – Nível Tecnológico dos Municípios Sojicultores | 2022/23",
      outer = TRUE, cex = 1.0, font = 2, col = "#1B5E20")

par(mfrow = c(1, 1))


# =============================================================================
# 3. BÔNUS – Produtividade média por Nível Tecnológico
# =============================================================================

cat("\n--- Produtividade Média por Nível Tecnológico ---\n")
tapply(produtividade, nivel_tec, function(x)
  cat(sprintf("  %-6s: %.4f ton/ha (n = %d)\n",
              levels(nivel_tec)[match(deparse(substitute(x)), ls())],
              mean(x), length(x))))

# versão legível
for (nv in levels(nivel_tec)) {
  sub_prod <- produtividade[nivel_tec == nv]
  cat(sprintf("  %-6s: média = %.4f ton/ha  |  n = %d\n",
              nv, mean(sub_prod), length(sub_prod)))
}

cat("\n=== Fim da análise ===\n")
