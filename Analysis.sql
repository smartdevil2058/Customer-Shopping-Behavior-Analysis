use `customer behaviour analysis`;
select * from customer_shopping_behavior ;
-- 01) ~~> What is the total revenue genrated by the male vs female?

select gender, sum(`purchase amount (USD)`) as revenue from customer_shopping_behavior group by gender;

-- 02) ~~> Which customers used a discount but still spent more than the avrage purchase amount?

SELECT `customer id`, `purchase amount (USD)`
FROM customer_shopping_behavior
WHERE `discount applied` = 'Yes'
  AND `purchase amount (USD)` >= (
      SELECT MAX(`purchase amount (USD)`)
      FROM customer_shopping_behavior
  );

-- 03) ~~> Which are the top 5 products with the highest average review rating?

select `Item Purchased`, avg(`Review Rating`) as "Average Product Rating"
from customer_shopping_behavior
group by `Item Purchased`
order by avg(`Review Rating`) desc
limit 5; 

-- 04) ~~> Compare the avrage purchase amounts between standard and express shipping ?

select `Shipping Type`,
avg(`purchase amount (USD)`) from customer_shopping_behavior
where `Shipping Type` in ( "Standard","Express" )
group by `Shipping Type`;

-- 05) ~~> Do subscribed customre spend more? Compare the average spend and total revenue between subscriber and non-subscriber.

select `Subscription Status`,
count(`Customer ID`) as total_customer,
avg(`Purchase Amount (USD)`) as avg_spend,
sum(`Purchase Amount (USD)`) as "total revenue"
from customer_shopping_behavior
group by `Subscription Status`
order by `total revenue`, avg_spend;

-- 06) ~~> Which 5 product has the highest percentage of purchases with the discouns applied?

select `Item Purchased`,
round(100*sum(case when `Discount Applied` = 'Yes' THEN 1  else 0 end)/ count(*) , 2) as "discount rate" 
from customer_shopping_behavior
group by `Item Purchased`
order by `discount rate` desc
limit 5;

-- 07) ~~> Segment customers into new, returning, and loyal based on their total number of the  previous purchases, and show the count of each sagement.

WITH customer_type AS (
    SELECT 
        `Customer ID`,
        `Previous Purchases`,
        CASE 
            WHEN `Previous Purchases` = 1 THEN 'New'
            WHEN `Previous Purchases` BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS customer_segment
    FROM customer_shopping_behavior
)

SELECT 
    customer_segment,
    COUNT(*) AS number_of_customers
FROM customer_type
GROUP BY customer_segment;

-- 08) ~~> What are the top 3 most purchased product within each category?

WITH item_count AS (
    SELECT
        Category,
        `Item Purchased`,
        COUNT(`Customer ID`) AS total_orders
    FROM customer_shopping_behavior
    GROUP BY Category, `Item Purchased`
),
ranked_items AS (
    SELECT
        Category,
        `Item Purchased`,
        total_orders,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY total_orders DESC
        ) AS item_rank
    FROM item_count
)

SELECT
    item_rank,
    Category,
    `Item Purchased`,
    total_orders
FROM ranked_items
WHERE item_rank <= 3;

-- 09) ~~> Are customers who are repeat buyers( more tham 5 previous purchases) also likely to subscribe?

select `Subscription Status`,
count(`Customer ID`) as repeat_buyers 
FROM customer_shopping_behavior
where `Previous Purchases` > 5
group by `Subscription Status`



