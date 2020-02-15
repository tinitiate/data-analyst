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


-- 3. In which sale type teams should I invest
select  count(1), st.type_name, p.product_type
from    dim_product p
       ,fact_sale      f
       ,dim_sales_type st
where  p.product_id = f.product_id 
and    f.sales_type_id = st.sales_type_id
group by st.type_name,p.product_type

831	OFFLINE
253	ONLINE
-- Which season or group of months "dairy" has highest sales
select  count(1), t.action_month, p.product_type
from    dim_product p
       ,fact_sale    f
       ,dim_time    t
where  p.product_id = f.product_id 
and    f.time_id = t.time_id
and    p.product_type = 'dairy'
group by t.action_month,p.product_type
order by t.action_month;


