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



*********************************************


## Teton River Trail

### 3 surface levels

#### (criterion = "D")


```r
teton <-  expand.grid(
  Surface = c("Paved", "Gravel", "Dirt"),
  Location = c("Walters Pond (.68 miles)", "Teton Lakes (.58 miles)", "Barney Dairy Rd (.37 miles)" ),
  Cost = c("20", "35", "80")
  ) # Creating the choice sets


#teton$Cost <- sample(teton$Cost) # randomizing the columns

set.seed(69)

teton_output <- optFederov(~., data = teton,  criterion = "D" )

pander(teton_output)
```



  * **D**: _0.2334_
  * **A**: _7.016_
  * **Ge**: _0.768_
  * **Dea**: _0.74_
  * **design**:

    -------------------------------------------------------
     &nbsp;   Surface            Location             Cost
    -------- --------- ----------------------------- ------
     **2**    Gravel     Walters Pond (.68 miles)      20

     **4**     Paved      Teton Lakes (.58 miles)      20

     **9**     Dirt     Barney Dairy Rd (.37 miles)    20

     **12**    Dirt      Walters Pond (.68 miles)      35

     **13**    Paved      Teton Lakes (.58 miles)      35

     **14**   Gravel      Teton Lakes (.58 miles)      35

     **17**   Gravel    Barney Dairy Rd (.37 miles)    35

     **19**    Paved     Walters Pond (.68 miles)      80

     **23**   Gravel      Teton Lakes (.58 miles)      80

     **24**    Dirt       Teton Lakes (.58 miles)      80

     **25**    Paved    Barney Dairy Rd (.37 miles)    80

     **26**   Gravel    Barney Dairy Rd (.37 miles)    80
    -------------------------------------------------------

  * **rows**: _2_, _4_, _9_, _12_, _13_, _14_, _17_, _19_, _23_, _24_, _25_ and _26_

<!-- end of list -->


*******************************

#### (nTrials = 9)

```r
teton2 <-  expand.grid(
  Surface = c("Paved", "Gravel", "Dirt"),
  Location = c("Walters Pond (.68 miles)", "Teton Lakes (.58 miles)", "Barney Dairy Rd (.37 miles)" ),
  Cost = c("20", "35", "80")
  ) # Creating the choice sets


#teton$Cost <- sample(teton$Cost) # randomizing the columns

set.seed(69)

teton_output2 <- optFederov(~., data = teton2,  criterion = "D" , nTrials = 9)

pander(teton_output2)
```



  * **D**: _0.2435_
  * **A**: _6.143_
  * **Ge**: _1_
  * **Dea**: _1_
  * **design**:

    -------------------------------------------------------
     &nbsp;   Surface            Location             Cost
    -------- --------- ----------------------------- ------
     **2**    Gravel     Walters Pond (.68 miles)      20

     **4**     Paved      Teton Lakes (.58 miles)      20

     **9**     Dirt     Barney Dairy Rd (.37 miles)    20

     **12**    Dirt      Walters Pond (.68 miles)      35

     **14**   Gravel      Teton Lakes (.58 miles)      35

     **16**    Paved    Barney Dairy Rd (.37 miles)    35

     **19**    Paved     Walters Pond (.68 miles)      80

     **24**    Dirt       Teton Lakes (.58 miles)      80

     **26**   Gravel    Barney Dairy Rd (.37 miles)    80
    -------------------------------------------------------

  * **rows**: _2_, _4_, _9_, _12_, _14_, _16_, _19_, _24_ and _26_

<!-- end of list -->

*******************************

#### (nTrials = 7)

```r
teton3 <-  expand.grid(
  Surface = c("Paved", "Gravel", "Dirt"),
  Location = c("Walters Pond (.68 miles)", "Teton Lakes (.58 miles)", "Barney Dairy Rd (.37 miles)" ),
  Cost = c("20", "35", "80")
  ) # Creating the choice sets


#teton$Cost <- sample(teton$Cost) # randomizing the columns

set.seed(69)

teton_output3 <- optFederov(~., data = teton3,  criterion = "D" , nTrials = 7)

pander(teton_output3)
```



  * **D**: _0.2123_
  * **A**: _7.5_
  * **Ge**: _0.5_
  * **Dea**: _0.368_
  * **design**:

    -------------------------------------------------------
     &nbsp;   Surface            Location             Cost
    -------- --------- ----------------------------- ------
     **1**     Paved     Walters Pond (.68 miles)      20

     **5**    Gravel      Teton Lakes (.58 miles)      20

     **9**     Dirt     Barney Dairy Rd (.37 miles)    20

     **13**    Paved      Teton Lakes (.58 miles)      35

     **17**   Gravel    Barney Dairy Rd (.37 miles)    35

     **21**    Dirt      Walters Pond (.68 miles)      80

     **25**    Paved    Barney Dairy Rd (.37 miles)    80
    -------------------------------------------------------

  * **rows**: _1_, _5_, _9_, _13_, _17_, _21_ and _25_

<!-- end of list -->


*******************************
### 2 surface levels

#### (criterion = "D")

```r
teton4 <-  expand.grid(
  Surface = c("Paved", "Gravel"),
  Location = c("Walters Pond (.68 miles)", "Teton Lakes (.58 miles)", "Barney Dairy Rd (.37 miles)" ),
  Cost = c("20", "35", "80")
  ) # Creating the choice sets


#teton$Cost <- sample(teton$Cost) # randomizing the columns

set.seed(69)

teton_output4 <- optFederov(~., data = teton4,  criterion = "D")

pander(teton_output4)
```



  * **D**: _0.257_
  * **A**: _6.532_
  * **Ge**: _0.713_
  * **Dea**: _0.669_
  * **design**:

    -------------------------------------------------------
     &nbsp;   Surface            Location             Cost
    -------- --------- ----------------------------- ------
     **2**    Gravel     Walters Pond (.68 miles)      20

     **4**    Gravel      Teton Lakes (.58 miles)      20

     **5**     Paved    Barney Dairy Rd (.37 miles)    20

     **7**     Paved     Walters Pond (.68 miles)      35

     **9**     Paved      Teton Lakes (.58 miles)      35

     **10**   Gravel      Teton Lakes (.58 miles)      35

     **12**   Gravel    Barney Dairy Rd (.37 miles)    35

     **14**   Gravel     Walters Pond (.68 miles)      80

     **15**    Paved      Teton Lakes (.58 miles)      80

     **17**    Paved    Barney Dairy Rd (.37 miles)    80

     **18**   Gravel    Barney Dairy Rd (.37 miles)    80
    -------------------------------------------------------

  * **rows**: _2_, _4_, _5_, _7_, _9_, _10_, _12_, _14_, _15_, _17_ and _18_

<!-- end of list -->

***********************************

#### (nTrials = 6)


```r
teton5 <-  expand.grid(
  Surface = c("Paved", "Gravel"),
  Location = c("Walters Pond (.68 miles)", "Teton Lakes (.58 miles)", "Barney Dairy Rd (.37 miles)" ),
  Cost = c("20", "35", "80")
  ) # Creating the choice sets


#teton$Cost <- sample(teton$Cost) # randomizing the columns

set.seed(69)

teton_output5 <- optFederov(~., data = teton5,  criterion = "D", nTrials = 6)

pander(teton_output5)
```



  * **D**: _0.21_
  * **A**: _8_
  * **Ge**: _0.333_
  * **Dea**: _0.135_
  * **design**:

    -------------------------------------------------------
     &nbsp;   Surface            Location             Cost
    -------- --------- ----------------------------- ------
     **2**    Gravel     Walters Pond (.68 miles)      20

     **3**     Paved      Teton Lakes (.58 miles)      20

     **10**   Gravel      Teton Lakes (.58 miles)      35

     **13**    Paved     Walters Pond (.68 miles)      80

     **16**   Gravel      Teton Lakes (.58 miles)      80

     **17**    Paved    Barney Dairy Rd (.37 miles)    80
    -------------------------------------------------------

  * **rows**: _2_, _3_, _10_, _13_, _16_ and _17_

<!-- end of list -->

#### (nTrials = 9)

```r
teton6 <-  expand.grid(
  Surface = c("Paved", "Gravel"),
  Location = c("Walters Pond (.68 miles)", "Teton Lakes (.58 miles)", "Barney Dairy Rd (.37 miles)" ),
  Cost = c("20", "35", "80")
  ) # Creating the choice sets


#teton$Cost <- sample(teton$Cost) # randomizing the columns

set.seed(69)

teton_output6 <- optFederov(~., data = teton6,  criterion = "D", nTrials = 9)

pander(teton_output6)
```



  * **D**: _0.2594_
  * **A**: _5.917_
  * **Ge**: _0.857_
  * **Dea**: _0.846_
  * **design**:

    -------------------------------------------------------
     &nbsp;   Surface            Location             Cost
    -------- --------- ----------------------------- ------
     **2**    Gravel     Walters Pond (.68 miles)      20

     **4**    Gravel      Teton Lakes (.58 miles)      20

     **5**     Paved    Barney Dairy Rd (.37 miles)    20

     **7**     Paved     Walters Pond (.68 miles)      35

     **10**   Gravel      Teton Lakes (.58 miles)      35

     **12**   Gravel    Barney Dairy Rd (.37 miles)    35

     **14**   Gravel     Walters Pond (.68 miles)      80

     **15**    Paved      Teton Lakes (.58 miles)      80

     **18**   Gravel    Barney Dairy Rd (.37 miles)    80
    -------------------------------------------------------

  * **rows**: _2_, _4_, _5_, _7_, _10_, _12_, _14_, _15_ and _18_

<!-- end of list -->


### Railroad Trail...



