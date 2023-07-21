--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (2, 'mitko', 0, NULL);
INSERT INTO public.players VALUES (3, 'user_1689928012366', 0, NULL);
INSERT INTO public.players VALUES (4, 'user_1689928012365', 0, NULL);
INSERT INTO public.players VALUES (5, 'user_1689928056142', 0, NULL);
INSERT INTO public.players VALUES (6, 'user_1689928056141', 0, NULL);
INSERT INTO public.players VALUES (7, 'user_1689928183224', 0, NULL);
INSERT INTO public.players VALUES (8, 'user_1689928183223', 0, NULL);
INSERT INTO public.players VALUES (9, 'user_1689928226440', 0, 9999);
INSERT INTO public.players VALUES (10, 'user_1689928226439', 0, 9999);
INSERT INTO public.players VALUES (11, 'user_1689928741935', 0, 9999);
INSERT INTO public.players VALUES (12, 'user_1689928741934', 0, 9999);
INSERT INTO public.players VALUES (13, 'user_1689928793448', 0, 9999);
INSERT INTO public.players VALUES (14, 'user_1689928793447', 0, 9999);
INSERT INTO public.players VALUES (15, 'user_1689928836890', 0, 9999);
INSERT INTO public.players VALUES (16, 'user_1689928836889', 0, 9999);
INSERT INTO public.players VALUES (17, 'user_1689928867329', 0, 9999);
INSERT INTO public.players VALUES (18, 'user_1689928867328', 0, 9999);
INSERT INTO public.players VALUES (20, 'user_1689928897344', 2, 9999);
INSERT INTO public.players VALUES (19, 'user_1689928897345', 5, 9999);
INSERT INTO public.players VALUES (22, 'user_1689928939624', 2, 9999);
INSERT INTO public.players VALUES (21, 'user_1689928939625', 5, 9999);
INSERT INTO public.players VALUES (1, 'petko', 1, NULL);
INSERT INTO public.players VALUES (23, 'me', 1, 9);
INSERT INTO public.players VALUES (25, 'user_1689929323357', 2, 238);
INSERT INTO public.players VALUES (24, 'user_1689929323358', 5, 215);
INSERT INTO public.players VALUES (27, 'user_1689929376373', 2, 253);
INSERT INTO public.players VALUES (26, 'user_1689929376374', 5, 94);
INSERT INTO public.players VALUES (29, 'user_1689929415480', 2, 416);
INSERT INTO public.players VALUES (28, 'user_1689929415481', 5, 153);
INSERT INTO public.players VALUES (31, 'user_1689929549705', 2, 607);
INSERT INTO public.players VALUES (30, 'user_1689929549706', 4, 119);
INSERT INTO public.players VALUES (33, 'user_1689929560071', 2, 179);
INSERT INTO public.players VALUES (32, 'user_1689929560072', 5, 18);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 33, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- PostgreSQL database dump complete
--

