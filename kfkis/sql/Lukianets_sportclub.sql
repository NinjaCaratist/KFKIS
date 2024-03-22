--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-05-23 19:10:35

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: kursach; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA kursach;


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA kursach; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA kursach IS 'standard public schema';


SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17252)
-- Name: employees; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.employees (
    employee_id integer NOT NULL,
    position_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    middle_name character varying(255) DEFAULT NULL::character varying,
    birthday date NOT NULL,
    sex character varying(1) NOT NULL,
    passport_data bigint NOT NULL,
    inn bigint,
    adress character varying(255) DEFAULT NULL::character varying,
    phone bigint NOT NULL,
    CONSTRAINT employees_birthday_check CHECK ((birthday > make_date(1922, 1, 1))),
    CONSTRAINT employees_first_name_check CHECK (((first_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT employees_inn_check CHECK (((inn >= 1000000000) AND (inn <= '9999999999'::bigint))),
    CONSTRAINT employees_last_name_check CHECK (((last_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT employees_middle_name_check CHECK (((middle_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT employees_passport_data_check CHECK ((passport_data >= 1000000000)),
    CONSTRAINT employees_phone_check CHECK (((phone >= '10000000000'::bigint) AND (phone <= '99999999999'::bigint))),
    CONSTRAINT employees_sex_check CHECK (((sex)::text ~ '[mf]'::text))
);


--
-- TOC entry 218 (class 1259 OID 17251)
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 218
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.employees_employee_id_seq OWNED BY kursach.employees.employee_id;


--
-- TOC entry 215 (class 1259 OID 17233)
-- Name: extra_services; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.extra_services (
    service_id integer NOT NULL,
    service_name character varying(255) NOT NULL,
    employee_id integer NOT NULL,
    place_id integer NOT NULL,
    service_price integer NOT NULL,
    CONSTRAINT extra_services_service_name_check CHECK (((service_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT extra_services_service_price_check CHECK ((service_price > 0))
);


--
-- TOC entry 214 (class 1259 OID 17232)
-- Name: extra_services_service_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.extra_services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 214
-- Name: extra_services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.extra_services_service_id_seq OWNED BY kursach.extra_services.service_id;


--
-- TOC entry 217 (class 1259 OID 17242)
-- Name: group_sections; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.group_sections (
    section_id integer NOT NULL,
    coach_id integer NOT NULL,
    place_id integer NOT NULL,
    section_name character varying(255) NOT NULL,
    average_age integer,
    age_limit integer NOT NULL,
    CONSTRAINT group_sections_age_limit_check CHECK (((age_limit >= 6) AND (age_limit <= 99))),
    CONSTRAINT group_sections_average_age_check CHECK (((average_age >= 6) AND (average_age <= 99))),
    CONSTRAINT group_sections_section_name_check CHECK (((section_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
);


--
-- TOC entry 216 (class 1259 OID 17241)
-- Name: group_sections_section_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.group_sections_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 216
-- Name: group_sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.group_sections_section_id_seq OWNED BY kursach.group_sections.section_id;


--
-- TOC entry 213 (class 1259 OID 17227)
-- Name: inventory_responsible; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.inventory_responsible (
    object_id integer NOT NULL,
    employee_id integer NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 17212)
-- Name: places; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.places (
    place_id integer NOT NULL,
    place_name character varying(255) NOT NULL,
    CONSTRAINT places_place_name_check CHECK (((place_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
);


--
-- TOC entry 209 (class 1259 OID 17211)
-- Name: places_place_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.places_place_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 209
-- Name: places_place_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.places_place_id_seq OWNED BY kursach.places.place_id;


--
-- TOC entry 221 (class 1259 OID 17271)
-- Name: positions; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.positions (
    position_id integer NOT NULL,
    position_name character varying(255) NOT NULL,
    salary integer NOT NULL,
    CONSTRAINT positions_position_name_check CHECK (((position_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT positions_salary_check CHECK ((salary > 0))
);


--
-- TOC entry 220 (class 1259 OID 17270)
-- Name: positions_position_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.positions_position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 220
-- Name: positions_position_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.positions_position_id_seq OWNED BY kursach.positions.position_id;


--
-- TOC entry 212 (class 1259 OID 17220)
-- Name: sport_inventory; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.sport_inventory (
    object_id integer NOT NULL,
    object_name character varying(255) NOT NULL,
    object_place integer NOT NULL,
    CONSTRAINT sport_inventory_object_name_check CHECK (((object_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
);


--
-- TOC entry 211 (class 1259 OID 17219)
-- Name: sport_inventory_object_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.sport_inventory_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 211
-- Name: sport_inventory_object_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.sport_inventory_object_id_seq OWNED BY kursach.sport_inventory.object_id;


--
-- TOC entry 227 (class 1259 OID 17315)
-- Name: subscriptions; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.subscriptions (
    subscription_id integer NOT NULL,
    visitor_id integer NOT NULL,
    tariff_id integer NOT NULL,
    manager_id integer NOT NULL,
    creation_date date NOT NULL,
    visits_left integer NOT NULL,
    active boolean NOT NULL,
    CONSTRAINT subscriptions_visits_left_check CHECK ((visits_left >= 0))
);


--
-- TOC entry 226 (class 1259 OID 17314)
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.subscriptions_subscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 226
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.subscriptions_subscription_id_seq OWNED BY kursach.subscriptions.subscription_id;


--
-- TOC entry 225 (class 1259 OID 17300)
-- Name: tariffs; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.tariffs (
    tariff_id integer NOT NULL,
    tariff_name character varying(255) NOT NULL,
    price integer NOT NULL,
    duration integer NOT NULL,
    visit_days character varying(30) NOT NULL,
    visit_hours character varying(13) NOT NULL,
    visits_amount integer NOT NULL,
    group_section_id integer NOT NULL,
    pool boolean NOT NULL,
    gym boolean NOT NULL,
    social_status character varying(255) DEFAULT NULL::character varying,
    CONSTRAINT tariffs_duration_check CHECK ((duration > 0)),
    CONSTRAINT tariffs_price_check CHECK ((price > 0)),
    CONSTRAINT tariffs_social_status_check CHECK (((social_status)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT tariffs_tariff_name_check CHECK (((tariff_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT tariffs_visits_amount_check CHECK ((visits_amount > 0))
);


--
-- TOC entry 224 (class 1259 OID 17299)
-- Name: tariffs_tariff_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.tariffs_tariff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 224
-- Name: tariffs_tariff_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.tariffs_tariff_id_seq OWNED BY kursach.tariffs.tariff_id;


--
-- TOC entry 223 (class 1259 OID 17280)
-- Name: visitors; Type: TABLE; Schema: kursach; Owner: -
--

CREATE TABLE kursach.visitors (
    visitor_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    middle_name character varying(255) DEFAULT NULL::character varying,
    birthday date NOT NULL,
    sex character varying(1) NOT NULL,
    passport_data bigint NOT NULL,
    adress character varying(255) DEFAULT NULL::character varying,
    phone bigint NOT NULL,
    email character varying(255) DEFAULT NULL::character varying,
    social_status character varying(255) NOT NULL,
    CONSTRAINT visitors_birthday_check CHECK ((birthday > make_date(1922, 1, 1))),
    CONSTRAINT visitors_first_name_check CHECK (((first_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT visitors_last_name_check CHECK (((last_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT visitors_middle_name_check CHECK (((middle_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text)),
    CONSTRAINT visitors_passport_data_check CHECK ((passport_data >= 1000000000)),
    CONSTRAINT visitors_phone_check CHECK (((phone >= '10000000000'::bigint) AND (phone <= '99999999999'::bigint))),
    CONSTRAINT visitors_sex_check CHECK (((sex)::text ~ '[mf]'::text)),
    CONSTRAINT visitors_social_status_check CHECK (((social_status)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
);


--
-- TOC entry 222 (class 1259 OID 17279)
-- Name: visitors_visitor_id_seq; Type: SEQUENCE; Schema: kursach; Owner: -
--

CREATE SEQUENCE kursach.visitors_visitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 222
-- Name: visitors_visitor_id_seq; Type: SEQUENCE OWNED BY; Schema: kursach; Owner: -
--

ALTER SEQUENCE kursach.visitors_visitor_id_seq OWNED BY kursach.visitors.visitor_id;


--
-- TOC entry 3219 (class 2604 OID 17255)
-- Name: employees employee_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.employees ALTER COLUMN employee_id SET DEFAULT nextval('kursach.employees_employee_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 17236)
-- Name: extra_services service_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.extra_services ALTER COLUMN service_id SET DEFAULT nextval('kursach.extra_services_service_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 17245)
-- Name: group_sections section_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.group_sections ALTER COLUMN section_id SET DEFAULT nextval('kursach.group_sections_section_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 17215)
-- Name: places place_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.places ALTER COLUMN place_id SET DEFAULT nextval('kursach.places_place_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 17274)
-- Name: positions position_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.positions ALTER COLUMN position_id SET DEFAULT nextval('kursach.positions_position_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 17223)
-- Name: sport_inventory object_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.sport_inventory ALTER COLUMN object_id SET DEFAULT nextval('kursach.sport_inventory_object_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 17318)
-- Name: subscriptions subscription_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.subscriptions ALTER COLUMN subscription_id SET DEFAULT nextval('kursach.subscriptions_subscription_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 17303)
-- Name: tariffs tariff_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.tariffs ALTER COLUMN tariff_id SET DEFAULT nextval('kursach.tariffs_tariff_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 17283)
-- Name: visitors visitor_id; Type: DEFAULT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.visitors ALTER COLUMN visitor_id SET DEFAULT nextval('kursach.visitors_visitor_id_seq'::regclass);


--
-- TOC entry 3435 (class 0 OID 17252)
-- Dependencies: 219
-- Data for Name: employees; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3431 (class 0 OID 17233)
-- Dependencies: 215
-- Data for Name: extra_services; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3433 (class 0 OID 17242)
-- Dependencies: 217
-- Data for Name: group_sections; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3429 (class 0 OID 17227)
-- Dependencies: 213
-- Data for Name: inventory_responsible; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3426 (class 0 OID 17212)
-- Dependencies: 210
-- Data for Name: places; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3437 (class 0 OID 17271)
-- Dependencies: 221
-- Data for Name: positions; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3428 (class 0 OID 17220)
-- Dependencies: 212
-- Data for Name: sport_inventory; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3443 (class 0 OID 17315)
-- Dependencies: 227
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3441 (class 0 OID 17300)
-- Dependencies: 225
-- Data for Name: tariffs; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3439 (class 0 OID 17280)
-- Dependencies: 223
-- Data for Name: visitors; Type: TABLE DATA; Schema: kursach; Owner: -
--



--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 218
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.employees_employee_id_seq', 1, false);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 214
-- Name: extra_services_service_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.extra_services_service_id_seq', 1, false);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 216
-- Name: group_sections_section_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.group_sections_section_id_seq', 1, false);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 209
-- Name: places_place_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.places_place_id_seq', 1, false);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 220
-- Name: positions_position_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.positions_position_id_seq', 1, false);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 211
-- Name: sport_inventory_object_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.sport_inventory_object_id_seq', 1, false);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 226
-- Name: subscriptions_subscription_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.subscriptions_subscription_id_seq', 1, false);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 224
-- Name: tariffs_tariff_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.tariffs_tariff_id_seq', 1, false);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 222
-- Name: visitors_visitor_id_seq; Type: SEQUENCE SET; Schema: kursach; Owner: -
--

SELECT pg_catalog.setval('kursach.visitors_visitor_id_seq', 1, false);


--
-- TOC entry 3265 (class 2606 OID 17269)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 3261 (class 2606 OID 17240)
-- Name: extra_services extra_services_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.extra_services
    ADD CONSTRAINT extra_services_pkey PRIMARY KEY (service_id);


--
-- TOC entry 3263 (class 2606 OID 17250)
-- Name: group_sections group_sections_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.group_sections
    ADD CONSTRAINT group_sections_pkey PRIMARY KEY (section_id);


--
-- TOC entry 3259 (class 2606 OID 17231)
-- Name: inventory_responsible inventory_responsible_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.inventory_responsible
    ADD CONSTRAINT inventory_responsible_pkey PRIMARY KEY (object_id, employee_id);


--
-- TOC entry 3255 (class 2606 OID 17218)
-- Name: places places_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (place_id);


--
-- TOC entry 3267 (class 2606 OID 17278)
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (position_id);


--
-- TOC entry 3257 (class 2606 OID 17226)
-- Name: sport_inventory sport_inventory_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.sport_inventory
    ADD CONSTRAINT sport_inventory_pkey PRIMARY KEY (object_id);


--
-- TOC entry 3273 (class 2606 OID 17321)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (subscription_id);


--
-- TOC entry 3271 (class 2606 OID 17313)
-- Name: tariffs tariffs_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.tariffs
    ADD CONSTRAINT tariffs_pkey PRIMARY KEY (tariff_id);


--
-- TOC entry 3269 (class 2606 OID 17298)
-- Name: visitors visitors_pkey; Type: CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.visitors
    ADD CONSTRAINT visitors_pkey PRIMARY KEY (visitor_id);


--
-- TOC entry 3281 (class 2606 OID 25251)
-- Name: employees emp_position_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.employees
    ADD CONSTRAINT emp_position_id_fk FOREIGN KEY (position_id) REFERENCES kursach.positions(position_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3277 (class 2606 OID 25256)
-- Name: extra_services es_employee_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.extra_services
    ADD CONSTRAINT es_employee_id_fk FOREIGN KEY (employee_id) REFERENCES kursach.employees(employee_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3278 (class 2606 OID 25261)
-- Name: extra_services es_place_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.extra_services
    ADD CONSTRAINT es_place_id_fk FOREIGN KEY (place_id) REFERENCES kursach.places(place_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3279 (class 2606 OID 25236)
-- Name: group_sections gs_coach_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.group_sections
    ADD CONSTRAINT gs_coach_id_fk FOREIGN KEY (coach_id) REFERENCES kursach.employees(employee_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3280 (class 2606 OID 25241)
-- Name: group_sections gs_place_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.group_sections
    ADD CONSTRAINT gs_place_id_fk FOREIGN KEY (place_id) REFERENCES kursach.places(place_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3275 (class 2606 OID 25266)
-- Name: inventory_responsible ir_employee_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.inventory_responsible
    ADD CONSTRAINT ir_employee_id_fk FOREIGN KEY (employee_id) REFERENCES kursach.employees(employee_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3276 (class 2606 OID 25271)
-- Name: inventory_responsible ir_object_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.inventory_responsible
    ADD CONSTRAINT ir_object_id_fk FOREIGN KEY (object_id) REFERENCES kursach.sport_inventory(object_id) NOT VALID;


--
-- TOC entry 3274 (class 2606 OID 17322)
-- Name: sport_inventory si_object_place_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.sport_inventory
    ADD CONSTRAINT si_object_place_fk FOREIGN KEY (object_place) REFERENCES kursach.places(place_id);


--
-- TOC entry 3283 (class 2606 OID 17377)
-- Name: subscriptions sub_manager_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.subscriptions
    ADD CONSTRAINT sub_manager_id_fk FOREIGN KEY (manager_id) REFERENCES kursach.employees(employee_id);


--
-- TOC entry 3284 (class 2606 OID 17372)
-- Name: subscriptions sub_tariff_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.subscriptions
    ADD CONSTRAINT sub_tariff_id_fk FOREIGN KEY (tariff_id) REFERENCES kursach.tariffs(tariff_id);


--
-- TOC entry 3285 (class 2606 OID 17367)
-- Name: subscriptions sub_visitor_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.subscriptions
    ADD CONSTRAINT sub_visitor_id_fk FOREIGN KEY (visitor_id) REFERENCES kursach.visitors(visitor_id);


--
-- TOC entry 3282 (class 2606 OID 25246)
-- Name: tariffs trf_group_section_id_fk; Type: FK CONSTRAINT; Schema: kursach; Owner: -
--

ALTER TABLE ONLY kursach.tariffs
    ADD CONSTRAINT trf_group_section_id_fk FOREIGN KEY (group_section_id) REFERENCES kursach.group_sections(section_id) ON DELETE CASCADE NOT VALID;


-- Completed on 2022-05-23 19:10:35

--
-- PostgreSQL database dump complete
--

