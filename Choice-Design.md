---
title: "Choice Design"
author: "Ryan Gifford"
date: "February 05, 2021"
output:
  html_document:  
    keep_md: true
    toc: true
    toc_float: true
    code_folding: hide
    fig_height: 6
    fig_width: 12
    fig_align: 'center'
---





```r
# Use this R-Chunk to import all your datasets!


#install.packages('support.CEs')

library(survival)
library(support.CEs)
library(tidyverse)
library(pander)
library(knitr)
library(data.table)
library(kableExtra)
```


## Matrix Design


```r
des2 <- Lma.design(
  attribute.names = list(
    Surface = c("Dirt", "Gravel", "Paved"),  
    Dist = c("Da", "Db", "Dc"), # Distances: ALT1: 0.49,1.50, 1.63  ALT2: 0.36,0.68, 0.91
    Cost = c("Ca", "Cb", "Cc")), #Costs: ALT1: 26,81,88     ALT2: 20, 37, 49
  nalternatives = 2,
  nblocks = 2,
  row.renames = FALSE,
  seed = 987)

des2
```

```
## 
## Choice sets:
## alternative 1 in each choice set
##    BLOCK QES ALT Surface Dist Cost
## 13     1   1   1  Gravel   Db   Cb
## 11     1   2   1    Dirt   Db   Ca
## 15     1   3   1  Gravel   Db   Cc
## 8      1   4   1   Paved   Dc   Ca
## 7      1   5   1    Dirt   Da   Cb
## 3      1   6   1   Paved   Da   Cc
## 16     1   7   1   Paved   Dc   Cc
## 9      1   8   1    Dirt   Da   Ca
## 18     1   9   1  Gravel   Dc   Cb
## 17     2   1   1    Dirt   Dc   Cb
## 6      2   2   1    Dirt   Dc   Cc
## 14     2   3   1   Paved   Da   Cb
## 12     2   4   1   Paved   Db   Ca
## 1      2   5   1  Gravel   Dc   Ca
## 4      2   6   1   Paved   Db   Cb
## 10     2   7   1    Dirt   Db   Cc
## 5      2   8   1  Gravel   Da   Ca
## 2      2   9   1  Gravel   Da   Cc
## 
## alternative 2 in each choice set
##    BLOCK QES ALT Surface Dist Cost
## 13     1   1   2  Gravel   Db   Cb
## 11     1   2   2   Paved   Dc   Cb
## 15     1   3   2   Paved   Da   Ca
## 8      1   4   2    Dirt   Db   Cb
## 7      1   5   2  Gravel   Dc   Cc
## 3      1   6   2  Gravel   Db   Ca
## 16     1   7   2   Paved   Dc   Cc
## 9      1   8   2    Dirt   Da   Ca
## 18     1   9   2    Dirt   Da   Cc
## 17     2   1   2   Paved   Db   Ca
## 6      2   2   2  Gravel   Da   Cb
## 14     2   3   2   Paved   Da   Cb
## 12     2   4   2  Gravel   Da   Cc
## 1      2   5   2  Gravel   Dc   Ca
## 4      2   6   2    Dirt   Dc   Ca
## 10     2   7   2    Dirt   Db   Cc
## 5      2   8   2   Paved   Db   Cc
## 2      2   9   2    Dirt   Dc   Cb
## 
## Candidate design:
##    A B C D E F G
## 1  2 3 1 2 3 1 2
## 2  2 1 3 1 3 2 2
## 3  3 1 3 2 2 1 1
## 4  3 2 2 1 3 1 2
## 5  2 1 1 3 2 3 2
## 6  1 3 3 2 1 2 2
## 7  1 1 2 2 3 3 1
## 8  3 3 1 1 2 2 1
## 9  1 1 1 1 1 1 1
## 10 1 2 3 1 2 3 2
## 11 1 2 1 3 3 2 1
## 12 3 2 1 2 1 3 2
## 13 2 2 2 2 2 2 1
## 14 3 1 2 3 1 2 2
## 15 2 2 3 3 1 1 1
## 16 3 3 3 3 3 3 1
## 17 1 3 2 3 2 1 2
## 18 2 3 2 1 1 3 1
## class=design, type= oa 
## 
## Design information:
## number of blocks = 2 
## number of questions per block = 9 
## number of alternatives per choice set = 2 
## number of attributes per alternative = 3
```

```r
questionnaire(choice.experiment.design = des2, quote = F)
```

```
## 
## Block 1 
##  
## Question 1 
##         alt.1  alt.2 
## Surface Gravel Gravel
## Dist    Db     Db    
## Cost    Cb     Cb    
## 
## Question 2 
##         alt.1 alt.2
## Surface Dirt  Paved
## Dist    Db    Dc   
## Cost    Ca    Cb   
## 
## Question 3 
##         alt.1  alt.2
## Surface Gravel Paved
## Dist    Db     Da   
## Cost    Cc     Ca   
## 
## Question 4 
##         alt.1 alt.2
## Surface Paved Dirt 
## Dist    Dc    Db   
## Cost    Ca    Cb   
## 
## Question 5 
##         alt.1 alt.2 
## Surface Dirt  Gravel
## Dist    Da    Dc    
## Cost    Cb    Cc    
## 
## Question 6 
##         alt.1 alt.2 
## Surface Paved Gravel
## Dist    Da    Db    
## Cost    Cc    Ca    
## 
## Question 7 
##         alt.1 alt.2
## Surface Paved Paved
## Dist    Dc    Dc   
## Cost    Cc    Cc   
## 
## Question 8 
##         alt.1 alt.2
## Surface Dirt  Dirt 
## Dist    Da    Da   
## Cost    Ca    Ca   
## 
## Question 9 
##         alt.1  alt.2
## Surface Gravel Dirt 
## Dist    Dc     Da   
## Cost    Cb     Cc   
## 
## Block 2 
##  
## Question 1 
##         alt.1 alt.2
## Surface Dirt  Paved
## Dist    Dc    Db   
## Cost    Cb    Ca   
## 
## Question 2 
##         alt.1 alt.2 
## Surface Dirt  Gravel
## Dist    Dc    Da    
## Cost    Cc    Cb    
## 
## Question 3 
##         alt.1 alt.2
## Surface Paved Paved
## Dist    Da    Da   
## Cost    Cb    Cb   
## 
## Question 4 
##         alt.1 alt.2 
## Surface Paved Gravel
## Dist    Db    Da    
## Cost    Ca    Cc    
## 
## Question 5 
##         alt.1  alt.2 
## Surface Gravel Gravel
## Dist    Dc     Dc    
## Cost    Ca     Ca    
## 
## Question 6 
##         alt.1 alt.2
## Surface Paved Dirt 
## Dist    Db    Dc   
## Cost    Cb    Ca   
## 
## Question 7 
##         alt.1 alt.2
## Surface Dirt  Dirt 
## Dist    Db    Db   
## Cost    Cc    Cc   
## 
## Question 8 
##         alt.1  alt.2
## Surface Gravel Paved
## Dist    Da     Db   
## Cost    Ca     Cc   
## 
## Question 9 
##         alt.1  alt.2
## Surface Gravel Dirt 
## Dist    Da     Dc   
## Cost    Cc     Cb
```

```r
desmat2 <- make.design.matrix(
  choice.experiment.design = des2,
  optout = T,
  categorical.attributes = "Surface",
  continuous.attributes = c("Dist", "Cost"),
 # continuous.attributes = c("Dist", "Cost"),
  unlabeled = FALSE)

#write.csv(desmat2, file = "C:\\Users\\Ryan\\Desktop\\matrix.csv", row.names = F)
```

## Paper Charts



```r
dat <- read.csv("C:\\Users\\Ryan\\Desktop\\Choice Experiment\\choices.csv")

dat1 <- dat[,c(2:3)]
dat2 <- dat[,c(5:6)] %>% 
  rename(Attributes = Attributes.1, Levels = Levels.1)



list(dat2, dat1) %>%
  kbl(caption =  "Choice Experiment Design") %>%
  kable_classic("striped" ,full_width = F, html_font = "Times New Roman") %>% 
    add_header_above(c("Rail Trail" = 1, "Teton Trail" = 1)) 
```

<table class="kable_wrapper lightable-classic lightable-striped" style="font-family: Times New Roman; width: auto !important; margin-left: auto; margin-right: auto;">
<thead><tr>
<th style="padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="1"><div style="TRUE">Rail Trail</div></th>
<th style="padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="1"><div style="TRUE">Teton Trail</div></th>
</tr></thead>
<caption>Choice Experiment Design</caption>
<tbody>
  <tr>
   <td> 

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Attributes </th>
   <th style="text-align:left;"> Levels </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Length (miles) </td>
   <td style="text-align:left;"> 0.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 1.68 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 3.09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cost ($) </td>
   <td style="text-align:left;"> 26 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 91 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 167 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surface </td>
   <td style="text-align:left;"> Dirt </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Crushed Stone </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Asphalt </td>
  </tr>
</tbody>
</table>

 </td>
   <td> 

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Attributes </th>
   <th style="text-align:left;"> Levels </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Length (miles) </td>
   <td style="text-align:left;"> 0.36 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 0.89 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 1.06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cost ($) </td>
   <td style="text-align:left;"> 20 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 48 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Surface </td>
   <td style="text-align:left;"> Dirt </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Crushed Stone </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Asphalt </td>
  </tr>
</tbody>
</table>

 </td>
  </tr>
</tbody>
</table>

```r
  #save_kable(file = "C:\\Users\\Ryan\\Google Drive\\BYU-I\\Winter_2021\\Special Projects\\Paper\\Tables\\Rplot.jpg",
            # zoom = 2)


# webshot::install_phantomjs()
```


