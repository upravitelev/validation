library(data.table)
library(glue)
library(lavaan)
library(googlesheets4)


# google spreadsheet ------------------------------------------------------

# install.packages('googlesheets4')
library(googlesheets4)
# ss <- gs4_create("2025_03_01_survey_validation")



# big model ---------------------------------------------------------------
big_model <- fread('big_model.csv')

big_model[, C1 := tolower(C1)]
big_model[, C2 := tolower(C2)]
big_model[, C3 := tolower(C3)]

big_model[, c1 := .GRP, by = C1]
big_model[, c2 := .GRP, by = C2]
big_model[, c3 := .GRP, by = C3]


# questions ---------------------------------------------------------------

questions <- fread('questions.csv')
questions[, competence_ru := tolower(competence_ru)]
questions[, question_ru := tolower(question_ru)]
questions <- questions[order(question_ru)]

questions[, q := paste0('q_', .I)]
questions[, q_order := seq_len(.N)]

question_matrix <- dcast(questions, q + question_ru ~ competence_ru, fun.aggregate = length)
question_matrix[, mult := rowSums(.SD), .SDcols = 3:length(question_matrix)]

questions <- merge(questions, big_model[, list(C1, c1, C2, c2, C3, c3)], by.x = 'competence_ru', by.y = 'C3', all.x = TRUE)

fwrite(questions, './data/questions.csv')

# questionnaire -----------------------------------------------------------

questionnaire <- fread('questionnaire.csv')
questionnaire_names <- data.table(
  question_ru = tolower(names(questionnaire))
)

questionnaire_names[c(1:9, 232), question_type := 'info']
questionnaire_names[10:146, question_type := 'competencies']
questionnaire_names[147:160, question_type := 'empathy']
questionnaire_names[161:170, question_type := 'TIPI']
questionnaire_names[171:185, question_type := 'MAAS']
questionnaire_names[186:231, question_type := 'SSPM']

# questionnaire_names[, q_number := seq_len(.N), by = question_type]

questionnaire_names[, question_ru := gsub('[0-9]*\\.\\s+', '', question_ru)]

questionnaire_names <- merge(questionnaire_names, questions, by = 'question_ru', all.x = TRUE)

c2_info <- questionnaire_names[question_type == 'competencies']
c2_questions <- c2_info[order(q_order), question_ru]
c2_q_numbers <- c2_info[order(q_order), q]

fwrite(questionnaire_names, './data/questionnaire_names.csv')

# model declaration -------------------------------------------------------

# questions[, sort(unique(c2))]
# questions[c2 == 2, paste(glue('c{2} ~='), paste(q, collapse = ' + '))]

c2_names <- questions[question_ru %in% c2_info[, unique(question_ru)], sort(unique(c2))]

c2_declarations <- lapply(c2_names, function(x) questions[c2 == x & question_ru %in% c2_questions, paste(glue('c{x} =~'), paste(q, collapse = ' + '))])
c2_declarations <- paste(c2_declarations, collapse = '\n\n')

c2_declarations_corr <- paste(
  c2_declarations,
  paste(paste(paste('c', c2_names, sep = ''), collapse = ' + '), ' ~~ ', paste(paste('c', c2_names, sep = ''), collapse = ' + ')),
  sep = '\n\n'
)

c2_declarations_corr <- paste(
  c2_declarations,
  '
  c2  ~~ c3  + c5  + c6  + c8  + c9  + c10 + c11
  c3  ~~ c5  + c6  + c8  + c9  + c10 + c11
  c5  ~~ c6  + c8  + c9  + c10 + c11
  c6  ~~ c8  + c9  + c10 + c11
  c8  ~~ c9  + c10 + c11
  c9  ~~ c10 + c11
  c10 ~~ c11
  ',
  sep = '\n\n'
)



# cat(c2_declarations)
# cat(c2_declarations_corr)

# model data --------------------------------------------------------------

c2_data <- copy(questionnaire)
names(c2_data) <- tolower(names(c2_data))
names(c2_data) <- gsub('[0-9]*\\.\\s+', '', names(c2_data))

c2_data <- c2_data[, .SD, .SDcols = c2_questions]
names(c2_data) <- c2_q_numbers
# View(data.table(names(c2_data)))

# c2_data[, replace(.SD, .SD == 'Совершенно не верно', -2)]

c2_data[, (c2_q_numbers) := replace(.SD, .SD == 'Совершенно не верно', -2), .SDcols = c2_q_numbers]
c2_data[, (c2_q_numbers) := replace(.SD, .SD == 'Скорее не верно', -1), .SDcols = c2_q_numbers]
c2_data[, (c2_q_numbers) := replace(.SD, .SD == 'Скорее верно', 1), .SDcols = c2_q_numbers]
c2_data[, (c2_q_numbers) := replace(.SD, .SD == 'Совершенно верно', 2), .SDcols = c2_q_numbers]
c2_data[, (c2_q_numbers) := lapply(.SD, as.numeric), .SDcols = c2_q_numbers]

fwrite(c2_data, './data/c2_data.csv')

# model fit ---------------------------------------------------------------

fit_mlr <- cfa(model = c2_declarations, data = c2_data, estimator = 'MLR')
saveRDS(fit_mlr, 'fit_mlr')

fit_ml <- cfa(model = c2_declarations, data = c2_data, estimator = 'ML')
saveRDS(fit_ml, 'fit_ml')

fit_wlsmv <- cfa(model = c2_declarations, data = c2_data, estimator = 'WLSMV')

summary(fit, fit.measures = TRUE, standardized = TRUE)

summary(fit_mlr)

summary(fit_mlr, fit.measures = TRUE, standardized = TRUE)
summary(fit_ml, fit.measures = TRUE, standardized = TRUE)

fit_corr_mlr <- cfa(model = c2_declarations_corr, data = c2_data, estimator = 'MLR')
saveRDS(fit_corr_mlr, 'fit_corr_mlr')
summary(fit_corr_mlr, fit.measures = TRUE, standardized = TRUE)
inspect(fit_corr_mlr, "cor.lv")


# coefficients ------------------------------------------------------------

coeffs <- data.table(parameterEstimates(fit_corr_mlr))[op == '=~']
coeffs_lowp <- coeffs[pvalue < 0.05 | is.na(pvalue)]
# coeffs_lowp <- coeffs_lowp[op == '=~']

c2_declarations_cleaned <- coeffs_lowp[, list(paste(lhs, '=~', paste(rhs, collapse = ' + ') )), by = lhs]
c2_declarations_cleaned <- c2_declarations_cleaned[, paste(V1, collapse = '\n\n')]

fit_mlr_cleaned <- cfa(model = c2_declarations_cleaned, data = c2_data, estimator = 'MLR')
saveRDS(fit_mlr_cleaned, 'fit_mlr_cleaned')


fitMeasures(fit_mlr, c("cfi", "rmsea", "srmr", "chisq", "df"))
fitMeasures(fit_mlr_cleaned, c("cfi", "rmsea", "srmr", "chisq", "df"))
fitMeasures(fit_corr_mlr, c("cfi", "rmsea", "srmr", "chisq", "df"))

coeffs_cleaned <- data.table(parameterEstimates(fit_mlr_cleaned))[op == '=~']
coeffs_cleaned_lowp <- coeffs_cleaned[pvalue < 0.05 | is.na(pvalue)]
coeffs_cleaned[pvalue >= 0.05, .N]


coeffs[, .N, by = lhs]
coeffs_cleaned_lowp[, .N, by = lhs]


c2_declarations_cleand_corr <- paste(
  c2_declarations_cleaned,
  '
  c2  ~~ c3  + c5  + c6  + c8  + c9  + c10 + c11
  c3  ~~ c5  + c6  + c8  + c9  + c10 + c11
  c5  ~~ c6  + c8  + c9  + c10 + c11
  c6  ~~ c8  + c9  + c10 + c11
  c8  ~~ c9  + c10 + c11
  c9  ~~ c10 + c11
  c10 ~~ c11
  ',
  sep = '\n\n'
)

fit_mlr_corr_cleaned <- cfa(model = c2_declarations_cleand_corr, data = c2_data, estimator = 'MLR')
saveRDS(fit_mlr_corr_cleaned, 'fit_mlr_corr_cleaned')


# excluded questions ------------------------------------------------------

scales_questions <- merge(
  # coeffs[, list(full_model = .N), keyby = lhs],
  c2_info[, list(full_model = .N), keyby = list(lhs = paste0('c', c2), C1, C2)],
  coeffs_cleaned_lowp[, list(trimmed_model = .N), by = lhs],
  by = 'lhs', all.x = TRUE
)
scales_questions[, excluded := full_model - trimmed_model]

write_sheet(
  data = scales_questions,
  ss = ss,
  sheet = 'excluded_amount'
)

# scales_questions
# c2_info[!q %in% coeffs_cleaned_lowp[, lhs], list(lhs = paste0('c', c2), C1, C2, q, question_ru)]
c2_info_excluded <- c2_info[, list(C1, c1, C2, c2, c3, q, q_order, question_ru)]
c2_info_excluded <- merge(c2_info_excluded, big_model[, list(c3, C3, description)], by = 'c3', all.x = TRUE)
c2_info_excluded[, status := ifelse(q %in% coeffs_cleaned_lowp[, rhs], 'used', 'excluded')]

c2_info_excluded <- c2_info_excluded[order(c1, c2, c3, q_order)]

c2_info_excluded[, c1 := NULL]
c2_info_excluded[, c2 := NULL]
c2_info_excluded[, c3 := NULL]
c2_info_excluded[, q_order := NULL]

write_sheet(
  data = c2_info_excluded,
  ss = ss,
  sheet = 'excluded_questions'
)


# c2_info[, .N, keyby = list(lhs = paste0('c', c2), C1, C2)]


# cross-loads -------------------------------------------------------------

modindices <- modindices(fit_mlr_cleaned, sort = TRUE)
setDT(modindices)

modindices_cut <- modindices[op == '=~' & mi > 15]
modindices_cut <- modindices_cut[order(rhs, -mi)]
modindices_cut[, mi_rnd := round(mi, 2)]

indices_table <- rbind(
  modindices_cut[, list(type = 'cross-loads', lhs, rhs, mi = round(mi, 2))],
  coeffs_lowp[, list(type = 'model', lhs, rhs, mi = 100, pvalue = round(pvalue, 5))],
  fill = TRUE
)

indices_table[, n_factors := .N, by = rhs]
indices_table <- indices_table[n_factors > 1]

indices_table <- merge(
  indices_table,
  questionnaire_names[, list(rhs = q, question_ru, c3)],
  by = 'rhs', all.x = TRUE
)

indices_table <- merge(
  indices_table,
  unique(big_model[, list(lhs = paste0('c', c2), C1, C2)]),
  by = c('lhs'), all.x = TRUE
)

indices_table <- merge(
  indices_table,
  unique(big_model[, list(lhs = paste0('c', c2), c3, C3, description)]),
  by = c('lhs', 'c3'), all.x = TRUE
)

indices_table <- indices_table[order(rhs, -type, -mi)]
indices_table[, n_factors := NULL]

write_sheet(
  data = indices_table,
  ss = ss,
  sheet = 'cross-loads'
)



# updated model -----------------------------------------------------------

modindices_high_loads <- modindices_cut[, .SD[1], by = rhs]
modindices_high_loads

coeffs_lowp[, unique(lhs)]

# c2_declarations_mod <- lapply(coeffs_lowp[, unique(lhs)], function(x) {
#   questions <- c(coeffs_lowp[lhs == x, rhs], modindices_high_loads[lhs == x, rhs])
#   questions <- sort(unique(questions))
#   model <- paste(questions, collapse = ' + ')
#   paste(x, '=~', model)
# })

c2_declarations_mod <- lapply(coeffs_lowp[, unique(lhs)], function(x) {
  if (x == 'c3') {
    questions <- c(coeffs_lowp[lhs %in% c('c3', 'c9'), rhs], modindices_high_loads[lhs %in% c('c3', 'c9'), rhs])
  }
  else {
    questions <- c(coeffs_lowp[lhs == x, rhs], modindices_high_loads[lhs == x, rhs])
  }
  questions <- sort(unique(questions))
  model <- paste(questions, collapse = ' + ')
  paste(x, '=~', model)
})
c2_declarations_mod <- c2_declarations_mod[-6]

c2_declarations_mod <- paste(c2_declarations_mod, collapse = '\n')
cat(c2_declarations_mod)

fit_mlr_mod <- cfa(model = c2_declarations_mod, data = c2_data, estimator = 'MLR')
saveRDS(fit_mlr_mod, 'fit_mlr_mod')

lavInspect(fit_mlr_mod, "converged")

inspect(fit_mlr_mod, "cor.lv")
inspect(fit_mlr_cleaned, "cor.lv")
inspect(fit_mlr, "cor.lv")

View(modindices(fit_mlr_mod, sort = TRUE))


fitMeasures(fit_mlr, c("cfi", "rmsea", "srmr", "chisq", "df"))
fitMeasures(fit_mlr_cleaned, c("cfi", "rmsea", "srmr", "chisq", "df"))
fitMeasures(fit_mlr_mod, c("cfi", "rmsea", "srmr", "chisq", "df"))


q_84 + q_139 + q_141 + q_165 + q_201 + q_67 + q_200
q_81 + q_164 + q_230 + q_139 + q_141 + q_201 + q_206 + q_208 + q_225 + q_6 + q_84

c3 =~ q_84 + q_139 + q_141 + q_165 + q_201 / + q_67 + q_200
c9 =~ q_81 + q_164 + q_230 / + q_139 + q_141 + q_201 + q_206 + q_208 + q_225 + q_6 + q_84

cat(c2_declarations_cleaned)
modindices[lhs == 'c2' & mi > 10][order(rhs), paste(rhs, collapse = ' + ')]
modindices[lhs == 'c3' & mi > 10][order(rhs), paste(rhs, collapse = ' + ')]
modindices[lhs == 'c5' & mi > 10][order(rhs), paste(rhs, collapse = ' + ')]
modindices[lhs == 'c6' & mi > 10][order(rhs), paste(rhs, collapse = ' + ')]

modindices[, uniqueN(rhs)]


# MIMIC -------------------------------------------------------------------
c2_data_ext <- cbind(
  c2_data, 
  questionnaire[, list(
    gender = `Пол`, 
    experience = `Каков ваш стаж в психологическом консультировании?`, 
    age = `Сколько вам лет?`, 
    is_psychologist = `Есть ли у вас высшее психологическое образование?`)]
)

questionnaire[, .N, by = list(gender = `Пол`)]
c2_data_ext <- c2_data_ext[gender != 'Другое']

questionnaire[, .N, by = list(experience = `Каков ваш стаж в психологическом консультировании?`)]
questionnaire[, .N, by = list(is_psychologist = `Есть ли у вас высшее психологическое образование?`)]



fit_configural <- cfa(c2_declarations_cleaned, data = c2_data_ext, group = "gender", estimator = "MLR")
summary(fit_configural, fit.measures = TRUE)


# fit_metric <- cfa(c2_declarations_cleaned, data = c2_data_ext, group = "gender", group.equal = "loadings", estimator = "MLR")
# anova(fit_configural, fit_metric)  # Compare to configural model
# 
# fit_scalar <- cfa(c2_declarations_cleaned, data = c2_data_ext, group = "gender", group.equal = c("loadings", "intercepts"), estimator = "MLR")
# anova(fit_metric, fit_scalar)  # Compare to metric model
# 
# 
# fit_residual <- cfa(c2_declarations_cleaned, data = c2_data_ext, group = "gender", group.equal = c("loadings", "intercepts", "residuals"), estimator = "MLR")
# anova(fit_scalar, fit_residual)

fit_configural <- cfa(c2_declarations_cleaned, data = c2_data_ext, group = "experience", estimator = "MLR")
summary(fit_configural, fit.measures = TRUE)















