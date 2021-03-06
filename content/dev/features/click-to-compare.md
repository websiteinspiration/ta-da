+++
date = "2019-07-03T15:20:47-04:00"
publishdate = "2019-07-03T17:22:18+0000"
title = "Click to set the comparison column for hypothesis tests"
news_description = "You can now click to set a reference column for hypothesis testing in tables. Click here to learn more."
description = "Tables are shaded to show which other columns are higher or lower than the reference column for each row."
weight = 20
tags = ["tables", "statistics"]
categories = ["feature"]
images = ["https://crunch.io/img/logo-1200x630.png"]
+++

Tables in the application now let you set a column as the basis of comparison, shading the table to show which other columns are higher or lower than the reference column, and to what level of statistical significance. The test is a two-tailed _t_ test comparing each column proportion in turn to the proportion in the reference column. In a multitable, the test is conducted between categories within each column variable, and not across column variables. [See here for more details](http://support.crunch.io/articles/c9e4yRRi/Hypothesis-testing-in-Crunch).

First turn on significance shading using the display controls at the bottom of the screen. The coloring ranges from dark green (much higher) to dark red (much lower) according to the P-value of the difference of what would be expected if the row and column variables were independent, based on the standardized residuals of the crosstab. To base all comparisons on a specific column, move your mouse over any column of a table or multitable. A new button appears beneath the column: “Set comparison.”

{{< figure src="dev/features/images/click-to-compare-static.png" class="img-fluid bordered">}}

When a column comparison is set, the reference column becomes grey and the other categories of its variable are colored by the _P_-value of their column percentage compared to the reference column. The reference column will remain set as long as the same column variable is in place, or you click Reset in the same column or select a different reference column.

{{< figure src="dev/features/images/click-to-compare-result-static.png" class="img-fluid bordered">}}


{{< figure src="dev/features/images/compare-columns.gif" class="img-fluid">}}
