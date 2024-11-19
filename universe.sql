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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255),
    mass numeric(30,10) NOT NULL,
    type character varying(100),
    galaxy_id integer,
    is_supermassive boolean,
    event_horizon_radius_km numeric(15,5)
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255),
    description text,
    number_of_planets integer,
    age_in_million_years integer NOT NULL,
    has_planets boolean
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
    name character varying(255),
    description text,
    diameter integer NOT NULL,
    distance_from_planet_km integer,
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
    name character varying,
    description text,
    diameter integer NOT NULL,
    orbital_period_days integer,
    mass numeric(30,2),
    galaxy_name character varying,
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
    name character varying,
    description text,
    age_in_million_years integer,
    diameter integer NOT NULL,
    is_active boolean,
    has_planets boolean,
    galaxy_id integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 4300000.0000000000, 'Supermassive', 1, true, 12.00000);
INSERT INTO public.black_hole VALUES (2, 'Andromeda Central', 110000000.0000000000, 'Supermassive', 2, true, 200.00000);
INSERT INTO public.black_hole VALUES (3, 'Cartwheel BH1', 50000.0000000000, 'Intermediate', 5, false, 0.50000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the Solar System', 100000000, 13500, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way', 100000000, 10200, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'A galaxy with a bright nucleus and prominent dust lane', 50000, 12600, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', 40000, 13700, true);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 'A ring-shaped galaxy formed by a collision', 85000, 1500, true);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'Known for its dark band of absorbing dust', 60000, 8700, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Sirius I', 'Small rocky moon with volcanic activity', 3500, 45000, 1);
INSERT INTO public.moon VALUES (2, 'Sirius II', 'Ice-covered moon with liquid oceans underneath', 4000, 50000, 1);
INSERT INTO public.moon VALUES (3, 'Sirius III', 'A large moon with deep craters', 8000, 70000, 1);
INSERT INTO public.moon VALUES (4, 'Sirius IV', 'Moon with a thin atmosphere and occasional auroras', 5000, 60000, 1);
INSERT INTO public.moon VALUES (5, 'Beta I', 'Gas giant moon with swirling atmospheric storms', 10000, 150000, 2);
INSERT INTO public.moon VALUES (6, 'Beta II', 'Moons of varying sizes around the gas giant', 30000, 130000, 2);
INSERT INTO public.moon VALUES (7, 'Beta III', 'Massive moon orbiting the gas giant', 50000, 180000, 2);
INSERT INTO public.moon VALUES (8, 'Omega I', 'Gas giant moon with high radiation levels', 11000, 150000, 3);
INSERT INTO public.moon VALUES (9, 'Omega II', 'Moon with strange mineral deposits and high gravity', 7000, 120000, 3);
INSERT INTO public.moon VALUES (10, 'Minor I', 'Small rocky moon with low gravity', 4000, 8000, 4);
INSERT INTO public.moon VALUES (11, 'Minor II', 'Moon with significant tectonic activity', 4500, 9000, 4);
INSERT INTO public.moon VALUES (12, 'Proxima I', 'Potentially habitable moon with water and an atmosphere', 6000, 15000, 5);
INSERT INTO public.moon VALUES (13, 'Proxima II', 'Moon with large canyons and desert terrain', 3500, 20000, 5);
INSERT INTO public.moon VALUES (14, 'Proxima III', 'Moon with thick clouds and storms', 4000, 25000, 6);
INSERT INTO public.moon VALUES (15, 'Proxima IV', 'Cold barren moon with little atmosphere', 3000, 30000, 6);
INSERT INTO public.moon VALUES (16, 'Vega I', 'Ice moon with glacial plains', 12000, 25000, 7);
INSERT INTO public.moon VALUES (17, 'Vega II', 'Rocky moon with large mountain ranges', 15000, 30000, 7);
INSERT INTO public.moon VALUES (18, 'Gamma I', 'Lava moon with constant volcanic eruptions', 7000, 12000, 9);
INSERT INTO public.moon VALUES (19, 'Gamma II', 'Moon covered with molten lava flows', 9000, 15000, 9);
INSERT INTO public.moon VALUES (20, 'Delta I', 'Frozen moon with methane ice caps', 13000, 10000, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Sirius Prime', 'Rocky terrestrial planet with harsh radiation environment', 12000, 180, 5970000000000000000000000.00, 'Milky Way', 7);
INSERT INTO public.planet VALUES (2, 'Sirius Beta', 'Gas giant with vibrant blue atmospheric bands', 142000, 540, 1900000000000000000000000000.00, 'Milky Way', 7);
INSERT INTO public.planet VALUES (3, 'Betelgeuse Omega', 'Massive gas giant near end-of-life star', 215000, 3650, 3500000000000000000000000000.00, 'Milky Way', 8);
INSERT INTO public.planet VALUES (4, 'Betelgeuse Minor', 'Small rocky world in wide orbit', 6000, 7300, 330000000000000000000000.00, 'Milky Way', 8);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Potentially habitable exoplanet', 14000, 11, 1170000000000000000000000.00, 'Milky Way', 9);
INSERT INTO public.planet VALUES (6, 'Proxima c', 'Cold super-Earth in outer system', 18000, 5, 7100000000000000000000000.00, 'Milky Way', 9);
INSERT INTO public.planet VALUES (7, 'Vega Prime', 'Massive ice giant', 52000, 730, 87000000000000000000000000.00, 'Milky Way', 10);
INSERT INTO public.planet VALUES (8, 'Vega Minor', 'Dense rocky planet with volcanic activity', 10000, 210, 4800000000000000000000000.00, 'Milky Way', 10);
INSERT INTO public.planet VALUES (9, 'Aldebaran Gamma', 'Molten lava world close to red giant', 22000, 90, 2600000000000000000000000.00, 'Milky Way', 11);
INSERT INTO public.planet VALUES (10, 'Aldebaran Delta', 'Frozen outer planet with methane atmosphere', 38000, 3650, 140000000000000000000000000.00, 'Milky Way', 11);
INSERT INTO public.planet VALUES (11, 'Antares Alpha', 'Supermassive gas giant', 320000, 2190, 1200000000000000000000000000.00, 'Milky Way', 12);
INSERT INTO public.planet VALUES (12, 'Antares Beta', 'Rocky desert planet with extreme temperature variations', 16000, 540, 520000000000000000000000.00, 'Milky Way', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sirius', 'Brightest star in the night sky', 300, 1200000, true, true, 1);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 'A red supergiant in the Orion constellation', 8000, 1300000, false, false, 2);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 'Closest star to the Sun', 4500, 200000, true, true, 3);
INSERT INTO public.star VALUES (10, 'Vega', 'Bright star in the Lyra constellation', 460, 970000, true, false, 4);
INSERT INTO public.star VALUES (11, 'Aldebaran', 'A red giant in the Taurus constellation', 6400, 440000, false, false, 5);
INSERT INTO public.star VALUES (12, 'Antares', 'A red supergiant in the Scorpius constellation', 12000, 1200000, false, true, 6);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: black_hole black_hole_galaxy_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_name_key UNIQUE (galaxy_id, name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

