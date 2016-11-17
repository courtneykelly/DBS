# DATABASE SYSTEMS
## Coursework 1

**Database schema** For this assignment we will use the schema available at:
            `<dbshome>/assignment1/schema.sql` 

where `<dbshome>` is `/afs/inf.ed.ac.uk/group/teaching/dbs`. This is a slight variation of the schema we have already seen in tutorial 1. You can create the schema in your PostgreSQL database on DICE with the command: `psql -h pgteach -1 -f <dbshome>/assignment1/schema.sql`. The schema file is annotated
with comments consisting of directives for datafiller to generate more realistic-looking test data. These directives will be completely ignored by the DBMS and do not in any way constrain the database.

**Assignment** Write the following queries in SQL

1. Invoices issued after their due date. Return all attributes

2. Invoices that were issued before the date in which the order they refer to was placed. Return the ID of the invoice, the date it was issued, the ID of the order associated with it and the date the order was placed.

3. Orders that do not have a detail and were placed before 6 September 2016. Return all attributes.

4. Customers who have not placed any orders in 2016. Return all attributes.

5. ID and name of customers and the date of their last order. For customers who did not place any orders, no rows must be returned. For each customer who placed more than one order on the date of their most recent order, only one row must be returned.

6. Invoices that have been overpaid. Observe that there may be more than one payment referring to the same invoice. Return the invoice number and the amount that should be reimbursed.

7. Products that were ordered more than 10 times in total, by taking into account the quantities in which they appear in the order details. Return the product code and the total number of times it was ordered.

8. Products that are usually ordered in bulk: whenever one of these products is ordered, it is ordered in a quantity that on average is equal to or greater than 8. For each such product, return product code and price.

9. Total number of orders placed in 2016 by customers of each country. If all customers from a specific country did not place any orders in 2016, the country will not appear in the output.

10. For each order without invoice, list its ID, the date it was placed and the total price of the products in its detail, taking into account the quantity of each ordered product and its unit price. Orders without detail must not be included in the answers.


