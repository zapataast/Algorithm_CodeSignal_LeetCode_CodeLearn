SELECT u1.user_id as buyer_id, u1.join_date ,ISNULL(uu.orders_in_2019,0) as orders_in_2019
FROM Users as u1 left join (SELECT buyer_id,count(*) as orders_in_2019 FROM Orders
                      where year(order_date) = 2019 
GROUP BY buyer_id) as uu on u1.user_id = uu.buyer_id


