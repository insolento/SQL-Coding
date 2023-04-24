/*DROP TABLE Comm_Shipping_Details;
DROP TABLE Comm_Address;
DROP TABLE Comm_Costumers;
DROP TABLE Comm_Order_Details;
DROP TABLE Comm_Product_Offer;
DROP TABLE Comm_Product;
DROP TABLE Comm_Categories;*/

CREATE TABLE Comm_Categories
(Category_ID NUMBER(4),
Name VARCHAR2(30) NOT NULL,
Description VARCHAR2(50),
Thumbnail VARCHAR2(10),
   CONSTRAINT Categorie_Cat_ID_pk PRIMARY KEY(Category_ID));

INSERT INTO Comm_Categories 
VALUES (1000,'Laptops', 'portatil computers', null);
INSERT INTO Comm_Categories 
VALUES (1001,'Desktops', 'Desk computers', null);
INSERT INTO Comm_Categories 
VALUES (1002,'Smartphones', 'mobile devices', null);  
INSERT INTO Comm_Categories 
VALUES (1003,'VideoGames', 'game consoles', null);  
INSERT INTO Comm_Categories 
VALUES (1004,'Accesories', 'gadgets', null); 

CREATE TABLE Comm_Product
(Comm_Product_ID NUMBER(4),
Category_id NUMBER(4),
Name VARCHAR2(50) NOT NULL,
Price NUMBER(4),
Product_Size VARCHAR2(20),
Description VARCHAR2(250),
Colour VARCHAR2(10),
Image VARCHAR2(10),
Created DATE,
Stock NUMBER(4),
   CONSTRAINT Product_Product_ID_pk PRIMARY KEY(Comm_Product_ID),
   CONSTRAINT Product_Category_id_fk FOREIGN KEY(Category_id)
   REFERENCES Comm_Categories(Category_id));
   
   
INSERT INTO Comm_Product 
VALUES (1000,1000, 'Macbook Air 2020', 1300, '13.6 inches',
'The Apple MacBook Air 2020 packs 256GB of SSD storage. Graphics are powered by Integrated Graphics Processor. Connectivity options include Wi-Fi 802.11 a/b/g/n/ac',
'grey', null, TO_DATE('01-APR-23','DD-MON-YY'),10); 

INSERT INTO Comm_Product 
VALUES (1001,1000, 'Macbook Pro M2', 1900, '14 inches',
'The Apple MacBook PRO M2 offers advancements in performance and efficiency with an 18 percent faster CPU, a 35 percent faster GPU, and a 40 percent faster Neural Engine. The MacBook Pro supports up to 2TB SSD storage and 24GB memory.',
'midnight', null, TO_DATE('01-APR-23','DD-MON-YY'),5); 

INSERT INTO Comm_Product 
VALUES (1002,1002, 'Iphone 14 PRO MAX', 1700, '6.69 inches',
'The iPhone 14 Pro Max display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape. Both models: Dynamic Island.',
'DeepPurple', null, TO_DATE('01-APR-23','DD-MON-YY'),50); 

INSERT INTO Comm_Product 
VALUES (1003,1002, 'Iphone 14', 1099, '6.1 inches',
'Apples iPhone 14 models are identical in design to the iPhone 13 models, featuring flat edges, an aerospace-grade aluminum enclosure, and a glass back that enables wireless charging.',
'silver', null, TO_DATE('01-APR-23','DD-MON-YY'),50); 

INSERT INTO Comm_Product 
VALUES (1004,1003, 'Playstation 5', 599, '15.4 inches',
'Powered by an eight-core AMD Zen 2 CPU and custom AMD Radeon GPU, the PS5 is offered in two models: with and without a 4K Blu-ray drive. Supporting a 120Hz video refresh, the PS5 is considerably more powerful than the PS4 and PS4 Pro',
'white', null, TO_DATE('01-APR-23','DD-MON-YY'),8); 



CREATE TABLE Comm_Product_Offer
(Product_Offer_ID NUMBER(4),
Comm_Product_ID NUMBER(4),
Discount NUMBER(4) NOT NULL,
Start_Date DATE NOT NULL,
Expiration_Date DATE NOT NULL,
   CONSTRAINT Offer_Product_Offer_ID_pk PRIMARY KEY(Product_Offer_ID),
   CONSTRAINT Offer_Product_ID_fk FOREIGN KEY(Comm_Product_ID)
   REFERENCES Comm_Product(Comm_Product_ID));
   
INSERT INTO Comm_Product_Offer 
VALUES (1000,1000, 10,TO_DATE('01-JAN-23','DD-MON-YY'), TO_DATE('30-APR-23','DD-MON-YY'));
INSERT INTO Comm_Product_Offer 
VALUES (1001,1000, 15,TO_DATE('01-MAY-23','DD-MON-YY'), TO_DATE('05-MAY-23','DD-MON-YY'));
INSERT INTO Comm_Product_Offer 
VALUES (1002,1003, 5,TO_DATE('01-APR-23','DD-MON-YY'), TO_DATE('30-APR-23','DD-MON-YY'));
INSERT INTO Comm_Product_Offer 
VALUES (1003,1002, 2,TO_DATE('01-APR-23','DD-MON-YY'), TO_DATE('10-APR-23','DD-MON-YY'));
INSERT INTO Comm_Product_Offer 
VALUES (1004,1004, 25,TO_DATE('01-APR-23','DD-MON-YY'), TO_DATE('15-MAY-23','DD-MON-YY'));
 

CREATE TABLE Comm_Order_Details
(Order_Details_ID NUMBER(4),
Comm_Product_ID NUMBER(4) NOT NULL,
Quantity NUMBER(4) NOT NULL,
Price NUMBER(8),
Sku VARCHAR2(10),
   CONSTRAINT Order_Detail_ID_pk PRIMARY KEY(Order_Details_ID),
   CONSTRAINT OrderD_Product_ID_fk FOREIGN KEY(Comm_Product_ID)
   REFERENCES Comm_Product(Comm_Product_ID));

INSERT INTO Comm_Order_Details 
VALUES (1000,1000, 2, 2600, 'AB100');
INSERT INTO Comm_Order_Details 
VALUES (1001,1001, 1, 1900, 'AB200');
INSERT INTO Comm_Order_Details 
VALUES (1002,1004, 6, 3594, 'ABC10');
INSERT INTO Comm_Order_Details 
VALUES (1003,1004, 3, 1797, 'ABC20');
INSERT INTO Comm_Order_Details 
VALUES (1004,1003, 2, 16485, 'AB100');


CREATE TABLE Comm_Costumers
(Costumer_ID NUMBER(4),
email VARCHAR2(25) NOT NULL,
password VARCHAR2(12) NOT NULL,
full_name VARCHAR2(40) NOT NULL,
billing_address VARCHAR2(40),
default_shipping_address NUMBER(1),
country VARCHAR2(25),
phone NUMBER(10),
address_ID NUMBER(4),
   CONSTRAINT Comm_Costumer_ID_pk PRIMARY KEY(Costumer_ID));
   
INSERT INTO Comm_Costumers 
VALUES (1000,'max1@outlook.com', 'abc123', 'Max', null, 0, 'USA', 6574297585, 1000);
INSERT INTO Comm_Costumers 
VALUES (1001,'ricardo1@outlook.com', 'efg123', 'Ricardo', '100 Dirwell Rd', 0, 'CANADA', null, 1001);
INSERT INTO Comm_Costumers 
VALUES (1002,'isnel1@outlook.com', 'hij123', 'Isnel', null, 0, 'BRASIL', 4254297585, 1002);
INSERT INTO Comm_Costumers 
VALUES (1003,'sergio1@outlook.com', 'klm123', 'Sergio', null, 0, 'CUBA', 4874297511, 1003);
INSERT INTO Comm_Costumers 
VALUES (1004,'Daniela@outlook.com', 'nop123', 'Daniela', '1557 NY Avenue', 1, 'USA', 9564297585, 1004);

CREATE TABLE Comm_Address
(address_ID NUMBER(4),
costumer_ID NUMBER(4) NOT NULL,
state VARCHAR2(25),
city VARCHAR2(25),
street VARCHAR2(25),
apartment NUMBER(4),
   CONSTRAINT Address_ID_pk PRIMARY KEY(address_ID),
   CONSTRAINT Addresscostumer_ID_fk FOREIGN KEY(costumer_ID)
   REFERENCES Comm_Costumers(costumer_ID));

INSERT INTO Comm_Address    
VALUES (1000,1000, 'NEW YORK', 'NY', '1102', null);
INSERT INTO Comm_Address    
VALUES (1001,1001, 'ONTARIO', 'TORONTO', 'Dundas', 132);
INSERT INTO Comm_Address    
VALUES (1002,1002, 'Río de Janeiro', null, null, null);
INSERT INTO Comm_Address    
VALUES (1003,1003, null, 'La Habana', null, null);
INSERT INTO Comm_Address    
VALUES (1004,1004, 'MICHIGAN', 'Detroit', null, null);

CREATE TABLE Comm_Shipping_Details
(Shipping_Details_ID NUMBER(4),
Comm_Product_ID NUMBER(4) NOT NULL,
Order_Details_ID NUMBER(4),
Costumer_ID NUMBER(4),
traking_number VARCHAR2(20),
shipped_detail VARCHAR2(20),
delivery_on VARCHAR2(20),
   CONSTRAINT Shipping_Details_ID_pk PRIMARY KEY(Shipping_Details_ID),
   CONSTRAINT Shipping_Product_ID_fk FOREIGN KEY(Comm_Product_ID)
   REFERENCES Comm_Product(Comm_Product_ID),
   CONSTRAINT Shippingd_ODetails_ID_fk FOREIGN KEY(Order_Details_ID)
   REFERENCES Comm_Order_Details(Order_Details_ID),
   CONSTRAINT Shipping_costumer_ID_fk FOREIGN KEY(Costumer_ID)
   REFERENCES Comm_Costumers(Costumer_ID));
   
INSERT INTO Comm_Shipping_Details    
VALUES (1000, 1000, 1000, 1000, 'QWERTY132', null, null);
INSERT INTO Comm_Shipping_Details    
VALUES (1001, 1001, 1001, 1001, 'QWERTY456', null, null);
INSERT INTO Comm_Shipping_Details    
VALUES (1002, 1002, 1002, 1002, 'QWERTY789', null, null);
INSERT INTO Comm_Shipping_Details    
VALUES (1003, 1003, 1003, 1003, 'QWERTY741', null, null);
INSERT INTO Comm_Shipping_Details    
VALUES (1004, 1004, 1004, 1004, 'QWERTY852', null, null);
