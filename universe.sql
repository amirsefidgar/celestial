--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: distance_from_earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distance_from_earth (
    name character varying(20),
    distance_from_earth_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.distance_from_earth OWNER TO freecodecamp;

--
-- Name: distance_from_earth_id_distance_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distance_from_earth_id_distance_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_from_earth_id_distance_seq OWNER TO freecodecamp;

--
-- Name: distance_from_earth_id_distance_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distance_from_earth_id_distance_seq OWNED BY public.distance_from_earth.distance_from_earth_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    age integer NOT NULL,
    color character varying(10),
    material text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    planet_id integer,
    age integer NOT NULL,
    color character varying(10),
    material text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    star_id integer,
    age integer NOT NULL,
    color character varying(10),
    material text NOT NULL,
    has_moon boolean,
    size numeric(10,10)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    age integer NOT NULL,
    color character varying(10),
    material text NOT NULL,
    has_galaxy boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: distance_from_earth distance_from_earth_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth ALTER COLUMN distance_from_earth_id SET DEFAULT nextval('public.distance_from_earth_id_distance_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Data for Name: distance_from_earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distance_from_earth VALUES ('a', 1, 1, 1, 1, 1);
INSERT INTO public.distance_from_earth VALUES ('b', 2, 1, 1, 1, 1);
INSERT INTO public.distance_from_earth VALUES ('c', 3, 1, 1, 1, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'a', 1, 'red', 'khak');
INSERT INTO public.galaxy VALUES (2, 'b', 2, 'red', 'iron');
INSERT INTO public.galaxy VALUES (3, 'c', 3, 'red', 'iron');
INSERT INTO public.galaxy VALUES (4, 'd', 4, 'red', 'iron');
INSERT INTO public.galaxy VALUES (5, 'e', 5, 'red', 'iron');
INSERT INTO public.galaxy VALUES (6, 'f', 6, 'red', 'iron');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'a', 1, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (2, 'b', 2, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (3, 'c', 3, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (4, 'd', 4, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (6, 'e', 6, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (7, 'f', 7, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (8, 'g', 8, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (9, 'h', 9, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (10, 'l', 10, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (11, 'm', 11, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (13, 'n', 12, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (14, 'o', 13, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (15, 'q', 1, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (16, 'w', 2, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (17, 'r', 3, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (18, 't', 4, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (20, 'y', 6, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (21, 'u', 7, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (22, 'p', 8, 1, 'red', 'iron');
INSERT INTO public.moon VALUES (23, 's', 9, 1, 'red', 'iron');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'a', 1, 1, 'red', 'iron', true, 0.1000000000);
INSERT INTO public.planet VALUES (2, 'b', 2, 2, 'red', 'iron', true, 0.2000000000);
INSERT INTO public.planet VALUES (3, 'c', 3, 3, 'red', 'iron', true, 0.3000000000);
INSERT INTO public.planet VALUES (4, 'd', 4, 4, 'red', 'iron', true, 0.4000000000);
INSERT INTO public.planet VALUES (6, 'e', 6, 5, 'red', 'iron', true, 0.5000000000);
INSERT INTO public.planet VALUES (7, 'f', 7, 6, 'red', 'iron', true, 0.6000000000);
INSERT INTO public.planet VALUES (8, 'g', 1, 7, 'red', 'iron', true, 0.7000000000);
INSERT INTO public.planet VALUES (9, 'h', 2, 8, 'red', 'iron', true, 0.8000000000);
INSERT INTO public.planet VALUES (10, 'l', 3, 9, 'red', 'iron', true, 0.9000000000);
INSERT INTO public.planet VALUES (11, 'm', 4, 10, 'red', 'iron', true, 0.1000000000);
INSERT INTO public.planet VALUES (12, 'n', 6, 11, 'red', 'iron', true, 0.2000000000);
INSERT INTO public.planet VALUES (13, 'o', 7, 12, 'red', 'iron', true, 0.3000000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a', 1, 'red', 'khak', true, 1);
INSERT INTO public.star VALUES (2, 'b', 2, 'red', 'khak', true, 2);
INSERT INTO public.star VALUES (3, 'c', 3, 'red', 'khak', true, 3);
INSERT INTO public.star VALUES (4, 'd', 4, 'red', 'khak', true, 4);
INSERT INTO public.star VALUES (6, 'e', 5, 'red', 'khak', true, 5);
INSERT INTO public.star VALUES (7, 'f', 6, 'red', 'khak', true, 6);


--
-- Name: distance_from_earth_id_distance_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distance_from_earth_id_distance_seq', 3, true);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 23, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 13, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 7, true);


--
-- Name: distance_from_earth distance_from_earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT distance_from_earth_pkey PRIMARY KEY (distance_from_earth_id);


--
-- Name: distance_from_earth distance_from_earth_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_from_earth
    ADD CONSTRAINT distance_from_earth_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: moon moon_id_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

