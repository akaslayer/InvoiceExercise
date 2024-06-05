select o.orderid, o.invoicename, o.updated_at as "Terakhir diubah" , v.vendorname from orders o join vendors v  on v.vendorid  = o.orderid;

select o.orderid, c.fullname,c.address,c.phonenumber from customers c join orders o on o.customerid  = c.customerid ;

select o.orderid,  p.productname, oi.quantity, p.price, (p.price * oi.quantity) as "Total Harga" from orders o join orderitem oi
on oi.orderid = o.orderid join products p on p.productid  = oi.productid;

select o.orderid as "Order ID" , sum(oi.quantity) as "Total Barang", sum(oi.price * oi.quantity) as "Total Harga",
o.deliveryinsurancefee as "Biaya Asuransi Pengiriman", o.deliveryfee as "Total Ongkos Kirim",
sum(oi.price * oi.quantity +o.deliveryfee + o.deliveryinsurancefee) as "Total Belanja", 1000 as "Biaya Layanan",
1000 as "Biaya Jasa Aplikasi", sum(oi.price * oi.quantity +o.deliveryfee + o.deliveryinsurancefee + 1000 + 1000) as "Total Tagihan"  from orders o
join orderitem oi
on oi.orderid  = o.orderid group by o.orderid;  

select o.orderid as "Order ID", string_agg(p.promoname, ', ') as "Nama Promo" , sum(pu.promoamount)  as "Total Diskon" from orders o
join promousage pu on pu.orderid = o.orderid join promos p on p.promoid  = pu.promoid group by o.orderid;

select o.orderid as "Order ID", string_agg(pm.paymentname, ', ')  as "Metode Pembayaran" from orders o join paymentmethodslist pml on pml.orderid  = o.orderid
join paymentmethods pm on pm.paymentid = pml.paymentid group by o.orderid; 

select o.orderid, s.shippersname from orders o join shippers s on s.shippersid  = o.shippingid; 