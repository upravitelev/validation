# ! надо сделать блок по препроцессингу -- перекодировать обратные вопросы в прямые


# дисперсия по порядку вопросов -------------------------------------------

c2_data_l <- melt(c2_data, measure.vars = names(c2_data), variable.name = 'q')
c2_data_l_stat  <- c2_data_l[, list(q_sd = sd(value), q_mean = mean(value)), keyby = q]
c2_data_l_stat <- merge(
  questionnaire_names[question_type == 'competencies', list(question_ru, q, q_order, C2, c2)],
  c2_data_l_stat,
  by = 'q'
)

c2_data_l_stat <- c2_data_l_stat[order(q_order)]
c2_data_l_stat[, q_order := seq_len(.N)]

plot_ly(c2_data_l_stat, x = ~q_order, y = ~q_sd, color = ~paste('c2 = ', c2), type = 'bar') %>%
  layout(
    title = 'Дисперсия вопросов по номеру предъявления'
  )

plot_ly(c2_data_l_stat, x = ~q_order, y = ~q_mean, color = ~paste('c2 = ', c2), type = 'bar') %>%
  layout(
    title = 'Среднее значение вопросов по номеру предъявления'
  )

plot_ly(c2_data_l_stat, x = ~q_order, y = ~abs(q_mean), color = ~paste('c2 = ', c2), type = 'bar') %>%
  layout(
    title = 'Среднее значение вопросов по номеру предъявления'
  )



# корреляционный анализ субшкал -------------------------------------------

c3_sums <- data.table()

for (i in c2_info[, unique(c3)]) {
  c2c3_colname <- c2_info[c3 == i, unique(paste0('c2_', c2, '_', c3))]
  c2c3_values <- c2_data[, rowSums(.SD), .SDcols = c2_info[c3 == i, q]]
  c3_sums[, (paste0('c3_', i)) := c2c3_values]
}


corrmatrix <- Hmisc::rcorr(as.matrix(c3_sums))

flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}

corr_dt <- flattenCorrMatrix(corrmatrix$r, corrmatrix$P)
setDT(corr_dt)
corr_dt[, p := round(p, 3)]

corr_dt_stat <- corr_dt[, list(
  n_sig_corrs = length(column[p < 0.05]),
  r_max = max(cor[p < 0.05])
), keyby = row]



corrplot(
  cor(c3_sums),
  type = "upper",
  order = "hclust",
  tl.col = "black",
  tl.srt = 45, insig = "blank"
)

corrplot(
  c3_sums[, cor(.SD), .SDcols = c2_info[c2 == 5, paste0('c3_', unique(c3))]],
  type = "upper",
  order = "hclust",
  tl.col = "black",
  tl.srt = 45, insig = "blank"
)

c3_sums[, .SD, .SDcols = c2_info[c2 == 5, paste0('c3_', unique(c3))]]

corrplot(
  c3_sums[, cor(.SD), .SDcols = c2_info[c2 == 5, paste0('c3_', unique(c3))]],
  type = "upper",
  order = "hclust",
  tl.col = "black",
  tl.srt = 45, insig = "blank"
)

install.packages('heatmaply')
library(heatmaply)

cor.coef <- cor(c2_sums)

# Compute correlation p-values
cor.test.p <- function(x){
  FUN <- function(x, y) cor.test(x, y)[["p.value"]]
  z <- outer(
    colnames(x), 
    colnames(x), 
    Vectorize(function(i,j) FUN(x[,i], x[,j]))
  )
  dimnames(z) <- list(colnames(x), colnames(x))
  z
}
p <- cor.test.p(cor.coef)
Hmisc::rcorr(as.matrix(c2_sums))$r
Hmisc::rcorr(as.matrix(c2_sums))$P
p

c2_sums[, cor.test(c2_11, c2_6)$p.value]

heatmaply_cor(
  corrmatrix$r,
  node_type = "scatter",
  point_size_mat = corrmatrix$P, 
  label_names = c('x', 'y', 'r')  
)

corrmatrix <- Hmisc::rcorr(as.matrix(mtcars))
heatmaply_cor(
  corrmatrix$r,
  node_type = "scatter",
  point_size_mat = NULL, 
  point_size_name = 'xxx',
  label_names = c('x', 'y', 'r')  
)



corrmatrix <- Hmisc::rcorr(as.matrix(c2_sums))
corr_dt <- flattenCorrMatrix(corrmatrix$r, corrmatrix$P)
setDT(corr_dt)
# corr_dt[, p := round(p, 3)]
corr_dt[p >= 0.05, cor := NULL]

corrmatrix_w <- dcast(corr_dt, row ~ column, value.var = 'cor')
rownames(corrmatrix_w) <- corrmatrix_w[, row]
corrmatrix_w[, row := NULL]

heatmaply_cor(
  corrmatrix_w,
  node_type = "scatter",
  point_size_mat = corrmatrix_w, 
  point_size_name = "Pearson's r",
  custom_hovertext = corrmatrix$P,
  label_names = c('x', 'y', 'Correlation')  
)

corrmatrix

corr_dt <- merge(
  corr_dt,
  unique(big_model[, list(row = paste0('c2_', c2), C2_row = C2)]),
  by = 'row', all.x = TRUE
)

corr_dt <- merge(
  corr_dt,
  unique(big_model[, list(column = paste0('c2_', c2), C2_col = C2)]),
  by = 'column', all.x = TRUE
)

corr_dt[, hover := paste0(
  C2_row, '<br>',
  C2_col, '<br>', 
  "Pearson's r = ", cor, '<br>',
  'p-value = ', p
)]


heatmaply_cor_func <- function(df) {
  df[p >= 0.05, cor := NULL]
  corrmatrix_w <- dcast(df, C2_row ~ C2_col, value.var = 'cor')
  rownames(corrmatrix_w) <- corrmatrix_w[, C2_row]
  corrmatrix_w[, C2_row := NULL]  
  
  corrmatrix_hover <- dcast(df, C2_row ~ C2_col, value.var = 'hover')
  rownames(corrmatrix_hover) <- corrmatrix_hover[, C2_row]
  corrmatrix_hover[, C2_row := NULL]   
  list(
    coeffs = corrmatrix_w,
    hover = corrmatrix_hover
  )
}

heatmaply_cor(
  corrmatrix$r,
  node_type = "scatter",
  point_size_mat = heatmaply_cor_func(corr_dt)$coeffs, 
  # point_size_name = '',
  # custom_hovertext = heatmaply_cor_func(corr_dt)$hover,
  hclust_method = 'ward.D',
  # dendrogram = 'row',
  label_names = c('x', 'y', 'Correlation')  
)

heatmaply_cor(
  long_data = corr_dt[, list(name = C2_row, variable = C2_col, value = cor)],
  node_type = "scatter",
  # point_size_mat = heatmaply_cor_func(corr_dt)$coeffs, 
  # point_size_name = "Pearson's r",
  # custom_hovertext = heatmaply_cor_func(corr_dt)$hover,
  hclust_method = 'ward.D',
  dendrogram = 'row',
  label_names = c('x', 'y', 'Correlation')  
)




tmp <- heatmaply_cor_func(corr_dt)
cor(mtcars)

library(ggcorrplot)
library(plotly)
ggcorrplot(corrmatrix$r, p.mat = corrmatrix$P, hc.order = TRUE,
           type = "lower", insig = "blank", lab = TRUE, ggtheme = theme_void()) %>% 
  ggplotly(
    howerinfo = 'text',
    text = 'blabla'
  ) %>%
  layout(
    yaxis = list(title = '')
  )







loadings_matrix <- unclass(efa_result$loadings)
loadings_dt <- as.data.table(loadings_matrix, keep.rownames = 'q')

loadings_dt[, h2 := efa_result$communality]
loadings_dt[, u2 := efa_result$uniquenesses]
loadings_dt[, com := efa_result$complexity]

loadings_dt[, max_loading := do.call(pmax, lapply(.SD, abs)), .SDcols = patterns('ML')]

loadings_dt[, list(
  total_items = .N,
  loadings_03 = sum(max_loading > 0.3),
  communality_weak = sum(h2 < 0.4),
  complexity_high = sum(com > 2)
)]


factor_grid <- lapply(4:14, function(x) {
  efa_result <- fa(competencies_data, nfactors = x, rotate = "varimax", fm = "ml")  
  loadings_matrix <- unclass(efa_result$loadings)
  loadings_dt <- as.data.table(loadings_matrix, keep.rownames = 'q')
  
  loadings_dt[, h2 := efa_result$communality]
  loadings_dt[, u2 := efa_result$uniquenesses]
  loadings_dt[, com := efa_result$complexity]
  
  loadings_dt[, max_loading := do.call(pmax, lapply(.SD, abs)), .SDcols = patterns('ML')]
  
  loadings_dt[, list(
    n_factors = x,
    rotation = 'oblimin',
    CFI = round(efa_result$CFI, 3),
    p.value = round(efa_result$PVAL, 3),
    RMSEA = round(efa_result$RMSEA[1], 3),
    total_items = .N,
    items_loadings_03 = sum(max_loading > 0.3),
    items_communality_weak = sum(h2 < 0.4),
    items_complexity_high = sum(com > 2)
  )]
}
)
factor_grid <- rbindlist(factor_grid)
factor_grid
