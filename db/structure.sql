--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE activities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    summary text NOT NULL,
    description text,
    activity_type character varying(255),
    parent_id integer,
    internal_only boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE addresses (
    id integer NOT NULL,
    label character varying(255),
    line1 character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    country character varying(255),
    addressable_id integer,
    addressable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    start timestamp without time zone NOT NULL,
    finish timestamp without time zone NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    activity_id integer,
    archived boolean DEFAULT false
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE participations (
    id integer NOT NULL,
    event_id integer NOT NULL,
    person_id integer NOT NULL,
    p_type integer NOT NULL,
    status integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    attendance integer
);


--
-- Name: participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE participations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE participations_id_seq OWNED BY participations.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE people (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    gender character varying(255),
    email character varying(255),
    date_of_birth date,
    occupation character varying(255),
    nationality character varying(255),
    marketing boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cpf character varying(255),
    rg character varying(255),
    scholarity character varying(255),
    relationship integer,
    needs_review boolean DEFAULT false,
    needs_review_reason character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: phone_numbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE phone_numbers (
    id integer NOT NULL,
    label character varying(255),
    number character varying(255) NOT NULL,
    provider character varying(255),
    phone_type character varying(255) NOT NULL,
    phonable_id integer,
    phonable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE phone_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE phone_numbers_id_seq OWNED BY phone_numbers.id;


--
-- Name: resource_assets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE resource_assets (
    id integer NOT NULL,
    file_file_name character varying(255),
    file_content_type character varying(255),
    file_file_size integer,
    file_updated_at timestamp without time zone,
    assetable_id integer,
    assetable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    asset_type integer
);


--
-- Name: resource_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE resource_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE resource_assets_id_seq OWNED BY resource_assets.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    resource_id integer,
    resource_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: tmks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tmks (
    id integer NOT NULL,
    with_who_id integer NOT NULL,
    from_who_id integer NOT NULL,
    event_id integer NOT NULL,
    contact_date timestamp without time zone,
    contact_type character varying(255),
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tmks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tmks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tmks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tmks_id_seq OWNED BY tmks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    person_id integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id integer NOT NULL,
    event character varying(255) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp without time zone,
    object_changes text,
    event_id integer,
    person_id integer,
    activity_id integer
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volunteers (
    id integer NOT NULL,
    person_id integer NOT NULL,
    admission date,
    area_of_operation character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volunteers_id_seq OWNED BY volunteers.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY participations ALTER COLUMN id SET DEFAULT nextval('participations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY phone_numbers ALTER COLUMN id SET DEFAULT nextval('phone_numbers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY resource_assets ALTER COLUMN id SET DEFAULT nextval('resource_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tmks ALTER COLUMN id SET DEFAULT nextval('tmks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteers_id_seq'::regclass);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY participations
    ADD CONSTRAINT participations_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: resource_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY resource_assets
    ADD CONSTRAINT resource_assets_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: tmks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tmks
    ADD CONSTRAINT tmks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- Name: index_addresses_on_addressable_type_and_addressable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_addressable_type_and_addressable_id ON addresses USING btree (addressable_type, addressable_id);


--
-- Name: index_events_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_name ON events USING btree (name);


--
-- Name: index_participations_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_participations_on_event_id ON participations USING btree (event_id);


--
-- Name: index_participations_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_participations_on_person_id ON participations USING btree (person_id);


--
-- Name: index_people_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_people_on_name ON people USING btree (name);


--
-- Name: index_phone_numbers_on_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_phone_numbers_on_number ON phone_numbers USING btree (number);


--
-- Name: index_phone_numbers_on_phonable_type_and_phonable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_phone_numbers_on_phonable_type_and_phonable_id ON phone_numbers USING btree (phonable_type, phonable_id);


--
-- Name: index_resource_assets_on_assetable_type_and_assetable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resource_assets_on_assetable_type_and_assetable_id ON resource_assets USING btree (assetable_type, assetable_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_tmks_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tmks_on_event_id ON tmks USING btree (event_id);


--
-- Name: index_tmks_on_from_who_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tmks_on_from_who_id ON tmks USING btree (from_who_id);


--
-- Name: index_tmks_on_with_who_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tmks_on_with_who_id ON tmks USING btree (with_who_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_person_id ON users USING btree (person_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: index_volunteers_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_person_id ON volunteers USING btree (person_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20140330205100');

INSERT INTO schema_migrations (version) VALUES ('20140330210526');

INSERT INTO schema_migrations (version) VALUES ('20140330210756');

INSERT INTO schema_migrations (version) VALUES ('20140330220644');

INSERT INTO schema_migrations (version) VALUES ('20140330221658');

INSERT INTO schema_migrations (version) VALUES ('20140330221728');

INSERT INTO schema_migrations (version) VALUES ('20140504200029');

INSERT INTO schema_migrations (version) VALUES ('20140504200030');

INSERT INTO schema_migrations (version) VALUES ('20140601175536');

INSERT INTO schema_migrations (version) VALUES ('20140618034452');

INSERT INTO schema_migrations (version) VALUES ('20140624000637');

INSERT INTO schema_migrations (version) VALUES ('20140707171124');

INSERT INTO schema_migrations (version) VALUES ('20140708165800');

INSERT INTO schema_migrations (version) VALUES ('20140708171211');

INSERT INTO schema_migrations (version) VALUES ('20140728124727');

INSERT INTO schema_migrations (version) VALUES ('20140921230335');

INSERT INTO schema_migrations (version) VALUES ('20141102220305');

INSERT INTO schema_migrations (version) VALUES ('20141102220306');

INSERT INTO schema_migrations (version) VALUES ('20150107213212');

INSERT INTO schema_migrations (version) VALUES ('20150219010907');

INSERT INTO schema_migrations (version) VALUES ('20150315191029');

INSERT INTO schema_migrations (version) VALUES ('20150318162711');

INSERT INTO schema_migrations (version) VALUES ('20150318164747');

INSERT INTO schema_migrations (version) VALUES ('20150328235411');

INSERT INTO schema_migrations (version) VALUES ('20150403185402');

INSERT INTO schema_migrations (version) VALUES ('20150403190042');

INSERT INTO schema_migrations (version) VALUES ('20150606155758');

INSERT INTO schema_migrations (version) VALUES ('20150630202607');

INSERT INTO schema_migrations (version) VALUES ('20150814132526');

INSERT INTO schema_migrations (version) VALUES ('20150911172128');

INSERT INTO schema_migrations (version) VALUES ('20160108222336');

INSERT INTO schema_migrations (version) VALUES ('20160109333333');

INSERT INTO schema_migrations (version) VALUES ('20160424041349');

INSERT INTO schema_migrations (version) VALUES ('20170418084352');

