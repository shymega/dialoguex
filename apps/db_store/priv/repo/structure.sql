--
-- PostgreSQL database dump
--

-- Dumped from database version 11beta1
-- Dumped by pg_dump version 11beta1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: header_names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.header_names (
    id bigint NOT NULL,
    header_name character varying(255) NOT NULL,
    header_id bigint
);


--
-- Name: header_names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.header_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.header_names_id_seq OWNED BY public.header_names.id;


--
-- Name: header_values; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.header_values (
    id bigint NOT NULL,
    header_value character varying(255) NOT NULL,
    header_value_hash character varying(256) NOT NULL,
    header_id bigint
);


--
-- Name: header_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.header_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.header_values_id_seq OWNED BY public.header_values.id;


--
-- Name: headers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.headers (
    id bigint NOT NULL,
    header_name_id bigint,
    header_value_id bigint
);


--
-- Name: headers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.headers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.headers_id_seq OWNED BY public.headers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);


--
-- Name: header_names id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_names ALTER COLUMN id SET DEFAULT nextval('public.header_names_id_seq'::regclass);


--
-- Name: header_values id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_values ALTER COLUMN id SET DEFAULT nextval('public.header_values_id_seq'::regclass);


--
-- Name: headers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.headers ALTER COLUMN id SET DEFAULT nextval('public.headers_id_seq'::regclass);


--
-- Name: header_names header_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_names
    ADD CONSTRAINT header_names_pkey PRIMARY KEY (id);


--
-- Name: header_values header_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_values
    ADD CONSTRAINT header_values_pkey PRIMARY KEY (id);


--
-- Name: headers headers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.headers
    ADD CONSTRAINT headers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: header_names_header_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX header_names_header_name_index ON public.header_names USING btree (header_name);


--
-- Name: header_values_header_value_header_value_hash_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX header_values_header_value_header_value_hash_index ON public.header_values USING btree (header_value, header_value_hash);


--
-- Name: headers headers_header_name_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.headers
    ADD CONSTRAINT headers_header_name_id_fkey FOREIGN KEY (header_name_id) REFERENCES public.header_names(id);


--
-- Name: headers headers_header_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.headers
    ADD CONSTRAINT headers_header_value_id_fkey FOREIGN KEY (header_value_id) REFERENCES public.header_values(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO public."schema_migrations" (version) VALUES (20180611225156), (20180611225159), (20180611225202), (20180611231502);

