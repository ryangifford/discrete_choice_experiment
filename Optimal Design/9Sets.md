---
title: "CASE STUDY TITLE"
author: "YOUR NAME"
date: "December 04, 2020"
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
# Use this R-Chunk to clean & wrangle your data!

teton <-  expand.grid(
  Surface = c("Paved", "Gravel", "Dirt"),
  Location = c("HWY 20 to Eagle Park (0.36 miles)", "Eagle Park to Railroad (0.68 miles)", "Business Park to Canal (0.91 miles)" ),
  Cost = c("20", "37", "49")
  ) # Creating the choice sets


#teton$Cost <- sample(teton$Cost) # randomizing the columns

set.seed(69)

teton_output <- optFederov(~., data = teton , nTrials = 9)

#######################################

rail <-  expand.grid(
  Surface = c("Paved", "Gravel", "Dirt"),
  Location = c("Poleline to 4th S. (1.63 miles)", "4th S. to Riverside Park (1.50 miles)", "Riverside Park to 2nd E. (0.49 miles)") ,
   Cost = c("88", "81", "26"))
  
  

set.seed(69)

rail_output <- optFederov(~., data = rail , nTrials = 9)





pander(rail_output)
```



  * **D**: _0.2435_
  * **A**: _6.143_
  * **Ge**: _1_
  * **Dea**: _1_
  * **design**:

    ----------------------------------------------------------
     &nbsp;   Surface              Location              Cost
    -------- --------- -------------------------------- ------
     **2**    Gravel       Poleline to 4th S. (1.63       88
                                    miles)

     **4**     Paved    4th S. to Riverside Park (1.50    88
                                    miles)

     **9**     Dirt     Riverside Park to 2nd E. (0.49    88
                                    miles)

     **12**    Dirt        Poleline to 4th S. (1.63       81
                                    miles)

     **14**   Gravel    4th S. to Riverside Park (1.50    81
                                    miles)

     **16**    Paved    Riverside Park to 2nd E. (0.49    81
                                    miles)

     **19**    Paved       Poleline to 4th S. (1.63       26
                                    miles)

     **24**    Dirt     4th S. to Riverside Park (1.50    26
                                    miles)

     **26**   Gravel    Riverside Park to 2nd E. (0.49    26
                                    miles)
    ----------------------------------------------------------

  * **rows**: _2_, _4_, _9_, _12_, _14_, _16_, _19_, _24_ and _26_

<!-- end of list -->

```r
pander(teton_output)
```



  * **D**: _0.2435_
  * **A**: _6.143_
  * **Ge**: _1_
  * **Dea**: _1_
  * **design**:

    --------------------------------------------------------
     &nbsp;   Surface             Location             Cost
    -------- --------- ------------------------------ ------
     **2**    Gravel     HWY 20 to Eagle Park (0.36     20
                                   miles)

     **4**     Paved    Eagle Park to Railroad (0.68    20
                                   miles)

     **9**     Dirt     Business Park to Canal (0.91    20
                                   miles)

     **12**    Dirt      HWY 20 to Eagle Park (0.36     37
                                   miles)

     **14**   Gravel    Eagle Park to Railroad (0.68    37
                                   miles)

     **16**    Paved    Business Park to Canal (0.91    37
                                   miles)

     **19**    Paved     HWY 20 to Eagle Park (0.36     49
                                   miles)

     **24**    Dirt     Eagle Park to Railroad (0.68    49
                                   miles)

     **26**   Gravel    Business Park to Canal (0.91    49
                                   miles)
    --------------------------------------------------------

  * **rows**: _2_, _4_, _9_, _12_, _14_, _16_, _19_, _24_ and _26_

<!-- end of list -->

