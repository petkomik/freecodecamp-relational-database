--
-- PostgreSQL database dump
--e

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    num_stars integer,
    visited boolean,
    name character varying(60) NOT NULL,
    observed_civilizations integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    visited boolean,
    planet_id integer,
    name character varying(60) NOT NULL,
    color character varying(15)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    lvl_of_dev text,
    avg_distance_star numeric(20,1),
    star_id integer,
    name character varying(60) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    name character varying(40) NOT NULL,
    planet_moon_id integer NOT NULL,
    distance integer NOT NULL
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    num_orbiting_planets integer,
    galaxy_id integer,
    inhabitable boolean NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 0, false, 'Andromeda', 2);
INSERT INTO public.galaxy VALUES (2, 10000, true, 'Milky Way', 7);
INSERT INTO public.galaxy VALUES (3, 40000, false, 'Triangulum', 0);
INSERT INTO public.galaxy VALUES (4, 200000, false, 'Centaurus A', 1);
INSERT INTO public.galaxy VALUES (5, 33083, false, 'Sombrero', 5);
INSERT INTO public.galaxy VALUES (6, 42838, false, 'Whirlpool', 0);
INSERT INTO public.galaxy VALUES (7, 803830, false, 'Pinwheel', 0);
INSERT INTO public.galaxy VALUES (8, 495750, false, 'Bode''s', 0);
INSERT INTO public.galaxy VALUES (9, 3070273, true, 'Sculptur', 3);
INSERT INTO public.galaxy VALUES (10, 2044084, false, 'Black Eye', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, true, 1, 'Luna', 'Grey');
INSERT INTO public.moon VALUES (2, false, 2, 'Phobos', 'Grey');
INSERT INTO public.moon VALUES (3, false, 2, 'Deimos', 'Red');
INSERT INTO public.moon VALUES (4, true, 3, 'Titan', 'Orange');
INSERT INTO public.moon VALUES (5, false, 4, 'Ganymede', 'Brown');
INSERT INTO public.moon VALUES (6, false, 4, 'Callisto', 'Brown');
INSERT INTO public.moon VALUES (7, false, 4, 'Io', 'Yellow');
INSERT INTO public.moon VALUES (8, false, 4, 'Europa', 'White');
INSERT INTO public.moon VALUES (9, false, 5, 'Triton', 'Pink');
INSERT INTO public.moon VALUES (10, false, 9, 'Charon', 'Grey');
INSERT INTO public.moon VALUES (11, false, 10, 'Enceladus', 'White');
INSERT INTO public.moon VALUES (12, false, 10, 'Mimas', 'Grey');
INSERT INTO public.moon VALUES (13, false, 11, 'Phoebe', 'Brown');
INSERT INTO public.moon VALUES (14, false, 12, 'Miranda', 'Grey');
INSERT INTO public.moon VALUES (15, false, 12, 'Ariel', 'Blue');
INSERT INTO public.moon VALUES (16, false, 12, 'Umbriel', 'Brown');
INSERT INTO public.moon VALUES (17, false, 13, 'Titania', 'Brown');
INSERT INTO public.moon VALUES (18, false, 13, 'Oberon', 'Blue');
INSERT INTO public.moon VALUES (19, false, 14, 'Dione', 'White');
INSERT INTO public.moon VALUES (20, false, 14, 'Rhea', 'Brown');
INSERT INTO public.moon VALUES (21, false, 14, 'Iapetus', 'Brown');
INSERT INTO public.moon VALUES (22, false, 14, 'Tethys', 'White');
INSERT INTO public.moon VALUES (23, false, 15, 'Nereid', 'Grey');
INSERT INTO public.moon VALUES (24, false, 15, 'Proteus', 'Grey');
INSERT INTO public.moon VALUES (25, false, 15, 'Larissa', 'Pink');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Advanced', 1.0, 1, 'Earth');
INSERT INTO public.planet VALUES (2, 'Primitive', 1.5, 1, 'Mars');
INSERT INTO public.planet VALUES (3, 'None', 0.7, 1, 'Venus');
INSERT INTO public.planet VALUES (4, 'None', 5.2, 2, 'Jupiter');
INSERT INTO public.planet VALUES (5, 'None', 9.5, 2, 'Saturn');
INSERT INTO public.planet VALUES (6, 'None', 30.1, 3, 'Neptune');
INSERT INTO public.planet VALUES (7, 'None', 19.2, 3, 'Uranus');
INSERT INTO public.planet VALUES (8, 'None', 0.4, 4, 'Mercury');
INSERT INTO public.planet VALUES (9, 'None', 39.5, 4, 'Pluto');
INSERT INTO public.planet VALUES (10, 'Advanced', 12.1, 5, 'Kepler-22b');
INSERT INTO public.planet VALUES (11, 'Primitive', 14.7, 5, 'HD 209458 b');
INSERT INTO public.planet VALUES (12, 'Primitive', 6.3, 6, 'GJ 1214 b');
INSERT INTO public.planet VALUES (13, 'None', 4.3, 6, 'Gliese 581 d');
INSERT INTO public.planet VALUES (14, 'None', 8.9, 7, 'WASP-12b');
INSERT INTO public.planet VALUES (15, 'Advanced', 2.5, 8, 'TRAPPIST-1e');


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES ('Steven', 1, 434);
INSERT INTO public.planet_moon VALUES ('Michael', 2, 4424);
INSERT INTO public.planet_moon VALUES ('John', 3, 24247);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 8, 3, true, 'Sun');
INSERT INTO public.star VALUES (2, 2, 6, false, 'Proxima Centauri');
INSERT INTO public.star VALUES (3, 4, 8, false, 'Sirius');
INSERT INTO public.star VALUES (4, 5, 1, false, 'Alpha Centauri A');
INSERT INTO public.star VALUES (5, 3, 4, false, 'Alpha Centauri B');
INSERT INTO public.star VALUES (6, 0, 9, false, 'Betelgeuse');
INSERT INTO public.star VALUES (7, 1, 4, false, 'Rigel');
INSERT INTO public.star VALUES (8, 7, 3, false, 'Vega');
INSERT INTO public.star VALUES (9, 3, 2, false, 'Polaris');
INSERT INTO public.star VALUES (10, 2, 8, false, 'Deneb');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon planet_moon_distance_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_distance_key UNIQUE (distance);


--
-- Name: planet_moon planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_name_key UNIQUE (name);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_ref_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_ref_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_ref_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_ref_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_ref_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_ref_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

