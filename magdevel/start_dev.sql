--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: user
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO "user";

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE accounts_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    email character varying(75) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO "user";

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE accounts_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO "user";

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO "user";

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE accounts_user_groups_id_seq OWNED BY accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO "user";

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE accounts_user_id_seq OWNED BY accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE accounts_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO "user";

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO "user";

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE accounts_user_user_permissions_id_seq OWNED BY accounts_user_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO "user";

--
-- Name: cities_light_city; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE cities_light_city (
    id integer NOT NULL,
    name_ascii character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    geoname_id integer,
    alternate_names text,
    name character varying(200) NOT NULL,
    display_name character varying(200) NOT NULL,
    search_names text NOT NULL,
    latitude numeric(8,5),
    longitude numeric(8,5),
    region_id integer,
    country_id integer NOT NULL,
    population bigint,
    feature_code character varying(10)
);


ALTER TABLE public.cities_light_city OWNER TO "user";

--
-- Name: cities_light_city_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE cities_light_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_light_city_id_seq OWNER TO "user";

--
-- Name: cities_light_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE cities_light_city_id_seq OWNED BY cities_light_city.id;


--
-- Name: cities_light_country; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE cities_light_country (
    id integer NOT NULL,
    name_ascii character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    geoname_id integer,
    alternate_names text,
    name character varying(200) NOT NULL,
    code2 character varying(2),
    code3 character varying(3),
    continent character varying(2) NOT NULL,
    tld character varying(5) NOT NULL,
    phone character varying(20)
);


ALTER TABLE public.cities_light_country OWNER TO "user";

--
-- Name: cities_light_country_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE cities_light_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_light_country_id_seq OWNER TO "user";

--
-- Name: cities_light_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE cities_light_country_id_seq OWNED BY cities_light_country.id;


--
-- Name: cities_light_region; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE cities_light_region (
    id integer NOT NULL,
    name_ascii character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    geoname_id integer,
    alternate_names text,
    name character varying(200) NOT NULL,
    display_name character varying(200) NOT NULL,
    geoname_code character varying(50),
    country_id integer NOT NULL
);


ALTER TABLE public.cities_light_region OWNER TO "user";

--
-- Name: cities_light_region_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE cities_light_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_light_region_id_seq OWNER TO "user";

--
-- Name: cities_light_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE cities_light_region_id_seq OWNED BY cities_light_region.id;


--
-- Name: configuration_apiurl; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE configuration_apiurl (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(200) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.configuration_apiurl OWNER TO "user";

--
-- Name: configuration_apiurl_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE configuration_apiurl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuration_apiurl_id_seq OWNER TO "user";

--
-- Name: configuration_apiurl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE configuration_apiurl_id_seq OWNED BY configuration_apiurl.id;


--
-- Name: configuration_gatracking; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE configuration_gatracking (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.configuration_gatracking OWNER TO "user";

--
-- Name: configuration_gatracking_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE configuration_gatracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuration_gatracking_id_seq OWNER TO "user";

--
-- Name: configuration_gatracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE configuration_gatracking_id_seq OWNED BY configuration_gatracking.id;


--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE public.corsheaders_corsmodel OWNER TO "user";

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE corsheaders_corsmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corsheaders_corsmodel_id_seq OWNER TO "user";

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE corsheaders_corsmodel_id_seq OWNED BY corsheaders_corsmodel.id;


--
-- Name: device_device; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_device (
    uuid character varying(36) NOT NULL,
    advertising_id character varying(36),
    system_id character varying(255),
    serial_number character varying(255),
    name character varying(50),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    current_system_id integer NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.device_device OWNER TO "user";

--
-- Name: device_device_related_emails; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_device_related_emails (
    id integer NOT NULL,
    device_id character varying(36) NOT NULL,
    email_id integer NOT NULL
);


ALTER TABLE public.device_device_related_emails OWNER TO "user";

--
-- Name: device_device_related_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE device_device_related_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_device_related_emails_id_seq OWNER TO "user";

--
-- Name: device_device_related_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE device_device_related_emails_id_seq OWNED BY device_device_related_emails.id;


--
-- Name: device_devicecurrentsystem; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_devicecurrentsystem (
    id integer NOT NULL,
    system_id integer NOT NULL,
    version_id integer NOT NULL
);


ALTER TABLE public.device_devicecurrentsystem OWNER TO "user";

--
-- Name: device_devicecurrentsystem_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE device_devicecurrentsystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_devicecurrentsystem_id_seq OWNER TO "user";

--
-- Name: device_devicecurrentsystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE device_devicecurrentsystem_id_seq OWNED BY device_devicecurrentsystem.id;


--
-- Name: device_devicegroup; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_devicegroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.device_devicegroup OWNER TO "user";

--
-- Name: device_devicegroup_devices; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_devicegroup_devices (
    id integer NOT NULL,
    devicegroup_id integer NOT NULL,
    device_id character varying(36) NOT NULL
);


ALTER TABLE public.device_devicegroup_devices OWNER TO "user";

--
-- Name: device_devicegroup_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE device_devicegroup_devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_devicegroup_devices_id_seq OWNER TO "user";

--
-- Name: device_devicegroup_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE device_devicegroup_devices_id_seq OWNED BY device_devicegroup_devices.id;


--
-- Name: device_devicegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE device_devicegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_devicegroup_id_seq OWNER TO "user";

--
-- Name: device_devicegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE device_devicegroup_id_seq OWNED BY device_devicegroup.id;


--
-- Name: device_devicemodel; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_devicemodel (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    screen_width integer NOT NULL,
    screen_height integer NOT NULL,
    screen_inches double precision NOT NULL,
    screen_density integer NOT NULL,
    screen_layout_size_id integer
);


ALTER TABLE public.device_devicemodel OWNER TO "user";

--
-- Name: device_devicemodel_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE device_devicemodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_devicemodel_id_seq OWNER TO "user";

--
-- Name: device_devicemodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE device_devicemodel_id_seq OWNED BY device_devicemodel.id;


--
-- Name: device_devicesystem; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_devicesystem (
    id integer NOT NULL,
    name character varying(15) NOT NULL
);


ALTER TABLE public.device_devicesystem OWNER TO "user";

--
-- Name: device_devicesystem_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE device_devicesystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_devicesystem_id_seq OWNER TO "user";

--
-- Name: device_devicesystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE device_devicesystem_id_seq OWNED BY device_devicesystem.id;


--
-- Name: device_devicesystemversion; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_devicesystemversion (
    id integer NOT NULL,
    version character varying(10) NOT NULL
);


ALTER TABLE public.device_devicesystemversion OWNER TO "user";

--
-- Name: device_devicesystemversion_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE device_devicesystemversion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_devicesystemversion_id_seq OWNER TO "user";

--
-- Name: device_devicesystemversion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE device_devicesystemversion_id_seq OWNED BY device_devicesystemversion.id;


--
-- Name: device_screenlayoutsize; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE device_screenlayoutsize (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.device_screenlayoutsize OWNER TO "user";

--
-- Name: device_screenlayoutsize_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE device_screenlayoutsize_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_screenlayoutsize_id_seq OWNER TO "user";

--
-- Name: device_screenlayoutsize_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE device_screenlayoutsize_id_seq OWNED BY device_screenlayoutsize.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "user";

--
-- Name: identify_email; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE identify_email (
    id integer NOT NULL,
    email character varying(75) NOT NULL
);


ALTER TABLE public.identify_email OWNER TO "user";

--
-- Name: identify_email_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE identify_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identify_email_id_seq OWNER TO "user";

--
-- Name: identify_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE identify_email_id_seq OWNED BY identify_email.id;


--
-- Name: log_corelogentry; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE log_corelogentry (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    change_message text NOT NULL,
    action_type_id integer NOT NULL,
    content_type_id integer,
    type_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.log_corelogentry OWNER TO "user";

--
-- Name: log_corelogentry_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE log_corelogentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_corelogentry_id_seq OWNER TO "user";

--
-- Name: log_corelogentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE log_corelogentry_id_seq OWNED BY log_corelogentry.id;


--
-- Name: log_logactiontype; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE log_logactiontype (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.log_logactiontype OWNER TO "user";

--
-- Name: log_logactiontype_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE log_logactiontype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_logactiontype_id_seq OWNER TO "user";

--
-- Name: log_logactiontype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE log_logactiontype_id_seq OWNED BY log_logactiontype.id;


--
-- Name: log_logtype; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE log_logtype (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.log_logtype OWNER TO "user";

--
-- Name: log_logtype_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE log_logtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_logtype_id_seq OWNER TO "user";

--
-- Name: log_logtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE log_logtype_id_seq OWNED BY log_logtype.id;


--
-- Name: magad_adinsertionproposal; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_adinsertionproposal (
    id integer NOT NULL,
    active boolean NOT NULL,
    refused boolean NOT NULL,
    refusal_reason text NOT NULL,
    notification_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    campaign_id integer NOT NULL,
    interest_channel_id integer NOT NULL,
    publication_id integer NOT NULL
);


ALTER TABLE public.magad_adinsertionproposal OWNER TO "user";

--
-- Name: magad_adinsertionproposal_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_adinsertionproposal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_adinsertionproposal_id_seq OWNER TO "user";

--
-- Name: magad_adinsertionproposal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_adinsertionproposal_id_seq OWNED BY magad_adinsertionproposal.id;


--
-- Name: magad_adinsertionrequest; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_adinsertionrequest (
    uuid character varying(36) NOT NULL,
    page_number integer NOT NULL,
    inserted boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    campaign_id integer NOT NULL,
    device_log_id integer NOT NULL,
    issue_id integer NOT NULL,
    screen_id integer NOT NULL
);


ALTER TABLE public.magad_adinsertionrequest OWNER TO "user";

--
-- Name: magad_adscreen; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_adscreen (
    id integer NOT NULL,
    package character varying(100) NOT NULL,
    embedded_url character varying(200),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    advertisement_id integer NOT NULL
);


ALTER TABLE public.magad_adscreen OWNER TO "user";

--
-- Name: magad_adscreen_compatible_device_groups; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_adscreen_compatible_device_groups (
    id integer NOT NULL,
    adscreen_id integer NOT NULL,
    devicegroup_id integer NOT NULL
);


ALTER TABLE public.magad_adscreen_compatible_device_groups OWNER TO "user";

--
-- Name: magad_adscreen_compatible_device_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_adscreen_compatible_device_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_adscreen_compatible_device_groups_id_seq OWNER TO "user";

--
-- Name: magad_adscreen_compatible_device_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_adscreen_compatible_device_groups_id_seq OWNED BY magad_adscreen_compatible_device_groups.id;


--
-- Name: magad_adscreen_compatible_sdks; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_adscreen_compatible_sdks (
    id integer NOT NULL,
    adscreen_id integer NOT NULL,
    sdk_id integer NOT NULL
);


ALTER TABLE public.magad_adscreen_compatible_sdks OWNER TO "user";

--
-- Name: magad_adscreen_compatible_sdks_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_adscreen_compatible_sdks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_adscreen_compatible_sdks_id_seq OWNER TO "user";

--
-- Name: magad_adscreen_compatible_sdks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_adscreen_compatible_sdks_id_seq OWNED BY magad_adscreen_compatible_sdks.id;


--
-- Name: magad_adscreen_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_adscreen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_adscreen_id_seq OWNER TO "user";

--
-- Name: magad_adscreen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_adscreen_id_seq OWNED BY magad_adscreen.id;


--
-- Name: magad_advertisement; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_advertisement (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    contract_number character varying(100) NOT NULL,
    value numeric(9,2) NOT NULL,
    planned_insertions integer NOT NULL,
    contract character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    advertiser_id integer NOT NULL,
    agency_id integer NOT NULL
);


ALTER TABLE public.magad_advertisement OWNER TO "user";

--
-- Name: magad_advertisement_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_advertisement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_advertisement_id_seq OWNER TO "user";

--
-- Name: magad_advertisement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_advertisement_id_seq OWNED BY magad_advertisement.id;


--
-- Name: magad_advertiser; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_advertiser (
    id integer NOT NULL,
    legal_name character varying(100) NOT NULL,
    trade_name character varying(100) NOT NULL,
    tax_id character varying(30) NOT NULL,
    iban character varying(34) NOT NULL,
    zip_code character varying(30) NOT NULL,
    address character varying(150) NOT NULL,
    number character varying(150) NOT NULL,
    complement character varying(150) NOT NULL,
    phone character varying(20) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.magad_advertiser OWNER TO "user";

--
-- Name: magad_advertiser_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_advertiser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_advertiser_id_seq OWNER TO "user";

--
-- Name: magad_advertiser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_advertiser_id_seq OWNED BY magad_advertiser.id;


--
-- Name: magad_advertiser_profiles; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_advertiser_profiles (
    id integer NOT NULL,
    advertiser_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.magad_advertiser_profiles OWNER TO "user";

--
-- Name: magad_advertiser_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_advertiser_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_advertiser_profiles_id_seq OWNER TO "user";

--
-- Name: magad_advertiser_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_advertiser_profiles_id_seq OWNED BY magad_advertiser_profiles.id;


--
-- Name: magad_adviewreport; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_adviewreport (
    uuid character varying(36) NOT NULL,
    view_time double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    ad_insertion_id character varying(36) NOT NULL
);


ALTER TABLE public.magad_adviewreport OWNER TO "user";

--
-- Name: magad_agency; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_agency (
    id integer NOT NULL,
    legal_name character varying(100) NOT NULL,
    trade_name character varying(100) NOT NULL,
    tax_id character varying(30) NOT NULL,
    iban character varying(34) NOT NULL,
    zip_code character varying(30) NOT NULL,
    address character varying(150) NOT NULL,
    number character varying(150) NOT NULL,
    complement character varying(150) NOT NULL,
    phone character varying(20) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.magad_agency OWNER TO "user";

--
-- Name: magad_agency_advertisers; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_agency_advertisers (
    id integer NOT NULL,
    agency_id integer NOT NULL,
    advertiser_id integer NOT NULL
);


ALTER TABLE public.magad_agency_advertisers OWNER TO "user";

--
-- Name: magad_agency_advertisers_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_agency_advertisers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_agency_advertisers_id_seq OWNER TO "user";

--
-- Name: magad_agency_advertisers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_agency_advertisers_id_seq OWNED BY magad_agency_advertisers.id;


--
-- Name: magad_agency_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_agency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_agency_id_seq OWNER TO "user";

--
-- Name: magad_agency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_agency_id_seq OWNED BY magad_agency.id;


--
-- Name: magad_agency_profiles; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_agency_profiles (
    id integer NOT NULL,
    agency_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.magad_agency_profiles OWNER TO "user";

--
-- Name: magad_agency_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_agency_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_agency_profiles_id_seq OWNER TO "user";

--
-- Name: magad_agency_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_agency_profiles_id_seq OWNED BY magad_agency_profiles.id;


--
-- Name: magad_app; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_app (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    device_system_id integer NOT NULL,
    publication_id integer NOT NULL
);


ALTER TABLE public.magad_app OWNER TO "user";

--
-- Name: magad_app_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_app_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_app_id_seq OWNER TO "user";

--
-- Name: magad_app_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_app_id_seq OWNED BY magad_app.id;


--
-- Name: magad_campaign; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_campaign (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    observations text NOT NULL,
    planned_insertions integer NOT NULL,
    value numeric(9,2),
    already_inserted integer NOT NULL,
    deliverability double precision NOT NULL,
    starts_at date NOT NULL,
    ends_at date NOT NULL,
    daily_start_at time without time zone NOT NULL,
    status smallint NOT NULL,
    priority_level integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    advertisement_id integer NOT NULL,
    CONSTRAINT magad_campaign_status_check CHECK ((status >= 0))
);


ALTER TABLE public.magad_campaign OWNER TO "user";

--
-- Name: magad_campaign_categories; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_campaign_categories (
    id integer NOT NULL,
    campaign_id integer NOT NULL,
    interestcategory_id integer NOT NULL
);


ALTER TABLE public.magad_campaign_categories OWNER TO "user";

--
-- Name: magad_campaign_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_campaign_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_campaign_categories_id_seq OWNER TO "user";

--
-- Name: magad_campaign_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_campaign_categories_id_seq OWNED BY magad_campaign_categories.id;


--
-- Name: magad_campaign_channels; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_campaign_channels (
    id integer NOT NULL,
    campaign_id integer NOT NULL,
    interestchannel_id integer NOT NULL
);


ALTER TABLE public.magad_campaign_channels OWNER TO "user";

--
-- Name: magad_campaign_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_campaign_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_campaign_channels_id_seq OWNER TO "user";

--
-- Name: magad_campaign_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_campaign_channels_id_seq OWNED BY magad_campaign_channels.id;


--
-- Name: magad_campaign_distribution_areas; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_campaign_distribution_areas (
    id integer NOT NULL,
    campaign_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.magad_campaign_distribution_areas OWNER TO "user";

--
-- Name: magad_campaign_distribution_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_campaign_distribution_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_campaign_distribution_areas_id_seq OWNER TO "user";

--
-- Name: magad_campaign_distribution_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_campaign_distribution_areas_id_seq OWNED BY magad_campaign_distribution_areas.id;


--
-- Name: magad_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_campaign_id_seq OWNER TO "user";

--
-- Name: magad_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_campaign_id_seq OWNED BY magad_campaign.id;


--
-- Name: magad_configuration; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_configuration (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    api_url_id integer NOT NULL,
    ga_tracking_id integer NOT NULL,
    sdk_id integer,
    system_id integer
);


ALTER TABLE public.magad_configuration OWNER TO "user";

--
-- Name: magad_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_configuration_id_seq OWNER TO "user";

--
-- Name: magad_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_configuration_id_seq OWNED BY magad_configuration.id;


--
-- Name: magad_deviceapp; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_deviceapp (
    id integer NOT NULL,
    vendor_id character varying(36),
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    app_id integer NOT NULL,
    device_id character varying(36) NOT NULL,
    sdk_id integer NOT NULL
);


ALTER TABLE public.magad_deviceapp OWNER TO "user";

--
-- Name: magad_deviceapp_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_deviceapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_deviceapp_id_seq OWNER TO "user";

--
-- Name: magad_deviceapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_deviceapp_id_seq OWNED BY magad_deviceapp.id;


--
-- Name: magad_devicelog; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_devicelog (
    id integer NOT NULL,
    request_time timestamp with time zone NOT NULL,
    client_ip inet NOT NULL,
    user_agent text NOT NULL,
    coordinate geometry(Point,4326),
    altitude double precision,
    horizontal_accuracy double precision,
    vertical_accuracy double precision,
    floor integer,
    device_app_id integer NOT NULL,
    device_current_system_id integer NOT NULL,
    user_id integer NOT NULL,
    resource integer NOT NULL
);


ALTER TABLE public.magad_devicelog OWNER TO "user";

--
-- Name: magad_devicelog_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_devicelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_devicelog_id_seq OWNER TO "user";

--
-- Name: magad_devicelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_devicelog_id_seq OWNED BY magad_devicelog.id;


--
-- Name: magad_interestcategory; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_interestcategory (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.magad_interestcategory OWNER TO "user";

--
-- Name: magad_interestcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_interestcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_interestcategory_id_seq OWNER TO "user";

--
-- Name: magad_interestcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_interestcategory_id_seq OWNED BY magad_interestcategory.id;


--
-- Name: magad_interestchannel; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_interestchannel (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.magad_interestchannel OWNER TO "user";

--
-- Name: magad_interestchannel_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_interestchannel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_interestchannel_id_seq OWNER TO "user";

--
-- Name: magad_interestchannel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_interestchannel_id_seq OWNED BY magad_interestchannel.id;


--
-- Name: magad_interestchannelcategory; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_interestchannelcategory (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    interest_category_id integer NOT NULL,
    interest_channel_id integer NOT NULL
);


ALTER TABLE public.magad_interestchannelcategory OWNER TO "user";

--
-- Name: magad_interestchannelcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_interestchannelcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_interestchannelcategory_id_seq OWNER TO "user";

--
-- Name: magad_interestchannelcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_interestchannelcategory_id_seq OWNED BY magad_interestchannelcategory.id;


--
-- Name: magad_issue; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_issue (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    identifier character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    cover character varying(100),
    total_pages integer NOT NULL,
    black_list character varying(255),
    publication_id integer NOT NULL
);


ALTER TABLE public.magad_issue OWNER TO "user";

--
-- Name: magad_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_issue_id_seq OWNER TO "user";

--
-- Name: magad_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_issue_id_seq OWNED BY magad_issue.id;


--
-- Name: magad_logerrorjs; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_logerrorjs (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    log text NOT NULL
);


ALTER TABLE public.magad_logerrorjs OWNER TO "user";

--
-- Name: magad_logerrorjs_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_logerrorjs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_logerrorjs_id_seq OWNER TO "user";

--
-- Name: magad_logerrorjs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_logerrorjs_id_seq OWNED BY magad_logerrorjs.id;


--
-- Name: magad_page; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_page (
    id integer NOT NULL,
    number integer NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.magad_page OWNER TO "user";

--
-- Name: magad_page_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_page_id_seq OWNER TO "user";

--
-- Name: magad_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_page_id_seq OWNED BY magad_page.id;


--
-- Name: magad_publication; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_publication (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    interest_category_id integer NOT NULL,
    publisher_id integer NOT NULL
);


ALTER TABLE public.magad_publication OWNER TO "user";

--
-- Name: magad_publication_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_publication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_publication_id_seq OWNER TO "user";

--
-- Name: magad_publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_publication_id_seq OWNED BY magad_publication.id;


--
-- Name: magad_publisher; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_publisher (
    id integer NOT NULL,
    legal_name character varying(100) NOT NULL,
    trade_name character varying(100) NOT NULL,
    tax_id character varying(30) NOT NULL,
    iban character varying(34) NOT NULL,
    zip_code character varying(30) NOT NULL,
    address character varying(150) NOT NULL,
    number character varying(150) NOT NULL,
    complement character varying(150) NOT NULL,
    phone character varying(20) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.magad_publisher OWNER TO "user";

--
-- Name: magad_publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_publisher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_publisher_id_seq OWNER TO "user";

--
-- Name: magad_publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_publisher_id_seq OWNED BY magad_publisher.id;


--
-- Name: magad_publisher_profiles; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_publisher_profiles (
    id integer NOT NULL,
    publisher_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.magad_publisher_profiles OWNER TO "user";

--
-- Name: magad_publisher_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_publisher_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_publisher_profiles_id_seq OWNER TO "user";

--
-- Name: magad_publisher_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_publisher_profiles_id_seq OWNED BY magad_publisher_profiles.id;


--
-- Name: magad_sdk; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE magad_sdk (
    id integer NOT NULL,
    version character varying(5) NOT NULL,
    repository_url character varying(200) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.magad_sdk OWNER TO "user";

--
-- Name: magad_sdk_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE magad_sdk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magad_sdk_id_seq OWNER TO "user";

--
-- Name: magad_sdk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE magad_sdk_id_seq OWNED BY magad_sdk.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    manager_slug character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    comment text NOT NULL,
    user_id integer
);


ALTER TABLE public.reversion_revision OWNER TO "user";

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO "user";

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    content_type_id integer NOT NULL,
    revision_id integer NOT NULL
);


ALTER TABLE public.reversion_version OWNER TO "user";

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO "user";

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY accounts_user ALTER COLUMN id SET DEFAULT nextval('accounts_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('accounts_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('accounts_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY cities_light_city ALTER COLUMN id SET DEFAULT nextval('cities_light_city_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY cities_light_country ALTER COLUMN id SET DEFAULT nextval('cities_light_country_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY cities_light_region ALTER COLUMN id SET DEFAULT nextval('cities_light_region_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY configuration_apiurl ALTER COLUMN id SET DEFAULT nextval('configuration_apiurl_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY configuration_gatracking ALTER COLUMN id SET DEFAULT nextval('configuration_gatracking_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_device_related_emails ALTER COLUMN id SET DEFAULT nextval('device_device_related_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicecurrentsystem ALTER COLUMN id SET DEFAULT nextval('device_devicecurrentsystem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicegroup ALTER COLUMN id SET DEFAULT nextval('device_devicegroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicegroup_devices ALTER COLUMN id SET DEFAULT nextval('device_devicegroup_devices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicemodel ALTER COLUMN id SET DEFAULT nextval('device_devicemodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicesystem ALTER COLUMN id SET DEFAULT nextval('device_devicesystem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicesystemversion ALTER COLUMN id SET DEFAULT nextval('device_devicesystemversion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_screenlayoutsize ALTER COLUMN id SET DEFAULT nextval('device_screenlayoutsize_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY identify_email ALTER COLUMN id SET DEFAULT nextval('identify_email_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY log_corelogentry ALTER COLUMN id SET DEFAULT nextval('log_corelogentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY log_logactiontype ALTER COLUMN id SET DEFAULT nextval('log_logactiontype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY log_logtype ALTER COLUMN id SET DEFAULT nextval('log_logtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adinsertionproposal ALTER COLUMN id SET DEFAULT nextval('magad_adinsertionproposal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adscreen ALTER COLUMN id SET DEFAULT nextval('magad_adscreen_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adscreen_compatible_device_groups ALTER COLUMN id SET DEFAULT nextval('magad_adscreen_compatible_device_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adscreen_compatible_sdks ALTER COLUMN id SET DEFAULT nextval('magad_adscreen_compatible_sdks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_advertisement ALTER COLUMN id SET DEFAULT nextval('magad_advertisement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_advertiser ALTER COLUMN id SET DEFAULT nextval('magad_advertiser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_advertiser_profiles ALTER COLUMN id SET DEFAULT nextval('magad_advertiser_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_agency ALTER COLUMN id SET DEFAULT nextval('magad_agency_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_agency_advertisers ALTER COLUMN id SET DEFAULT nextval('magad_agency_advertisers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_agency_profiles ALTER COLUMN id SET DEFAULT nextval('magad_agency_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_app ALTER COLUMN id SET DEFAULT nextval('magad_app_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign ALTER COLUMN id SET DEFAULT nextval('magad_campaign_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_categories ALTER COLUMN id SET DEFAULT nextval('magad_campaign_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_channels ALTER COLUMN id SET DEFAULT nextval('magad_campaign_channels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_distribution_areas ALTER COLUMN id SET DEFAULT nextval('magad_campaign_distribution_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_configuration ALTER COLUMN id SET DEFAULT nextval('magad_configuration_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_deviceapp ALTER COLUMN id SET DEFAULT nextval('magad_deviceapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_devicelog ALTER COLUMN id SET DEFAULT nextval('magad_devicelog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_interestcategory ALTER COLUMN id SET DEFAULT nextval('magad_interestcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_interestchannel ALTER COLUMN id SET DEFAULT nextval('magad_interestchannel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_interestchannelcategory ALTER COLUMN id SET DEFAULT nextval('magad_interestchannelcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_issue ALTER COLUMN id SET DEFAULT nextval('magad_issue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_logerrorjs ALTER COLUMN id SET DEFAULT nextval('magad_logerrorjs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_page ALTER COLUMN id SET DEFAULT nextval('magad_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_publication ALTER COLUMN id SET DEFAULT nextval('magad_publication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_publisher ALTER COLUMN id SET DEFAULT nextval('magad_publisher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_publisher_profiles ALTER COLUMN id SET DEFAULT nextval('magad_publisher_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_sdk ALTER COLUMN id SET DEFAULT nextval('magad_sdk_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: user
--

COPY accounts_user (id, password, last_login, is_superuser, email, first_name, last_name, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$zId0BRTDj5HG$eoJgWHW/FUxQQ3DlEK31YD8g5PQSB0M0k246Va6tiCs=	2014-11-20 15:23:18-02	t	frederico.sachweh@gmail.com	Frederico	Matos	t	t	2014-11-20 15:22:17-02
2	pbkdf2_sha256$12000$HxGD9VHCnmV2$RMSVNgDfXfO+W/TpriC7LOBe+H/RMzXGefkTCHJ7rQ0=	2014-11-20 15:27:58.979561-02	t	gianrubio@gmail.com	Giancarlo	Rubio	t	t	2014-11-20 15:23:43-02
3	pbkdf2_sha256$12000$wuxTX3uRi3Q1$8NtBDwIzjNl18qMNotob+xLKJQYF/RLnvRrex1jv0T0=	2014-11-20 15:28:13.024249-02	t	dimas@dimasgabriel.net	Dimas	Gabriel	t	t	2014-11-20 15:24:37-02
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('accounts_user_id_seq', 3, true);


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('accounts_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: user
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: user
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add post gis geometry columns	6	add_postgisgeometrycolumns
17	Can change post gis geometry columns	6	change_postgisgeometrycolumns
18	Can delete post gis geometry columns	6	delete_postgisgeometrycolumns
19	Can add post gis spatial ref sys	7	add_postgisspatialrefsys
20	Can change post gis spatial ref sys	7	change_postgisspatialrefsys
21	Can delete post gis spatial ref sys	7	delete_postgisspatialrefsys
22	Can add token	8	add_token
23	Can change token	8	change_token
24	Can delete token	8	delete_token
25	Can add country	9	add_country
26	Can change country	9	change_country
27	Can delete country	9	delete_country
28	Can add region/state	10	add_region
29	Can change region/state	10	change_region
30	Can delete region/state	10	delete_region
31	Can add city	11	add_city
32	Can change city	11	change_city
33	Can delete city	11	delete_city
34	Can add revision	12	add_revision
35	Can change revision	12	change_revision
36	Can delete revision	12	delete_revision
37	Can add version	13	add_version
38	Can change version	13	change_version
39	Can delete version	13	delete_version
40	Can add Category	14	add_interestcategory
41	Can change Category	14	change_interestcategory
42	Can delete Category	14	delete_interestcategory
43	Can add Channel	15	add_interestchannel
44	Can change Channel	15	change_interestchannel
45	Can delete Channel	15	delete_interestchannel
46	Can add Interest Channel and Category	16	add_interestchannelcategory
47	Can change Interest Channel and Category	16	change_interestchannelcategory
48	Can delete Interest Channel and Category	16	delete_interestchannelcategory
49	Can add Publisher	17	add_publisher
50	Can change Publisher	17	change_publisher
51	Can delete Publisher	17	delete_publisher
52	Can add Publication	18	add_publication
53	Can change Publication	18	change_publication
54	Can delete Publication	18	delete_publication
55	Can add Issue	19	add_issue
56	Can change Issue	19	change_issue
57	Can delete Issue	19	delete_issue
58	Can add Page	20	add_page
59	Can change Page	20	change_page
60	Can delete Page	20	delete_page
61	Can add advertiser	21	add_advertiser
62	Can change advertiser	21	change_advertiser
63	Can delete advertiser	21	delete_advertiser
64	Can add agency	22	add_agency
65	Can change agency	22	change_agency
66	Can delete agency	22	delete_agency
67	Can add advertisement	23	add_advertisement
68	Can change advertisement	23	change_advertisement
69	Can delete advertisement	23	delete_advertisement
70	Can add SDK	24	add_sdk
71	Can change SDK	24	change_sdk
72	Can delete SDK	24	delete_sdk
73	Can add AdScreen	25	add_adscreen
74	Can change AdScreen	25	change_adscreen
75	Can delete AdScreen	25	delete_adscreen
76	Can add campaign	26	add_campaign
77	Can change campaign	26	change_campaign
78	Can delete campaign	26	delete_campaign
79	Can add AdInsertionProposal	27	add_adinsertionproposal
80	Can change AdInsertionProposal	27	change_adinsertionproposal
81	Can delete AdInsertionProposal	27	delete_adinsertionproposal
82	Can add Device Log	28	add_devicelog
83	Can change Device Log	28	change_devicelog
84	Can delete Device Log	28	delete_devicelog
85	Can add AdInsertionRequest	29	add_adinsertionrequest
86	Can change AdInsertionRequest	29	change_adinsertionrequest
87	Can delete AdInsertionRequest	29	delete_adinsertionrequest
88	Can add AdViewReport	30	add_adviewreport
89	Can change AdViewReport	30	change_adviewreport
90	Can delete AdViewReport	30	delete_adviewreport
91	Can add DeviceApp	31	add_deviceapp
92	Can change DeviceApp	31	change_deviceapp
93	Can delete DeviceApp	31	delete_deviceapp
94	Can add Configuration	32	add_configuration
95	Can change Configuration	32	change_configuration
96	Can delete Configuration	32	delete_configuration
97	Can add App	33	add_app
98	Can change App	33	change_app
99	Can delete App	33	delete_app
100	Can add Log JS	34	add_logerrorjs
101	Can change Log JS	34	change_logerrorjs
102	Can delete Log JS	34	delete_logerrorjs
103	Can add log type	35	add_logtype
104	Can change log type	35	change_logtype
105	Can delete log type	35	delete_logtype
106	Can add log action type	36	add_logactiontype
107	Can change log action type	36	change_logactiontype
108	Can delete log action type	36	delete_logactiontype
109	Can add email	37	add_email
110	Can change email	37	change_email
111	Can delete email	37	delete_email
112	Can add device system	38	add_devicesystem
113	Can change device system	38	change_devicesystem
114	Can delete device system	38	delete_devicesystem
115	Can add device system version	39	add_devicesystemversion
116	Can change device system version	39	change_devicesystemversion
117	Can delete device system version	39	delete_devicesystemversion
118	Can add device current system	40	add_devicecurrentsystem
119	Can change device current system	40	change_devicecurrentsystem
120	Can delete device current system	40	delete_devicecurrentsystem
121	Can add Screen Layout Size	41	add_screenlayoutsize
122	Can change Screen Layout Size	41	change_screenlayoutsize
123	Can delete Screen Layout Size	41	delete_screenlayoutsize
124	Can add device model	42	add_devicemodel
125	Can change device model	42	change_devicemodel
126	Can delete device model	42	delete_devicemodel
127	Can add device	43	add_device
128	Can change device	43	change_device
129	Can delete device	43	delete_device
130	Can add device group	44	add_devicegroup
131	Can change device group	44	change_devicegroup
132	Can delete device group	44	delete_devicegroup
133	Can add Api url	45	add_apiurl
134	Can change Api url	45	change_apiurl
135	Can delete Api url	45	delete_apiurl
136	Can add GA tracking	46	add_gatracking
137	Can change GA tracking	46	change_gatracking
138	Can delete GA tracking	46	delete_gatracking
139	Can add user	47	add_user
140	Can change user	47	change_user
141	Can delete user	47	delete_user
142	Can add cors model	48	add_corsmodel
143	Can change cors model	48	change_corsmodel
144	Can delete cors model	48	delete_corsmodel
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('auth_permission_id_seq', 144, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: user
--

COPY authtoken_token (key, user_id, created) FROM stdin;
d58696c5a9cadd3f6c6c23dcf82bfd6c6f3a1bef	1	2014-11-20 15:25:07.48954-02
c806e517cb742e4fce569a1ffdc37164f9e0e320	2	2014-11-20 15:28:03.599426-02
456d31c3e67c6c2763b974e596989c34e4e24af9	3	2014-11-20 15:28:17.702153-02
\.


--
-- Data for Name: cities_light_city; Type: TABLE DATA; Schema: public; Owner: user
--

COPY cities_light_city (id, name_ascii, slug, geoname_id, alternate_names, name, display_name, search_names, latitude, longitude, region_id, country_id, population, feature_code) FROM stdin;
\.


--
-- Name: cities_light_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('cities_light_city_id_seq', 1, false);


--
-- Data for Name: cities_light_country; Type: TABLE DATA; Schema: public; Owner: user
--

COPY cities_light_country (id, name_ascii, slug, geoname_id, alternate_names, name, code2, code3, continent, tld, phone) FROM stdin;
\.


--
-- Name: cities_light_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('cities_light_country_id_seq', 1, false);


--
-- Data for Name: cities_light_region; Type: TABLE DATA; Schema: public; Owner: user
--

COPY cities_light_region (id, name_ascii, slug, geoname_id, alternate_names, name, display_name, geoname_code, country_id) FROM stdin;
\.


--
-- Name: cities_light_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('cities_light_region_id_seq', 1, false);


--
-- Data for Name: configuration_apiurl; Type: TABLE DATA; Schema: public; Owner: user
--

COPY configuration_apiurl (id, name, url, created, active) FROM stdin;
\.


--
-- Name: configuration_apiurl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('configuration_apiurl_id_seq', 1, false);


--
-- Data for Name: configuration_gatracking; Type: TABLE DATA; Schema: public; Owner: user
--

COPY configuration_gatracking (id, name, code, created, active) FROM stdin;
\.


--
-- Name: configuration_gatracking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('configuration_gatracking_id_seq', 1, false);


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: user
--

COPY corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('corsheaders_corsmodel_id_seq', 1, false);


--
-- Data for Name: device_device; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_device (uuid, advertising_id, system_id, serial_number, name, created_at, updated_at, current_system_id, model_id) FROM stdin;
\.


--
-- Data for Name: device_device_related_emails; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_device_related_emails (id, device_id, email_id) FROM stdin;
\.


--
-- Name: device_device_related_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('device_device_related_emails_id_seq', 1, false);


--
-- Data for Name: device_devicecurrentsystem; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_devicecurrentsystem (id, system_id, version_id) FROM stdin;
\.


--
-- Name: device_devicecurrentsystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('device_devicecurrentsystem_id_seq', 1, false);


--
-- Data for Name: device_devicegroup; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_devicegroup (id, name) FROM stdin;
\.


--
-- Data for Name: device_devicegroup_devices; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_devicegroup_devices (id, devicegroup_id, device_id) FROM stdin;
\.


--
-- Name: device_devicegroup_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('device_devicegroup_devices_id_seq', 1, false);


--
-- Name: device_devicegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('device_devicegroup_id_seq', 1, false);


--
-- Data for Name: device_devicemodel; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_devicemodel (id, name, screen_width, screen_height, screen_inches, screen_density, screen_layout_size_id) FROM stdin;
\.


--
-- Name: device_devicemodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('device_devicemodel_id_seq', 1, false);


--
-- Data for Name: device_devicesystem; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_devicesystem (id, name) FROM stdin;
\.


--
-- Name: device_devicesystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('device_devicesystem_id_seq', 1, false);


--
-- Data for Name: device_devicesystemversion; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_devicesystemversion (id, version) FROM stdin;
\.


--
-- Name: device_devicesystemversion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('device_devicesystemversion_id_seq', 1, false);


--
-- Data for Name: device_screenlayoutsize; Type: TABLE DATA; Schema: public; Owner: user
--

COPY device_screenlayoutsize (id, name) FROM stdin;
\.


--
-- Name: device_screenlayoutsize_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('device_screenlayoutsize_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: user
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2014-11-20 15:23:32.438127-02	1	frederico.sachweh@gmail.com	2	Changed first_name and last_name.	47	1
2	2014-11-20 15:23:43.145107-02	2	gianrubio@gmail.com	1		47	1
3	2014-11-20 15:24:05.119462-02	2	gianrubio@gmail.com	2	Changed first_name, last_name, is_staff and is_superuser.	47	1
4	2014-11-20 15:24:37.95412-02	3	dimas@dimasgabriel.net	1		47	1
5	2014-11-20 15:24:50.631407-02	3	dimas@dimasgabriel.net	2	Changed first_name, last_name, is_staff and is_superuser.	47	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 5, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: user
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	content type	contenttypes	contenttype
5	session	sessions	session
6	post gis geometry columns	gis	postgisgeometrycolumns
7	post gis spatial ref sys	gis	postgisspatialrefsys
8	token	authtoken	token
9	country	cities_light	country
10	region/state	cities_light	region
11	city	cities_light	city
12	revision	reversion	revision
13	version	reversion	version
14	Category	magad	interestcategory
15	Channel	magad	interestchannel
16	Interest Channel and Category	magad	interestchannelcategory
17	Publisher	magad	publisher
18	Publication	magad	publication
19	Issue	magad	issue
20	Page	magad	page
21	advertiser	magad	advertiser
22	agency	magad	agency
23	advertisement	magad	advertisement
24	SDK	magad	sdk
25	AdScreen	magad	adscreen
26	campaign	magad	campaign
27	AdInsertionProposal	magad	adinsertionproposal
28	Device Log	magad	devicelog
29	AdInsertionRequest	magad	adinsertionrequest
30	AdViewReport	magad	adviewreport
31	DeviceApp	magad	deviceapp
32	Configuration	magad	configuration
33	App	magad	app
34	Log JS	magad	logerrorjs
35	log type	log	logtype
36	log action type	log	logactiontype
37	email	identify	email
38	device system	device	devicesystem
39	device system version	device	devicesystemversion
40	device current system	device	devicecurrentsystem
41	Screen Layout Size	device	screenlayoutsize
42	device model	device	devicemodel
43	device	device	device
44	device group	device	devicegroup
45	Api url	configuration	apiurl
46	GA tracking	configuration	gatracking
47	user	accounts	user
48	cors model	corsheaders	corsmodel
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('django_content_type_id_seq', 48, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2014-11-20 15:19:52.058261-02
2	auth	0001_initial	2014-11-20 15:19:52.134486-02
3	accounts	0001_initial	2014-11-20 15:19:52.212769-02
4	admin	0001_initial	2014-11-20 15:19:52.274477-02
5	authtoken	0001_initial	2014-11-20 15:19:52.329883-02
6	authtoken	0002_auto_20141119_1758	2014-11-20 15:19:52.447271-02
7	cities_light	0001_initial	2014-11-20 15:19:52.503278-02
8	cities_light	0002_city	2014-11-20 15:19:52.562088-02
9	configuration	0001_initial	2014-11-20 15:19:52.599991-02
10	identify	0001_initial	2014-11-20 15:19:52.622914-02
11	device	0001_initial	2014-11-20 15:19:52.91096-02
12	magad	0001_initial	2014-11-20 15:20:15.973958-02
13	log	0001_initial	2014-11-20 15:20:17.289364-02
14	magad	0002_devicelog_resource	2014-11-20 15:20:17.873819-02
15	magad	0003_auto_20141028_1608	2014-11-20 15:20:18.515836-02
16	magad	0004_logerrorjs	2014-11-20 15:20:19.054266-02
17	publisher	0001_initial	2014-11-20 15:20:19.369176-02
18	reversion	0001_initial	2014-11-20 15:20:19.483884-02
19	sessions	0001_initial	2014-11-20 15:20:19.505448-02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('django_migrations_id_seq', 19, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: user
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
e77kqrrmqycnjmjvvduoh2n8r75e0y5f	YTMyOWI3ZTZkZWRmYWIwYzA2MDQzM2Y0YjVhOGVkNzAxZTZiM2ZjODp7fQ==	2014-12-04 15:28:20.271659-02
\.


--
-- Data for Name: identify_email; Type: TABLE DATA; Schema: public; Owner: user
--

COPY identify_email (id, email) FROM stdin;
\.


--
-- Name: identify_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('identify_email_id_seq', 1, false);


--
-- Data for Name: log_corelogentry; Type: TABLE DATA; Schema: public; Owner: user
--

COPY log_corelogentry (id, action_time, object_id, object_repr, change_message, action_type_id, content_type_id, type_id, user_id) FROM stdin;
\.


--
-- Name: log_corelogentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('log_corelogentry_id_seq', 1, false);


--
-- Data for Name: log_logactiontype; Type: TABLE DATA; Schema: public; Owner: user
--

COPY log_logactiontype (id, name) FROM stdin;
\.


--
-- Name: log_logactiontype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('log_logactiontype_id_seq', 1, false);


--
-- Data for Name: log_logtype; Type: TABLE DATA; Schema: public; Owner: user
--

COPY log_logtype (id, name) FROM stdin;
\.


--
-- Name: log_logtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('log_logtype_id_seq', 1, false);


--
-- Data for Name: magad_adinsertionproposal; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_adinsertionproposal (id, active, refused, refusal_reason, notification_date, created_at, updated_at, campaign_id, interest_channel_id, publication_id) FROM stdin;
\.


--
-- Name: magad_adinsertionproposal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_adinsertionproposal_id_seq', 1, false);


--
-- Data for Name: magad_adinsertionrequest; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_adinsertionrequest (uuid, page_number, inserted, created_at, updated_at, campaign_id, device_log_id, issue_id, screen_id) FROM stdin;
\.


--
-- Data for Name: magad_adscreen; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_adscreen (id, package, embedded_url, created_at, updated_at, advertisement_id) FROM stdin;
\.


--
-- Data for Name: magad_adscreen_compatible_device_groups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_adscreen_compatible_device_groups (id, adscreen_id, devicegroup_id) FROM stdin;
\.


--
-- Name: magad_adscreen_compatible_device_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_adscreen_compatible_device_groups_id_seq', 1, false);


--
-- Data for Name: magad_adscreen_compatible_sdks; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_adscreen_compatible_sdks (id, adscreen_id, sdk_id) FROM stdin;
\.


--
-- Name: magad_adscreen_compatible_sdks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_adscreen_compatible_sdks_id_seq', 1, false);


--
-- Name: magad_adscreen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_adscreen_id_seq', 1, false);


--
-- Data for Name: magad_advertisement; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_advertisement (id, name, contract_number, value, planned_insertions, contract, created_at, updated_at, advertiser_id, agency_id) FROM stdin;
\.


--
-- Name: magad_advertisement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_advertisement_id_seq', 1, false);


--
-- Data for Name: magad_advertiser; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_advertiser (id, legal_name, trade_name, tax_id, iban, zip_code, address, number, complement, phone, created, active, city_id) FROM stdin;
\.


--
-- Name: magad_advertiser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_advertiser_id_seq', 1, false);


--
-- Data for Name: magad_advertiser_profiles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_advertiser_profiles (id, advertiser_id, user_id) FROM stdin;
\.


--
-- Name: magad_advertiser_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_advertiser_profiles_id_seq', 1, false);


--
-- Data for Name: magad_adviewreport; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_adviewreport (uuid, view_time, created_at, ad_insertion_id) FROM stdin;
\.


--
-- Data for Name: magad_agency; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_agency (id, legal_name, trade_name, tax_id, iban, zip_code, address, number, complement, phone, created, active, city_id) FROM stdin;
\.


--
-- Data for Name: magad_agency_advertisers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_agency_advertisers (id, agency_id, advertiser_id) FROM stdin;
\.


--
-- Name: magad_agency_advertisers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_agency_advertisers_id_seq', 1, false);


--
-- Name: magad_agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_agency_id_seq', 1, false);


--
-- Data for Name: magad_agency_profiles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_agency_profiles (id, agency_id, user_id) FROM stdin;
\.


--
-- Name: magad_agency_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_agency_profiles_id_seq', 1, false);


--
-- Data for Name: magad_app; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_app (id, created, active, device_system_id, publication_id) FROM stdin;
\.


--
-- Name: magad_app_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_app_id_seq', 1, false);


--
-- Data for Name: magad_campaign; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_campaign (id, name, description, observations, planned_insertions, value, already_inserted, deliverability, starts_at, ends_at, daily_start_at, status, priority_level, created_at, updated_at, advertisement_id) FROM stdin;
\.


--
-- Data for Name: magad_campaign_categories; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_campaign_categories (id, campaign_id, interestcategory_id) FROM stdin;
\.


--
-- Name: magad_campaign_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_campaign_categories_id_seq', 1, false);


--
-- Data for Name: magad_campaign_channels; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_campaign_channels (id, campaign_id, interestchannel_id) FROM stdin;
\.


--
-- Name: magad_campaign_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_campaign_channels_id_seq', 1, false);


--
-- Data for Name: magad_campaign_distribution_areas; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_campaign_distribution_areas (id, campaign_id, region_id) FROM stdin;
\.


--
-- Name: magad_campaign_distribution_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_campaign_distribution_areas_id_seq', 1, false);


--
-- Name: magad_campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_campaign_id_seq', 1, false);


--
-- Data for Name: magad_configuration; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_configuration (id, name, created, active, api_url_id, ga_tracking_id, sdk_id, system_id) FROM stdin;
\.


--
-- Name: magad_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_configuration_id_seq', 1, false);


--
-- Data for Name: magad_deviceapp; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_deviceapp (id, vendor_id, created, active, app_id, device_id, sdk_id) FROM stdin;
\.


--
-- Name: magad_deviceapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_deviceapp_id_seq', 1, false);


--
-- Data for Name: magad_devicelog; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_devicelog (id, request_time, client_ip, user_agent, coordinate, altitude, horizontal_accuracy, vertical_accuracy, floor, device_app_id, device_current_system_id, user_id, resource) FROM stdin;
\.


--
-- Name: magad_devicelog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_devicelog_id_seq', 1, false);


--
-- Data for Name: magad_interestcategory; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_interestcategory (id, name, slug, created, active) FROM stdin;
\.


--
-- Name: magad_interestcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_interestcategory_id_seq', 1, false);


--
-- Data for Name: magad_interestchannel; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_interestchannel (id, name, slug, created, active) FROM stdin;
\.


--
-- Name: magad_interestchannel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_interestchannel_id_seq', 1, false);


--
-- Data for Name: magad_interestchannelcategory; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_interestchannelcategory (id, created, active, interest_category_id, interest_channel_id) FROM stdin;
\.


--
-- Name: magad_interestchannelcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_interestchannelcategory_id_seq', 1, false);


--
-- Data for Name: magad_issue; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_issue (id, name, identifier, created, active, cover, total_pages, black_list, publication_id) FROM stdin;
\.


--
-- Name: magad_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_issue_id_seq', 1, false);


--
-- Data for Name: magad_logerrorjs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_logerrorjs (id, created_at, log) FROM stdin;
\.


--
-- Name: magad_logerrorjs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_logerrorjs_id_seq', 1, false);


--
-- Data for Name: magad_page; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_page (id, number, created, active, issue_id) FROM stdin;
\.


--
-- Name: magad_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_page_id_seq', 1, false);


--
-- Data for Name: magad_publication; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_publication (id, name, created, active, interest_category_id, publisher_id) FROM stdin;
\.


--
-- Name: magad_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_publication_id_seq', 1, false);


--
-- Data for Name: magad_publisher; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_publisher (id, legal_name, trade_name, tax_id, iban, zip_code, address, number, complement, phone, created, active, city_id) FROM stdin;
\.


--
-- Name: magad_publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_publisher_id_seq', 1, false);


--
-- Data for Name: magad_publisher_profiles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_publisher_profiles (id, publisher_id, user_id) FROM stdin;
\.


--
-- Name: magad_publisher_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_publisher_profiles_id_seq', 1, false);


--
-- Data for Name: magad_sdk; Type: TABLE DATA; Schema: public; Owner: user
--

COPY magad_sdk (id, version, repository_url, created_at) FROM stdin;
\.


--
-- Name: magad_sdk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('magad_sdk_id_seq', 1, false);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: user
--

COPY reversion_revision (id, manager_slug, date_created, comment, user_id) FROM stdin;
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 1, false);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: user
--

COPY reversion_version (id, object_id, object_id_int, format, serialized_data, object_repr, content_type_id, revision_id) FROM stdin;
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('reversion_version_id_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: user
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


SET search_path = topology, pg_catalog;

--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: user
--

COPY layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: user
--

COPY topology (id, name, srid, "precision", hasz) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- Name: accounts_user_email_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);


--
-- Name: accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: cities_light_city_geoname_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_city
    ADD CONSTRAINT cities_light_city_geoname_id_key UNIQUE (geoname_id);


--
-- Name: cities_light_city_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_city
    ADD CONSTRAINT cities_light_city_pkey PRIMARY KEY (id);


--
-- Name: cities_light_city_region_id_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_city
    ADD CONSTRAINT cities_light_city_region_id_name_key UNIQUE (region_id, name);


--
-- Name: cities_light_city_region_id_slug_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_city
    ADD CONSTRAINT cities_light_city_region_id_slug_key UNIQUE (region_id, slug);


--
-- Name: cities_light_country_code2_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_country
    ADD CONSTRAINT cities_light_country_code2_key UNIQUE (code2);


--
-- Name: cities_light_country_code3_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_country
    ADD CONSTRAINT cities_light_country_code3_key UNIQUE (code3);


--
-- Name: cities_light_country_geoname_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_country
    ADD CONSTRAINT cities_light_country_geoname_id_key UNIQUE (geoname_id);


--
-- Name: cities_light_country_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_country
    ADD CONSTRAINT cities_light_country_name_key UNIQUE (name);


--
-- Name: cities_light_country_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_country
    ADD CONSTRAINT cities_light_country_pkey PRIMARY KEY (id);


--
-- Name: cities_light_region_country_id_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_region
    ADD CONSTRAINT cities_light_region_country_id_name_key UNIQUE (country_id, name);


--
-- Name: cities_light_region_country_id_slug_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_region
    ADD CONSTRAINT cities_light_region_country_id_slug_key UNIQUE (country_id, slug);


--
-- Name: cities_light_region_geoname_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_region
    ADD CONSTRAINT cities_light_region_geoname_id_key UNIQUE (geoname_id);


--
-- Name: cities_light_region_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY cities_light_region
    ADD CONSTRAINT cities_light_region_pkey PRIMARY KEY (id);


--
-- Name: configuration_apiurl_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY configuration_apiurl
    ADD CONSTRAINT configuration_apiurl_pkey PRIMARY KEY (id);


--
-- Name: configuration_gatracking_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY configuration_gatracking
    ADD CONSTRAINT configuration_gatracking_pkey PRIMARY KEY (id);


--
-- Name: corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: device_device_advertising_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_device
    ADD CONSTRAINT device_device_advertising_id_key UNIQUE (advertising_id);


--
-- Name: device_device_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_device
    ADD CONSTRAINT device_device_pkey PRIMARY KEY (uuid);


--
-- Name: device_device_related_emails_device_id_email_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_device_related_emails
    ADD CONSTRAINT device_device_related_emails_device_id_email_id_key UNIQUE (device_id, email_id);


--
-- Name: device_device_related_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_device_related_emails
    ADD CONSTRAINT device_device_related_emails_pkey PRIMARY KEY (id);


--
-- Name: device_device_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_device
    ADD CONSTRAINT device_device_serial_number_key UNIQUE (serial_number);


--
-- Name: device_device_system_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_device
    ADD CONSTRAINT device_device_system_id_key UNIQUE (system_id);


--
-- Name: device_devicecurrentsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicecurrentsystem
    ADD CONSTRAINT device_devicecurrentsystem_pkey PRIMARY KEY (id);


--
-- Name: device_devicecurrentsystem_system_id_2c49be86dddc827f_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicecurrentsystem
    ADD CONSTRAINT device_devicecurrentsystem_system_id_2c49be86dddc827f_uniq UNIQUE (system_id, version_id);


--
-- Name: device_devicegroup_devices_devicegroup_id_device_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicegroup_devices
    ADD CONSTRAINT device_devicegroup_devices_devicegroup_id_device_id_key UNIQUE (devicegroup_id, device_id);


--
-- Name: device_devicegroup_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicegroup_devices
    ADD CONSTRAINT device_devicegroup_devices_pkey PRIMARY KEY (id);


--
-- Name: device_devicegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicegroup
    ADD CONSTRAINT device_devicegroup_pkey PRIMARY KEY (id);


--
-- Name: device_devicemodel_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicemodel
    ADD CONSTRAINT device_devicemodel_name_key UNIQUE (name);


--
-- Name: device_devicemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicemodel
    ADD CONSTRAINT device_devicemodel_pkey PRIMARY KEY (id);


--
-- Name: device_devicesystem_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicesystem
    ADD CONSTRAINT device_devicesystem_name_key UNIQUE (name);


--
-- Name: device_devicesystem_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicesystem
    ADD CONSTRAINT device_devicesystem_pkey PRIMARY KEY (id);


--
-- Name: device_devicesystemversion_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicesystemversion
    ADD CONSTRAINT device_devicesystemversion_pkey PRIMARY KEY (id);


--
-- Name: device_devicesystemversion_version_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_devicesystemversion
    ADD CONSTRAINT device_devicesystemversion_version_key UNIQUE (version);


--
-- Name: device_screenlayoutsize_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_screenlayoutsize
    ADD CONSTRAINT device_screenlayoutsize_name_key UNIQUE (name);


--
-- Name: device_screenlayoutsize_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY device_screenlayoutsize
    ADD CONSTRAINT device_screenlayoutsize_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_1cdd1a63f09486b9_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_1cdd1a63f09486b9_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: identify_email_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY identify_email
    ADD CONSTRAINT identify_email_pkey PRIMARY KEY (id);


--
-- Name: log_corelogentry_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY log_corelogentry
    ADD CONSTRAINT log_corelogentry_pkey PRIMARY KEY (id);


--
-- Name: log_logactiontype_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY log_logactiontype
    ADD CONSTRAINT log_logactiontype_pkey PRIMARY KEY (id);


--
-- Name: log_logtype_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY log_logtype
    ADD CONSTRAINT log_logtype_pkey PRIMARY KEY (id);


--
-- Name: magad_adinsertionproposal_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_adinsertionproposal
    ADD CONSTRAINT magad_adinsertionproposal_pkey PRIMARY KEY (id);


--
-- Name: magad_adinsertionrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_adinsertionrequest
    ADD CONSTRAINT magad_adinsertionrequest_pkey PRIMARY KEY (uuid);


--
-- Name: magad_adscreen_compatible_device_adscreen_id_devicegroup_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_adscreen_compatible_device_groups
    ADD CONSTRAINT magad_adscreen_compatible_device_adscreen_id_devicegroup_id_key UNIQUE (adscreen_id, devicegroup_id);


--
-- Name: magad_adscreen_compatible_device_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_adscreen_compatible_device_groups
    ADD CONSTRAINT magad_adscreen_compatible_device_groups_pkey PRIMARY KEY (id);


--
-- Name: magad_adscreen_compatible_sdks_adscreen_id_sdk_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_adscreen_compatible_sdks
    ADD CONSTRAINT magad_adscreen_compatible_sdks_adscreen_id_sdk_id_key UNIQUE (adscreen_id, sdk_id);


--
-- Name: magad_adscreen_compatible_sdks_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_adscreen_compatible_sdks
    ADD CONSTRAINT magad_adscreen_compatible_sdks_pkey PRIMARY KEY (id);


--
-- Name: magad_adscreen_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_adscreen
    ADD CONSTRAINT magad_adscreen_pkey PRIMARY KEY (id);


--
-- Name: magad_advertisement_agency_id_7250b4f15c4aac4a_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_advertisement
    ADD CONSTRAINT magad_advertisement_agency_id_7250b4f15c4aac4a_uniq UNIQUE (agency_id, contract_number);


--
-- Name: magad_advertisement_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_advertisement
    ADD CONSTRAINT magad_advertisement_pkey PRIMARY KEY (id);


--
-- Name: magad_advertiser_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_advertiser
    ADD CONSTRAINT magad_advertiser_pkey PRIMARY KEY (id);


--
-- Name: magad_advertiser_profiles_advertiser_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_advertiser_profiles
    ADD CONSTRAINT magad_advertiser_profiles_advertiser_id_user_id_key UNIQUE (advertiser_id, user_id);


--
-- Name: magad_advertiser_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_advertiser_profiles
    ADD CONSTRAINT magad_advertiser_profiles_pkey PRIMARY KEY (id);


--
-- Name: magad_advertiser_tax_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_advertiser
    ADD CONSTRAINT magad_advertiser_tax_id_key UNIQUE (tax_id);


--
-- Name: magad_adviewreport_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_adviewreport
    ADD CONSTRAINT magad_adviewreport_pkey PRIMARY KEY (uuid);


--
-- Name: magad_agency_advertisers_agency_id_advertiser_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_agency_advertisers
    ADD CONSTRAINT magad_agency_advertisers_agency_id_advertiser_id_key UNIQUE (agency_id, advertiser_id);


--
-- Name: magad_agency_advertisers_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_agency_advertisers
    ADD CONSTRAINT magad_agency_advertisers_pkey PRIMARY KEY (id);


--
-- Name: magad_agency_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_agency
    ADD CONSTRAINT magad_agency_pkey PRIMARY KEY (id);


--
-- Name: magad_agency_profiles_agency_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_agency_profiles
    ADD CONSTRAINT magad_agency_profiles_agency_id_user_id_key UNIQUE (agency_id, user_id);


--
-- Name: magad_agency_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_agency_profiles
    ADD CONSTRAINT magad_agency_profiles_pkey PRIMARY KEY (id);


--
-- Name: magad_agency_tax_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_agency
    ADD CONSTRAINT magad_agency_tax_id_key UNIQUE (tax_id);


--
-- Name: magad_app_device_system_id_7696c1c50109f703_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_app
    ADD CONSTRAINT magad_app_device_system_id_7696c1c50109f703_uniq UNIQUE (device_system_id, publication_id);


--
-- Name: magad_app_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_app
    ADD CONSTRAINT magad_app_pkey PRIMARY KEY (id);


--
-- Name: magad_campaign_categories_campaign_id_interestcategory_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_campaign_categories
    ADD CONSTRAINT magad_campaign_categories_campaign_id_interestcategory_id_key UNIQUE (campaign_id, interestcategory_id);


--
-- Name: magad_campaign_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_campaign_categories
    ADD CONSTRAINT magad_campaign_categories_pkey PRIMARY KEY (id);


--
-- Name: magad_campaign_channels_campaign_id_interestchannel_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_campaign_channels
    ADD CONSTRAINT magad_campaign_channels_campaign_id_interestchannel_id_key UNIQUE (campaign_id, interestchannel_id);


--
-- Name: magad_campaign_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_campaign_channels
    ADD CONSTRAINT magad_campaign_channels_pkey PRIMARY KEY (id);


--
-- Name: magad_campaign_distribution_areas_campaign_id_region_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_campaign_distribution_areas
    ADD CONSTRAINT magad_campaign_distribution_areas_campaign_id_region_id_key UNIQUE (campaign_id, region_id);


--
-- Name: magad_campaign_distribution_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_campaign_distribution_areas
    ADD CONSTRAINT magad_campaign_distribution_areas_pkey PRIMARY KEY (id);


--
-- Name: magad_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_campaign
    ADD CONSTRAINT magad_campaign_pkey PRIMARY KEY (id);


--
-- Name: magad_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_configuration
    ADD CONSTRAINT magad_configuration_pkey PRIMARY KEY (id);


--
-- Name: magad_deviceapp_device_id_71449f5ef3e8c245_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_deviceapp
    ADD CONSTRAINT magad_deviceapp_device_id_71449f5ef3e8c245_uniq UNIQUE (device_id, app_id, vendor_id);


--
-- Name: magad_deviceapp_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_deviceapp
    ADD CONSTRAINT magad_deviceapp_pkey PRIMARY KEY (id);


--
-- Name: magad_devicelog_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_devicelog
    ADD CONSTRAINT magad_devicelog_pkey PRIMARY KEY (id);


--
-- Name: magad_interestcategory_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_interestcategory
    ADD CONSTRAINT magad_interestcategory_name_key UNIQUE (name);


--
-- Name: magad_interestcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_interestcategory
    ADD CONSTRAINT magad_interestcategory_pkey PRIMARY KEY (id);


--
-- Name: magad_interestchannel_name_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_interestchannel
    ADD CONSTRAINT magad_interestchannel_name_key UNIQUE (name);


--
-- Name: magad_interestchannel_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_interestchannel
    ADD CONSTRAINT magad_interestchannel_pkey PRIMARY KEY (id);


--
-- Name: magad_interestchannelc_interest_channel_id_8188d2403d9e940_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_interestchannelcategory
    ADD CONSTRAINT magad_interestchannelc_interest_channel_id_8188d2403d9e940_uniq UNIQUE (interest_channel_id, interest_category_id);


--
-- Name: magad_interestchannelcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_interestchannelcategory
    ADD CONSTRAINT magad_interestchannelcategory_pkey PRIMARY KEY (id);


--
-- Name: magad_issue_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_issue
    ADD CONSTRAINT magad_issue_pkey PRIMARY KEY (id);


--
-- Name: magad_issue_publication_id_483bb233374b648e_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_issue
    ADD CONSTRAINT magad_issue_publication_id_483bb233374b648e_uniq UNIQUE (publication_id, identifier);


--
-- Name: magad_logerrorjs_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_logerrorjs
    ADD CONSTRAINT magad_logerrorjs_pkey PRIMARY KEY (id);


--
-- Name: magad_page_issue_id_d79799c313dd690_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_page
    ADD CONSTRAINT magad_page_issue_id_d79799c313dd690_uniq UNIQUE (issue_id, number);


--
-- Name: magad_page_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_page
    ADD CONSTRAINT magad_page_pkey PRIMARY KEY (id);


--
-- Name: magad_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_publication
    ADD CONSTRAINT magad_publication_pkey PRIMARY KEY (id);


--
-- Name: magad_publication_publisher_id_5973abebe8b13_uniq; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_publication
    ADD CONSTRAINT magad_publication_publisher_id_5973abebe8b13_uniq UNIQUE (publisher_id, name);


--
-- Name: magad_publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_publisher
    ADD CONSTRAINT magad_publisher_pkey PRIMARY KEY (id);


--
-- Name: magad_publisher_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_publisher_profiles
    ADD CONSTRAINT magad_publisher_profiles_pkey PRIMARY KEY (id);


--
-- Name: magad_publisher_profiles_publisher_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_publisher_profiles
    ADD CONSTRAINT magad_publisher_profiles_publisher_id_user_id_key UNIQUE (publisher_id, user_id);


--
-- Name: magad_publisher_tax_id_key; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_publisher
    ADD CONSTRAINT magad_publisher_tax_id_key UNIQUE (tax_id);


--
-- Name: magad_sdk_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY magad_sdk
    ADD CONSTRAINT magad_sdk_pkey PRIMARY KEY (id);


--
-- Name: reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX accounts_user_groups_0e939a4f ON accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX accounts_user_groups_e8701ad4 ON accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX accounts_user_user_permissions_8373b171 ON accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX accounts_user_user_permissions_e8701ad4 ON accounts_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: cities_light_city_0f442f96; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_city_0f442f96 ON cities_light_city USING btree (region_id);


--
-- Name: cities_light_city_248081ec; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_city_248081ec ON cities_light_city USING btree (population);


--
-- Name: cities_light_city_2dbcba41; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_city_2dbcba41 ON cities_light_city USING btree (slug);


--
-- Name: cities_light_city_3f98884f; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_city_3f98884f ON cities_light_city USING btree (feature_code);


--
-- Name: cities_light_city_610a2ab0; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_city_610a2ab0 ON cities_light_city USING btree (search_names);


--
-- Name: cities_light_city_93bfec8a; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_city_93bfec8a ON cities_light_city USING btree (country_id);


--
-- Name: cities_light_city_b068931c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_city_b068931c ON cities_light_city USING btree (name);


--
-- Name: cities_light_city_d7397f31; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_city_d7397f31 ON cities_light_city USING btree (name_ascii);


--
-- Name: cities_light_country_0e20e84e; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_country_0e20e84e ON cities_light_country USING btree (continent);


--
-- Name: cities_light_country_2dbcba41; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_country_2dbcba41 ON cities_light_country USING btree (slug);


--
-- Name: cities_light_country_a311df50; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_country_a311df50 ON cities_light_country USING btree (tld);


--
-- Name: cities_light_country_d7397f31; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_country_d7397f31 ON cities_light_country USING btree (name_ascii);


--
-- Name: cities_light_region_2dbcba41; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_region_2dbcba41 ON cities_light_region USING btree (slug);


--
-- Name: cities_light_region_93bfec8a; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_region_93bfec8a ON cities_light_region USING btree (country_id);


--
-- Name: cities_light_region_b068931c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_region_b068931c ON cities_light_region USING btree (name);


--
-- Name: cities_light_region_d7397f31; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_region_d7397f31 ON cities_light_region USING btree (name_ascii);


--
-- Name: cities_light_region_eb02a700; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX cities_light_region_eb02a700 ON cities_light_region USING btree (geoname_code);


--
-- Name: device_device_477cbf8a; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_device_477cbf8a ON device_device USING btree (model_id);


--
-- Name: device_device_51baaf8e; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_device_51baaf8e ON device_device USING btree (current_system_id);


--
-- Name: device_device_related_emails_9379346c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_device_related_emails_9379346c ON device_device_related_emails USING btree (device_id);


--
-- Name: device_device_related_emails_fdfd0ebf; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_device_related_emails_fdfd0ebf ON device_device_related_emails USING btree (email_id);


--
-- Name: device_devicecurrentsystem_316e8552; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_devicecurrentsystem_316e8552 ON device_devicecurrentsystem USING btree (version_id);


--
-- Name: device_devicecurrentsystem_c18a5443; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_devicecurrentsystem_c18a5443 ON device_devicecurrentsystem USING btree (system_id);


--
-- Name: device_devicegroup_devices_9379346c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_devicegroup_devices_9379346c ON device_devicegroup_devices USING btree (device_id);


--
-- Name: device_devicegroup_devices_f9b9c668; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_devicegroup_devices_f9b9c668 ON device_devicegroup_devices USING btree (devicegroup_id);


--
-- Name: device_devicemodel_b7652e66; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX device_devicemodel_b7652e66 ON device_devicemodel USING btree (screen_layout_size_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: log_corelogentry_417f1b1c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX log_corelogentry_417f1b1c ON log_corelogentry USING btree (content_type_id);


--
-- Name: log_corelogentry_5e5abda3; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX log_corelogentry_5e5abda3 ON log_corelogentry USING btree (action_type_id);


--
-- Name: log_corelogentry_94757cae; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX log_corelogentry_94757cae ON log_corelogentry USING btree (type_id);


--
-- Name: log_corelogentry_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX log_corelogentry_e8701ad4 ON log_corelogentry USING btree (user_id);


--
-- Name: magad_adinsertionproposal_72ef6487; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adinsertionproposal_72ef6487 ON magad_adinsertionproposal USING btree (publication_id);


--
-- Name: magad_adinsertionproposal_9c145cd1; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adinsertionproposal_9c145cd1 ON magad_adinsertionproposal USING btree (interest_channel_id);


--
-- Name: magad_adinsertionproposal_f14acec3; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adinsertionproposal_f14acec3 ON magad_adinsertionproposal USING btree (campaign_id);


--
-- Name: magad_adinsertionrequest_12f3e382; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adinsertionrequest_12f3e382 ON magad_adinsertionrequest USING btree (issue_id);


--
-- Name: magad_adinsertionrequest_cbdb6cb9; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adinsertionrequest_cbdb6cb9 ON magad_adinsertionrequest USING btree (device_log_id);


--
-- Name: magad_adinsertionrequest_e4ec8585; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adinsertionrequest_e4ec8585 ON magad_adinsertionrequest USING btree (screen_id);


--
-- Name: magad_adinsertionrequest_f14acec3; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adinsertionrequest_f14acec3 ON magad_adinsertionrequest USING btree (campaign_id);


--
-- Name: magad_adscreen_70b5610c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adscreen_70b5610c ON magad_adscreen USING btree (advertisement_id);


--
-- Name: magad_adscreen_compatible_device_groups_3ec3d4c0; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adscreen_compatible_device_groups_3ec3d4c0 ON magad_adscreen_compatible_device_groups USING btree (adscreen_id);


--
-- Name: magad_adscreen_compatible_device_groups_f9b9c668; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adscreen_compatible_device_groups_f9b9c668 ON magad_adscreen_compatible_device_groups USING btree (devicegroup_id);


--
-- Name: magad_adscreen_compatible_sdks_16a65913; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adscreen_compatible_sdks_16a65913 ON magad_adscreen_compatible_sdks USING btree (sdk_id);


--
-- Name: magad_adscreen_compatible_sdks_3ec3d4c0; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adscreen_compatible_sdks_3ec3d4c0 ON magad_adscreen_compatible_sdks USING btree (adscreen_id);


--
-- Name: magad_advertisement_169fc544; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_advertisement_169fc544 ON magad_advertisement USING btree (agency_id);


--
-- Name: magad_advertisement_3cc7577e; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_advertisement_3cc7577e ON magad_advertisement USING btree (advertiser_id);


--
-- Name: magad_advertiser_c7141997; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_advertiser_c7141997 ON magad_advertiser USING btree (city_id);


--
-- Name: magad_advertiser_profiles_3cc7577e; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_advertiser_profiles_3cc7577e ON magad_advertiser_profiles USING btree (advertiser_id);


--
-- Name: magad_advertiser_profiles_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_advertiser_profiles_e8701ad4 ON magad_advertiser_profiles USING btree (user_id);


--
-- Name: magad_adviewreport_b034c51e; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_adviewreport_b034c51e ON magad_adviewreport USING btree (ad_insertion_id);


--
-- Name: magad_agency_advertisers_169fc544; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_agency_advertisers_169fc544 ON magad_agency_advertisers USING btree (agency_id);


--
-- Name: magad_agency_advertisers_3cc7577e; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_agency_advertisers_3cc7577e ON magad_agency_advertisers USING btree (advertiser_id);


--
-- Name: magad_agency_c7141997; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_agency_c7141997 ON magad_agency USING btree (city_id);


--
-- Name: magad_agency_profiles_169fc544; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_agency_profiles_169fc544 ON magad_agency_profiles USING btree (agency_id);


--
-- Name: magad_agency_profiles_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_agency_profiles_e8701ad4 ON magad_agency_profiles USING btree (user_id);


--
-- Name: magad_app_72ef6487; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_app_72ef6487 ON magad_app USING btree (publication_id);


--
-- Name: magad_app_7645b3fb; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_app_7645b3fb ON magad_app USING btree (device_system_id);


--
-- Name: magad_campaign_70b5610c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_campaign_70b5610c ON magad_campaign USING btree (advertisement_id);


--
-- Name: magad_campaign_categories_624f733f; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_campaign_categories_624f733f ON magad_campaign_categories USING btree (interestcategory_id);


--
-- Name: magad_campaign_categories_f14acec3; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_campaign_categories_f14acec3 ON magad_campaign_categories USING btree (campaign_id);


--
-- Name: magad_campaign_channels_a5c563e9; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_campaign_channels_a5c563e9 ON magad_campaign_channels USING btree (interestchannel_id);


--
-- Name: magad_campaign_channels_f14acec3; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_campaign_channels_f14acec3 ON magad_campaign_channels USING btree (campaign_id);


--
-- Name: magad_campaign_distribution_areas_0f442f96; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_campaign_distribution_areas_0f442f96 ON magad_campaign_distribution_areas USING btree (region_id);


--
-- Name: magad_campaign_distribution_areas_f14acec3; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_campaign_distribution_areas_f14acec3 ON magad_campaign_distribution_areas USING btree (campaign_id);


--
-- Name: magad_configuration_16a65913; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_configuration_16a65913 ON magad_configuration USING btree (sdk_id);


--
-- Name: magad_configuration_213a9513; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_configuration_213a9513 ON magad_configuration USING btree (ga_tracking_id);


--
-- Name: magad_configuration_62c3323c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_configuration_62c3323c ON magad_configuration USING btree (api_url_id);


--
-- Name: magad_configuration_c18a5443; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_configuration_c18a5443 ON magad_configuration USING btree (system_id);


--
-- Name: magad_deviceapp_16a65913; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_deviceapp_16a65913 ON magad_deviceapp USING btree (sdk_id);


--
-- Name: magad_deviceapp_9379346c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_deviceapp_9379346c ON magad_deviceapp USING btree (device_id);


--
-- Name: magad_deviceapp_f382adfe; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_deviceapp_f382adfe ON magad_deviceapp USING btree (app_id);


--
-- Name: magad_devicelog_af5866de; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_devicelog_af5866de ON magad_devicelog USING btree (device_app_id);


--
-- Name: magad_devicelog_bb98363a; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_devicelog_bb98363a ON magad_devicelog USING btree (device_current_system_id);


--
-- Name: magad_devicelog_coordinate_id; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_devicelog_coordinate_id ON magad_devicelog USING gist (coordinate);


--
-- Name: magad_devicelog_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_devicelog_e8701ad4 ON magad_devicelog USING btree (user_id);


--
-- Name: magad_interestcategory_2dbcba41; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_interestcategory_2dbcba41 ON magad_interestcategory USING btree (slug);


--
-- Name: magad_interestchannel_2dbcba41; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_interestchannel_2dbcba41 ON magad_interestchannel USING btree (slug);


--
-- Name: magad_interestchannelcategory_372a08d2; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_interestchannelcategory_372a08d2 ON magad_interestchannelcategory USING btree (interest_category_id);


--
-- Name: magad_interestchannelcategory_9c145cd1; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_interestchannelcategory_9c145cd1 ON magad_interestchannelcategory USING btree (interest_channel_id);


--
-- Name: magad_issue_72ef6487; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_issue_72ef6487 ON magad_issue USING btree (publication_id);


--
-- Name: magad_page_12f3e382; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_page_12f3e382 ON magad_page USING btree (issue_id);


--
-- Name: magad_publication_2604cbea; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_publication_2604cbea ON magad_publication USING btree (publisher_id);


--
-- Name: magad_publication_372a08d2; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_publication_372a08d2 ON magad_publication USING btree (interest_category_id);


--
-- Name: magad_publisher_c7141997; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_publisher_c7141997 ON magad_publisher USING btree (city_id);


--
-- Name: magad_publisher_profiles_2604cbea; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_publisher_profiles_2604cbea ON magad_publisher_profiles USING btree (publisher_id);


--
-- Name: magad_publisher_profiles_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_publisher_profiles_e8701ad4 ON magad_publisher_profiles USING btree (user_id);


--
-- Name: magad_sdk_2af72f10; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX magad_sdk_2af72f10 ON magad_sdk USING btree (version);


--
-- Name: reversion_revision_b16b0f06; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX reversion_revision_b16b0f06 ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_c69e55a4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX reversion_revision_c69e55a4 ON reversion_revision USING btree (date_created);


--
-- Name: reversion_revision_e8701ad4; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX reversion_revision_e8701ad4 ON reversion_revision USING btree (user_id);


--
-- Name: reversion_version_0c9ba3a3; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX reversion_version_0c9ba3a3 ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_417f1b1c; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX reversion_version_417f1b1c ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_5de09a8d; Type: INDEX; Schema: public; Owner: user; Tablespace: 
--

CREATE INDEX reversion_version_5de09a8d ON reversion_version USING btree (revision_id);


--
-- Name: a1706a1f8ef41d7f437c407d8bbd138b; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adinsertionproposal
    ADD CONSTRAINT a1706a1f8ef41d7f437c407d8bbd138b FOREIGN KEY (interest_channel_id) REFERENCES magad_interestchannel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_u_permission_id_50fe63449eb6b2b7_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY accounts_user_user_permissions
    ADD CONSTRAINT accounts_u_permission_id_50fe63449eb6b2b7_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_grou_user_id_5b85b23148183af7_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY accounts_user_groups
    ADD CONSTRAINT accounts_user_grou_user_id_5b85b23148183af7_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups_group_id_7ce0525098714dc3_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_7ce0525098714dc3_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_user_id_5721dcfcd3d00419_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_user_id_5721dcfcd3d00419_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth__content_type_id_c78e4a6dec171d5_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth__content_type_id_c78e4a6dec171d5_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_77e7b7f7a3cbb4da_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_77e7b7f7a3cbb4da_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_61f28a40b7f5679c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_61f28a40b7f5679c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_4a2a4e28c10d40de_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_4a2a4e28c10d40de_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ba2b211cf7b406b79aca8e8c05a1f09e; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_interestchannelcategory
    ADD CONSTRAINT ba2b211cf7b406b79aca8e8c05a1f09e FOREIGN KEY (interest_channel_id) REFERENCES magad_interestchannel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cef283cd127329283838b1e4c73a9f48; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicemodel
    ADD CONSTRAINT cef283cd127329283838b1e4c73a9f48 FOREIGN KEY (screen_layout_size_id) REFERENCES device_screenlayoutsize(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cities_l_country_id_10e6efd2c6da81bf_fk_cities_light_country_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY cities_light_region
    ADD CONSTRAINT cities_l_country_id_10e6efd2c6da81bf_fk_cities_light_country_id FOREIGN KEY (country_id) REFERENCES cities_light_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cities_li_country_id_1d114f5edacc5a1_fk_cities_light_country_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY cities_light_city
    ADD CONSTRAINT cities_li_country_id_1d114f5edacc5a1_fk_cities_light_country_id FOREIGN KEY (country_id) REFERENCES cities_light_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cities_lig_region_id_3c6b93cc30668b37_fk_cities_light_region_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY cities_light_city
    ADD CONSTRAINT cities_lig_region_id_3c6b93cc30668b37_fk_cities_light_region_id FOREIGN KEY (region_id) REFERENCES cities_light_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d111ce6b5d267da026f4d52cda2cdddd; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_categories
    ADD CONSTRAINT d111ce6b5d267da026f4d52cda2cdddd FOREIGN KEY (interestcategory_id) REFERENCES magad_interestcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d1857e99990ff7ddebf403b32998bad0; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adviewreport
    ADD CONSTRAINT d1857e99990ff7ddebf403b32998bad0 FOREIGN KEY (ad_insertion_id) REFERENCES magad_adinsertionrequest(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d4c7e09880618221346261048b982cdc; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_devicelog
    ADD CONSTRAINT d4c7e09880618221346261048b982cdc FOREIGN KEY (device_current_system_id) REFERENCES device_devicecurrentsystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d5eaf3fb89db0ef7f625e17eaf8b2d43; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_interestchannelcategory
    ADD CONSTRAINT d5eaf3fb89db0ef7f625e17eaf8b2d43 FOREIGN KEY (interest_category_id) REFERENCES magad_interestcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d6e6cf716cf8010aa6b46d4b4e0943fd; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_channels
    ADD CONSTRAINT d6e6cf716cf8010aa6b46d4b4e0943fd FOREIGN KEY (interestchannel_id) REFERENCES magad_interestchannel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d9b8d35484d7f9cbc744502fe0b7ea18; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_publication
    ADD CONSTRAINT d9b8d35484d7f9cbc744502fe0b7ea18 FOREIGN KEY (interest_category_id) REFERENCES magad_interestcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: de_version_id_374fa084e4f02fa1_fk_device_devicesystemversion_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicecurrentsystem
    ADD CONSTRAINT de_version_id_374fa084e4f02fa1_fk_device_devicesystemversion_id FOREIGN KEY (version_id) REFERENCES device_devicesystemversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: device_dev_system_id_210145d42cac18d1_fk_device_devicesystem_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicecurrentsystem
    ADD CONSTRAINT device_dev_system_id_210145d42cac18d1_fk_device_devicesystem_id FOREIGN KEY (system_id) REFERENCES device_devicesystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: device_devic_model_id_31cea15600887a84_fk_device_devicemodel_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_device
    ADD CONSTRAINT device_devic_model_id_31cea15600887a84_fk_device_devicemodel_id FOREIGN KEY (model_id) REFERENCES device_devicemodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: device_device__device_id_295cedec3f64bc5e_fk_device_device_uuid; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_device_related_emails
    ADD CONSTRAINT device_device__device_id_295cedec3f64bc5e_fk_device_device_uuid FOREIGN KEY (device_id) REFERENCES device_device(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: device_device_re_email_id_24414283005fa000_fk_identify_email_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_device_related_emails
    ADD CONSTRAINT device_device_re_email_id_24414283005fa000_fk_identify_email_id FOREIGN KEY (email_id) REFERENCES identify_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: device_deviceg_device_id_45529630b8d98acd_fk_device_device_uuid; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicegroup_devices
    ADD CONSTRAINT device_deviceg_device_id_45529630b8d98acd_fk_device_device_uuid FOREIGN KEY (device_id) REFERENCES device_device(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: device_devicegroup_id_2ad7bbaf48907880_fk_device_devicegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_devicegroup_devices
    ADD CONSTRAINT device_devicegroup_id_2ad7bbaf48907880_fk_device_devicegroup_id FOREIGN KEY (devicegroup_id) REFERENCES device_devicegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djang_content_type_id_edb06ea8bb799dc_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djang_content_type_id_edb06ea8bb799dc_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_68311a4f72f009da_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_68311a4f72f009da_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f3b33de03b464a6923860d27f749ec18; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY device_device
    ADD CONSTRAINT f3b33de03b464a6923860d27f749ec18 FOREIGN KEY (current_system_id) REFERENCES device_devicecurrentsystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ga_tracking_id_299351f02c925133_fk_configuration_gatracking_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_configuration
    ADD CONSTRAINT ga_tracking_id_299351f02c925133_fk_configuration_gatracking_id FOREIGN KEY (ga_tracking_id) REFERENCES configuration_gatracking(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: log__content_type_id_5cb39ebd74b2414c_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY log_corelogentry
    ADD CONSTRAINT log__content_type_id_5cb39ebd74b2414c_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: log_cor_action_type_id_43535cf62f8f0e8e_fk_log_logactiontype_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY log_corelogentry
    ADD CONSTRAINT log_cor_action_type_id_43535cf62f8f0e8e_fk_log_logactiontype_id FOREIGN KEY (action_type_id) REFERENCES log_logactiontype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: log_corelogentry_type_id_7d931c523d246e69_fk_log_logtype_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY log_corelogentry
    ADD CONSTRAINT log_corelogentry_type_id_7d931c523d246e69_fk_log_logtype_id FOREIGN KEY (type_id) REFERENCES log_logtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: log_corelogentry_user_id_3a9c5feffae5d004_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY log_corelogentry
    ADD CONSTRAINT log_corelogentry_user_id_3a9c5feffae5d004_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mag_advertisement_id_2b9ebbb589ef6b56_fk_magad_advertisement_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adscreen
    ADD CONSTRAINT mag_advertisement_id_2b9ebbb589ef6b56_fk_magad_advertisement_id FOREIGN KEY (advertisement_id) REFERENCES magad_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mag_advertisement_id_389ece80bc4fa9ac_fk_magad_advertisement_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign
    ADD CONSTRAINT mag_advertisement_id_389ece80bc4fa9ac_fk_magad_advertisement_id FOREIGN KEY (advertisement_id) REFERENCES magad_advertisement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mag_device_system_id_4e955272f280d655_fk_device_devicesystem_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_app
    ADD CONSTRAINT mag_device_system_id_4e955272f280d655_fk_device_devicesystem_id FOREIGN KEY (device_system_id) REFERENCES device_devicesystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad__devicegroup_id_32effbef5087f6bc_fk_device_devicegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adscreen_compatible_device_groups
    ADD CONSTRAINT magad__devicegroup_id_32effbef5087f6bc_fk_device_devicegroup_id FOREIGN KEY (devicegroup_id) REFERENCES device_devicegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_a_publication_id_592685c39f61b6d5_fk_magad_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adinsertionproposal
    ADD CONSTRAINT magad_a_publication_id_592685c39f61b6d5_fk_magad_publication_id FOREIGN KEY (publication_id) REFERENCES magad_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_a_publication_id_691bdc80cc98166c_fk_magad_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_app
    ADD CONSTRAINT magad_a_publication_id_691bdc80cc98166c_fk_magad_publication_id FOREIGN KEY (publication_id) REFERENCES magad_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adin_device_log_id_212f073cfd3d3696_fk_magad_devicelog_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adinsertionrequest
    ADD CONSTRAINT magad_adin_device_log_id_212f073cfd3d3696_fk_magad_devicelog_id FOREIGN KEY (device_log_id) REFERENCES magad_devicelog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adinser_campaign_id_4ab89e3a374f02da_fk_magad_campaign_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adinsertionproposal
    ADD CONSTRAINT magad_adinser_campaign_id_4ab89e3a374f02da_fk_magad_campaign_id FOREIGN KEY (campaign_id) REFERENCES magad_campaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adinser_campaign_id_70153f0b71983918_fk_magad_campaign_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adinsertionrequest
    ADD CONSTRAINT magad_adinser_campaign_id_70153f0b71983918_fk_magad_campaign_id FOREIGN KEY (campaign_id) REFERENCES magad_campaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adinserti_screen_id_37da6012e1f978b2_fk_magad_adscreen_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adinsertionrequest
    ADD CONSTRAINT magad_adinserti_screen_id_37da6012e1f978b2_fk_magad_adscreen_id FOREIGN KEY (screen_id) REFERENCES magad_adscreen(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adinsertionre_issue_id_336e2efed4b0417e_fk_magad_issue_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adinsertionrequest
    ADD CONSTRAINT magad_adinsertionre_issue_id_336e2efed4b0417e_fk_magad_issue_id FOREIGN KEY (issue_id) REFERENCES magad_issue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adscree_adscreen_id_150f107f48ce4c4e_fk_magad_adscreen_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adscreen_compatible_sdks
    ADD CONSTRAINT magad_adscree_adscreen_id_150f107f48ce4c4e_fk_magad_adscreen_id FOREIGN KEY (adscreen_id) REFERENCES magad_adscreen(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adscree_adscreen_id_1d6fcb0ba2eed3db_fk_magad_adscreen_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adscreen_compatible_device_groups
    ADD CONSTRAINT magad_adscree_adscreen_id_1d6fcb0ba2eed3db_fk_magad_adscreen_id FOREIGN KEY (adscreen_id) REFERENCES magad_adscreen(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adscreen_compatib_sdk_id_144767ac76cf1856_fk_magad_sdk_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_adscreen_compatible_sdks
    ADD CONSTRAINT magad_adscreen_compatib_sdk_id_144767ac76cf1856_fk_magad_sdk_id FOREIGN KEY (sdk_id) REFERENCES magad_sdk(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adv_advertiser_id_2eb68def2547e0e4_fk_magad_advertiser_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_advertisement
    ADD CONSTRAINT magad_adv_advertiser_id_2eb68def2547e0e4_fk_magad_advertiser_id FOREIGN KEY (advertiser_id) REFERENCES magad_advertiser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_adv_advertiser_id_57240a5a415a1804_fk_magad_advertiser_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_advertiser_profiles
    ADD CONSTRAINT magad_adv_advertiser_id_57240a5a415a1804_fk_magad_advertiser_id FOREIGN KEY (advertiser_id) REFERENCES magad_advertiser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_advertis_city_id_12af9d9cc8130453_fk_cities_light_city_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_advertiser
    ADD CONSTRAINT magad_advertis_city_id_12af9d9cc8130453_fk_cities_light_city_id FOREIGN KEY (city_id) REFERENCES cities_light_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_advertiseme_agency_id_4eca0ef77f161b33_fk_magad_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_advertisement
    ADD CONSTRAINT magad_advertiseme_agency_id_4eca0ef77f161b33_fk_magad_agency_id FOREIGN KEY (agency_id) REFERENCES magad_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_advertiser_p_user_id_5d2f41f737a083cd_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_advertiser_profiles
    ADD CONSTRAINT magad_advertiser_p_user_id_5d2f41f737a083cd_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_age_advertiser_id_5e915501feb83cd3_fk_magad_advertiser_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_agency_advertisers
    ADD CONSTRAINT magad_age_advertiser_id_5e915501feb83cd3_fk_magad_advertiser_id FOREIGN KEY (advertiser_id) REFERENCES magad_advertiser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_agency_adve_agency_id_777638a2faec1596_fk_magad_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_agency_advertisers
    ADD CONSTRAINT magad_agency_adve_agency_id_777638a2faec1596_fk_magad_agency_id FOREIGN KEY (agency_id) REFERENCES magad_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_agency_city_id_7fc9ff3c1b47f4c5_fk_cities_light_city_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_agency
    ADD CONSTRAINT magad_agency_city_id_7fc9ff3c1b47f4c5_fk_cities_light_city_id FOREIGN KEY (city_id) REFERENCES cities_light_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_agency_prof_agency_id_1d34afd462a03036_fk_magad_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_agency_profiles
    ADD CONSTRAINT magad_agency_prof_agency_id_1d34afd462a03036_fk_magad_agency_id FOREIGN KEY (agency_id) REFERENCES magad_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_agency_profi_user_id_7ae9e1d87fc64988_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_agency_profiles
    ADD CONSTRAINT magad_agency_profi_user_id_7ae9e1d87fc64988_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_camp_region_id_6cf6178a0f4f0017_fk_cities_light_region_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_distribution_areas
    ADD CONSTRAINT magad_camp_region_id_6cf6178a0f4f0017_fk_cities_light_region_id FOREIGN KEY (region_id) REFERENCES cities_light_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_campaig_campaign_id_108cb21a8067032e_fk_magad_campaign_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_categories
    ADD CONSTRAINT magad_campaig_campaign_id_108cb21a8067032e_fk_magad_campaign_id FOREIGN KEY (campaign_id) REFERENCES magad_campaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_campaig_campaign_id_27f90a3987b4f2bc_fk_magad_campaign_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_channels
    ADD CONSTRAINT magad_campaig_campaign_id_27f90a3987b4f2bc_fk_magad_campaign_id FOREIGN KEY (campaign_id) REFERENCES magad_campaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_campaig_campaign_id_6b98ba95d257a9c4_fk_magad_campaign_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_campaign_distribution_areas
    ADD CONSTRAINT magad_campaig_campaign_id_6b98ba95d257a9c4_fk_magad_campaign_id FOREIGN KEY (campaign_id) REFERENCES magad_campaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_co_api_url_id_5c3f2127ced1435b_fk_configuration_apiurl_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_configuration
    ADD CONSTRAINT magad_co_api_url_id_5c3f2127ced1435b_fk_configuration_apiurl_id FOREIGN KEY (api_url_id) REFERENCES configuration_apiurl(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_confi_system_id_90b94542040ff56_fk_device_devicesystem_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_configuration
    ADD CONSTRAINT magad_confi_system_id_90b94542040ff56_fk_device_devicesystem_id FOREIGN KEY (system_id) REFERENCES device_devicesystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_configuration_sdk_id_3027e9e331c3dcd0_fk_magad_sdk_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_configuration
    ADD CONSTRAINT magad_configuration_sdk_id_3027e9e331c3dcd0_fk_magad_sdk_id FOREIGN KEY (sdk_id) REFERENCES magad_sdk(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_devi_device_app_id_2a9422eab178ff10_fk_magad_deviceapp_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_devicelog
    ADD CONSTRAINT magad_devi_device_app_id_2a9422eab178ff10_fk_magad_deviceapp_id FOREIGN KEY (device_app_id) REFERENCES magad_deviceapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_deviceap_device_id_36ebab76bc03e74a_fk_device_device_uuid; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_deviceapp
    ADD CONSTRAINT magad_deviceap_device_id_36ebab76bc03e74a_fk_device_device_uuid FOREIGN KEY (device_id) REFERENCES device_device(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_deviceapp_app_id_3c35d33e5dccb3ce_fk_magad_app_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_deviceapp
    ADD CONSTRAINT magad_deviceapp_app_id_3c35d33e5dccb3ce_fk_magad_app_id FOREIGN KEY (app_id) REFERENCES magad_app(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_deviceapp_sdk_id_4a8efd4254faa603_fk_magad_sdk_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_deviceapp
    ADD CONSTRAINT magad_deviceapp_sdk_id_4a8efd4254faa603_fk_magad_sdk_id FOREIGN KEY (sdk_id) REFERENCES magad_sdk(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_devicelog_user_id_569769fb09308cb4_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_devicelog
    ADD CONSTRAINT magad_devicelog_user_id_569769fb09308cb4_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_i_publication_id_158094535aff3dec_fk_magad_publication_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_issue
    ADD CONSTRAINT magad_i_publication_id_158094535aff3dec_fk_magad_publication_id FOREIGN KEY (publication_id) REFERENCES magad_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_page_issue_id_b70d7886e9be773_fk_magad_issue_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_page
    ADD CONSTRAINT magad_page_issue_id_b70d7886e9be773_fk_magad_issue_id FOREIGN KEY (issue_id) REFERENCES magad_issue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_publi_publisher_id_1adf7c4d64e3cb16_fk_magad_publisher_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_publication
    ADD CONSTRAINT magad_publi_publisher_id_1adf7c4d64e3cb16_fk_magad_publisher_id FOREIGN KEY (publisher_id) REFERENCES magad_publisher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_publis_publisher_id_6b7038a252a9f16_fk_magad_publisher_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_publisher_profiles
    ADD CONSTRAINT magad_publis_publisher_id_6b7038a252a9f16_fk_magad_publisher_id FOREIGN KEY (publisher_id) REFERENCES magad_publisher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_publisher_city_id_7f534611d4ea1fe_fk_cities_light_city_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_publisher
    ADD CONSTRAINT magad_publisher_city_id_7f534611d4ea1fe_fk_cities_light_city_id FOREIGN KEY (city_id) REFERENCES cities_light_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: magad_publisher_pro_user_id_5e5ccb546115235_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY magad_publisher_profiles
    ADD CONSTRAINT magad_publisher_pro_user_id_5e5ccb546115235_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reve_content_type_id_7c43ec0b58b95dad_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reve_content_type_id_7c43ec0b58b95dad_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion__revision_id_ad2eea6de3b141f_fk_reversion_revision_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion__revision_id_ad2eea6de3b141f_fk_reversion_revision_id FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_revision_user_id_399066a598eda74_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_user_id_399066a598eda74_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: fredericomatos
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM fredericomatos;
GRANT ALL ON SCHEMA public TO fredericomatos;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

