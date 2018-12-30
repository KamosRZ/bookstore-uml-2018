--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    pseudonym text,
    era text
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.authors.id;


--
-- Name: authors_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors_tags (
    author_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.authors_tags OWNER TO postgres;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer NOT NULL,
    name text NOT NULL,
    publishing_date timestamp without time zone NOT NULL,
    description text,
    price double precision NOT NULL,
    author_id integer NOT NULL,
    available_quantity integer NOT NULL
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: book_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_titles_id_seq OWNER TO postgres;

--
-- Name: book_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_titles_id_seq OWNED BY public.books.id;


--
-- Name: books_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books_tags (
    book_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.books_tags OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address text NOT NULL,
    bought_books integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customers.id;


--
-- Name: customers_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_tags (
    customer_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.customers_tags OWNER TO postgres;

--
-- Name: TABLE customers_tags; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.customers_tags IS 'Tracks what tags the customer is interested in.';


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: supplier_deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_deliveries (
    id integer NOT NULL,
    suppler_id integer NOT NULL
);


ALTER TABLE public.supplier_deliveries OWNER TO postgres;

--
-- Name: supplier_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_deliveries_id_seq OWNER TO postgres;

--
-- Name: supplier_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_deliveries_id_seq OWNED BY public.supplier_deliveries.id;


--
-- Name: supplier_delivery_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_delivery_entry (
    id integer NOT NULL,
    supplier_delivery_id integer NOT NULL,
    book_id integer NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.supplier_delivery_entry OWNER TO postgres;

--
-- Name: supplier_delivery_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_delivery_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_delivery_entry_id_seq OWNER TO postgres;

--
-- Name: supplier_delivery_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_delivery_entry_id_seq OWNED BY public.supplier_delivery_entry.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    id integer NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    address text NOT NULL,
    iban text NOT NULL,
    user_id integer NOT NULL,
    bulstat text NOT NULL
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    description text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.book_titles_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: supplier_deliveries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_deliveries ALTER COLUMN id SET DEFAULT nextval('public.supplier_deliveries_id_seq'::regclass);


--
-- Name: supplier_delivery_entry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_delivery_entry ALTER COLUMN id SET DEFAULT nextval('public.supplier_delivery_entry_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: authors author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: authors_tags authors_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_tags
    ADD CONSTRAINT authors_tags_pkey PRIMARY KEY (author_id, tag_id);


--
-- Name: books book_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT book_titles_pkey PRIMARY KEY (id);


--
-- Name: books_tags book_titles_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_tags
    ADD CONSTRAINT book_titles_tags_pkey PRIMARY KEY (book_id, tag_id);


--
-- Name: customers customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: customers_tags customers_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_tags
    ADD CONSTRAINT customers_tags_pkey PRIMARY KEY (customer_id, tag_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: supplier_deliveries supplier_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_deliveries
    ADD CONSTRAINT supplier_deliveries_pkey PRIMARY KEY (id);


--
-- Name: supplier_delivery_entry supplier_delivery_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_delivery_entry
    ADD CONSTRAINT supplier_delivery_entry_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: tags tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: books uq_book_name_author_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT uq_book_name_author_id UNIQUE (name, author_id);


--
-- Name: customers uq_customers_name_address; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT uq_customers_name_address UNIQUE (address, name);


--
-- Name: roles uq_roles_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uq_roles_name UNIQUE (name);


--
-- Name: suppliers uq_suppliers_address; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT uq_suppliers_address UNIQUE (address);


--
-- Name: suppliers uq_suppliers_bulstat; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT uq_suppliers_bulstat UNIQUE (bulstat);


--
-- Name: suppliers uq_suppliers_iban; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT uq_suppliers_iban UNIQUE (iban);


--
-- Name: suppliers uq_suppliers_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT uq_suppliers_name UNIQUE (name);


--
-- Name: suppliers uq_suppliers_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT uq_suppliers_phone UNIQUE (phone);


--
-- Name: suppliers uq_suppliers_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT uq_suppliers_user_id UNIQUE (user_id);


--
-- Name: tags uq_tag_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT uq_tag_name UNIQUE (name);


--
-- Name: users uq_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uq_users_email UNIQUE (email);


--
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: authors_tags fk_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_tags
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: books fk_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: supplier_delivery_entry fk_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_delivery_entry
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: books_tags fk_book_title_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_tags
    ADD CONSTRAINT fk_book_title_id FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: customers_tags fk_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_tags
    ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: users_roles fk_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: supplier_delivery_entry fk_supplier_deliver_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_delivery_entry
    ADD CONSTRAINT fk_supplier_deliver_id FOREIGN KEY (supplier_delivery_id) REFERENCES public.supplier_deliveries(id);


--
-- Name: supplier_deliveries fk_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_deliveries
    ADD CONSTRAINT fk_supplier_id FOREIGN KEY (suppler_id) REFERENCES public.suppliers(id);


--
-- Name: authors_tags fk_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_tags
    ADD CONSTRAINT fk_tag_id FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: books_tags fk_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_tags
    ADD CONSTRAINT fk_tag_id FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: customers_tags fk_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_tags
    ADD CONSTRAINT fk_tag_id FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: users_roles fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: customers fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: suppliers fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

