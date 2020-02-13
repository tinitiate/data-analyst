-- 1. Get total sales by product category
-- ---------------------------------------
select  p.product_type ,sum(f.price)
from    dim_product p
       ,fact_sale   f
where  p.product_id = f.product_id
group by p.product_type;

-- 2. Get total sales of all food product category
-- -----------------------------------------------
select  sum(f.price)
from    dim_product p
       ,fact_sale   f
where  p.product_id = f.product_id
and    p.product_type in ('fruit', 'dairy','food', 'frozen food');
