toc.dat                                                                                             0000600 0004000 0002000 00000017262 14227534127 0014456 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       +                    z            jovenes_emprendedores    14.2    14.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    32822    jovenes_emprendedores    DATABASE     y   CREATE DATABASE jovenes_emprendedores WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Latin America.1252';
 %   DROP DATABASE jovenes_emprendedores;
                postgres    false                     2615    32823    project    SCHEMA        CREATE SCHEMA project;
    DROP SCHEMA project;
                postgres    false         ?            1259    32824 	   idea_user    TABLE     ?   CREATE TABLE project.idea_user (
    id_idea integer NOT NULL,
    registred_id text NOT NULL,
    id_user2 integer NOT NULL
);
    DROP TABLE project.idea_user;
       project         heap    postgres    false    4         ?            1259    32829    idea_user_id_idea_seq    SEQUENCE     ?   CREATE SEQUENCE project.idea_user_id_idea_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE project.idea_user_id_idea_seq;
       project          postgres    false    4    210         	           0    0    idea_user_id_idea_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE project.idea_user_id_idea_seq OWNED BY project.idea_user.id_idea;
          project          postgres    false    211         ?            1259    32830    role    TABLE     T   CREATE TABLE project.role (
    id_user integer NOT NULL,
    role text NOT NULL
);
    DROP TABLE project.role;
       project         heap    postgres    false    4         ?            1259    32833    role_id_user_seq    SEQUENCE     ?   CREATE SEQUENCE project.role_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE project.role_id_user_seq;
       project          postgres    false    212    4         
           0    0    role_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE project.role_id_user_seq OWNED BY project.role.id_user;
          project          postgres    false    213         ?            1259    32834    user_information    TABLE     ?   CREATE TABLE project.user_information (
    id_info_user integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    id_role1 integer NOT NULL,
    email text NOT NULL
);
 %   DROP TABLE project.user_information;
       project         heap    postgres    false    4         ?            1259    32839 !   user_information_id_info_user_seq    SEQUENCE     ?   CREATE SEQUENCE project.user_information_id_info_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE project.user_information_id_info_user_seq;
       project          postgres    false    214    4                    0    0 !   user_information_id_info_user_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE project.user_information_id_info_user_seq OWNED BY project.user_information.id_info_user;
          project          postgres    false    215         g           2604    32840    idea_user id_idea    DEFAULT     x   ALTER TABLE ONLY project.idea_user ALTER COLUMN id_idea SET DEFAULT nextval('project.idea_user_id_idea_seq'::regclass);
 A   ALTER TABLE project.idea_user ALTER COLUMN id_idea DROP DEFAULT;
       project          postgres    false    211    210         h           2604    32841    role id_user    DEFAULT     n   ALTER TABLE ONLY project.role ALTER COLUMN id_user SET DEFAULT nextval('project.role_id_user_seq'::regclass);
 <   ALTER TABLE project.role ALTER COLUMN id_user DROP DEFAULT;
       project          postgres    false    213    212         i           2604    32842    user_information id_info_user    DEFAULT     ?   ALTER TABLE ONLY project.user_information ALTER COLUMN id_info_user SET DEFAULT nextval('project.user_information_id_info_user_seq'::regclass);
 M   ALTER TABLE project.user_information ALTER COLUMN id_info_user DROP DEFAULT;
       project          postgres    false    215    214         ?          0    32824 	   idea_user 
   TABLE DATA           E   COPY project.idea_user (id_idea, registred_id, id_user2) FROM stdin;
    project          postgres    false    210       3325.dat ?          0    32830    role 
   TABLE DATA           .   COPY project.role (id_user, role) FROM stdin;
    project          postgres    false    212       3327.dat           0    32834    user_information 
   TABLE DATA           m   COPY project.user_information (id_info_user, name, surname, username, password, id_role1, email) FROM stdin;
    project          postgres    false    214       3329.dat            0    0    idea_user_id_idea_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('project.idea_user_id_idea_seq', 1, false);
          project          postgres    false    211                    0    0    role_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('project.role_id_user_seq', 3, true);
          project          postgres    false    213                    0    0 !   user_information_id_info_user_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('project.user_information_id_info_user_seq', 1, false);
          project          postgres    false    215         k           2606    32844    idea_user idea_user_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY project.idea_user
    ADD CONSTRAINT idea_user_pkey PRIMARY KEY (id_idea);
 C   ALTER TABLE ONLY project.idea_user DROP CONSTRAINT idea_user_pkey;
       project            postgres    false    210         m           2606    32846    role role_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY project.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_user);
 9   ALTER TABLE ONLY project.role DROP CONSTRAINT role_pkey;
       project            postgres    false    212         o           2606    32848 &   user_information user_information_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY project.user_information
    ADD CONSTRAINT user_information_pkey PRIMARY KEY (id_info_user);
 Q   ALTER TABLE ONLY project.user_information DROP CONSTRAINT user_information_pkey;
       project            postgres    false    214         q           2606    32849 !   user_information user_information    FK CONSTRAINT     ?   ALTER TABLE ONLY project.user_information
    ADD CONSTRAINT user_information FOREIGN KEY (id_role1) REFERENCES project.role(id_user);
 L   ALTER TABLE ONLY project.user_information DROP CONSTRAINT user_information;
       project          postgres    false    212    214    3181         p           2606    32854    idea_user user_information    FK CONSTRAINT     ?   ALTER TABLE ONLY project.idea_user
    ADD CONSTRAINT user_information FOREIGN KEY (id_user2) REFERENCES project.role(id_user);
 E   ALTER TABLE ONLY project.idea_user DROP CONSTRAINT user_information;
       project          postgres    false    3181    210    212                                                                                                                                                                                                                                                                                                                                                      3325.dat                                                                                            0000600 0004000 0002000 00000000005 14227534127 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3327.dat                                                                                            0000600 0004000 0002000 00000000057 14227534127 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	investor
2	innovate man
3	administrator
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 3329.dat                                                                                            0000600 0004000 0002000 00000000005 14227534127 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000015153 14227534127 0015400 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

DROP DATABASE jovenes_emprendedores;
--
-- Name: jovenes_emprendedores; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE jovenes_emprendedores WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Latin America.1252';


ALTER DATABASE jovenes_emprendedores OWNER TO postgres;

\connect jovenes_emprendedores

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
-- Name: project; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA project;


ALTER SCHEMA project OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: idea_user; Type: TABLE; Schema: project; Owner: postgres
--

CREATE TABLE project.idea_user (
    id_idea integer NOT NULL,
    registred_id text NOT NULL,
    id_user2 integer NOT NULL
);


ALTER TABLE project.idea_user OWNER TO postgres;

--
-- Name: idea_user_id_idea_seq; Type: SEQUENCE; Schema: project; Owner: postgres
--

CREATE SEQUENCE project.idea_user_id_idea_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.idea_user_id_idea_seq OWNER TO postgres;

--
-- Name: idea_user_id_idea_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: postgres
--

ALTER SEQUENCE project.idea_user_id_idea_seq OWNED BY project.idea_user.id_idea;


--
-- Name: role; Type: TABLE; Schema: project; Owner: postgres
--

CREATE TABLE project.role (
    id_user integer NOT NULL,
    role text NOT NULL
);


ALTER TABLE project.role OWNER TO postgres;

--
-- Name: role_id_user_seq; Type: SEQUENCE; Schema: project; Owner: postgres
--

CREATE SEQUENCE project.role_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.role_id_user_seq OWNER TO postgres;

--
-- Name: role_id_user_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: postgres
--

ALTER SEQUENCE project.role_id_user_seq OWNED BY project.role.id_user;


--
-- Name: user_information; Type: TABLE; Schema: project; Owner: postgres
--

CREATE TABLE project.user_information (
    id_info_user integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    id_role1 integer NOT NULL,
    email text NOT NULL
);


ALTER TABLE project.user_information OWNER TO postgres;

--
-- Name: user_information_id_info_user_seq; Type: SEQUENCE; Schema: project; Owner: postgres
--

CREATE SEQUENCE project.user_information_id_info_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.user_information_id_info_user_seq OWNER TO postgres;

--
-- Name: user_information_id_info_user_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: postgres
--

ALTER SEQUENCE project.user_information_id_info_user_seq OWNED BY project.user_information.id_info_user;


--
-- Name: idea_user id_idea; Type: DEFAULT; Schema: project; Owner: postgres
--

ALTER TABLE ONLY project.idea_user ALTER COLUMN id_idea SET DEFAULT nextval('project.idea_user_id_idea_seq'::regclass);


--
-- Name: role id_user; Type: DEFAULT; Schema: project; Owner: postgres
--

ALTER TABLE ONLY project.role ALTER COLUMN id_user SET DEFAULT nextval('project.role_id_user_seq'::regclass);


--
-- Name: user_information id_info_user; Type: DEFAULT; Schema: project; Owner: postgres
--

ALTER TABLE ONLY project.user_information ALTER COLUMN id_info_user SET DEFAULT nextval('project.user_information_id_info_user_seq'::regclass);


--
-- Data for Name: idea_user; Type: TABLE DATA; Schema: project; Owner: postgres
--

COPY project.idea_user (id_idea, registred_id, id_user2) FROM stdin;
\.
COPY project.idea_user (id_idea, registred_id, id_user2) FROM '$$PATH$$/3325.dat';

--
-- Data for Name: role; Type: TABLE DATA; Schema: project; Owner: postgres
--

COPY project.role (id_user, role) FROM stdin;
\.
COPY project.role (id_user, role) FROM '$$PATH$$/3327.dat';

--
-- Data for Name: user_information; Type: TABLE DATA; Schema: project; Owner: postgres
--

COPY project.user_information (id_info_user, name, surname, username, password, id_role1, email) FROM stdin;
\.
COPY project.user_information (id_info_user, name, surname, username, password, id_role1, email) FROM '$$PATH$$/3329.dat';

--
-- Name: idea_user_id_idea_seq; Type: SEQUENCE SET; Schema: project; Owner: postgres
--

SELECT pg_catalog.setval('project.idea_user_id_idea_seq', 1, false);


--
-- Name: role_id_user_seq; Type: SEQUENCE SET; Schema: project; Owner: postgres
--

SELECT pg_catalog.setval('project.role_id_user_seq', 3, true);


--
-- Name: user_information_id_info_user_seq; Type: SEQUENCE SET; Schema: project; Owner: postgres
--

SELECT pg_catalog.setval('project.user_information_id_info_user_seq', 1, false);


--
-- Name: idea_user idea_user_pkey; Type: CONSTRAINT; Schema: project; Owner: postgres
--

ALTER TABLE ONLY project.idea_user
    ADD CONSTRAINT idea_user_pkey PRIMARY KEY (id_idea);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: project; Owner: postgres
--

ALTER TABLE ONLY project.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_user);


--
-- Name: user_information user_information_pkey; Type: CONSTRAINT; Schema: project; Owner: postgres
--

ALTER TABLE ONLY project.user_information
    ADD CONSTRAINT user_information_pkey PRIMARY KEY (id_info_user);


--
-- Name: user_information user_information; Type: FK CONSTRAINT; Schema: project; Owner: postgres
--

ALTER TABLE ONLY project.user_information
    ADD CONSTRAINT user_information FOREIGN KEY (id_role1) REFERENCES project.role(id_user);


--
-- Name: idea_user user_information; Type: FK CONSTRAINT; Schema: project; Owner: postgres
--

ALTER TABLE ONLY project.idea_user
    ADD CONSTRAINT user_information FOREIGN KEY (id_user2) REFERENCES project.role(id_user);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     