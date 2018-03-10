
CREATE TABLE Customer (
    id serial  NOT NULL ,
    uname text  NOT NULL ,
    fname text  NOT NULL ,
    lname text  NOT NULL ,
    passwd text  NOT NULL ,
    birthday text  NOT NULL ,
    email text  NOT NULL ,
    job text  NOT NULL ,
    address text  NOT NULL ,
    interests text  NOT NULL ,
    balance int,
    CONSTRAINT pk_Customer PRIMARY KEY (
        id
    )
);



CREATE TABLE Orders (
    OrderID serial  NOT NULL ,
    CustomerID int  NOT NULL ,
    TotalAmount double precision  NOT NULL ,
    CONSTRAINT pk_Order PRIMARY KEY (
        OrderID
    )
);

CREATE TABLE cart (
    cartID serial  NOT NULL ,
    ProductID int  NOT NULL ,
    Quantity int  NOT NULL ,
 CustomerID int  NOT NULL ,
    CONSTRAINT pk_cart PRIMARY KEY (
        cartID
    )
);


CREATE TABLE Product (
    ProductID serial  NOT NULL ,
    Name varchar(200)  NOT NULL ,
    Price double precision  NOT NULL ,
    qyn int NOT NULL,
    cat text Not NuLL,
    CONSTRAINT pk_Product PRIMARY KEY (
        ProductID
    )
);


CREATE TABLE finalcart (
    cartID serial  NOT NULL ,
    OrderID int  NOT NULL ,
    ProductID int  NOT NULL ,
    Quantity int  NOT NULL ,
    CONSTRAINT pk_finalcart PRIMARY KEY (
        cartID
    )
);

CREATE TABLE home_page (
    id serial ,
    image_path text
);

ALTER TABLE Orders ADD CONSTRAINT fk_Order_CustomerID FOREIGN KEY(CustomerID)
REFERENCES Customer (id) on delete cascade;



ALTER TABLE finalcart ADD CONSTRAINT fk FOREIGN KEY(OrderID)
REFERENCES Orders (OrderID) on delete cascade;

ALTER TABLE cart ADD CONSTRAINT fk_cart_customerID FOREIGN KEY(CustomerID)
REFERENCES Customer (id) on delete cascade;


ALTER TABLE finalcart ADD CONSTRAINT fk_cart_ProductID FOREIGN KEY(ProductID)
REFERENCES Product (ProductID) on delete cascade;

ALTER TABLE product
ADD COLUMN description text ,ADD COLUMN img varchar(256);

ALTER TABLE orders
ADD COLUMN orderdate timestamp DEFAULT now();


INSERT INTO home_page(image_path)
VALUES
 ('../../imgs/slideShow/watchlogos3.jpg'),('../../imgs/slideShow/perfumelogos2'),
('../../imgs/watches/watch1.png'),('../../imgs/watches/watch2.png'),
('../../imgs/perfumes/212.png'),('../../imgs/watches/watch3.png'),
('../../imgs/perfumes/gucci.png'),('../../imgs/perfumes/femme.png'),
('../../imgs/watches/watch4.png'),('../../imgs/watches/watch4.png'),
('../../imgs/watches/watch5.png'),('../../imgs/watches/watch6.png'),
('../../imgs/perfumes/212_2.png'),('../../imgs/perfumes/212_men.png'),
('../../imgs/perfumes/amarige.png'),('../../imgs/perfumes/bvlgari.png');
	
	
	
	

 
