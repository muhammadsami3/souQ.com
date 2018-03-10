--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: java; Tablespace: 
--

CREATE TABLE cart (
    cartid integer NOT NULL,
    productid integer NOT NULL,
    quantity integer NOT NULL,
    customerid integer NOT NULL
);


ALTER TABLE public.cart OWNER TO java;

--
-- Name: cart_cartid_seq; Type: SEQUENCE; Schema: public; Owner: java
--

CREATE SEQUENCE cart_cartid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_cartid_seq OWNER TO java;

--
-- Name: cart_cartid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: java
--

ALTER SEQUENCE cart_cartid_seq OWNED BY cart.cartid;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: java; Tablespace: 
--

CREATE TABLE customer (
    id integer NOT NULL,
    uname text NOT NULL,
    fname text NOT NULL,
    lname text NOT NULL,
    passwd text NOT NULL,
    birthday text NOT NULL,
    email text NOT NULL,
    job text NOT NULL,
    address text NOT NULL,
    interests text NOT NULL,
    balance double precision DEFAULT 0
);


ALTER TABLE public.customer OWNER TO java;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: java
--

CREATE SEQUENCE customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO java;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: java
--

ALTER SEQUENCE customer_id_seq OWNED BY customer.id;


--
-- Name: finalcart; Type: TABLE; Schema: public; Owner: java; Tablespace: 
--

CREATE TABLE finalcart (
    cartid integer NOT NULL,
    orderid integer NOT NULL,
    productid integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.finalcart OWNER TO java;

--
-- Name: finalcart_cartid_seq; Type: SEQUENCE; Schema: public; Owner: java
--

CREATE SEQUENCE finalcart_cartid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finalcart_cartid_seq OWNER TO java;

--
-- Name: finalcart_cartid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: java
--

ALTER SEQUENCE finalcart_cartid_seq OWNED BY finalcart.cartid;


--
-- Name: home_page; Type: TABLE; Schema: public; Owner: java; Tablespace: 
--

CREATE TABLE home_page (
    id integer NOT NULL,
    image_path text
);


ALTER TABLE public.home_page OWNER TO java;

--
-- Name: home_page_id_seq; Type: SEQUENCE; Schema: public; Owner: java
--

CREATE SEQUENCE home_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_page_id_seq OWNER TO java;

--
-- Name: home_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: java
--

ALTER SEQUENCE home_page_id_seq OWNED BY home_page.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: java; Tablespace: 
--

CREATE TABLE orders (
    orderid integer NOT NULL,
    customerid integer NOT NULL,
    totalamount double precision NOT NULL,
    orderdate timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orders OWNER TO java;

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: java
--

CREATE SEQUENCE orders_orderid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderid_seq OWNER TO java;

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: java
--

ALTER SEQUENCE orders_orderid_seq OWNED BY orders.orderid;


--
-- Name: product; Type: TABLE; Schema: public; Owner: java; Tablespace: 
--

CREATE TABLE product (
    productid integer NOT NULL,
    name character varying(200) NOT NULL,
    price double precision NOT NULL,
    qyn integer NOT NULL,
    cat text NOT NULL,
    description text,
    img character varying(256)
);


ALTER TABLE public.product OWNER TO java;

--
-- Name: product_productid_seq; Type: SEQUENCE; Schema: public; Owner: java
--

CREATE SEQUENCE product_productid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productid_seq OWNER TO java;

--
-- Name: product_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: java
--

ALTER SEQUENCE product_productid_seq OWNED BY product.productid;


--
-- Name: cartid; Type: DEFAULT; Schema: public; Owner: java
--

ALTER TABLE ONLY cart ALTER COLUMN cartid SET DEFAULT nextval('cart_cartid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: java
--

ALTER TABLE ONLY customer ALTER COLUMN id SET DEFAULT nextval('customer_id_seq'::regclass);


--
-- Name: cartid; Type: DEFAULT; Schema: public; Owner: java
--

ALTER TABLE ONLY finalcart ALTER COLUMN cartid SET DEFAULT nextval('finalcart_cartid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: java
--

ALTER TABLE ONLY home_page ALTER COLUMN id SET DEFAULT nextval('home_page_id_seq'::regclass);


--
-- Name: orderid; Type: DEFAULT; Schema: public; Owner: java
--

ALTER TABLE ONLY orders ALTER COLUMN orderid SET DEFAULT nextval('orders_orderid_seq'::regclass);


--
-- Name: productid; Type: DEFAULT; Schema: public; Owner: java
--

ALTER TABLE ONLY product ALTER COLUMN productid SET DEFAULT nextval('product_productid_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: java
--

COPY cart (cartid, productid, quantity, customerid) FROM stdin;
\.


--
-- Name: cart_cartid_seq; Type: SEQUENCE SET; Schema: public; Owner: java
--

SELECT pg_catalog.setval('cart_cartid_seq', 1, true);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: java
--

COPY customer (id, uname, fname, lname, passwd, birthday, email, job, address, interests, balance) FROM stdin;
3	Rouen	Rouen	Antar	1234	11/1/1995	r@gmail.com	engineer	alexanderia	perfumes	100000
4	rouen	rouen	antar	1234	11/1/1995	rouen@gmail.com	engineer	alexanderia	perfumes	100000
2	m.badreldin	maryam	badreldin	123	10/3/1994	maryam@gmail.com	software	cairo	perfumes	10000
1	mena	mena	mgabara	1234	2/2/1995	menna@gmail.com	software	alexanderia	watches	-20000000
\.


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: java
--

SELECT pg_catalog.setval('customer_id_seq', 4, true);


--
-- Data for Name: finalcart; Type: TABLE DATA; Schema: public; Owner: java
--

COPY finalcart (cartid, orderid, productid, quantity) FROM stdin;
1	1	2	1
\.


--
-- Name: finalcart_cartid_seq; Type: SEQUENCE SET; Schema: public; Owner: java
--

SELECT pg_catalog.setval('finalcart_cartid_seq', 1, true);


--
-- Data for Name: home_page; Type: TABLE DATA; Schema: public; Owner: java
--

COPY home_page (id, image_path) FROM stdin;
2	../../imgs/slideShow/watchlogos3.jpg
3	../../imgs/slideShow/perfumelogos2
4	../../imgs/watches/watch1.png
5	../../imgs/watches/watch2.png
6	../../imgs/perfumes/212.png
7	../../imgs/watches/watch3.png
8	../../imgs/perfumes/gucci.png
9	../../imgs/perfumes/femme.png
10	../../imgs/watches/watch4.png
11	../../imgs/watches/watch5.png
12	../../imgs/watches/watch6.png
14	../../imgs/perfumes/212_2.png
15	../../imgs/perfumes/212_men.png
13	../../imgs/perfumes/amarige.png
16	../../imgs/perfumes/bvlgari.png
\.


--
-- Name: home_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: java
--

SELECT pg_catalog.setval('home_page_id_seq', 16, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: java
--

COPY orders (orderid, customerid, totalamount, orderdate) FROM stdin;
1	1	20000000	2018-03-08 16:15:01.700268
\.


--
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: java
--

SELECT pg_catalog.setval('orders_orderid_seq', 1, true);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: java
--

COPY product (productid, name, price, qyn, cat, description, img) FROM stdin;
2	BMW	20000000	1	Cars	egdfjklg	car1.jpg
3	Mercedes	1500000	2	watches	gcdbjknfv	car2.jpg
\.


--
-- Name: product_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: java
--

SELECT pg_catalog.setval('product_productid_seq', 3, true);


--
-- Name: pk_cart; Type: CONSTRAINT; Schema: public; Owner: java; Tablespace: 
--

ALTER TABLE ONLY cart
    ADD CONSTRAINT pk_cart PRIMARY KEY (cartid);


--
-- Name: pk_customer; Type: CONSTRAINT; Schema: public; Owner: java; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (id);


--
-- Name: pk_finalcart; Type: CONSTRAINT; Schema: public; Owner: java; Tablespace: 
--

ALTER TABLE ONLY finalcart
    ADD CONSTRAINT pk_finalcart PRIMARY KEY (cartid);


--
-- Name: pk_order; Type: CONSTRAINT; Schema: public; Owner: java; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT pk_order PRIMARY KEY (orderid);


--
-- Name: pk_product; Type: CONSTRAINT; Schema: public; Owner: java; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT pk_product PRIMARY KEY (productid);


--
-- Name: fk_cart_customerid; Type: FK CONSTRAINT; Schema: public; Owner: java
--

ALTER TABLE ONLY cart
    ADD CONSTRAINT fk_cart_customerid FOREIGN KEY (customerid) REFERENCES customer(id);


--
-- Name: fk_cart_orderid; Type: FK CONSTRAINT; Schema: public; Owner: java
--

ALTER TABLE ONLY finalcart
    ADD CONSTRAINT fk_cart_orderid FOREIGN KEY (orderid) REFERENCES orders(orderid);


--
-- Name: fk_cart_productid; Type: FK CONSTRAINT; Schema: public; Owner: java
--

ALTER TABLE ONLY finalcart
    ADD CONSTRAINT fk_cart_productid FOREIGN KEY (productid) REFERENCES product(productid);


--
-- Name: fk_order_customerid; Type: FK CONSTRAINT; Schema: public; Owner: java
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_order_customerid FOREIGN KEY (customerid) REFERENCES customer(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

