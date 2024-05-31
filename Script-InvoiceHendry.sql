create table Customers (
    customerID SERIAL primary key ,
    fullName varchar(255) not null,
    phoneNumber varchar(13) not null,
    Address varchar(255) not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

create table Vendors(
	vendorID SERIAL primary key,
	vendorName varchar(255) not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
); 

create table Products (
	productID SERIAL primary key,
	productName varchar(255) not null,
	productWeight int not null,
	price BigInt not null,
	stock int not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
	vendorID int not null,
	foreign key (vendorID) REFERENCES Vendors(vendorID)  
);

create table Shippers (
	shippersID SERIAL primary key,
	shippersName varchar(255) not null,
	shippersPrice BigInt not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

create table Promos (
	promoID SERIAL primary key,
	promoName varchar(255) not null,
	promoDiscount BigInt not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

create table Orders (
	orderID SERIAL primary key,
	invoiceName varchar(255) not null,
	deliveryInsuranceFee BigInt not null,
	deliveryFee BigInt not null,
	cashbackPromo BigInt not null,
	totalPrice BigInt not null,
	shippingID int not null,
	customerID int not null,
	vendorID int not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
	foreign key (shippingID) references Shippers(shippersID),
	foreign key (customerID) references Customers(customerID),
	foreign key (vendorID) references Vendors(vendorID)
);

create table PromoUsage (
	promoListID SERIAL primary key,
	promoAmount int not null,
	promoID int not null,
	orderID int not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
	foreign key(promoID) references Promos(promoID),
	foreign key (orderID) references Orders(orderID)
);


create table PaymentMethods (
	paymentID SERIAL primary key,
	paymentName varchar(255) not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);


create table PaymentMethodsList (
	paymentListID SERIAL primary key,
	transactionAmount int not null,
	paymentID int not null,
	orderID int not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
	foreign key(paymentID) references PaymentMethods(paymentID),
	foreign key (orderID) references Orders(orderID)
);


create table OrderItem (
	orderItemID SERIAL primary key,
	productID int not null,
	quantity int not null,
	price int not null,
	orderID int not null,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
	foreign key (productID) references Products(productID),
	foreign key (orderID) references Orders(orderID)
);


INSERT INTO Customers (fullName, phoneNumber, Address) VALUES
('John Doe', '1234567890', '123 Elm Street'),
('Jane Smith', '2345678901', '456 Oak Avenue'),
('Alice Johnson', '3456789012', '789 Pine Road'),
('Bob Brown', '4567890123', '101 Maple Boulevard'),
('Charlie Davis', '5678901234', '202 Birch Lane'),
('Diana Evans', '6789012345', '303 Cedar Circle'),
('Frank Green', '7890123456', '404 Spruce Street'),
('Grace Harris', '8901234567', '505 Willow Way'),
('Henry Wilson', '9012345678', '606 Poplar Drive'),
('Irene Young', '0123456789', '707 Aspen Avenue');

-- Insert dummy data into Vendors
INSERT INTO Vendors (vendorName) VALUES
('Vendor A'),
('Vendor B'),
('Vendor C'),
('Vendor D'),
('Vendor E'),
('Vendor F'),
('Vendor G'),
('Vendor H'),
('Vendor I'),
('Vendor J');

-- Insert dummy data into Products
INSERT INTO Products (productName, productWeight, price, stock, vendorID) VALUES
('Product 1', 10, 1000, 50, 1),
('Product 2', 20, 2000, 40, 2),
('Product 3', 15, 1500, 60, 3),
('Product 4', 25, 2500, 30, 4),
('Product 5', 10, 1000, 70, 5),
('Product 6', 20, 2000, 20, 6),
('Product 7', 15, 1500, 50, 7),
('Product 8', 25, 2500, 40, 8),
('Product 9', 10, 1000, 60, 9),
('Product 10', 20, 2000, 30, 10);

-- Insert dummy data into Shippers
INSERT INTO Shippers (shippersName, shippersPrice) VALUES
('Shipper A', 500),
('Shipper B', 600),
('Shipper C', 700),
('Shipper D', 800),
('Shipper E', 900),
('Shipper F', 1000),
('Shipper G', 1100),
('Shipper H', 1200),
('Shipper I', 1300),
('Shipper J', 1400);

-- Insert dummy data into Promos
INSERT INTO Promos (promoName, promoDiscount) VALUES
('Promo 1', 100),
('Promo 2', 200),
('Promo 3', 300),
('Promo 4', 400),
('Promo 5', 500),
('Promo 6', 600),
('Promo 7', 700),
('Promo 8', 800),
('Promo 9', 900),
('Promo 10', 1000);

-- Insert dummy data into Orders
INSERT INTO Orders (invoiceName, deliveryInsuranceFee, deliveryFee, cashbackPromo, totalPrice, shippingID, customerID, vendorID) VALUES
('Invoice 1', 50, 100, 10, 1060, 1, 1, 1),
('Invoice 2', 60, 200, 20, 1220, 2, 2, 2),
('Invoice 3', 70, 300, 30, 1380, 3, 3, 3),
('Invoice 4', 80, 400, 40, 1540, 4, 4, 4),
('Invoice 5', 90, 500, 50, 1700, 5, 5, 5),
('Invoice 6', 100, 600, 60, 1860, 6, 6, 6),
('Invoice 7', 110, 700, 70, 2020, 7, 7, 7),
('Invoice 8', 120, 800, 80, 2180, 8, 8, 8),
('Invoice 9', 130, 900, 90, 2340, 9, 9, 9),
('Invoice 10', 140, 1000, 100, 2500, 10, 10, 10);

-- Insert dummy data into PromoUsage
INSERT INTO PromoUsage (promoAmount, promoID, orderID) VALUES
(50, 1, 1),
(60, 2, 2),
(70, 3, 3),
(80, 4, 4),
(90, 5, 5),
(100, 6, 6),
(110, 7, 7),
(120, 8, 8),
(130, 9, 9),
(140, 10, 10);

-- Insert dummy data into PaymentMethods
INSERT INTO PaymentMethods (paymentName) VALUES
('Credit Card'),
('Debit Card'),
('PayPal'),
('Bank Transfer'),
('Cash on Delivery'),
('Google Pay'),
('Apple Pay'),
('Amazon Pay'),
('Stripe'),
('Square');

-- Insert dummy data into PaymentMethodsList
INSERT INTO PaymentMethodsList (transactionAmount, paymentID, orderID) VALUES
(1060, 1, 1),
(1220, 1, 1),
(1380, 3, 3),
(1540, 4, 4),
(1700, 5, 5),
(1860, 6, 6),
(2020, 7, 7),
(2180, 8, 8),
(2340, 9, 9),
(2500, 10, 10);

-- Insert dummy data into OrderItem
INSERT INTO OrderItem (productID, quantity, price, orderID) VALUES
(1, 2, 2000, 1),
(2, 1, 2000, 2),
(3, 3, 4500, 3),
(4, 1, 2500, 4),
(5, 2, 2000, 5),
(6, 1, 2000, 6),
(7, 3, 4500, 7),
(8, 2, 5000, 8),
(9, 1, 1000, 9),
(10, 2, 4000, 10);






	
