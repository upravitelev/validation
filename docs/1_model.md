# CFA {#cfa}







## модель на 8 компетенций

Самая простая модель на 8 компетенций среднего уровня (с2). Это исходная модель, которая описана в статье. С помощью конфирматорного факторного анализа проверяем, насколько теоретическая структура модели присутствует в данных.

Декларация модели такая:


```
## c2 =~ q_6 + q_157 + q_174 + q_179 + q_4 + q_119 + q_158 + q_208 + q_227
## 
## c3 =~ q_84 + q_139 + q_141 + q_165 + q_201
## 
## c5 =~ q_40 + q_171 + q_215 + q_34 + q_130 + q_151 + q_182 + q_221 + q_89 + q_115 + q_175 + q_223 + q_62 + q_88 + q_212 + q_86 + q_90 + q_32 + q_206 + q_46 + q_48 + q_79 + q_203 + q_104 + q_117 + q_123 + q_229
## 
## c6 =~ q_2 + q_60 + q_128 + q_207 + q_211 + q_21 + q_22 + q_97 + q_155 + q_26 + q_216 + q_225 + q_11 + q_14 + q_17 + q_28 + q_168
## 
## c8 =~ q_74 + q_134 + q_204 + q_214 + q_19 + q_51 + q_76 + q_85 + q_228 + q_56 + q_113 + q_138 + q_193 + q_200 + q_10 + q_67 + q_87 + q_131 + q_185 + q_65 + q_91 + q_132 + q_184 + q_15 + q_23 + q_96 + q_194 + q_195 + q_24 + q_25 + q_69 + q_148 + q_149 + q_199 + q_202 + q_30 + q_73 + q_95 + q_146 + q_154
## 
## c9 =~ q_81 + q_147 + q_164 + q_230
## 
## c10 =~ q_36 + q_80 + q_126 + q_136 + q_183 + q_186 + q_7 + q_33 + q_43 + q_57 + q_107 + q_190 + q_127 + q_133 + q_152 + q_153 + q_166 + q_197
## 
## c11 =~ q_8 + q_72 + q_93 + q_111 + q_144 + q_196 + q_55 + q_77 + q_106 + q_118 + q_125 + q_177 + q_1 + q_109 + q_129 + q_176 + q_210
```

Модель сходится относительно неплохо:


```
##   cfi rmsea  srmr 
## 0.456 0.054 0.078
```

Индекс CFI (сравнение с моделью без латентных факторов) невысок, так как для хороших моделей значение должно быть выше 0.9, а лучше -- выше 0.95. 
Возможные способы улучшить модель -- пересмотреть факторную структуру или добавить кросс-нагрузки (когда один вопрос относится к нескольким факторам).

Референсные значения для RMSEA (оценка сложности модели) -- чем ниже, тем лучше, ниже 0.05 очень хорошее качество, ниже 0.08 -- приемлемое.

Референсные значения для SRMR (насколько хорошо модель воспроизводит наблюдаемые корреляции) -- чем ниже, тем лучше, ниже 0.05 очень хорошее качество, ниже 0.08 -- приемлемое.


## очищенная модель 

Ряд вопросов имеют низкий / незначимый вклад, поэтому их лучше удалить из модели. Вот список компетенций с исходным количеством вопросов и удаленными вопросами:

<table class="table" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> c2 </th>
   <th style="text-align:left;"> C1 </th>
   <th style="text-align:left;"> C2 </th>
   <th style="text-align:right;"> full_model </th>
   <th style="text-align:right;"> trimmed_model </th>
   <th style="text-align:right;"> excluded </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> c2 </td>
   <td style="text-align:left;"> процесс терапии </td>
   <td style="text-align:left;"> альянс и сеттинг - 1 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> c3 </td>
   <td style="text-align:left;"> процесс терапии </td>
   <td style="text-align:left;"> альянс и сеттинг - 2 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> c5 </td>
   <td style="text-align:left;"> отношения </td>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> c6 </td>
   <td style="text-align:left;"> отношения </td>
   <td style="text-align:left;"> отношения-2 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> c8 </td>
   <td style="text-align:left;"> работа с изменениями </td>
   <td style="text-align:left;"> работа с изменениями </td>
   <td style="text-align:right;"> 40 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> c9 </td>
   <td style="text-align:left;"> профессионализм </td>
   <td style="text-align:left;"> профессионализм-1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> c10 </td>
   <td style="text-align:left;"> профессионализм </td>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> c11 </td>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

После удаления вопросов метрики модели выглядят следующим образом:


```
##   cfi rmsea  srmr 
## 0.551 0.054 0.073
```


## метрики качества c2-моделей

Метрики качества модели без знасимых вопросов практически не изменились. Сводная таблица всех четырех моделей (с корреляцией факторов / без корреляции, с удалением незначимых вопровов / все вопросы) выглядит следующим образом:


```
##                 model    cfi  rmsea   srmr
##                <char> <char> <char> <char>
## 1:      all questions  0.456  0.054  0.078
## 2: excluded questions  0.551  0.054  0.073
```

Удаление незначимых вопросов немного улучшает качество структуры модели, но оно все еще недостаточно. Дальнейшие действия возможные тут --- добавление кросс-нагрузок вопросов в разные факторы. Либо пересмотр всей модели в целом с помощью разведочного факторного анализа.

Однако это все требует теоретического пересмотра модели компетенций, и может быть излишним для текущей задачи.



