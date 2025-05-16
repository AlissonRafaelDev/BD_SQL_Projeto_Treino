--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: acompanhamento; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.acompanhamento (
    id_acompanhamento integer NOT NULL,
    id_atleta integer,
    id_profissional integer,
    data_inicio date,
    data_termino date,
    observacoes text,
    id_cardapio integer,
    id_treino_exercicio integer
);


ALTER TABLE public.acompanhamento OWNER TO neondb_owner;

--
-- Name: acompanhamento_id_acompanhamento_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.acompanhamento_id_acompanhamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.acompanhamento_id_acompanhamento_seq OWNER TO neondb_owner;

--
-- Name: acompanhamento_id_acompanhamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.acompanhamento_id_acompanhamento_seq OWNED BY public.acompanhamento.id_acompanhamento;


--
-- Name: administrador; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.administrador (
    id_adm integer NOT NULL,
    nome character varying(255),
    email character varying(255),
    senha character varying(255),
    "codigo_segurança" character varying(255),
    data_cadastro timestamp without time zone
);


ALTER TABLE public.administrador OWNER TO neondb_owner;

--
-- Name: administrador_id_adm_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.administrador_id_adm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.administrador_id_adm_seq OWNER TO neondb_owner;

--
-- Name: administrador_id_adm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.administrador_id_adm_seq OWNED BY public.administrador.id_adm;


--
-- Name: alimento; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.alimento (
    id_alimento integer NOT NULL,
    nome character varying(255),
    grupo character varying,
    carboidratos double precision,
    descricao text,
    proteinas double precision,
    gorduras double precision
);


ALTER TABLE public.alimento OWNER TO neondb_owner;

--
-- Name: alimento_id_alimento_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.alimento_id_alimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alimento_id_alimento_seq OWNER TO neondb_owner;

--
-- Name: alimento_id_alimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.alimento_id_alimento_seq OWNED BY public.alimento.id_alimento;


--
-- Name: atleta; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.atleta (
    id_atleta integer NOT NULL,
    nome character varying(255) NOT NULL,
    data_nascimento date,
    email character varying(255),
    senha character varying(255),
    termos_uso boolean,
    genero character varying(255),
    data_cadastro timestamp without time zone
);


ALTER TABLE public.atleta OWNER TO neondb_owner;

--
-- Name: atleta_id_atleta_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.atleta_id_atleta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.atleta_id_atleta_seq OWNER TO neondb_owner;

--
-- Name: atleta_id_atleta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.atleta_id_atleta_seq OWNED BY public.atleta.id_atleta;


--
-- Name: cardapio; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.cardapio (
    id_cardapio integer NOT NULL,
    nome character varying,
    tipo character varying(255),
    horario_inicio time without time zone,
    horario_fim time without time zone,
    kcal_max character varying,
    observacoes text,
    data_criacao date,
    dias text,
    id_alimento integer,
    quantidade_alimento double precision
);


ALTER TABLE public.cardapio OWNER TO neondb_owner;

--
-- Name: cardapio_id_cardapio_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

ALTER TABLE public.cardapio ALTER COLUMN id_cardapio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cardapio_id_cardapio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: exercicio; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.exercicio (
    id_exercicio integer NOT NULL,
    nome character varying(255) NOT NULL,
    descricao text,
    icone_treino character varying(255),
    video_url character varying(255),
    grupo_muscular character varying(255),
    equipamento character varying(255)
);


ALTER TABLE public.exercicio OWNER TO neondb_owner;

--
-- Name: exercicio_id_exercicio_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.exercicio_id_exercicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exercicio_id_exercicio_seq OWNER TO neondb_owner;

--
-- Name: exercicio_id_exercicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.exercicio_id_exercicio_seq OWNED BY public.exercicio.id_exercicio;


--
-- Name: plano_exercicio; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.plano_exercicio (
    id_plano_exercicio integer NOT NULL,
    id_treino integer,
    observacoes text
);


ALTER TABLE public.plano_exercicio OWNER TO neondb_owner;

--
-- Name: plano_exercicio_id_plano_exercicio_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.plano_exercicio_id_plano_exercicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plano_exercicio_id_plano_exercicio_seq OWNER TO neondb_owner;

--
-- Name: plano_exercicio_id_plano_exercicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.plano_exercicio_id_plano_exercicio_seq OWNED BY public.plano_exercicio.id_plano_exercicio;


--
-- Name: profissional; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.profissional (
    id_profissional integer NOT NULL,
    nome character varying(255),
    email character varying(255),
    senha character varying(255),
    cpf character(11),
    profissao character varying(255),
    registro_profissional character varying(20),
    telefone character varying(15),
    data_cadastro timestamp without time zone
);


ALTER TABLE public.profissional OWNER TO neondb_owner;

--
-- Name: profissional_id_profissional_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.profissional_id_profissional_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profissional_id_profissional_seq OWNER TO neondb_owner;

--
-- Name: profissional_id_profissional_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.profissional_id_profissional_seq OWNED BY public.profissional.id_profissional;


--
-- Name: treino; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.treino (
    id_treinos integer NOT NULL,
    nome character varying(255) NOT NULL,
    data_criacao date NOT NULL,
    objetivo text,
    frequencia boolean NOT NULL,
    criador character varying(255),
    id_exercicio integer,
    series integer,
    repeticoes integer,
    cargas double precision
);


ALTER TABLE public.treino OWNER TO neondb_owner;

--
-- Name: treino_id_treinos_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.treino_id_treinos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.treino_id_treinos_seq OWNER TO neondb_owner;

--
-- Name: treino_id_treinos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.treino_id_treinos_seq OWNED BY public.treino.id_treinos;


--
-- Name: acompanhamento id_acompanhamento; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.acompanhamento ALTER COLUMN id_acompanhamento SET DEFAULT nextval('public.acompanhamento_id_acompanhamento_seq'::regclass);


--
-- Name: administrador id_adm; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.administrador ALTER COLUMN id_adm SET DEFAULT nextval('public.administrador_id_adm_seq'::regclass);


--
-- Name: alimento id_alimento; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.alimento ALTER COLUMN id_alimento SET DEFAULT nextval('public.alimento_id_alimento_seq'::regclass);


--
-- Name: atleta id_atleta; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.atleta ALTER COLUMN id_atleta SET DEFAULT nextval('public.atleta_id_atleta_seq'::regclass);


--
-- Name: exercicio id_exercicio; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.exercicio ALTER COLUMN id_exercicio SET DEFAULT nextval('public.exercicio_id_exercicio_seq'::regclass);


--
-- Name: plano_exercicio id_plano_exercicio; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.plano_exercicio ALTER COLUMN id_plano_exercicio SET DEFAULT nextval('public.plano_exercicio_id_plano_exercicio_seq'::regclass);


--
-- Name: profissional id_profissional; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.profissional ALTER COLUMN id_profissional SET DEFAULT nextval('public.profissional_id_profissional_seq'::regclass);


--
-- Name: treino id_treinos; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.treino ALTER COLUMN id_treinos SET DEFAULT nextval('public.treino_id_treinos_seq'::regclass);


--
-- Data for Name: acompanhamento; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.acompanhamento (id_acompanhamento, id_atleta, id_profissional, data_inicio, data_termino, observacoes, id_cardapio, id_treino_exercicio) FROM stdin;
1	1	1	2024-01-05	2024-02-05	Boa evolução até agora.	1	1
2	2	2	2024-01-07	2024-02-07	Necessita melhorar o desempenho.	2	2
\.


--
-- Data for Name: administrador; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.administrador (id_adm, nome, email, senha, "codigo_segurança", data_cadastro) FROM stdin;
1	Admin Geral	admin@email.com	admin123	cod123	2024-01-01 08:00:00
\.


--
-- Data for Name: alimento; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.alimento (id_alimento, nome, grupo, carboidratos, descricao, proteinas, gorduras) FROM stdin;
1	Arroz Integral	Carboidrato	45	Fonte de energia de digestão lenta.	3	1
2	Peito de Frango	Proteína	0	Rico em proteína magra.	30	3.5
\.


--
-- Data for Name: atleta; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.atleta (id_atleta, nome, data_nascimento, email, senha, termos_uso, genero, data_cadastro) FROM stdin;
1	Lucas Silva	2000-05-10	lucas@email.com	senha123	t	Masculino	2024-01-01 09:30:00
2	Ana Costa	1998-09-15	ana@email.com	senha456	t	Feminino	2024-01-02 10:00:00
\.


--
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.cardapio (id_cardapio, nome, tipo, horario_inicio, horario_fim, kcal_max, observacoes, data_criacao, dias, id_alimento, quantidade_alimento) FROM stdin;
1	Café da Manhã	Matinal	07:00:00	08:00:00	400	Café leve com proteína.	2024-01-10	Segunda a sexta	1	150
2	Almoço	Principal	12:00:00	13:00:00	700	Refeição rica em proteínas.	2024-01-10	Segunda a sexta	2	200
\.


--
-- Data for Name: exercicio; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.exercicio (id_exercicio, nome, descricao, icone_treino, video_url, grupo_muscular, equipamento) FROM stdin;
2	Agachamento	Exercício para pernas	icone_agachamento.png	https://www.youtube.com/shorts/wzsUfTMPrEg	Pernas	Halteres
1	Supino Reto	Exercício para peitoral	icone_supino.png	https://www.youtube.com/shorts/50RSzhMG5Hc	Peitoral	Barra
\.


--
-- Data for Name: plano_exercicio; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.plano_exercicio (id_plano_exercicio, id_treino, observacoes) FROM stdin;
1	1	Aquecimento leve antes do exercício.
2	2	Utilizar carga moderada.
\.


--
-- Data for Name: profissional; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.profissional (id_profissional, nome, email, senha, cpf, profissao, registro_profissional, telefone, data_cadastro) FROM stdin;
1	Carlos Mendes	carlos@email.com	senha789	12345678900	Nutricionista	CRN123456	11999999999	2024-01-03 14:00:00
2	Juliana Rocha	juliana@email.com	senha321	09876543211	Personal Trainer	CREF654321	11988888888	2024-01-03 15:00:00
\.


--
-- Data for Name: treino; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.treino (id_treinos, nome, data_criacao, objetivo, frequencia, criador, id_exercicio, series, repeticoes, cargas) FROM stdin;
1	Treino A	2025-05-15	Hipertrofia	t	João	1	4	12	50.5
3	Treino A	2024-01-05	Hipertrofia	t	Carlos Mendes	1	4	12	35.5
2	Treino B	2024-01-06	Resistência	f	Juliana Rocha	2	3	15	20
\.


--
-- Name: acompanhamento_id_acompanhamento_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.acompanhamento_id_acompanhamento_seq', 1, false);


--
-- Name: administrador_id_adm_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.administrador_id_adm_seq', 1, false);


--
-- Name: alimento_id_alimento_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.alimento_id_alimento_seq', 1, false);


--
-- Name: atleta_id_atleta_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.atleta_id_atleta_seq', 1, false);


--
-- Name: cardapio_id_cardapio_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.cardapio_id_cardapio_seq', 1, false);


--
-- Name: exercicio_id_exercicio_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.exercicio_id_exercicio_seq', 1, false);


--
-- Name: plano_exercicio_id_plano_exercicio_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.plano_exercicio_id_plano_exercicio_seq', 1, false);


--
-- Name: profissional_id_profissional_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.profissional_id_profissional_seq', 1, false);


--
-- Name: treino_id_treinos_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.treino_id_treinos_seq', 1, true);


--
-- Name: acompanhamento acompanhamento_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.acompanhamento
    ADD CONSTRAINT acompanhamento_pkey PRIMARY KEY (id_acompanhamento);


--
-- Name: administrador administrador_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (id_adm);


--
-- Name: alimento alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.alimento
    ADD CONSTRAINT alimento_pkey PRIMARY KEY (id_alimento);


--
-- Name: atleta atleta_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.atleta
    ADD CONSTRAINT atleta_pkey PRIMARY KEY (id_atleta);


--
-- Name: cardapio cardapio_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_pkey PRIMARY KEY (id_cardapio);


--
-- Name: exercicio exercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.exercicio
    ADD CONSTRAINT exercicio_pkey PRIMARY KEY (id_exercicio);


--
-- Name: plano_exercicio plano_exercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.plano_exercicio
    ADD CONSTRAINT plano_exercicio_pkey PRIMARY KEY (id_plano_exercicio);


--
-- Name: profissional profissional_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.profissional
    ADD CONSTRAINT profissional_pkey PRIMARY KEY (id_profissional);


--
-- Name: treino treino_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.treino
    ADD CONSTRAINT treino_pkey PRIMARY KEY (id_treinos);


--
-- Name: acompanhamento acompanhamento_id_atleta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.acompanhamento
    ADD CONSTRAINT acompanhamento_id_atleta_fkey FOREIGN KEY (id_atleta) REFERENCES public.atleta(id_atleta);


--
-- Name: acompanhamento acompanhamento_id_profissional_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.acompanhamento
    ADD CONSTRAINT acompanhamento_id_profissional_fkey FOREIGN KEY (id_profissional) REFERENCES public.profissional(id_profissional);


--
-- Name: plano_exercicio plano_exercicio_id_treino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.plano_exercicio
    ADD CONSTRAINT plano_exercicio_id_treino_fkey FOREIGN KEY (id_treino) REFERENCES public.treino(id_treinos);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

