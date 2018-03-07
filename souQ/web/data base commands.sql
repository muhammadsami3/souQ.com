
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
    id integer ,
    image_path text
);

ALTER TABLE Orders ADD CONSTRAINT fk_Order_CustomerID FOREIGN KEY(CustomerID)
REFERENCES Customer (id);



ALTER TABLE finalcart ADD CONSTRAINT fk_cart_OrderID FOREIGN KEY(OrderID)
REFERENCES Orders (OrderID);

ALTER TABLE cart ADD CONSTRAINT fk_cart_customerID FOREIGN KEY(CustomerID)
REFERENCES Customer (id);


ALTER TABLE finalcart ADD CONSTRAINT fk_cart_ProductID FOREIGN KEY(ProductID)
REFERENCES Product (ProductID);

ALTER TABLE product
ADD COLUMN description text ,ADD COLUMN img varchar(256);

ALTER TABLE orders
ADD COLUMN orderdate timestamp DEFAULT now();


INSERT INTO home_page(image_path)
VALUES
 ('../../imgs/slideShow/perfumelogos2'),('../../imgs/slideShow/watchlogos3.jpg'),('../../imgs/slideShow/Ad6.png'),('../../imgs/slideShow/Ad11.jpg'),('../../imgs/slideShow/Ad3.jpg'),('../../imgs/slideShow/Ad1.png'),('../../imgs/slideShow/Ad2.png'),('../../imgs/slideShow/watch10.jpeg'),('../../imgs/slideShow/perfumelogos4.jpeg');

