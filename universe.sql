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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id integer NOT NULL,
    name character varying(20),
    year_discovered integer NOT NULL,
    description text NOT NULL,
    seen_from_the_earth boolean
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age numeric,
    distance integer,
    size integer,
    description text,
    is_active boolean,
    unique_column character varying(20)
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
    moon_id numeric NOT NULL,
    name character varying(255) NOT NULL,
    age integer,
    distance_from_planet integer,
    planet_it_belongs_to text,
    is_active boolean,
    unique_column character varying(20),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id numeric NOT NULL,
    name character varying(255) NOT NULL,
    age integer,
    distance_from_star integer,
    description text,
    is_active boolean,
    unique_column character varying(20),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id numeric NOT NULL,
    name character varying(255) NOT NULL,
    age integer,
    temperature integer,
    description text,
    is_active boolean,
    unique_column character varying(20),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'Halley', 1705, 'It is made of ice and debris', true);
INSERT INTO public.comets VALUES (2, 'Hale-Bopp', 1995, 'Composed of ice, dust and gas', true);
INSERT INTO public.comets VALUES (3, 'Borrely', 2001, 'Periodic comet', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, NULL, 1000, 'Spiral galaxy', true, 'A1');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, NULL, 1200, 'Spiral galaxy', true, 'A2');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5, NULL, 800, 'Spiral galaxy', true, 'A3');
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 12, NULL, 500, 'Spiral galaxy', true, 'A4');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 15, NULL, 1500, 'Elliptical galaxy', true, 'B1');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 8, NULL, 700, 'Spiral galaxy', true, 'A5');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4, 10, 'Earth', true, 'Z1', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 2, 'Mars', true, 'Z2', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 3, 'Mars', true, 'Z3', 2);
INSERT INTO public.moon VALUES (4, 'Titan', 5, 22, 'Saturn', true, 'Z4', 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 7, 25, 'Jupiter', true, 'Z5', 5);
INSERT INTO public.moon VALUES (6, 'Triton', 6, 12, 'Neptune', true, 'Z6', 6);
INSERT INTO public.moon VALUES (7, 'Europa', 4, 15, 'Jupiter', true, 'Z7', 5);
INSERT INTO public.moon VALUES (8, 'Io', 3, 18, 'Jupiter', true, 'Z8', 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 8, 'Saturn', true, 'Z9', 4);
INSERT INTO public.moon VALUES (10, 'Charon', 5, 7, 'Pluto', true, 'Z10', 9);
INSERT INTO public.moon VALUES (11, 'Phoebe', 8, 28, 'Saturn', true, 'Z11', 4);
INSERT INTO public.moon VALUES (12, 'Callisto', 9, 30, 'Jupiter', true, 'Z12', 4);
INSERT INTO public.moon VALUES (13, 'Miranda', 4, 5, 'Uranus', true, 'Z13', 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 20, 'Uranus', true, 'Z14', 7);
INSERT INTO public.moon VALUES (15, 'Titania', 6, 18, 'Uranus', true, 'Z15', 7);
INSERT INTO public.moon VALUES (16, 'Iapetus', 10, 35, 'Saturn', true, 'Z16', 4);
INSERT INTO public.moon VALUES (17, 'Dione', 7, 17, 'Saturn', true, 'Z17', 4);
INSERT INTO public.moon VALUES (18, 'Rhea', 8, 19, 'Saturn', true, 'Z18', 4);
INSERT INTO public.moon VALUES (19, 'Thetys', 6, 16, 'Saturn', true, 'Z19', 4);
INSERT INTO public.moon VALUES (20, 'Umbriel', 5, 21, 'Uranus', true, 'Z20', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4, 150, 'Blue planet', true, 'AB1', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 6, 228, 'Red planet', true, 'BC1', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 5, 108, 'Cloudy planet', true, 'CD1', 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 8, 952, 'Ringed planet', true, 'DE1', 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 9, 778, 'Gas giant', true, 'EF', 3);
INSERT INTO public.planet VALUES (6, 'Neptune', 7, 4500, 'Blue gas giant', true, 'FG', 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 6, 2871, 'Ice giant', true, 'GH', 4);
INSERT INTO public.planet VALUES (8, 'Mercury', 3, 58, 'Small rocky planet', true, 'HI', 5);
INSERT INTO public.planet VALUES (9, 'Pluto', 10, 5900, 'Dwarf planet', true, 'IJ', 5);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 2, 1400, 'Exoplanet', true, 'JK', 6);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 4, 470, 'Hot Jupiter', true, 'KL', 6);
INSERT INTO public.planet VALUES (12, 'Gliese 581d', 6, 200, 'Potentially habitable', true, 'LM', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, 6000, 'G-type main-sequence star', true, '1A', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 10, 9500, 'Binary star system', true, '1B', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8, 3500, 'Red supergiant star', true, '1C', 2);
INSERT INTO public.star VALUES (4, 'Vega', 3, 9600, 'A-type main-sequence star', true, '1D', 3);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 2700, 'Red dwarf star', true, '1E', 5);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 6, 5800, 'Binary star system', true, '1F', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: comets comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_column_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_column_key UNIQUE (unique_column);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_column_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_column_key UNIQUE (unique_column);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_column_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_column_key UNIQUE (unique_column);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_column_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_column_key UNIQUE (unique_column);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
