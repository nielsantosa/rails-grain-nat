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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: item_modifier_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_modifier_groups (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    modifier_group_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: item_modifier_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_modifier_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_modifier_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_modifier_groups_id_seq OWNED BY public.item_modifier_groups.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    type character varying,
    label character varying,
    description character varying,
    price double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: menu_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu_sections (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    section_id bigint NOT NULL,
    display_order integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: menu_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.menu_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: menu_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.menu_sections_id_seq OWNED BY public.menu_sections.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menus (
    id bigint NOT NULL,
    label character varying,
    state character varying,
    start_date date,
    end_date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: modifier_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modifier_groups (
    id bigint NOT NULL,
    label character varying,
    selection_required_min integer,
    selection_required_max integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: modifier_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modifier_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modifier_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modifier_groups_id_seq OWNED BY public.modifier_groups.id;


--
-- Name: modifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modifiers (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    modifier_group_id bigint NOT NULL,
    display_order integer DEFAULT 0,
    default_quantity integer DEFAULT 0,
    price_override double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: modifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modifiers_id_seq OWNED BY public.modifiers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: section_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.section_items (
    id bigint NOT NULL,
    section_id bigint NOT NULL,
    item_id bigint NOT NULL,
    display_order integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: section_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.section_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: section_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.section_items_id_seq OWNED BY public.section_items.id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sections (
    id bigint NOT NULL,
    label character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- Name: item_modifier_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_modifier_groups ALTER COLUMN id SET DEFAULT nextval('public.item_modifier_groups_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: menu_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_sections ALTER COLUMN id SET DEFAULT nextval('public.menu_sections_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: modifier_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_groups ALTER COLUMN id SET DEFAULT nextval('public.modifier_groups_id_seq'::regclass);


--
-- Name: modifiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifiers ALTER COLUMN id SET DEFAULT nextval('public.modifiers_id_seq'::regclass);


--
-- Name: section_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_items ALTER COLUMN id SET DEFAULT nextval('public.section_items_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: item_modifier_groups item_modifier_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_modifier_groups
    ADD CONSTRAINT item_modifier_groups_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: menu_sections menu_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_sections
    ADD CONSTRAINT menu_sections_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: modifier_groups modifier_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_groups
    ADD CONSTRAINT modifier_groups_pkey PRIMARY KEY (id);


--
-- Name: modifiers modifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifiers
    ADD CONSTRAINT modifiers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: section_items section_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_items
    ADD CONSTRAINT section_items_pkey PRIMARY KEY (id);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: index_item_modifier_groups_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_modifier_groups_on_item_id ON public.item_modifier_groups USING btree (item_id);


--
-- Name: index_item_modifier_groups_on_item_id_and_modifier_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_item_modifier_groups_on_item_id_and_modifier_group_id ON public.item_modifier_groups USING btree (item_id, modifier_group_id);


--
-- Name: index_item_modifier_groups_on_modifier_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_modifier_groups_on_modifier_group_id ON public.item_modifier_groups USING btree (modifier_group_id);


--
-- Name: index_menu_sections_on_menu_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_menu_sections_on_menu_id ON public.menu_sections USING btree (menu_id);


--
-- Name: index_menu_sections_on_menu_id_and_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_menu_sections_on_menu_id_and_section_id ON public.menu_sections USING btree (menu_id, section_id);


--
-- Name: index_menu_sections_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_menu_sections_on_section_id ON public.menu_sections USING btree (section_id);


--
-- Name: index_modifiers_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_modifiers_on_item_id ON public.modifiers USING btree (item_id);


--
-- Name: index_modifiers_on_modifier_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_modifiers_on_modifier_group_id ON public.modifiers USING btree (modifier_group_id);


--
-- Name: index_section_items_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_items_on_item_id ON public.section_items USING btree (item_id);


--
-- Name: index_section_items_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_items_on_section_id ON public.section_items USING btree (section_id);


--
-- Name: index_section_items_on_section_id_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_section_items_on_section_id_and_item_id ON public.section_items USING btree (section_id, item_id);


--
-- Name: menu_sections fk_rails_47e1e28bb8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_sections
    ADD CONSTRAINT fk_rails_47e1e28bb8 FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- Name: item_modifier_groups fk_rails_5da566bd5d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_modifier_groups
    ADD CONSTRAINT fk_rails_5da566bd5d FOREIGN KEY (modifier_group_id) REFERENCES public.modifier_groups(id);


--
-- Name: modifiers fk_rails_769dcf7ebb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifiers
    ADD CONSTRAINT fk_rails_769dcf7ebb FOREIGN KEY (modifier_group_id) REFERENCES public.modifier_groups(id);


--
-- Name: item_modifier_groups fk_rails_8a119061a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_modifier_groups
    ADD CONSTRAINT fk_rails_8a119061a3 FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: section_items fk_rails_8a81cbe10d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_items
    ADD CONSTRAINT fk_rails_8a81cbe10d FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- Name: modifiers fk_rails_a71cb195a8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifiers
    ADD CONSTRAINT fk_rails_a71cb195a8 FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: menu_sections fk_rails_a915680585; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_sections
    ADD CONSTRAINT fk_rails_a915680585 FOREIGN KEY (menu_id) REFERENCES public.menus(id);


--
-- Name: section_items fk_rails_e0534d06cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_items
    ADD CONSTRAINT fk_rails_e0534d06cc FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20240303074311'),
('20240303074304'),
('20240303074249'),
('20240303073801'),
('20240302225048'),
('20240302225027'),
('20240302224915'),
('20240302020727'),
('20240302020611'),
('20240302013523'),
('20240302013248'),
('20240302013140');

