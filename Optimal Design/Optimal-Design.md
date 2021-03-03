---
title: "Optimal Design"
author: "Ryan Gifford"
date: "November 11, 2020"
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





https://www.r-bloggers.com/2009/11/design-of-experiments-%e2%80%93-optimal-designs/

## R-Bloggers Example

```r
cand.list <-  expand.grid(
  Factor1 = c("A", "B", "C", "D"),
  Factor2 = c("I", "II", "III"),
  Factor3 = c("Low", "High"),
  Factor4 = c("Yes", "No")
  )


set.seed(69)

output1 <- optFederov( ~ ., data = cand.list, nTrials = 13)

output1$design
```

```
##    Factor1 Factor2 Factor3 Factor4
## 4        D       I     Low     Yes
## 7        C      II     Low     Yes
## 9        A     III     Low     Yes
## 14       B       I    High     Yes
## 20       D      II    High     Yes
## 22       B     III    High     Yes
## 25       A       I     Low      No
## 27       C       I     Low      No
## 30       B      II     Low      No
## 36       D     III     Low      No
## 40       D       I    High      No
## 41       A      II    High      No
## 47       C     III    High      No
```


***************************

## Bloomington Bike Paths

### Normal Expansion Set

```r
normal_expansion <-  expand.grid(
  Miles = c(3, 6, 7),
  Access = c(2, 5, 9),
  Donation = c(5, 14, 8)
  )



set.seed(69)

output2 <- optFederov( ~ ., data = normal_expansion, nTrials = 16)

row.names(output2$design) <- NULL


output2$design
```

```
##    Miles Access Donation
## 1      3      2        5
## 2      6      2        5
## 3      7      2        5
## 4      3      9        5
## 5      6      9        5
## 6      7      9        5
## 7      3      2       14
## 8      6      2       14
## 9      7      2       14
## 10     3      5       14
## 11     3      9       14
## 12     6      9       14
## 13     7      9       14
## 14     3      2        8
## 15     7      2        8
## 16     3      9        8
```

*********************************************

### Bloomington Expansion Set

```r
bloom_expansion <-  expand.grid(
  Miles = c(6, 2, 3),
  Access = c(5, 9, 2),
  Donation = c(5, 14, 8)
  )



set.seed(69)

output3 <- optFederov( ~ ., data = bloom_expansion, nTrials = 16)


row.names(output3$design) <- NULL

output3$design
```

```
##    Miles Access Donation
## 1      6      9        5
## 2      2      9        5
## 3      3      9        5
## 4      6      2        5
## 5      2      2        5
## 6      3      2        5
## 7      6      5       14
## 8      6      9       14
## 9      2      9       14
## 10     3      9       14
## 11     6      2       14
## 12     2      2       14
## 13     3      2       14
## 14     6      9        8
## 15     6      2        8
## 16     2      2        8
```

*********************************************


## Possible Rexburg Sets

### Teton River Trail


```r
teton <-  expand.grid(
  Surface = c("Paved", "Gravel", "Dirt"),
  Location = c("Walters Pond (.68 miles)", "Teton Lakes (.58 miles)", "Barney Dairy Rd (.37 miles)" ),
  Cost = c("20", "35", "80")
  ) # Creating the choice sets


#teton$Cost <- sample(teton$Cost) # randomizing the columns

set.seed(69)

teton_output <- optFederov(~., data = teton,  criterion = "D" , nTrials = 7)

teton_output
```

```
## $D
## [1] 0.2122849
## 
## $A
## [1] 7.5
## 
## $Ge
## [1] 0.5
## 
## $Dea
## [1] 0.368
## 
## $design
##    Surface                    Location Cost
## 1    Paved    Walters Pond (.68 miles)   20
## 5   Gravel     Teton Lakes (.58 miles)   20
## 9     Dirt Barney Dairy Rd (.37 miles)   20
## 13   Paved     Teton Lakes (.58 miles)   35
## 17  Gravel Barney Dairy Rd (.37 miles)   35
## 21    Dirt    Walters Pond (.68 miles)   80
## 25   Paved Barney Dairy Rd (.37 miles)   80
## 
## $rows
## [1]  1  5  9 13 17 21 25
```

### Railroad Trail...


```r
rail <-  expand.grid(
  Surface = c("Paved", "Gravel", "Dirt"),
  Location = c("Poleline to 7th S (1.1 miles)", "7th S to 2nd N (1.4 miles)", "2nd N to 2nd E (.9 miles)" ),
  Cost = c(60, 75, 45)
  )


set.seed(69)

rail_output <- optFederov( ~ ., data = rail, nTrials = 19)

rail_output$design
```

```
##    Surface                      Location Cost
## 1    Paved Poleline to 7th S (1.1 miles)   60
## 10   Paved Poleline to 7th S (1.1 miles)   75
## 11  Gravel Poleline to 7th S (1.1 miles)   75
## 12    Dirt Poleline to 7th S (1.1 miles)   75
## 13   Paved    7th S to 2nd N (1.4 miles)   75
## 14  Gravel    7th S to 2nd N (1.4 miles)   75
## 15    Dirt    7th S to 2nd N (1.4 miles)   75
## 16   Paved     2nd N to 2nd E (.9 miles)   75
## 17  Gravel     2nd N to 2nd E (.9 miles)   75
## 18    Dirt     2nd N to 2nd E (.9 miles)   75
## 19   Paved Poleline to 7th S (1.1 miles)   45
## 20  Gravel Poleline to 7th S (1.1 miles)   45
## 21    Dirt Poleline to 7th S (1.1 miles)   45
## 22   Paved    7th S to 2nd N (1.4 miles)   45
## 23  Gravel    7th S to 2nd N (1.4 miles)   45
## 24    Dirt    7th S to 2nd N (1.4 miles)   45
## 25   Paved     2nd N to 2nd E (.9 miles)   45
## 26  Gravel     2nd N to 2nd E (.9 miles)   45
## 27    Dirt     2nd N to 2nd E (.9 miles)   45
```

