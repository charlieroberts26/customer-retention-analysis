# Customer Retention and Profitability Analysis

## Objective

Determine how effectively the company retains customers and identify which customers and customer segments generate the greatest long-term value.

## Dataset

The Superstore dataset contains sales transactions, profit, discounts, products, categories, regions, customers, and order dates from 2014–2017.

## Tools and Techniques

- MySQL.
- Data Cleaning (converted date fields to MySQL date format, validated new date columns, renamed date columns to replace original fields, and verified dates could be used with functions such as YEAR() and MONTH()).
- Aggregations and Grouping.
- Common Table Expressions (CTEs).
- Window Functions.
- Date Functions.
- Customer Retention Analysis.
- Customer Profitability Analysis.

## Analysis Process

- Analyzed customer growth between 2014 and 2017.
- Measured year-over-year changes in the customer base.
- Investigated repeat purchasing behavior.
- Examined customer purchasing frequency.
- Identified the highest-value customers by sales and profit.
- Calculated and compared customer revenue and profitability.
- Analyzed customer segments by revenue and profitability.

## Key Findings

### Customer Growth

The customer base saw a small (3.73%) drop in size from 2014 to 2015 but has increased since then. The largest increase was 2015 to 2016 when the customer base grew by 11.8%.


2014: 590 customers
2015: 568 customers (-22, -3.73%)
2016: 635 customers (+67, +11.80%)
2017: 690 customers (+55, +8.66%)

### Top customers

The ten highest-spending customers generated between $12,129 and $25,043 in revenue. Sean Miller was the largest customer by revenue, generating $25,043.05 in sales.


Despite there being several high-spending customers, revenue was not highly concentrated. The top 10 customers only accounted for 6.76% of total company revenue. This suggests that company performance depends on a broad customer base rather than a small number of high-spending customers.


### Customer retention


781 customers were repeat purchasers, accounting for 98.49% of the customer base. This suggests the company is successful at retaining customers.


Only 12 customers placed a single order. Most customers placed between 4 and 9 orders, with 5 orders being the most common purchasing frequency (129 customers).


### Customer Profitability

Analysis showed that several of the highest-revenue customers were not among the most profitable customers. Sean Miller generated the highest revenue in the dataset ($25,043.05) but produced a loss of $1,980.74, while Ken Lonsdale generated $14,071.92 in revenue but achieved a profit margin of only 5.46%. By contrast, Tamara Chand generated the highest profit ($8,964.48), followed by Raymond Buch ($6,976.10) and Sanjit Chand ($5,757.41). These results suggest that revenue alone is an unreliable measure of customer value.


### Customer Segment Results

Home Office customers generated the highest profit margin (14.05%) but contributed the least revenue and profit overall. Consumer customers generated the most revenue ($1.15M) and profit ($132.7K), despite having the lowest profit margin (11.53%). No one segment appears to be particularly beneficial or especially problematic.


## Conclusion

Customer retention was extremely high, with 98.49% of customers placing more than one order and most customers making between four and nine purchases. As a result, comparisons between one-time and repeat purchasers provided limited additional insight because one-time customers represented only a very small proportion of the customer base. 

Revenue was distributed broadly across the customer base, with the ten highest-spending customers accounting for only 6.76% of total company revenue.

Customer profitability varied substantially and several high-revenue customers generated relatively little profit and, even losses in some cases. The most notable was Sean Miller, who generated $25,043.05 in revenue but produced a loss of $1,980.74.  

These findings suggest that the company benefits from a sizeable and loyal customer base, but that revenue alone does not appear to be a good indication of customer value and should be evaluated alongside profitability.