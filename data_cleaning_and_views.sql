create or replace view v_clean_orders as
select
`Order Id` as order_id,
`Customer Id` AS customer_id,
`Category Name` AS category_name,
`Product Name` AS product_name,
str_to_date(`order date (DateOrders)`, '%m/%d/%Y') as order_date, -- konwersja daty, bo jest jako txt, duże Y bo rok ma 4 cyfry
cast(`Sales per customer` as Decimal(10,2)) as revenue, -- cast bo jest typ jest double
cast(`Order Profit Per Order` as Decimal(10,2)) as margin,
cast(`Product Price` as decimal(10,2)) as product_price,
cast(`Order Item Quantity` as SIGNED) as quantity, -- SIGNED bo INT w mysql nie działa
`Delivery Status` AS delivery_status,
`Late_delivery_risk` AS late_risk,
cast(`Days for shipping (real)` AS SIGNED) AS days_shipping_real,
cast(`Days for shipment (scheduled)` AS SIGNED) AS days_shipping_scheduled,
`Order City` AS order_city,
`Order Country` as order_country,
`Order Region` AS order_region,
cast(`Days for shipping (real)` AS SIGNED) - cast(`Days for shipment (scheduled)` AS SIGNED) as shipping_gap,
case
	when `Delivery Status` = 'Late delivery' then 1 else 0
    end as is_late,
case
	when cast(`Days for shipping (real)` AS SIGNED) < cast(`Days for shipment (scheduled)` AS SIGNED) then 'Early'
    when cast(`Days for shipping (real)` AS SIGNED) = cast(`Days for shipment (scheduled)` AS SIGNED) then 'On time'
    else 'Late'
    end as delivery_performance,
case 
	when `Delivery Status` = 'Late delivery' and cast(`Days for shipping (real)` AS SIGNED) > cast(`Days for shipment (scheduled)` AS SIGNED) then 1 else 0
    end as delivery_ocochodzi,
`Product Image` as product_photo,
`Shipping Mode`
from raw_supply_chain;