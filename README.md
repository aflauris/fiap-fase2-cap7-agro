# 🌱 Análise Estatística de Dados do Agronegócio
**FIAP – Fase 2 | Cap 7 – Decolando com Ciências de Dados**

> Análise exploratória de dados sobre a produção de soja por município brasileiro, com base em dados públicos da CONAB e IBGE (Safra 2022/2023).

---

## 👩‍🎓 Autora
| Campo | Dados |
|---|---|
| Nome | Ana Flora Lauris |
| RM | 572202 |
| Fase | 2 – Campo da Inovação |
| Capítulo | 7 – Decolando com Ciências de Dados |

---

## 📁 Arquivos do Projeto

| Arquivo | Descrição |
|---|---|
| `AnaFloraLauris_RM572202_fase2_cap7_dados_soja.xlsx` | Base de dados com 33 municípios produtores de soja |
| `AnaFloraLauris_RM572202_fase2_cap7_analise.R` | Script R com análise exploratória completa |

---

## 🗂️ Sobre a Base de Dados

Tema: **Produção de Soja por Município Brasileiro – Safra 2022/2023**

Fontes: [CONAB](https://www.conab.gov.br/) | [IBGE](https://www.ibge.gov.br/) | [Embrapa](https://www.embrapa.br/) | [MAPA](https://www.gov.br/agricultura/pt-br)

| Coluna | Tipo de Variável | Descrição |
|---|---|---|
| Nº de Propriedades Rurais | Quantitativa Discreta | Quantidade de propriedades rurais produtoras por município |
| Produtividade (ton/ha) | Quantitativa Contínua | Produção média em toneladas por hectare |
| Estado | Qualitativa Nominal | Unidade Federativa do município |
| Nível Tecnológico | Qualitativa Ordinal | Adoção de tecnologia: Baixo / Médio / Alto |
| Região | Qualitativa Nominal | Região geográfica do Brasil |

Estados cobertos: MT, PR, RS, GO, MS, BA, TO, MA, PI

---

## 📊 Análise Realizada em R

### Variável Quantitativa — Produtividade (ton/ha)

**Medidas de Tendência Central**
- Média, Mediana e Moda

**Medidas de Dispersão**
- Variância, Desvio Padrão, Amplitude Total e Coeficiente de Variação

**Medidas Separatrizes**
- Quartis (Q1, Q2, Q3), IQR, Percentis P10 e P90

**Análise Gráfica**

![Gráficos de Produtividade](https://i.imgur.com/placeholder.png)

- Histograma com média e mediana
- Boxplot com dados individuais sobrepostos
- Curva de Densidade
- QQ-Plot para verificação de normalidade

---

### Variável Qualitativa — Nível Tecnológico

**Análise Gráfica**
- Gráfico de Barras com frequência absoluta e relativa
- Gráfico de Pizza com distribuição percentual

| Nível | Municípios | % |
|---|---|---|
| Baixo | 8 | 24,2% |
| Médio | 12 | 36,4% |
| Alto | 13 | 39,4% |

---

## 🔍 Principais Resultados

- A produtividade média da soja nos municípios analisados foi de **3,44 ton/ha**
- O QQ-Plot indicou **distribuição aproximadamente normal**
- Municípios com **nível tecnológico Alto** apresentaram produtividade média de **3,81 ton/ha**, contra **2,88 ton/ha** dos municípios com nível Baixo
- A maioria dos municípios da amostra concentra-se na região **Centro-Oeste**, maior polo sojicultor do Brasil

---

## 🛠️ Tecnologias Utilizadas

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)

---

*Projeto acadêmico desenvolvido para a disciplina de Ciências de Dados – FIAP 2026*
