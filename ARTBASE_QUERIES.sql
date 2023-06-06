-- Test Case 1
-- What is the count of total artworks created by each artist who has created more than one artwork, and
-- whose name has the letter "o"?

WITH counts_above2 as
  (SELECT artist_name, COUNT(*) AS total_artwork
FROM artwork
GROUP BY artist_name
HAVING COUNT(*) > 1)

SELECT * FROM counts_above2
WHERE artist_name LIKE ('%o%');


-- Test Case 2
-- Get the title, art type, and price of artworks that have a price that is greater than or equal to the
-- average price of all artworks rounded to one decimal place. Sort the result by the price of artworks in ascending order.

SELECT title, art_type, price FROM artwork WHERE price >=
(select round(AVG(price),1) from artwork)
ORDER BY price ASC;


-- Test Case 3
-- What is the total amount of sold artworks that were created in the year 2000 and beyond?
SELECT SUM(price) AS total_amount_sold FROM artwork
WHERE year_created >= 2000;


-- Test Case 4
-- What is the title, type, price, and artist name of artworks that were created between the years 1900 and
-- 1999 or have a price greater than or equal to $20,000?
SELECT * FROM artwork
WHERE year_created BETWEEN '1900' AND '1999' OR price >= 20000;


-- Test Case 5
-- What customers live in either USA or the United Kingdom, and whose names have the letter "D"?

SELECT * FROM customer
WHERE country IN ('USA', 'United Kingdom') AND cus_name LIKE ('D___%');


-- Test Case 6
-- Create a view "customers_art_purchase" to get the artist’s name, title, and price of artwork each
-- customer likes. Order the result by the customer’s name.

CREATE VIEW customers_art_purchase
AS
SELECT c.cus_name, aw.title, cla.artist_name, aw.price
FROM customer c
LEFT Join cus_like_artist cla
ON c.cus_id = cla.cus_id
JOIN artwork aw
ON cla.artist_name = aw.artist_name
ORDER BY cus_name;

SELECT * FROM customers_art_purchase;


-- Test Case 7
-- Provide the number of customers that like each group of art. Group the result by the group name.

SELECT group_name, count(c.cus_id) FROM
customer c
JOIN cus_like_group cg
ON c.cus_id = cg.cus_id
JOIN artgroup ag
ON cg.group_id = ag.group_id
GROUP BY group_name;


-- Test Case 8
-- retrieve the average price of artwork for each art group and sorts the results in descending order based on the average price

SELECT ag.group_name,  ROUND(AVG(aw.price),2) AS avgearae_price
FROM artwork aw
JOIN classify cl
ON aw.title = cl.title
JOIN artgroup ag
ON cl.group_id = ag.group_id
GROUP BY ag.group_name
ORDER BY AVG(aw.price) DESC;


-- Test Case 9
-- What is the total sum of artwork purchased by each customer? Group the result by the customer’s name.

SELECT cus_name, SUM(price) AS total_amount FROM (SELECT c.cus_name, aw.title, cla.artist_name, aw.price
FROM customer c
LEFT Join cus_like_artist cla
ON c.cus_id = cla.cus_id
JOIN artwork aw
ON cla.artist_name = aw.artist_name)
GROUP BY cus_name;


-- Test Case 10
-- Create a trigger to capitalize the customer’s name in the customer table on insertion.

CREATE OR REPLACE TRIGGER capitalize_customer_name
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
:NEW.cus_name := UPPER(:NEW.cus_name);
END; 
/

-- Check it out
INSERT INTO customer (cus_id, cus_name, city, country, phone_no,
amount_spent) VALUES('c_22', 'Testing trigger creation', 'Japan',
'Tokyo', '+81 6025550163', 20550.00)


-- Test Case 11
-- What artworks are qualified or not qualified for a discount if the price of the artwork is greater than $10,000?

CREATE FUNCTION discounted_price(price IN NUMBER)
RETURN VARCHAR2
IS status VARCHAR2(30);

BEGIN
     CASE
        WHEN price > 10000.00 THEN 
         status := 'Qualified for discount';
        ELSE status :='No discount needed';
     END CASE;
    RETURN status;
END;
/
SELECT title, price, discounted_price(price)AS status FROM artwork;