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
    galaxy_name character varying(32) NOT NULL,
    diameter integer,
    number_of_stars_in_billions integer,
    mass_in_mo_x_10_12 numeric(5,2),
    name character varying(120)
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
    moon_name character varying(32) NOT NULL,
    planet_name character varying(32),
    mean_radius_in_km integer,
    orbital_semi_major_axis_in_km integer,
    existence_of_water boolean,
    discovery_year smallint,
    name character varying(32)
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    more_info_name character varying(32) NOT NULL,
    galaxy_name character varying(32),
    star_name character varying(32),
    planet_name character varying(32),
    moon_name character varying(32),
    more_info_text text,
    name character varying(32)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying(32) NOT NULL,
    star_name character varying(32),
    diameter_relative_to_earth numeric(6,3),
    mass_relative_to_earth numeric(8,5),
    reached_by_unmanned_object boolean,
    reached_by_humans boolean,
    name character varying(32)
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
    star_name character varying(32) NOT NULL,
    galaxy_name character varying(32),
    number_of_planets integer,
    distance_to_earth_in_ly numeric(16,5),
    mass_in_10_30kg numeric(16,5),
    surface_temp_in_k integer,
    name character varying(32)
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 90000, 400, 1.15, 'Droga Mleczna');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 152000, 1000, 1.50, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 32000, 20, 0.10, 'Wielki Oblok Magellana');
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Spheroidal', 10000, NULL, NULL, 'SagDEG');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 18900, 3, NULL, 'Maly Oblok Magellana');
INSERT INTO public.galaxy VALUES (4, 'Canis Major Overdensity', NULL, 1, NULL, 'Karzel Wielkiego Psa');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'Titania', 'Uranus', 788, 436300, true, 1787, 'Tytania');
INSERT INTO public.moon VALUES (10, 'Rhea', 'Saturn', 763, 527070, true, 1672, 'Rea');
INSERT INTO public.moon VALUES (11, 'Oberon', 'Uranus', 761, 583500, true, 1787, 'Oberon');
INSERT INTO public.moon VALUES (13, 'Charon', 'Pluto', 606, 19591, true, 1978, 'Charon');
INSERT INTO public.moon VALUES (20, 'Vanth', 'Orcus', 221, 9000, false, 2005, 'Vanth');
INSERT INTO public.moon VALUES (22, 'Proteus', 'Neptun', 210, 117647, false, 1989, 'Proteusz');
INSERT INTO public.moon VALUES (19, 'Miranda', 'Uranus', 235, 129900, true, 1948, 'Miranda');
INSERT INTO public.moon VALUES (18, 'Enceladus', 'Saturn', 252, 238040, true, 1789, 'Enceladus');
INSERT INTO public.moon VALUES (17, 'Tethys', 'Saturn', 533, 294670, true, 1684, 'Tetyda');
INSERT INTO public.moon VALUES (16, 'Dione', 'Saturn', 561, 377420, true, 1684, 'Dione');
INSERT INTO public.moon VALUES (14, 'Umbriel', 'Uranus', 584, 266000, true, 1851, 'Umbriel');
INSERT INTO public.moon VALUES (15, 'Ariel', 'Uranus', 578, 190900, true, 1851, 'Ariel');
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Saturn', 735, 3560840, true, 1671, 'Japet');
INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 1738, 384399, true, NULL, 'Księżyc');
INSERT INTO public.moon VALUES (2, 'Ganymede', 'Jupiter', 2634, 1070400, true, 1610, 'Ganimedes');
INSERT INTO public.moon VALUES (3, 'Titan', 'Saturn', 2574, 1221870, true, 1655, 'Tytan');
INSERT INTO public.moon VALUES (4, 'Callisto', 'Jupiter', 2410, 1882700, true, 1610, 'Kalisto');
INSERT INTO public.moon VALUES (5, 'Io', 'Jupiter', 1821, 421800, false, 1610, 'Io');
INSERT INTO public.moon VALUES (6, 'Europa', 'Jupiter', 1560, 671100, true, 1610, 'Europa');
INSERT INTO public.moon VALUES (7, 'Triton', 'Neptun', 1353, 354800, true, 1846, 'Tryton');


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Fact #1', 'Milky Way', 'Sol', 'Saturn', 'Titan', 'On Titan exist a sea of liquid methane', 'Fakt #1');
INSERT INTO public.more_info VALUES (2, 'Fact #2', 'Milky Way', 'Sol', 'Saturn', 'Titan', 'In this sea there are rocks made of ice', 'Fakt #2');
INSERT INTO public.more_info VALUES (3, 'Fact #3', 'Milky Way', 'Sol', 'Saturn', 'Titan', 'There are also rivers and lakes of lifuid methane', 'Fakt #3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Jupiter', 'Sol', 11.209, 317.83000, true, false, 'Jowisz');
INSERT INTO public.planet VALUES (4, 'Mars', 'Sol', 0.532, 0.11000, true, false, 'Mars');
INSERT INTO public.planet VALUES (3, 'Earth', 'Sol', 1.000, 1.00000, true, true, 'Ziemia');
INSERT INTO public.planet VALUES (2, 'Venus', 'Sol', 0.949, 0.81000, true, false, 'Wenus');
INSERT INTO public.planet VALUES (1, 'Mercury', 'Sol', 0.383, 0.06000, true, false, 'Merkury');
INSERT INTO public.planet VALUES (12, 'Haumea', 'Sol', 0.130, 0.00070, false, false, 'Haumea');
INSERT INTO public.planet VALUES (11, 'Pluto', 'Sol', 0.186, 0.00220, false, false, 'Pluton');
INSERT INTO public.planet VALUES (10, 'Orcus', 'Sol', 0.072, 0.00010, false, false, 'Orcus');
INSERT INTO public.planet VALUES (9, 'Ceres', 'Sol', 0.074, 0.00016, false, false, 'Ceres');
INSERT INTO public.planet VALUES (8, 'Neptun', 'Sol', 3.883, 17.15000, false, false, 'Neptun');
INSERT INTO public.planet VALUES (7, 'Uranus', 'Sol', 4.007, 14.54000, false, false, 'Uran');
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sol', 9.449, 95.16000, true, false, 'Saturn');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Milky Way', 8, 0.00001, 1.98850, 5772, 'Slonce');
INSERT INTO public.star VALUES (3, 'Lalande 21185', 'Milky Way', 2, 8.30044, 0.77350, 3547, 'Lalande 21185');
INSERT INTO public.star VALUES (4, 'Lacaille 9352', 'Milky Way', 3, 10.72000, 0.95240, 3672, 'Lacaille 9352');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Milky Way', 2, 4.30000, 2.14519, 5790, 'Alfa Centauri');
INSERT INTO public.star VALUES (6, '61 Cygni', 'Milky Way', NULL, 11.40400, 1.39195, 4526, '61 Cygni');
INSERT INTO public.star VALUES (5, 'Sirius', 'Milky Way', NULL, 8.60000, 4.10220, 9940, 'Syriusz');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_more_info_name_key UNIQUE (more_info_name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: moon moon_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: more_info more_info_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- Name: more_info more_info_moon_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_moon_name_fkey FOREIGN KEY (moon_name) REFERENCES public.moon(moon_name);


--
-- Name: more_info more_info_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: more_info more_info_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- Name: planet planet_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- Name: star star_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--

