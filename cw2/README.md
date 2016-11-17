# DATABASE SYSTEMS
## Coursework 1

**Database schema** For this assignment we will use the schema available at:
            `<dbshome>/assignment2/schema.sql` 
            
where `<dbshome>` is `/afs/inf.ed.ac.uk/group/teaching/dbs`. This is again a variation of the schema we have used in Coursework 1. Table Products now has an additional column ptype that indicates the type of product. The same product cannot have two different values of ptype. In the test database, there are three types of products: `BOOK`, `MUSIC` and `MOVIE`. If a query asks for books, this means products where the value of ptype is the string `BOOK` (case-sensitive), and similarly for the other two product types. However, if a query asks something for each product type, you cannot assume that the values for ptype will only be `BOOK`, `MUSIC` and `MOVIE`: there is no constraint in the database schema that enforces that, and your query must work independently of which and how many types of products there are in the database it is run against. Indeed, the instances on which your queries will be executed may well contain other, different types of products (as well as customers’ countries).

**Assignment** Write the following queries in SQL

1. Total number of orders placed in 2016 by customers of each country. If all customers from a specific country did not place any orders in 2016, the country appears in the output with 0 total orders. Return all countries and corresponding total counts.

2. For each product type calculate the average number of times products of that type have been included in an order (taking into account quantities). Orders that do not include any product of a certain type do not contribute to the average for that type (rather than contributing 0). Return the product type and the corresponding average; the latter must be a number with exactly two decimal places. Types of products that have never been ordered are not included in the output.

3. Find invoices that have been vatted. The amount of such invoices is the total of the order they refer to plus 20%. Return the invoice ID. Keep in mind the datatype of ”amount” in invoices and pay special attention to rounding. Do not use PostgreSQL’s round function, which is not SQL standard and would likely give you a wrong result.

4. For each type of product, find the customer who ordered the highest number of products of that type (taking into account quantities). Return the product type and the ID of the customer. If two or more customers are tied for a specific product type they will all be included in the output. If no products of a specific type have ever been ordered, that type will not be in the output.

5. For each customer, calculate the number of orders placed and the average spend, which is the average total (taking into account quantities and unit prices of ordered products) across all orders placed by that customer. Return the customer ID, the number of orders, and the corresponding average spend. The latter must be a number with exactly two decimal places. Orders without detail must be considered in the calculation of the average as having a total of 0. Customers who did not place any orders will be included in the output with 0 orders (not 0.00 or anything else, just 0) and NULL average spend.

6. For each product type, calculate the number of orders consisting only of products of that type. Return the product type and the number of orders.

7. Find “poor readers”: customers who have not purchased any books in 2016. Return the customer ID.

8. Find customers who spent less than 50 in music in the period between January and June 2016 (extremes included). Return the customer ID and the corresponding spend. Customers who have not bought any music in the given period must be returned with 0.00 spend (precisely in this form).

9. For each customer who has placed at least two orders, calculate the longest number of days ever elapsed between any one order and the next. The only case in which this interval (which you can calculate as the difference of two dates) will be zero is for customers who placed at least two orders and all of them were placed in the same day. Whether an order has a detail is irrelevant. Return the customer ID and the corresponding interval (which will be an integer).

10. Find customers who have placed at least 5 orders, all in different dates, and the interval between any one of their orders and the next (not on the same date) is less than 30 days on average. The interval between any two orders placed in the same day (which is 0) does not contribute to the average. Whether an order has a detail or not is irrelevant. Return the customer ID only. To some extent, this query is similar to the previous one, but subtly different. Take a moment to think before doing copy & paste.


 

