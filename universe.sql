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
    stars_in_trillion integer,
    description text,
    distance_in_kpc numeric,
    is_habitable boolean,
    planet_count_in_trillions integer,
    has_black_holes boolean,
    name character varying(50) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: COLUMN galaxy.distance_in_kpc; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.distance_in_kpc IS '1000kpc => 3260 light years';


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
    name character varying(50) NOT NULL,
    diameter integer,
    age_in_milions integer,
    distance_in_light_years numeric,
    description text,
    is_only_moon boolean,
    is_visited boolean,
    planet_id integer
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
    name character varying(50) NOT NULL,
    diameter integer,
    distance_in_kpc numeric,
    description text,
    age_in_milions integer,
    ishabitable boolean,
    is_dwarf boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    diameter_in_millions_km integer,
    distance_in_kpc numeric,
    description text,
    name character varying(50) NOT NULL,
    age_in_milions integer,
    is_dwarf boolean,
    galaxy_id integer,
    has_inteligent_life boolean
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
-- Name: transport; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.transport (
    transport_id integer NOT NULL,
    name character varying(50) NOT NULL,
    route_name character varying(100),
    routes_per_day integer NOT NULL
);


ALTER TABLE public.transport OWNER TO freecodecamp;

--
-- Name: transport_transport_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.transport_transport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transport_transport_id_seq OWNER TO freecodecamp;

--
-- Name: transport_transport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.transport_transport_id_seq OWNED BY public.transport.transport_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: transport transport_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.transport ALTER COLUMN transport_id SET DEFAULT nextval('public.transport_transport_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'check wiki :)', 765.0, false, 15, true, 'Andromeda');
INSERT INTO public.galaxy VALUES (2, 12, 'very far', 332.1567, true, 48, true, 'Messier 83');
INSERT INTO public.galaxy VALUES (3, 5, 'not so far', 674.00567, true, 23, true, 'Comet Galaxy');
INSERT INTO public.galaxy VALUES (4, 33, 'very dangerous, far', 913.22, false, 129, true, 'Tadpole Galaxy');
INSERT INTO public.galaxy VALUES (5, 9, 'relatively far', 777.142, true, 129, false, 'Jedi Galaxy');
INSERT INTO public.galaxy VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, 'Mystery Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ve moon', 323, 444, 321.23, 'very dark', false, false, 4);
INSERT INTO public.moon VALUES (2, 'Ve moon 123', 622, 744, 221.23, 'very dark', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Toman', 432, 664, 266.23, 'very dark', true, true, 4);
INSERT INTO public.moon VALUES (4, 'Moon 11', 332, 464, 265.23, 'very dark', false, true, 1);
INSERT INTO public.moon VALUES (5, 'Moon 12', 332, 464, 265.23, 'very dark', false, true, 1);
INSERT INTO public.moon VALUES (6, 'Moon 13', 111, 222, 333.44, 'good place to visit', false, true, 1);
INSERT INTO public.moon VALUES (7, 'Moon 14', 111, 222, 333.44, 'good place to visit', false, true, 1);
INSERT INTO public.moon VALUES (8, 'Wjade', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (9, 'Wjade 1', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (10, 'Wjade 12', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (11, 'Jedi Moon', NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (12, 'Jedi Moon 123', NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (13, 'Ce Moon', NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (14, 'Ce Moon 1', NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (15, 'Ce Moon 2', NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (16, 'Ce Moon 3', NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (17, 'NeCe', NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (18, 'NeCe 1', NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (19, 'NeCe 2', NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (20, 'NeCe 3', NULL, NULL, NULL, NULL, NULL, NULL, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth 112', 232, 234.234, 'similar to earth', 223, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Braace', 297, 882.4, 'Not so popular', 999, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Terewe', 457, 345.423, 'Very popular', 786, true, false, 2);
INSERT INTO public.planet VALUES (4, 'Lopa', 654, 766.23, 'Extreme weather', 543, true, false, 2);
INSERT INTO public.planet VALUES (5, 'Lopa 22', 354, 266.23, 'Extreme hot  weather', 243, false, false, 3);
INSERT INTO public.planet VALUES (6, 'Edonis 22', 388, 376.23, 'Some desc', 223, false, false, 3);
INSERT INTO public.planet VALUES (7, 'Makeme', 488, 226.23, 'Some desc 123', 993, false, false, 3);
INSERT INTO public.planet VALUES (8, 'Makeme 123', 788, 346.23, ' 123 Some desc 123', 693, true, false, 4);
INSERT INTO public.planet VALUES (9, 'Ceres 112', 588, 446.23, ' 123 Some desc 123', 112, true, true, 4);
INSERT INTO public.planet VALUES (10, 'New Ceres', 588, 446.23, ' 123 Some desc 123', 112, true, true, 4);
INSERT INTO public.planet VALUES (11, 'Plusa', 953, NULL, NULL, NULL, true, false, 5);
INSERT INTO public.planet VALUES (12, 'Terra', 353, NULL, NULL, NULL, false, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 332.86, 'very bright', 'Orion 007', 1260, false, 1, true);
INSERT INTO public.star VALUES (2, 14, 532.16, 'not very bright, you can say', 'Eros', 2160, false, 3, true);
INSERT INTO public.star VALUES (3, 17, 239.123, 'lot of hydrogen', 'Betelgeuse', 1844, true, 2, false);
INSERT INTO public.star VALUES (4, 27, 449.123, 'lot of hydrogrogen', 'Legeuse', 344, true, 2, true);
INSERT INTO public.star VALUES (5, 523, 444.44444, 'a lot people want to go :))', 'Jedi Star', 9999, false, 5, true);
INSERT INTO public.star VALUES (6, 111, 765.44444, 'a lot of smoke', 'Antares', 339, true, 4, false);


--
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.transport VALUES (1, 'Faster INC', 'Explore Andromeda', 1);
INSERT INTO public.transport VALUES (2, 'Roky transport ', 'To Mystery and back', 2);
INSERT INTO public.transport VALUES (3, 'Reliable transit', 'Call us any time', 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: transport_transport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.transport_transport_id_seq', 3, true);


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
-- Name: transport transport_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_name_key UNIQUE (name);


--
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (transport_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

