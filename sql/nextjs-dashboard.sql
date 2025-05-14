--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.customers (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    image_url character varying(255) NOT NULL
);


ALTER TABLE public.customers OWNER TO neondb_owner;

--
-- Name: invoices; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.invoices (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    customer_id uuid NOT NULL,
    amount integer NOT NULL,
    status character varying(255) NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.invoices OWNER TO neondb_owner;

--
-- Name: revenue; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.revenue (
    month character varying(4) NOT NULL,
    revenue integer NOT NULL
);


ALTER TABLE public.revenue OWNER TO neondb_owner;

--
-- Name: users; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO neondb_owner;

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.customers (id, name, email, image_url) FROM stdin;
3958dc9e-742f-4377-85e9-fec4b6a6442a	Lee Robinson	lee@robinson.com	/customers/lee-robinson.png
d6e15727-9fe1-4961-8c5b-ea44a9bd81aa	Evil Rabbit	evil@rabbit.com	/customers/evil-rabbit.png
76d65c26-f784-44a2-ac19-586678f7c2f2	Michael Novotny	michael@novotny.com	/customers/michael-novotny.png
3958dc9e-712f-4377-85e9-fec4b6a6442a	Delba de Oliveira	delba@oliveira.com	/customers/delba-de-oliveira.png
cc27c14a-0acf-4f4a-a6c9-d45682c144b9	Amy Burns	amy@burns.com	/customers/amy-burns.png
13d07535-c59e-4157-a011-f8d2ef4e0cbb	Balazs Orban	balazs@orban.com	/customers/balazs-orban.png
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.invoices (id, customer_id, amount, status, date) FROM stdin;
21b4df71-47dd-4c82-b0d4-0482f089da83	3958dc9e-712f-4377-85e9-fec4b6a6442a	20348	pending	2022-11-14
878998ca-b6c7-403e-892a-5cf399f14bdb	cc27c14a-0acf-4f4a-a6c9-d45682c144b9	3040	paid	2022-10-29
24843618-f401-47aa-bc79-e61ebec5021f	d6e15727-9fe1-4961-8c5b-ea44a9bd81aa	15795	pending	2022-12-06
d81e9900-da7a-44ed-9fed-3fb4190029b4	13d07535-c59e-4157-a011-f8d2ef4e0cbb	34577	pending	2023-08-05
dad02fc2-07dc-457b-a587-ae59d6d81e77	3958dc9e-712f-4377-85e9-fec4b6a6442a	500	paid	2023-08-19
6a15787d-4494-43f1-9edf-d04a6fec5107	13d07535-c59e-4157-a011-f8d2ef4e0cbb	8546	paid	2023-06-07
4084d66a-a5d1-47b2-b1f2-187623da78b0	3958dc9e-742f-4377-85e9-fec4b6a6442a	54246	pending	2023-07-16
a5237cbd-d514-48bc-9773-9c5eff83f142	76d65c26-f784-44a2-ac19-586678f7c2f2	32545	paid	2023-06-09
8823dff4-d22b-4cb1-ab41-bb77d4e3551d	cc27c14a-0acf-4f4a-a6c9-d45682c144b9	1250	paid	2023-06-17
5d8c8108-86bd-49b6-9fa6-ff50272ac5f8	d6e15727-9fe1-4961-8c5b-ea44a9bd81aa	666	pending	2023-06-27
b1d98afc-2463-43fc-b26e-82f8b1eb9a12	3958dc9e-742f-4377-85e9-fec4b6a6442a	1000	paid	2022-06-05
acfe9b35-2abd-4685-8221-475feb5e4486	13d07535-c59e-4157-a011-f8d2ef4e0cbb	8945	paid	2023-06-03
37cb0a98-4605-4093-83ae-7fe2f16f1124	76d65c26-f784-44a2-ac19-586678f7c2f2	32545	paid	2023-06-09
70a1437e-8be9-4010-ac02-659c31bc641e	13d07535-c59e-4157-a011-f8d2ef4e0cbb	8945	paid	2023-06-03
6cd07dfa-943c-4585-9d59-6822094b5aad	d6e15727-9fe1-4961-8c5b-ea44a9bd81aa	15795	pending	2022-12-06
66588b53-fdef-4250-ae19-d906c8b39ade	13d07535-c59e-4157-a011-f8d2ef4e0cbb	34577	pending	2023-08-05
160448d5-b8d6-4ccb-a1a1-e7966181db83	cc27c14a-0acf-4f4a-a6c9-d45682c144b9	1250	paid	2023-06-17
0dd02811-011d-473e-a909-d427dfd98f04	3958dc9e-742f-4377-85e9-fec4b6a6442a	1000	paid	2022-06-05
6c919b14-e205-472c-b8e9-ae67b93e5f17	3958dc9e-712f-4377-85e9-fec4b6a6442a	20348	pending	2022-11-14
885c4b76-5128-4a0c-b507-872148d330ff	3958dc9e-742f-4377-85e9-fec4b6a6442a	54246	pending	2023-07-16
b874f9ef-9808-46d1-8375-6655b384253b	13d07535-c59e-4157-a011-f8d2ef4e0cbb	8546	paid	2023-06-07
58493fc9-9cb9-4195-9d9f-68c6b7ded236	cc27c14a-0acf-4f4a-a6c9-d45682c144b9	3040	paid	2022-10-29
b63475c7-fbb7-4156-8b6c-77d182a5088d	d6e15727-9fe1-4961-8c5b-ea44a9bd81aa	666	pending	2023-06-27
9d8366f9-125b-4027-a78b-0d379b93de5b	3958dc9e-712f-4377-85e9-fec4b6a6442a	500	paid	2023-08-19
\.


--
-- Data for Name: revenue; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.revenue (month, revenue) FROM stdin;
Sep	2500
Mar	2200
Feb	1800
Jan	2000
Oct	2800
Nov	3000
Dec	4800
Jun	3200
May	2300
Apr	2500
Aug	3700
Jul	3500
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.users (id, name, email, password) FROM stdin;
410544b2-4001-4271-9855-fec4b6a6442a	User	user@nextmail.com	$2b$10$yicgjPOUz1tnAKpgQrkpB.dIcLM2cpLLyfpysSm1Jx6dGRrgrlPzC
\.


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: revenue revenue_month_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.revenue
    ADD CONSTRAINT revenue_month_key UNIQUE (month);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

