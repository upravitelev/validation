# EFA {#efa}





```
## [1] 0
```


## Размеры шкал

Основная проблема в модели на уровне с2-шкал --- неравномерность шкал по количеству вопросов. Эта неравномерность вызвана тем, что от исходной модели опросника на 230 вопросов в количественном исследовании было использовано всего 137 вопросов. Остальные вопросы (и, соответственно, (суб)шкалы), было решено оценивать акачественными методами.

В результате в некоторых шкалах всего 3 вопроса, а в некоторых --- до 27:

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


## Модель с3-шкал

Самый простой способ решить эту проблему -- оценить структуру опросника на уровне дробных с3-шкал. Это помогло бы оценить вклады тех или иных вопросов, или же просто расширить количество шкал опросника.

Однако модель на 30 факторов не сходится, даже если предположить скоррелированность латентных факторов.


```
## lavaan 0.6-19 did NOT end normally after 6672 iterations
## ** WARNING ** Estimates below are most likely unreliable
## 
##   Estimator                                         ML
##   Optimization method                           NLMINB
##   Number of model parameters                       709
## 
##   Number of observations                           563
```

Если рассматривать каждую из 30 шкал отдельно, то видно, что есть несколько шкал, по которым даже маленькая модель сойтись не может. 


| c3| c2| n_questions|cfi                                                       |rmsea                                                     |srmr                                                      |
|--:|--:|-----------:|:---------------------------------------------------------|:---------------------------------------------------------|:---------------------------------------------------------|
|  3|  2|           4|<span style="     color: red !important;" >0.879</span>   |<span style="     color: red !important;" >0.169</span>   |<span style="     color: black !important;" >0.066</span> |
|  5|  2|           5|<span style="     color: red !important;" >0.889</span>   |<span style="     color: red !important;" >0.154</span>   |<span style="     color: black !important;" >0.061</span> |
|  8|  3|           5|<span style="     color: red !important;" >0.863</span>   |<span style="     color: red !important;" >0.2</span>     |<span style="     color: black !important;" >0.066</span> |
| 12|  5|           2|<span style="     color: black !important;" >NA</span>    |<span style="     color: black !important;" >NA</span>    |<span style="     color: black !important;" >NA</span>    |
| 13|  5|           4|<span style="     color: black !important;" >0.976</span> |<span style="     color: black !important;" >0.077</span> |<span style="     color: black !important;" >0.031</span> |
| 14|  5|           4|<span style="     color: black !important;" >0.917</span> |<span style="     color: red !important;" >0.096</span>   |<span style="     color: black !important;" >0.041</span> |
| 15|  5|           3|<span style="     color: black !important;" >1</span>     |<span style="     color: black !important;" >0</span>     |<span style="     color: black !important;" >0</span>     |
| 16|  5|           5|<span style="     color: red !important;" >0.733</span>   |<span style="     color: red !important;" >0.226</span>   |<span style="     color: red !important;" >0.117</span>   |
| 17|  5|           3|<span style="     color: black !important;" >1</span>     |<span style="     color: black !important;" >0</span>     |<span style="     color: black !important;" >0</span>     |
| 18|  5|           4|<span style="     color: black !important;" >0.997</span> |<span style="     color: black !important;" >0.034</span> |<span style="     color: black !important;" >0.017</span> |
| 19|  5|           2|<span style="     color: black !important;" >NA</span>    |<span style="     color: black !important;" >NA</span>    |<span style="     color: black !important;" >NA</span>    |
| 20|  6|           3|<span style="     color: black !important;" >NA</span>    |<span style="     color: black !important;" >NA</span>    |<span style="     color: black !important;" >NA</span>    |
| 21|  6|           5|<span style="     color: red !important;" >0.868</span>   |<span style="     color: red !important;" >0.107</span>   |<span style="     color: black !important;" >0.056</span> |
| 22|  6|           4|<span style="     color: black !important;" >NA</span>    |<span style="     color: black !important;" >NA</span>    |<span style="     color: black !important;" >NA</span>    |
| 23|  6|           5|<span style="     color: red !important;" >0.776</span>   |<span style="     color: red !important;" >0.111</span>   |<span style="     color: black !important;" >0.063</span> |
| 25|  8|           5|<span style="     color: red !important;" >0.706</span>   |<span style="     color: red !important;" >0.134</span>   |<span style="     color: black !important;" >0.075</span> |
| 26|  8|           5|<span style="     color: red !important;" >0.64</span>    |<span style="     color: red !important;" >0.175</span>   |<span style="     color: red !important;" >0.094</span>   |
| 27|  8|           5|<span style="     color: red !important;" >0.837</span>   |<span style="     color: red !important;" >0.086</span>   |<span style="     color: black !important;" >0.052</span> |
| 28|  8|           4|<span style="     color: red !important;" >0.851</span>   |<span style="     color: red !important;" >0.111</span>   |<span style="     color: black !important;" >0.047</span> |
| 29|  8|           5|<span style="     color: black !important;" >0.957</span> |<span style="     color: red !important;" >0.089</span>   |<span style="     color: black !important;" >0.037</span> |
| 30|  8|           4|<span style="     color: red !important;" >0.521</span>   |<span style="     color: red !important;" >0.261</span>   |<span style="     color: red !important;" >0.109</span>   |
| 31|  8|           7|<span style="     color: black !important;" >0.906</span> |<span style="     color: red !important;" >0.122</span>   |<span style="     color: black !important;" >0.064</span> |
| 32|  8|           5|<span style="     color: red !important;" >0.881</span>   |<span style="     color: black !important;" >0.069</span> |<span style="     color: black !important;" >0.041</span> |
| 36|  9|           4|<span style="     color: red !important;" >0.845</span>   |<span style="     color: red !important;" >0.2</span>     |<span style="     color: black !important;" >0.077</span> |
| 37| 10|           6|<span style="     color: red !important;" >0.875</span>   |<span style="     color: red !important;" >0.132</span>   |<span style="     color: black !important;" >0.072</span> |
| 38| 10|           6|<span style="     color: red !important;" >0.872</span>   |<span style="     color: red !important;" >0.114</span>   |<span style="     color: black !important;" >0.053</span> |
| 39| 10|           6|<span style="     color: black !important;" >0.971</span> |<span style="     color: black !important;" >0.064</span> |<span style="     color: black !important;" >0.035</span> |
| 40| 11|           5|<span style="     color: black !important;" >0.915</span> |<span style="     color: red !important;" >0.145</span>   |<span style="     color: black !important;" >0.052</span> |
| 41| 11|           6|<span style="     color: red !important;" >0.873</span>   |<span style="     color: red !important;" >0.103</span>   |<span style="     color: black !important;" >0.057</span> |
| 42| 11|           6|<span style="     color: red !important;" >0.888</span>   |<span style="     color: red !important;" >0.127</span>   |<span style="     color: black !important;" >0.067</span> |

Как правило, такое происходит в нескольких ситуациях:

 - вопросы либо очень слабо, либо очень сильно скоррелированы
 - есть много пропусков или недостаточно респондентов
 - не учтена ситуация, когда один вопрос может в реальности относиться к нескольким факторам (кросс-нагрузки)

## EFA, с3 = 5

Я попробовал переразбить вопросы шкалы с2 = 5 (отношения-1) на две субшкалы. Для этого я использовал эксплораторный факторный анализ с oblimin-вращением. Вращение нужно, что сделать структуру более интерпретабельной, а также выровнять факторы, так как без вращения первый фактор всегда забирает максимум дисперсии и, соответственно, остальные факторы меньше по количеству вопросов и менее интерпретабельны.


```
## 
## Loadings:
##       MR1    MR2   
## q_40               
## q_171              
## q_215         0.589
## q_34               
## q_130              
## q_151              
## q_182  0.410       
## q_221              
## q_89   0.652       
## q_115              
## q_175              
## q_223  0.654       
## q_62   0.480       
## q_88   0.415       
## q_212              
## q_86   0.549       
## q_90               
## q_32   0.476       
## q_206  0.508       
## q_46   0.456       
## q_48   0.657       
## q_79               
## q_203  0.576       
## q_104              
## q_117         0.409
## q_123         0.693
## q_229              
## 
##                  MR1   MR2
## SS loadings    4.125 1.556
## Proportion Var 0.153 0.058
## Cumulative Var 0.153 0.210
```
Диаграмма, дисперсия каких вопросов каким фактором объясняется, выглядит вот так.
<img src="2_scales_files/figure-html/unnamed-chunk-7-1.png" width="672" />

Таблица вопросов с маркером объясняющего их фактора:

<table class="table" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> C2 </th>
   <th style="text-align:right;"> c2 </th>
   <th style="text-align:right;"> c3 </th>
   <th style="text-align:left;"> q </th>
   <th style="text-align:left;"> competence_ru </th>
   <th style="text-align:left;"> question_ru </th>
   <th style="text-align:right;"> MR1 </th>
   <th style="text-align:right;"> MR2 </th>
   <th style="text-align:right;"> factor_number </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> q_206 </td>
   <td style="text-align:left;"> принятие </td>
   <td style="text-align:left;"> я с уважением отношусь к личности, мировоззрению, ценностям клиента и стараюсь продемонстрировать это </td>
   <td style="text-align:right;"> 0.508 </td>
   <td style="text-align:right;"> 0.056 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> q_32 </td>
   <td style="text-align:left;"> принятие </td>
   <td style="text-align:left;"> когда я слушал(а) клиента, то смотрел(а) на него, активно поддерживая контакт </td>
   <td style="text-align:right;"> 0.476 </td>
   <td style="text-align:right;"> 0.028 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:left;"> q_223 </td>
   <td style="text-align:left;"> перефразирование и пересказ </td>
   <td style="text-align:left;"> я уточнял(а) у клиента, правильно ли я его понимаю </td>
   <td style="text-align:right;"> 0.654 </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:left;"> q_89 </td>
   <td style="text-align:left;"> перефразирование и пересказ </td>
   <td style="text-align:left;"> я использовал(а) перефразирование, чтобы убедиться, что правильно понимаю клиента </td>
   <td style="text-align:right;"> 0.652 </td>
   <td style="text-align:right;"> -0.045 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:left;"> q_62 </td>
   <td style="text-align:left;"> поддержка </td>
   <td style="text-align:left;"> я говорил(а) клиентам слова одобрения и поддержки в процессе работы </td>
   <td style="text-align:right;"> 0.480 </td>
   <td style="text-align:right;"> 0.063 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:left;"> q_88 </td>
   <td style="text-align:left;"> поддержка </td>
   <td style="text-align:left;"> я использовал(а) невербальные способы поддержки клиента </td>
   <td style="text-align:right;"> 0.415 </td>
   <td style="text-align:right;"> -0.079 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:left;"> q_182 </td>
   <td style="text-align:left;"> невербальные навыки </td>
   <td style="text-align:left;"> я подстраивался(лась) под позу, тембр и манеру речи клиента </td>
   <td style="text-align:right;"> 0.410 </td>
   <td style="text-align:right;"> -0.177 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:left;"> q_203 </td>
   <td style="text-align:left;"> резюмирование </td>
   <td style="text-align:left;"> я резюмировал(а) слова клиента </td>
   <td style="text-align:right;"> 0.576 </td>
   <td style="text-align:right;"> 0.036 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:left;"> q_46 </td>
   <td style="text-align:left;"> резюмирование </td>
   <td style="text-align:left;"> по следам рассказа клиента я обобщал(а) суть его переживаний и размышлений </td>
   <td style="text-align:right;"> 0.456 </td>
   <td style="text-align:right;"> -0.024 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:left;"> q_48 </td>
   <td style="text-align:left;"> резюмирование </td>
   <td style="text-align:left;"> после рассказа клиента я кратко резюмировал(а) ему суть сказанного </td>
   <td style="text-align:right;"> 0.657 </td>
   <td style="text-align:right;"> 0.076 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:left;"> q_86 </td>
   <td style="text-align:left;"> понятность </td>
   <td style="text-align:left;"> я использовал(а) метафоры и аналогии, чтобы клиенту было понятнее, что я имел(а) в виду </td>
   <td style="text-align:right;"> 0.549 </td>
   <td style="text-align:right;"> -0.046 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:left;"> q_117 </td>
   <td style="text-align:left;"> эмпатия </td>
   <td style="text-align:left;"> я не называл(а) чувства клиента, он сам должен осознавать и называть их </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> 0.409 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:left;"> q_123 </td>
   <td style="text-align:left;"> эмпатия </td>
   <td style="text-align:left;"> я не отзеркаливал(а) чувства клиента, чтобы не вовлечься в его переживания и быть в состоянии помочь ему </td>
   <td style="text-align:right;"> -0.007 </td>
   <td style="text-align:right;"> 0.693 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:left;"> q_215 </td>
   <td style="text-align:left;"> конгруэнтность </td>
   <td style="text-align:left;"> я старался(лась) не показывать клиенту свои чувства, возникающие в процессе терапии </td>
   <td style="text-align:right;"> 0.059 </td>
   <td style="text-align:right;"> 0.589 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:left;"> q_115 </td>
   <td style="text-align:left;"> перефразирование и пересказ </td>
   <td style="text-align:left;"> я не использовал(а) перефразирование </td>
   <td style="text-align:right;"> -0.344 </td>
   <td style="text-align:right;"> 0.219 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:left;"> q_175 </td>
   <td style="text-align:left;"> перефразирование и пересказ </td>
   <td style="text-align:left;"> я повторял(а) сказанное словами клиента </td>
   <td style="text-align:right;"> 0.267 </td>
   <td style="text-align:right;"> -0.195 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:left;"> q_104 </td>
   <td style="text-align:left;"> эмпатия </td>
   <td style="text-align:left;"> я называл(а) чувства, переживаемые клиентом </td>
   <td style="text-align:right;"> 0.323 </td>
   <td style="text-align:right;"> -0.093 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:left;"> q_229 </td>
   <td style="text-align:left;"> эмпатия </td>
   <td style="text-align:left;"> я часто испытывал(а) теплые чувства и заботу по отношению к клиенту </td>
   <td style="text-align:right;"> 0.294 </td>
   <td style="text-align:right;"> -0.090 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:left;"> q_212 </td>
   <td style="text-align:left;"> поддержка </td>
   <td style="text-align:left;"> я спрашивал(а) клиента о том, комфортно ли ему во время сессии </td>
   <td style="text-align:right;"> 0.397 </td>
   <td style="text-align:right;"> 0.244 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:left;"> q_130 </td>
   <td style="text-align:left;"> невербальные навыки </td>
   <td style="text-align:left;"> я не подстраивался(лась) под позу и манеру речи клиента </td>
   <td style="text-align:right;"> -0.180 </td>
   <td style="text-align:right;"> 0.310 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:left;"> q_151 </td>
   <td style="text-align:left;"> невербальные навыки </td>
   <td style="text-align:left;"> я обращал(а) большое внимание на невербальные проявления клиента </td>
   <td style="text-align:right;"> 0.395 </td>
   <td style="text-align:right;"> -0.056 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:left;"> q_221 </td>
   <td style="text-align:left;"> невербальные навыки </td>
   <td style="text-align:left;"> я уделял(а) внимание смыслу сказанного клиентом, а не его невербальным проявлениям </td>
   <td style="text-align:right;"> -0.167 </td>
   <td style="text-align:right;"> 0.151 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:left;"> q_34 </td>
   <td style="text-align:left;"> невербальные навыки </td>
   <td style="text-align:left;"> мне было трудно удерживать зрительный контакт с клиентом, это отвлекало от сути нашей беседы </td>
   <td style="text-align:right;"> -0.251 </td>
   <td style="text-align:right;"> 0.092 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:left;"> q_171 </td>
   <td style="text-align:left;"> конгруэнтность </td>
   <td style="text-align:left;"> я открыто делился своими чувствами с клиентом во время сессии </td>
   <td style="text-align:right;"> 0.185 </td>
   <td style="text-align:right;"> -0.340 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:left;"> q_40 </td>
   <td style="text-align:left;"> конгруэнтность </td>
   <td style="text-align:left;"> на вопросы клиента о моих чувствах я давал(а) честный ответ, даже если это могло задеть его </td>
   <td style="text-align:right;"> 0.151 </td>
   <td style="text-align:right;"> -0.167 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:left;"> q_79 </td>
   <td style="text-align:left;"> резюмирование </td>
   <td style="text-align:left;"> я избегал(а) переспрашиваний в процессе работы </td>
   <td style="text-align:right;"> -0.236 </td>
   <td style="text-align:right;"> 0.211 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> отношения-1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:left;"> q_90 </td>
   <td style="text-align:left;"> понятность </td>
   <td style="text-align:left;"> я использовал(а) психологические термины, чтобы завоевать доверие клиента </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.150 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table>

Вообще, большое количество вопросов, которые оказались без сильных нагрузок по первому или второму факторам, свидетельствует о том, что либо респонденты неверно понимают вопросы, либо эти вопросы служат маркерами какой-то иной компетенции.



## EFA, с3 = 10

Аналогично с с2 = 10 (профессионализм) на две субшкалы. 


```
## 
## Loadings:
##       MR1    MR2   
## q_36         -0.413
## q_80               
## q_126              
## q_136              
## q_183  0.407       
## q_186  0.837       
## q_7    0.443       
## q_33          0.667
## q_43               
## q_57          0.735
## q_107        -0.567
## q_190         0.602
## q_127              
## q_133 -0.698       
## q_152  0.802       
## q_153  0.443       
## q_166              
## q_197  0.631       
## 
##                  MR1   MR2
## SS loadings    3.242 2.357
## Proportion Var 0.180 0.131
## Cumulative Var 0.180 0.311
```
Диаграмма, дисперсия каких вопросов каким фактором объясняется, выглядит вот так. Связь между факторами со значением 0.5 свидетельствует от достаточно сильной корреляции факторов друг с другом.
<img src="2_scales_files/figure-html/unnamed-chunk-10-1.png" width="672" />

Таблица вопросов с маркером объясняющего их фактора:

<table class="table" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> C2 </th>
   <th style="text-align:left;"> q </th>
   <th style="text-align:left;"> competence_ru </th>
   <th style="text-align:left;"> question_ru </th>
   <th style="text-align:right;"> MR1 </th>
   <th style="text-align:right;"> MR2 </th>
   <th style="text-align:right;"> factor_number </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_133 </td>
   <td style="text-align:left;"> супервизия - личная терапия - интервизия </td>
   <td style="text-align:left;"> я не прибегаю к супервизиям/интервизиям в своей работе </td>
   <td style="text-align:right;"> -0.698 </td>
   <td style="text-align:right;"> -0.014 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_152 </td>
   <td style="text-align:left;"> супервизия - личная терапия - интервизия </td>
   <td style="text-align:left;"> я обращаюсь к интервизии и/или супервизии для рефлексии работы с клиентами </td>
   <td style="text-align:right;"> 0.802 </td>
   <td style="text-align:right;"> 0.045 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_153 </td>
   <td style="text-align:left;"> супервизия - личная терапия - интервизия </td>
   <td style="text-align:left;"> я обращаюсь к своим коллегам, чтобы обсудить возникающие в процессе консультирования проблемы (например, этические, эмоциональные и пр.) </td>
   <td style="text-align:right;"> 0.443 </td>
   <td style="text-align:right;"> 0.168 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_197 </td>
   <td style="text-align:left;"> супервизия - личная терапия - интервизия </td>
   <td style="text-align:left;"> я прохожу личную терапию для проработки собственных проблем и запросов </td>
   <td style="text-align:right;"> 0.631 </td>
   <td style="text-align:right;"> -0.140 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_183 </td>
   <td style="text-align:left;"> мотивация развиваться </td>
   <td style="text-align:left;"> я посещаю конференции и участвую в них </td>
   <td style="text-align:right;"> 0.407 </td>
   <td style="text-align:right;"> 0.148 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_186 </td>
   <td style="text-align:left;"> мотивация развиваться </td>
   <td style="text-align:left;"> я предпринимаю специальные действия для профилактики эмоционального выгорания (супервизии, личная терапия, интервизии, группы и т.д.) </td>
   <td style="text-align:right;"> 0.837 </td>
   <td style="text-align:right;"> -0.019 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_7 </td>
   <td style="text-align:left;"> самооценка </td>
   <td style="text-align:left;"> вне сессий я тренировал(а) свои профессиональные навыки (например, в группах, на тренингах и т.д.) </td>
   <td style="text-align:right;"> 0.443 </td>
   <td style="text-align:right;"> 0.196 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_36 </td>
   <td style="text-align:left;"> мотивация развиваться </td>
   <td style="text-align:left;"> мне не хватает времени и сил следить за исследованиями в области психологии и смежных специальностей </td>
   <td style="text-align:right;"> -0.080 </td>
   <td style="text-align:right;"> -0.413 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_107 </td>
   <td style="text-align:left;"> самооценка </td>
   <td style="text-align:left;"> я не анализировал(а) случай клиента между сессиями </td>
   <td style="text-align:right;"> 0.039 </td>
   <td style="text-align:right;"> -0.567 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_190 </td>
   <td style="text-align:left;"> самооценка </td>
   <td style="text-align:left;"> я проводил(а) самостоятельный анализ сессий, чтобы лучше разобраться в случае клиента </td>
   <td style="text-align:right;"> -0.048 </td>
   <td style="text-align:right;"> 0.602 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_33 </td>
   <td style="text-align:left;"> самооценка </td>
   <td style="text-align:left;"> между сессиями я анализировал(а) качество терапевтического альянса </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.667 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_57 </td>
   <td style="text-align:left;"> самооценка </td>
   <td style="text-align:left;"> я анализировал(а) проведенные мною сессии, чтобы выявить свои зоны развития </td>
   <td style="text-align:right;"> -0.026 </td>
   <td style="text-align:right;"> 0.735 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_127 </td>
   <td style="text-align:left;"> супервизия - личная терапия - интервизия </td>
   <td style="text-align:left;"> я не ощущаю потребности в личной терапии </td>
   <td style="text-align:right;"> -0.371 </td>
   <td style="text-align:right;"> 0.264 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_166 </td>
   <td style="text-align:left;"> супервизия - личная терапия - интервизия </td>
   <td style="text-align:left;"> я осваиваю новые подходы самостоятельно, не прибегая к обучению у других специалистов </td>
   <td style="text-align:right;"> -0.241 </td>
   <td style="text-align:right;"> -0.021 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_126 </td>
   <td style="text-align:left;"> мотивация развиваться </td>
   <td style="text-align:left;"> я не ощущаю необходимости в курсах повышения квалификации </td>
   <td style="text-align:right;"> -0.170 </td>
   <td style="text-align:right;"> 0.053 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_136 </td>
   <td style="text-align:left;"> мотивация развиваться </td>
   <td style="text-align:left;"> я не провожу профилактику эмоционального выгорания </td>
   <td style="text-align:right;"> -0.369 </td>
   <td style="text-align:right;"> -0.257 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_80 </td>
   <td style="text-align:left;"> мотивация развиваться </td>
   <td style="text-align:left;"> я изучаю актуальную повестку научных событий в своей области </td>
   <td style="text-align:right;"> 0.254 </td>
   <td style="text-align:right;"> 0.364 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> профессионализм-2 </td>
   <td style="text-align:left;"> q_43 </td>
   <td style="text-align:left;"> самооценка </td>
   <td style="text-align:left;"> на сессиях я действовал(а) интуитивно, не вдаваясь в детальный анализ своей работы </td>
   <td style="text-align:right;"> -0.089 </td>
   <td style="text-align:right;"> -0.367 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table>

Здесь факторная структура и разделение вопросов по факторам также более сбалансировано:
<table class="table" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> factor_number </th>
   <th style="text-align:right;"> n_questions </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
</tbody>
</table>


## EFA, с3 = 11

Аналогично с с2 = 11 (результаты), попробовал разбить на две субшкалы. 


```
## 
## Loadings:
##       MR1    MR2   
## q_8           0.459
## q_72   0.402       
## q_93               
## q_111  0.603       
## q_144  0.538       
## q_196         0.494
## q_55          0.783
## q_77          0.733
## q_106              
## q_118              
## q_125  0.414       
## q_177         0.587
## q_1                
## q_109  0.458       
## q_129  0.663       
## q_176  0.749       
## q_210 -0.416       
## 
##                  MR1   MR2
## SS loadings    2.948 2.315
## Proportion Var 0.173 0.136
## Cumulative Var 0.173 0.310
```
Диаграмма, дисперсия каких вопросов каким фактором объясняется, выглядит вот так. Связь между факторами со значением -0.4 свидетельствует от достаточно сильной отрицательной корреляции.
<img src="2_scales_files/figure-html/unnamed-chunk-14-1.png" width="672" />

Таблица вопросов с маркером объясняющего их фактора:

<table class="table" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> C2 </th>
   <th style="text-align:left;"> q </th>
   <th style="text-align:left;"> competence_ru </th>
   <th style="text-align:left;"> question_ru </th>
   <th style="text-align:right;"> MR1 </th>
   <th style="text-align:right;"> MR2 </th>
   <th style="text-align:right;"> factor_number </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_109 </td>
   <td style="text-align:left;"> резюмирование сессии и результатов терапии c клиентом </td>
   <td style="text-align:left;"> я не выделял(а) значимые моменты сессии для клиента, поскольку он сам запоминает самое важное </td>
   <td style="text-align:right;"> 0.458 </td>
   <td style="text-align:right;"> -0.082 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_129 </td>
   <td style="text-align:left;"> резюмирование сессии и результатов терапии c клиентом </td>
   <td style="text-align:left;"> я не подводил(а) итогов на сессии </td>
   <td style="text-align:right;"> 0.663 </td>
   <td style="text-align:right;"> 0.009 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_176 </td>
   <td style="text-align:left;"> резюмирование сессии и результатов терапии c клиентом </td>
   <td style="text-align:left;"> я подводил(а) итог сессии, только если об этом просил клиент </td>
   <td style="text-align:right;"> 0.749 </td>
   <td style="text-align:right;"> 0.126 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_210 </td>
   <td style="text-align:left;"> резюмирование сессии и результатов терапии c клиентом </td>
   <td style="text-align:left;"> я специально оставлял(а) время в конце сессии для подведения итогов </td>
   <td style="text-align:right;"> -0.416 </td>
   <td style="text-align:right;"> 0.250 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_111 </td>
   <td style="text-align:left;"> оценка результатов </td>
   <td style="text-align:left;"> я не задавал(а) клиенту вопросы про результаты терапии, так как, когда они появятся, это станет само собой заметно </td>
   <td style="text-align:right;"> 0.603 </td>
   <td style="text-align:right;"> -0.028 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_144 </td>
   <td style="text-align:left;"> оценка результатов </td>
   <td style="text-align:left;"> я не тратил(а) время сессии на оценку промежуточных результатов </td>
   <td style="text-align:right;"> 0.538 </td>
   <td style="text-align:right;"> -0.010 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_72 </td>
   <td style="text-align:left;"> оценка результатов </td>
   <td style="text-align:left;"> я ждал(а) полного решения проблемы, чтобы вместе с клиентом подвести итоги работы </td>
   <td style="text-align:right;"> 0.402 </td>
   <td style="text-align:right;"> 0.034 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_125 </td>
   <td style="text-align:left;"> поддержание результатов </td>
   <td style="text-align:left;"> я не отмечал(а) незначительные изменения клиента, пока проблема не была полностью решена </td>
   <td style="text-align:right;"> 0.414 </td>
   <td style="text-align:right;"> -0.093 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_196 </td>
   <td style="text-align:left;"> оценка результатов </td>
   <td style="text-align:left;"> я просил(а) клиента рассказывать мне о том, как он оценивает свой прогресс </td>
   <td style="text-align:right;"> -0.172 </td>
   <td style="text-align:right;"> 0.494 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_8 </td>
   <td style="text-align:left;"> оценка результатов </td>
   <td style="text-align:left;"> во время сессии я сопоставлял(а) изначальный запрос клиента и текущие результаты </td>
   <td style="text-align:right;"> -0.143 </td>
   <td style="text-align:right;"> 0.459 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_177 </td>
   <td style="text-align:left;"> поддержание результатов </td>
   <td style="text-align:left;"> я поддерживал(а) в клиенте ощущение веры в свою способность достичь цели, напоминая о его предыдущих успехах </td>
   <td style="text-align:right;"> -0.034 </td>
   <td style="text-align:right;"> 0.587 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_55 </td>
   <td style="text-align:left;"> поддержание результатов </td>
   <td style="text-align:left;"> я акцентировал(а) внимание клиента на его достижениях </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.783 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_77 </td>
   <td style="text-align:left;"> поддержание результатов </td>
   <td style="text-align:left;"> я замечал(а) даже малейшие положительные изменения у клиента и говорил(а) ему о них </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 0.733 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_1 </td>
   <td style="text-align:left;"> резюмирование сессии и результатов терапии c клиентом </td>
   <td style="text-align:left;"> в конце сессии я уточнял(а) у клиента, что он считает результатом сессии </td>
   <td style="text-align:right;"> -0.375 </td>
   <td style="text-align:right;"> 0.357 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_93 </td>
   <td style="text-align:left;"> оценка результатов </td>
   <td style="text-align:left;"> я использовал(а) специальные инструменты для подведения промежуточных итогов (например, шкалы или вопросы) </td>
   <td style="text-align:right;"> -0.356 </td>
   <td style="text-align:right;"> 0.229 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_106 </td>
   <td style="text-align:left;"> поддержание результатов </td>
   <td style="text-align:left;"> я не акцентировал(а) внимание на успехах клиента и ждал(а), что он сам их заметит </td>
   <td style="text-align:right;"> 0.359 </td>
   <td style="text-align:right;"> -0.247 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> результаты </td>
   <td style="text-align:left;"> q_118 </td>
   <td style="text-align:left;"> поддержание результатов </td>
   <td style="text-align:left;"> я не обсуждал(а) с клиентом то, что уже достигнуто, а фокусировался(лась) на том, что еще не сделано </td>
   <td style="text-align:right;"> 0.352 </td>
   <td style="text-align:right;"> -0.166 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table>

Здесь факторная структура и разделение вопросов по факторам оказалось более сбалансированным:
<table class="table" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> factor_number </th>
   <th style="text-align:right;"> n_questions </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
</tbody>
</table>
