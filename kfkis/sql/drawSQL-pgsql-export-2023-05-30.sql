CREATE TABLE "places"(
    "place_id" SERIAL NOT NULL,
    "place_name" VARCHAR(255) NOT NULL,
    "adress" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "places" ADD PRIMARY KEY("place_id");
CREATE TABLE "countries"( 
    "country_id" INTEGER NOT NULL,
    "country_name" VARCHAR(255) NOT NULL
    CONSTRAINT countries_country_name_check CHECK (((country_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
);
ALTER TABLE
    "countries" ADD PRIMARY KEY("country_id");
CREATE TABLE "ranks"(
    "rank_id" INTEGER NOT NULL,
    "rank_name" VARCHAR(255) NOT NULL
CONSTRAINT ranks_rank_name_check CHECK (((rank_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
);
ALTER TABLE
    "ranks" ADD PRIMARY KEY("rank_id");
CREATE TABLE "event_sportsman"(
    "event_id" INTEGER NOT NULL,
    "sportsman_id" INTEGER NOT NULL
);
-- ALTER TABLE
--     "event_sportsman" ADD PRIMARY KEY("event_id");
-- ALTER TABLE
--     "event_sportsman" ADD PRIMARY KEY("sportsman_id");
CREATE TABLE "events"(
    "event_id" SERIAL NOT NULL,
    "event_name" VARCHAR(255) NOT NULL,
    "sport_id" INTEGER NOT NULL,
    "resp_id" INTEGER NOT NULL,
    "org_id" INTEGER NOT NULL,
    "place_id" INTEGER NOT NULL,
    "begin_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "done" BOOLEAN NULL
    CONSTRAINT events_event_name_check CHECK (((event_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    
);
ALTER TABLE
    "events" ADD PRIMARY KEY("event_id");
CREATE TABLE "trainers"(
    "trainer_id" SERIAL NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "middle_name" VARCHAR(255) NULL,
    "city_id" INTEGER NOT NULL,
    "sport_id" INTEGER NOT NULL,
    "rank_id" INTEGER NOT NULL,
    "phone" BIGINT NULL,
    "email" VARCHAR(255) NULL
    CONSTRAINT trainers_first_name_check CHECK (((first_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT trainers_last_name_check CHECK (((last_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT trainers_middle_name_check CHECK (((middle_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT trainers_phone_check CHECK (((phone >= '10000000000'::bigint) AND (phone <= '99999999999'::bigint)))
);
ALTER TABLE
    "trainers" ADD PRIMARY KEY("trainer_id");
CREATE TABLE "athletes"(
    "sportsman_id" SERIAL NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "second_name" VARCHAR(255) NOT NULL,
    "middle_name" VARCHAR(255) NULL,
    "city_id" INTEGER NOT NULL,
    "trainer_id" INTEGER NULL,
    "sport_id" INTEGER NOT NULL,
    "rank_id" INTEGER NULL,
    "phone" BIGINT NULL,
    "email" VARCHAR(255) NULL
    CONSTRAINT athletes_first_name_check CHECK (((first_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT athletes_last_name_check CHECK (((last_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT athletes_middle_name_check CHECK (((middle_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT athletes_phone_check CHECK (((phone >= '10000000000'::bigint) AND (phone <= '99999999999'::bigint)))
);
ALTER TABLE
    "athletes" ADD PRIMARY KEY("sportsman_id");
CREATE TABLE "organaizers"(
    "organizer_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "middle_name" VARCHAR(255) NULL,
    "city_id" INTEGER NOT NULL,
    "phone" BIGINT NOT NULL,
    "email" VARCHAR(255) NULL
    CONSTRAINT organaizers_first_name_check CHECK (((first_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT organaizers_last_name_check CHECK (((last_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT organaizers_middle_name_check CHECK (((middle_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT organaizers_phone_check CHECK (((phone >= '10000000000'::bigint) AND (phone <= '99999999999'::bigint)))
);
ALTER TABLE
    "organaizers" ADD PRIMARY KEY("organizer_id");
CREATE TABLE "sports"(
    "sport_id" INTEGER NOT NULL,
    "sport_name" VARCHAR(255) NOT NULL
    CONSTRAINT sports_sport_name_check CHECK (((sport_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
);
ALTER TABLE
    "sports" ADD PRIMARY KEY("sport_id");
CREATE TABLE "positions"(
    "position_id" INTEGER NOT NULL,
    "position_name" VARCHAR(255) NOT NULL
    CONSTRAINT positions_position_name_check CHECK (((position_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
);
ALTER TABLE
    "positions" ADD PRIMARY KEY("position_id");
CREATE TABLE "cities"(
    "city_id" INTEGER NOT NULL,
    "city_name" VARCHAR(255) NOT NULL,
    "country_id" INTEGER NOT NULL
);
ALTER TABLE
    "cities" ADD PRIMARY KEY("city_id");
CREATE TABLE "employees"(
    "employee_id" INTEGER NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "middle_name" VARCHAR(255) NULL,
    "position_id" INTEGER NOT NULL,
    "birthday" DATE NULL,
    "phone" BIGINT NULL,
    "email" VARCHAR(255) NULL
    CONSTRAINT employees_first_name_check CHECK (((first_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT employees_last_name_check CHECK (((last_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT employees_middle_name_check CHECK (((middle_name)::text ~ '[a-zA-Zа-яА-Я]+$'::text))
    CONSTRAINT employees_phone_check CHECK (((phone >= '10000000000'::bigint) AND (phone <= '99999999999'::bigint)))
);
ALTER TABLE
    "employees" ADD PRIMARY KEY("employee_id");
ALTER TABLE
    "athletes" ADD CONSTRAINT "athletes_city_id_foreign" FOREIGN KEY("city_id") REFERENCES "cities"("city_id");
ALTER TABLE
    "athletes" ADD CONSTRAINT "athletes_trainer_id_foreign" FOREIGN KEY("trainer_id") REFERENCES "trainers"("trainer_id");
ALTER TABLE
    "athletes" ADD CONSTRAINT "athletes_sport_id_foreign" FOREIGN KEY("sport_id") REFERENCES "sports"("sport_id");
ALTER TABLE
    "trainers" ADD CONSTRAINT "trainers_sport_id_foreign" FOREIGN KEY("sport_id") REFERENCES "sports"("sport_id");
ALTER TABLE
    "events" ADD CONSTRAINT "events_org_id_foreign" FOREIGN KEY("org_id") REFERENCES "organaizers"("organizer_id");
ALTER TABLE
    "events" ADD CONSTRAINT "events_resp_id_foreign" FOREIGN KEY("resp_id") REFERENCES "employees"("employee_id");
ALTER TABLE
    "trainers" ADD CONSTRAINT "trainers_rank_id_foreign" FOREIGN KEY("rank_id") REFERENCES "ranks"("rank_id");
ALTER TABLE
    "employees" ADD CONSTRAINT "employees_position_id_foreign" FOREIGN KEY("position_id") REFERENCES "positions"("position_id");
ALTER TABLE
    "trainers" ADD CONSTRAINT "trainers_city_id_foreign" FOREIGN KEY("city_id") REFERENCES "cities"("city_id");
ALTER TABLE
    "athletes" ADD CONSTRAINT "athletes_rank_id_foreign" FOREIGN KEY("rank_id") REFERENCES "ranks"("rank_id");
ALTER TABLE
    "events" ADD CONSTRAINT "events_place_id_foreign" FOREIGN KEY("place_id") REFERENCES "places"("place_id");
ALTER TABLE
    "events" ADD CONSTRAINT "events_sport_id_foreign" FOREIGN KEY("sport_id") REFERENCES "sports"("sport_id");
ALTER TABLE
    "event_sportsman" ADD CONSTRAINT "event_sportsman_sportsman_id_foreign" FOREIGN KEY("sportsman_id") REFERENCES "athletes"("sportsman_id");
ALTER TABLE
    "organaizers" ADD CONSTRAINT "organaizers_city_id_foreign" FOREIGN KEY("city_id") REFERENCES "cities"("city_id");
ALTER TABLE
    "event_sportsman" ADD CONSTRAINT "event_sportsman_event_id_foreign" FOREIGN KEY("event_id") REFERENCES "events"("event_id");
ALTER TABLE
    "cities" ADD CONSTRAINT "cities_country_id_foreign" FOREIGN KEY("country_id") REFERENCES "countries"("country_id");