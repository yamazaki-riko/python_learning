--
-- PostgreSQL database dump
--

\restrict rFOcqASFpGGoRzajLSVcJ1ODcjnMyn3qkDDof5ezvnHEe7gzvO3tjsDYE6K6iiG

-- Dumped from database version 16.12 (Debian 16.12-1.pgdg13+1)
-- Dumped by pg_dump version 16.12 (Debian 16.12-1.pgdg13+1)

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
-- Name: koshien; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA koshien;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tmp_coaching_career; Type: TABLE; Schema: koshien; Owner: -
--

CREATE TABLE koshien.tmp_coaching_career (
    rank_no integer NOT NULL,
    manager_name character varying(50) NOT NULL,
    school_name character varying(50),
    appearances_spring smallint,
    appearances_summer smallint,
    appearances_total smallint,
    wins_spring smallint,
    wins_summer smallint,
    wins_total smallint,
    losses_spring smallint,
    losses_summer smallint,
    losses_total smallint,
    win_pct_spring numeric(4,3),
    win_pct_summer numeric(4,3),
    win_pct_total numeric(4,3),
    championships_spring smallint,
    championships_summer smallint,
    championships_total smallint,
    notable_players text,
    is_active text
);


--
-- Name: tmp_koshien_appearances_summer; Type: TABLE; Schema: koshien; Owner: -
--

CREATE TABLE koshien.tmp_koshien_appearances_summer (
    year integer NOT NULL,
    tournament_no character varying(10),
    district character varying(10),
    school_name character varying(50) NOT NULL,
    summer_appearances smallint
);


--
-- Name: COLUMN tmp_koshien_appearances_summer.year; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_koshien_appearances_summer.year IS '年';


--
-- Name: COLUMN tmp_koshien_appearances_summer.tournament_no; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_koshien_appearances_summer.tournament_no IS '大会回数';


--
-- Name: COLUMN tmp_koshien_appearances_summer.district; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_koshien_appearances_summer.district IS '地区';


--
-- Name: COLUMN tmp_koshien_appearances_summer.school_name; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_koshien_appearances_summer.school_name IS '学校名';


--
-- Name: COLUMN tmp_koshien_appearances_summer.summer_appearances; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_koshien_appearances_summer.summer_appearances IS '出場回数_夏';


--
-- Name: tmp_media_rank; Type: TABLE; Schema: koshien; Owner: -
--

CREATE TABLE koshien.tmp_media_rank (
    year integer NOT NULL,
    district character varying(10),
    school_name character varying(50) NOT NULL,
    nikkan_sports_rating character(1),
    sponichi_rating character(1),
    sankei_sports_rating character(1),
    sports_hochi_rating character(1),
    chunichi_sports_rating character(1),
    draft_mtg_site_rating character(1),
    media_avg_score numeric(3,1),
    media_rank integer,
    num_papers_a_or_above integer
);


--
-- Name: COLUMN tmp_media_rank.year; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.year IS '年';


--
-- Name: COLUMN tmp_media_rank.district; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.district IS '地区';


--
-- Name: COLUMN tmp_media_rank.school_name; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.school_name IS '学校名';


--
-- Name: COLUMN tmp_media_rank.nikkan_sports_rating; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.nikkan_sports_rating IS '日刊スポーツ';


--
-- Name: COLUMN tmp_media_rank.sponichi_rating; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.sponichi_rating IS 'スポーツニッポン';


--
-- Name: COLUMN tmp_media_rank.sankei_sports_rating; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.sankei_sports_rating IS 'サンケイスポーツ';


--
-- Name: COLUMN tmp_media_rank.sports_hochi_rating; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.sports_hochi_rating IS 'スポーツ報知';


--
-- Name: COLUMN tmp_media_rank.chunichi_sports_rating; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.chunichi_sports_rating IS '中日スポーツ';


--
-- Name: COLUMN tmp_media_rank.draft_mtg_site_rating; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.draft_mtg_site_rating IS 'ドラフト会議サイト';


--
-- Name: COLUMN tmp_media_rank.media_avg_score; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.media_avg_score IS 'メディア平均スコア';


--
-- Name: COLUMN tmp_media_rank.media_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.media_rank IS 'メディア順位';


--
-- Name: COLUMN tmp_media_rank.num_papers_a_or_above; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_media_rank.num_papers_a_or_above IS 'A以上の紙数';


--
-- Name: tmp_team_batting_stats; Type: TABLE; Schema: koshien; Owner: -
--

CREATE TABLE koshien.tmp_team_batting_stats (
    year integer NOT NULL,
    tournament character varying(20) NOT NULL,
    school_name character varying(50) NOT NULL,
    prefecture_name character varying(50),
    game_count smallint,
    team_batting_avg numeric(4,3),
    batting_avg_rank smallint,
    total_runs numeric(4,1),
    total_runs_rank smallint,
    runs_per_game numeric(3,1),
    runs_per_game_rank smallint,
    home_runs numeric(4,1),
    home_runs_rank smallint,
    home_runs_per_game numeric(3,1),
    home_runs_per_game_rank smallint,
    total_stolen_bases numeric(4,1),
    stolen_bases_rank smallint,
    stolen_bases_per_game numeric(3,1),
    stolen_bases_per_game_rank smallint,
    total_sacrifice_bunts numeric(4,1),
    sacrifice_bunts_rank smallint,
    sacrifice_bunts_per_game numeric(3,1),
    sacrifice_bunts_per_game_rank smallint
);


--
-- Name: COLUMN tmp_team_batting_stats.year; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.year IS '年';


--
-- Name: COLUMN tmp_team_batting_stats.tournament; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.tournament IS '春/夏';


--
-- Name: COLUMN tmp_team_batting_stats.school_name; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.school_name IS '高校名';


--
-- Name: COLUMN tmp_team_batting_stats.prefecture_name; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.prefecture_name IS '県名';


--
-- Name: COLUMN tmp_team_batting_stats.game_count; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.game_count IS '試合数';


--
-- Name: COLUMN tmp_team_batting_stats.team_batting_avg; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.team_batting_avg IS 'チーム打率';


--
-- Name: COLUMN tmp_team_batting_stats.batting_avg_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.batting_avg_rank IS '打率順位';


--
-- Name: COLUMN tmp_team_batting_stats.total_runs; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.total_runs IS '総得点';


--
-- Name: COLUMN tmp_team_batting_stats.total_runs_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.total_runs_rank IS '総得点順位';


--
-- Name: COLUMN tmp_team_batting_stats.runs_per_game; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.runs_per_game IS '1試合あたり得点';


--
-- Name: COLUMN tmp_team_batting_stats.runs_per_game_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.runs_per_game_rank IS '得点順位';


--
-- Name: COLUMN tmp_team_batting_stats.home_runs; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.home_runs IS '本塁打';


--
-- Name: COLUMN tmp_team_batting_stats.home_runs_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.home_runs_rank IS '本塁打順位';


--
-- Name: COLUMN tmp_team_batting_stats.home_runs_per_game; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.home_runs_per_game IS '1試合あたり本塁打';


--
-- Name: COLUMN tmp_team_batting_stats.home_runs_per_game_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.home_runs_per_game_rank IS '本塁打順位(per game)';


--
-- Name: COLUMN tmp_team_batting_stats.total_stolen_bases; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.total_stolen_bases IS '総盗塁数';


--
-- Name: COLUMN tmp_team_batting_stats.stolen_bases_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.stolen_bases_rank IS '盗塁順位';


--
-- Name: COLUMN tmp_team_batting_stats.stolen_bases_per_game; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.stolen_bases_per_game IS '1試合あたり盗塁数';


--
-- Name: COLUMN tmp_team_batting_stats.stolen_bases_per_game_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.stolen_bases_per_game_rank IS '盗塁順位(per game)';


--
-- Name: COLUMN tmp_team_batting_stats.total_sacrifice_bunts; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.total_sacrifice_bunts IS '総犠打数';


--
-- Name: COLUMN tmp_team_batting_stats.sacrifice_bunts_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.sacrifice_bunts_rank IS '犠打順位';


--
-- Name: COLUMN tmp_team_batting_stats.sacrifice_bunts_per_game; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.sacrifice_bunts_per_game IS '1試合あたり犠打数';


--
-- Name: COLUMN tmp_team_batting_stats.sacrifice_bunts_per_game_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_batting_stats.sacrifice_bunts_per_game_rank IS '犠打順位(per game)';


--
-- Name: tmp_team_pitching_stats; Type: TABLE; Schema: koshien; Owner: -
--

CREATE TABLE koshien.tmp_team_pitching_stats (
    year integer NOT NULL,
    tournament character varying(20) NOT NULL,
    school_name character varying(50) NOT NULL,
    prefecture_name character varying(50),
    game_count smallint,
    team_era numeric(4,2),
    era_rank smallint,
    total_runs_allowed numeric(4,1),
    total_runs_allowed_rank smallint,
    runs_allowed_per_game numeric(4,1),
    runs_allowed_per_game_rank smallint,
    total_errors numeric(4,1),
    total_errors_rank smallint,
    errors_per_game numeric(3,1),
    errors_per_game_rank smallint
);


--
-- Name: COLUMN tmp_team_pitching_stats.year; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.year IS '年';


--
-- Name: COLUMN tmp_team_pitching_stats.tournament; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.tournament IS '春/夏';


--
-- Name: COLUMN tmp_team_pitching_stats.school_name; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.school_name IS '高校名';


--
-- Name: COLUMN tmp_team_pitching_stats.prefecture_name; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.prefecture_name IS '県名';


--
-- Name: COLUMN tmp_team_pitching_stats.game_count; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.game_count IS '試合数';


--
-- Name: COLUMN tmp_team_pitching_stats.team_era; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.team_era IS 'チーム防御率';


--
-- Name: COLUMN tmp_team_pitching_stats.era_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.era_rank IS '防御率順位';


--
-- Name: COLUMN tmp_team_pitching_stats.total_runs_allowed; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.total_runs_allowed IS '総失点';


--
-- Name: COLUMN tmp_team_pitching_stats.total_runs_allowed_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.total_runs_allowed_rank IS '総失点順位';


--
-- Name: COLUMN tmp_team_pitching_stats.runs_allowed_per_game; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.runs_allowed_per_game IS '1試合あたり失点';


--
-- Name: COLUMN tmp_team_pitching_stats.runs_allowed_per_game_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.runs_allowed_per_game_rank IS '失点順位(per game)';


--
-- Name: COLUMN tmp_team_pitching_stats.total_errors; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.total_errors IS '総失策数';


--
-- Name: COLUMN tmp_team_pitching_stats.total_errors_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.total_errors_rank IS '総失策順位';


--
-- Name: COLUMN tmp_team_pitching_stats.errors_per_game; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.errors_per_game IS '1試合あたり失策';


--
-- Name: COLUMN tmp_team_pitching_stats.errors_per_game_rank; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_team_pitching_stats.errors_per_game_rank IS '失策順位(per game)';


--
-- Name: tmp_tournament_games; Type: TABLE; Schema: koshien; Owner: -
--

CREATE TABLE koshien.tmp_tournament_games (
    year integer NOT NULL,
    tournament_no character varying(10),
    game_date character varying(10) NOT NULL,
    game_order integer,
    round_name character varying(10) NOT NULL,
    winner_school character varying(50) NOT NULL,
    winner_score smallint,
    loser_score smallint,
    loser_school character varying(50),
    remarks text
);


--
-- Name: COLUMN tmp_tournament_games.year; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.year IS '年';


--
-- Name: COLUMN tmp_tournament_games.tournament_no; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.tournament_no IS '大会回数';


--
-- Name: COLUMN tmp_tournament_games.game_date; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.game_date IS '日付';


--
-- Name: COLUMN tmp_tournament_games.game_order; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.game_order IS '試合順';


--
-- Name: COLUMN tmp_tournament_games.round_name; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.round_name IS '回戦';


--
-- Name: COLUMN tmp_tournament_games.winner_school; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.winner_school IS '勝利校';


--
-- Name: COLUMN tmp_tournament_games.winner_score; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.winner_score IS '得点_勝利校';


--
-- Name: COLUMN tmp_tournament_games.loser_score; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.loser_score IS '得点_敗戦校';


--
-- Name: COLUMN tmp_tournament_games.loser_school; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.loser_school IS '敗戦校';


--
-- Name: COLUMN tmp_tournament_games.remarks; Type: COMMENT; Schema: koshien; Owner: -
--

COMMENT ON COLUMN koshien.tmp_tournament_games.remarks IS '備考';


--
-- Data for Name: tmp_coaching_career; Type: TABLE DATA; Schema: koshien; Owner: -
--

COPY koshien.tmp_coaching_career (rank_no, manager_name, school_name, appearances_spring, appearances_summer, appearances_total, wins_spring, wins_summer, wins_total, losses_spring, losses_summer, losses_total, win_pct_spring, win_pct_summer, win_pct_total, championships_spring, championships_summer, championships_total, notable_players, is_active) FROM stdin;
1	西谷浩一	大阪桐蔭	13	10	23	33	36	69	8	6	14	0.805	0.857	0.831	4	4	8	中村剛也／西岡剛／中田翔／浅村栄斗	現役
2	高嶋仁	智弁学園／智弁和歌山	14	24	38	30	38	68	13	22	35	0.697	0.633	0.660	1	2	3	高代延博／中谷仁／西川遥輝／林晃汰	引退
3	中村順司	PL学園	10	6	16	31	27	58	7	3	10	0.815	0.900	0.853	3	3	6	清原和博／桑田真澄／立浪和義／松井稼頭央	引退
4	馬淵史郎	明徳義塾	16	20	36	19	35	54	15	20	35	0.559	0.636	0.607	0	1	1	森岡良介／伊藤光／岸潤一郎／西浦颯大	現役
5	渡辺元智	横浜	15	12	27	23	28	51	12	20	22	0.657	0.736	0.699	3	2	5	松坂大輔／涌井秀章／筒香嘉智／近藤健介	引退
5	前田三夫	帝京	14	12	26	21	30	51	13	10	23	0.618	0.750	0.689	1	2	3	森本稀哲／杉谷拳士／原口文仁／山崎康晃	引退
7	木内幸男	取手二／常総学院	7	15	22	13	27	40	6	13	19	0.684	0.675	0.678	1	2	3	松沼博久／松沼雅之／仁志敏久／金子誠	引退
7	阪口慶三	東邦／大垣日大	18	17	35	24	16	40	17	17	34	0.585	0.485	0.541	1	0	1	山倉和博／朝倉健太／滝野要／橋本侑樹	引退
9	中井哲之	広陵	14	9	23	24	15	39	12	9	21	0.657	0.625	0.650	2	0	2	二岡智宏／野村祐輔／小林誠司／中村奨成	現役
10	蔦文也	池田	7	7	14	21	16	37	5	6	11	0.808	0.727	0.771	2	1	3	畠山準／水野雄仁	引退
10	小倉全由	関東一／日大三	9	12	21	14	23	37	9	11	20	0.609	0.676	0.649	0	2	2	武田勝／近藤一樹／山崎福也／坂倉将吾	引退
12	尾藤公	箕島	8	6	14	22	13	35	5	5	10	0.815	0.722	0.778	3	1	4	東尾修／吉井理人	引退
13	深谷弘次	中京商／三重／中京	8	8	16	16	17	33	5	7	12	0.762	0.739	0.717	2	1	3	江藤省三／木俣達彦	引退
14	北野尚文	福井商	17	19	36	14	17	31	17	19	36	0.452	0.472	0.463	0	0	0	横山竜士／天谷宗一郎／中村悠平	引退
14	原田英彦	平安／龍谷大平安	11	8	19	19	12	31	10	8	18	0.655	0.600	0.633	1	0	1	川口知哉／炭谷銀仁朗／高橋奎二	現役
14	門馬敬治	東海大相模／創志学園	9	4	13	21	10	31	5	3	8	0.808	0.769	0.795	3	1	4	菅野智之／田中広輔／大田泰示／小笠原慎之介	現役
17	竹田利秋	東北／仙台育英	13	14	27	12	18	30	13	14	27	0.480	0.563	0.526	0	0	0	安部理／佐々木主浩／斎藤隆／金村曉	引退
18	佐々木順一朗	仙台育英／学法石川	7	13	20	7	22	29	7	13	20	0.500	0.628	0.592	0	0	0	佐藤由規／松原聖弥／上林誠知	現役
18	杉浦藤文	中京商／中京	7	6	13	10	19	29	6	5	11	0.625	0.792	0.725	1	1	2	紀藤真琴／野中徹博	引退
18	斎藤智也	聖光学院	6	18	24	5	24	29	6	18	24	0.455	0.571	0.547	0	0	0	歳内宏明／岡野祐一郎／八百板卓丸／湯浅京己	現役
21	森士	浦和学院	10	12	22	20	8	28	9	12	21	0.690	0.400	0.571	1	0	1	木塚敦志／大竹寛／小島和哉	引退
21	多賀章仁	近江	7	16	23	9	19	28	7	16	23	0.563	0.543	0.548	0	0	0	植田海／京山将弥／土田龍空	現役
23	栽弘義	豊見城／沖縄水産	6	11	17	2	25	27	6	11	17	0.250	0.694	0.614	0	0	0	石嶺和彦／大野倫／新垣渚	引退
23	仲井宗基	光星学院／八戸学院光星	7	8	15	9	18	27	7	8	15	0.563	0.643	0.650	0	0	0	北條史也／田村龍弘／武岡龍世	現役
25	三原新二郎	広陵／福井／京都西・京都外大西	6	8	14	11	15	26	6	8	14	0.647	0.652	0.650	0	0	0	大野雄大／辻孟彦／森原康平／中川皓太	引退
25	久保克之	鹿児島実	7	12	19	12	14	26	6	12	18	0.667	0.538	0.591	1	0	1	定岡智秋／定岡正二／鹿島忠／杉内俊哉	引退
25	枦山智博	鹿児島商工／樟南	7	16	23	4	22	26	7	16	23	0.364	0.579	0.531	0	0	0	大西崇之／田村恵／鶴岡慎也／大和	引退
28	谷脇一夫	高知商	5	9	14	9	16	25	4	9	13	0.692	0.640	0.658	1	0	1	中西清起／中山裕章／岡林洋一	引退
28	上甲正典	宇和島東／済美	6	11	17	16	9	25	4	11	15	0.800	0.450	0.625	2	0	2	平井正史／岩村明憲／福井優也／安樂智大	引退
30	玉国光男	宇部商	5	11	16	5	19	24	5	11	16	0.500	0.633	0.600	0	0	0	秋村謙宏／上本達之／嶋村一輝	引退
30	小坂将商	智弁学園	7	8	15	11	13	24	5	8	13	0.688	0.619	0.649	1	0	1	枡田慎太郎／岡本和真／廣岡大志／前川右京	現役
32	古屋文雄	横浜商	3	5	8	10	13	23	3	5	8	0.769	0.722	0.742	0	0	0	荒井幸雄／河原隆一	引退
32	斉藤一之	銚子商	5	6	11	6	17	23	5	5	10	0.545	0.773	0.697	0	1	1	篠塚和典／宇野勝	引退
32	永田裕治	報徳学園／日大三島	12	8	20	15	8	23	11	8	19	0.577	0.500	0.548	1	0	1	山崎勝己／大谷智久／小園海斗	現役
32	吉田洸二	清峰／山梨学院	8	8	16	18	5	23	5	8	13	0.783	0.429	0.639	2	0	2	今村猛／垣越建伸	現役
\.


--
-- Data for Name: tmp_koshien_appearances_summer; Type: TABLE DATA; Schema: koshien; Owner: -
--

COPY koshien.tmp_koshien_appearances_summer (year, tournament_no, district, school_name, summer_appearances) FROM stdin;
2022	第104回	北北海道	旭川大高	8
2022	第104回	南北海道	札幌大谷	2
2022	第104回	青森	八戸学院光星	12
2022	第104回	岩手	一関学院	4
2022	第104回	秋田	能代松陽	1
2022	第104回	山形	鶴岡東	12
2022	第104回	宮城	仙台育英	20
2022	第104回	福島	聖光学院	17
2022	第104回	茨城	明秀日立	5
2022	第104回	栃木	国学院栃木	6
2022	第104回	群馬	樹徳	4
2022	第104回	埼玉	聖望学園	2
2022	第104回	千葉	市船橋	9
2022	第104回	東東京	二松学舎大付	7
2022	第104回	西東京	日大三	22
2022	第104回	神奈川	横浜	25
2022	第104回	山梨	日本航空	8
2022	第104回	長野	佐久長聖	4
2022	第104回	新潟	日本文理	13
2022	第104回	富山	高岡商	25
2022	第104回	石川	星稜	25
2022	第104回	福井	敦賀気比	14
2022	第104回	静岡	日大三島	3
2022	第104回	愛知	愛工大名電	20
2022	第104回	岐阜	県岐阜商	31
2022	第104回	三重	三重	8
2022	第104回	滋賀	近江	17
2022	第104回	京都	京都国際	3
2022	第104回	奈良	天理	34
2022	第104回	和歌山	智辯和歌山	20
2022	第104回	大阪	大阪桐蔭	13
2022	第104回	兵庫	社	5
2022	第104回	岡山	創志学園	7
2022	第104回	広島	盈進	1
2022	第104回	鳥取	鳥取商	7
2022	第104回	島根	浜田	3
2022	第104回	山口	下関国際	4
2022	第104回	香川	高松商	31
2022	第104回	愛媛	帝京五	2
2022	第104回	徳島	鳴門	15
2022	第104回	高知	明徳義塾	18
2022	第104回	福岡	九州国際大付	9
2022	第104回	佐賀	有田工	3
2022	第104回	長崎	海星	14
2022	第104回	熊本	九州学院	6
2022	第104回	大分	明豊	9
2022	第104回	宮崎	富島	3
2022	第104回	鹿児島	鹿児島実	23
2022	第104回	沖縄	興南	14
2023	第105回	北北海道	クラーク国際	1
2023	第105回	南北海道	北海	22
2023	第105回	青森	八戸学院光星	13
2023	第105回	岩手	花巻東	13
2023	第105回	秋田	明桜	9
2023	第105回	山形	日大山形	12
2023	第105回	宮城	仙台育英	21
2023	第105回	福島	聖光学院	18
2023	第105回	茨城	土浦日大	2
2023	第105回	栃木	文星芸大付	5
2023	第105回	群馬	前橋商	14
2023	第105回	埼玉	浦和学院	16
2023	第105回	千葉	専大松戸	2
2023	第105回	東東京	共栄学園	1
2023	第105回	西東京	日大三	23
2023	第105回	神奈川	慶應義塾	11
2023	第105回	山梨	東海大甲府	14
2023	第105回	長野	上田西	3
2023	第105回	新潟	東京学館新潟	2
2023	第105回	富山	富山商	13
2023	第105回	石川	星稜	26
2023	第105回	福井	北陸	5
2023	第105回	静岡	浜松開誠館	2
2023	第105回	愛知	愛工大名電	21
2023	第105回	岐阜	大垣日大	12
2023	第105回	三重	いなべ総合	2
2023	第105回	滋賀	近江	18
2023	第105回	京都	立命館宇治	4
2023	第105回	奈良	智辯学園	16
2023	第105回	和歌山	市和歌山	5
2023	第105回	大阪	履正社	10
2023	第105回	兵庫	社	6
2023	第105回	岡山	おかやま山陽	2
2023	第105回	広島	広陵	33
2023	第105回	鳥取	鳥取商	8
2023	第105回	島根	立正大淞南	6
2023	第105回	山口	宇部鴻城	8
2023	第105回	香川	英明	3
2023	第105回	愛媛	川之江	3
2023	第105回	徳島	徳島商	21
2023	第105回	高知	高知中央	3
2023	第105回	福岡	九州国際大付	10
2023	第105回	佐賀	鳥栖工	1
2023	第105回	長崎	創成館	4
2023	第105回	熊本	東海大熊本星翔	1
2023	第105回	大分	明豊	10
2023	第105回	宮崎	宮崎学園	1
2023	第105回	鹿児島	神村学園	5
2023	第105回	沖縄	沖縄尚学	12
2024	第106回	北北海道	白樺学園	3
2024	第106回	南北海道	札幌日大	1
2024	第106回	青森	青森山田	9
2024	第106回	岩手	花巻東	14
2024	第106回	秋田	金足農	7
2024	第106回	山形	鶴岡東	13
2024	第106回	宮城	聖和学園	0
2024	第106回	福島	聖光学院	19
2024	第106回	茨城	霞ケ浦	6
2024	第106回	栃木	石橋	1
2024	第106回	群馬	健大高崎	6
2024	第106回	埼玉	花咲徳栄	8
2024	第106回	千葉	木更津総合	9
2024	第106回	東東京	関東一	15
2024	第106回	西東京	早稲田実業	12
2024	第106回	神奈川	東海大相模	20
2024	第106回	山梨	山梨学院	7
2024	第106回	長野	上田西	4
2024	第106回	新潟	新潟明訓	7
2024	第106回	富山	富山商	14
2024	第106回	石川	小松大谷	2
2024	第106回	福井	北陸	6
2024	第106回	静岡	掛川西	3
2024	第106回	愛知	愛工大名電	22
2024	第106回	岐阜	大垣日大	13
2024	第106回	三重	菰野	2
2024	第106回	滋賀	滋賀学園	3
2024	第106回	京都	京都国際	4
2024	第106回	奈良	智辯学園	17
2024	第106回	和歌山	智辯和歌山	21
2024	第106回	大阪	大阪桐蔭	14
2024	第106回	兵庫	報徳学園	22
2024	第106回	岡山	創志学園	8
2024	第106回	広島	広陵	34
2024	第106回	鳥取	鳥取城北	9
2024	第106回	島根	石見智翠館	8
2024	第106回	山口	南陽工	3
2024	第106回	香川	英明	4
2024	第106回	愛媛	帝京五	3
2024	第106回	徳島	阿南光	4
2024	第106回	高知	明徳義塾	19
2024	第106回	福岡	西日本短大附	4
2024	第106回	佐賀	有田工	4
2024	第106回	長崎	海星	15
2024	第106回	熊本	熊本工	23
2024	第106回	大分	明豊	11
2024	第106回	宮崎	聖心ウルスラ	1
2024	第106回	鹿児島	神村学園	6
2024	第106回	沖縄	興南	15
2025	第107回	北北海道	旭川志峯	0
2025	第107回	南北海道	北海	23
2025	第107回	青森	弘前学院聖愛	4
2025	第107回	岩手	花巻東	15
2025	第107回	秋田	金足農	8
2025	第107回	山形	日大山形	13
2025	第107回	宮城	仙台育英	22
2025	第107回	福島	聖光学院	20
2025	第107回	茨城	明秀日立	6
2025	第107回	栃木	青藍泰斗	1
2025	第107回	群馬	健大高崎	7
2025	第107回	埼玉	叡明	1
2025	第107回	千葉	市立船橋	9
2025	第107回	東東京	関東一	16
2025	第107回	西東京	横浜	26
2025	第107回	神奈川	東海大相模	21
2025	第107回	山梨	山梨学院	8
2025	第107回	長野	松商学園	15
2025	第107回	新潟	帝京長岡	3
2025	第107回	富山	富山商	15
2025	第107回	石川	星稜	27
2025	第107回	福井	北陸	7
2025	第107回	静岡	知徳	2
2025	第107回	愛知	享栄	17
2025	第107回	岐阜	大垣日大	14
2025	第107回	三重	菰野	3
2025	第107回	滋賀	近江	19
2025	第107回	京都	京都国際	5
2025	第107回	奈良	智辯学園	18
2025	第107回	和歌山	智辯和歌山	22
2025	第107回	大阪	大阪桐蔭	15
2025	第107回	兵庫	報徳学園	23
2025	第107回	岡山	岡山学芸館	4
2025	第107回	広島	広陵	35
2025	第107回	鳥取	鳥取城北	10
2025	第107回	島根	開星	11
2025	第107回	山口	宇部鴻城	9
2025	第107回	香川	英明	5
2025	第107回	愛媛	今治西	11
2025	第107回	徳島	阿南光	5
2025	第107回	高知	明徳義塾	20
2025	第107回	福岡	九州国際大付	11
2025	第107回	佐賀	唐津商	10
2025	第107回	長崎	長崎日大	5
2025	第107回	熊本	熊本工	24
2025	第107回	大分	明豊	12
2025	第107回	宮崎	日章学園	6
2025	第107回	鹿児島	神村学園	7
2025	第107回	沖縄	沖縄尚学	13
\.


--
-- Data for Name: tmp_media_rank; Type: TABLE DATA; Schema: koshien; Owner: -
--

COPY koshien.tmp_media_rank (year, district, school_name, nikkan_sports_rating, sponichi_rating, sankei_sports_rating, sports_hochi_rating, chunichi_sports_rating, draft_mtg_site_rating, media_avg_score, media_rank, num_papers_a_or_above) FROM stdin;
2022	神奈川	横浜	A	A	A	A	\N	\N	4.0	1	5
2022	滋賀	近江	A	A	A	A	\N	\N	4.0	1	5
2022	大阪	大阪桐蔭	A	A	A	A	\N	\N	4.0	1	5
2022	広島	広陵	A	A	A	A	\N	\N	4.0	1	5
2022	福岡	九州国際大付	A	A	A	A	\N	\N	4.0	1	5
2022	茨城	明秀日立	A	B	A	A	\N	\N	3.8	6	4
2022	宮城	仙台育英	B	A	A	B	\N	\N	3.4	7	2
2022	青森	八戸学院光星	B	B	B	B	\N	\N	3.0	8	0
2022	福島	聖光学院	B	B	B	B	\N	\N	3.0	8	0
2022	千葉	市船橋	B	B	B	B	\N	\N	3.0	8	0
2022	東東京	二松学舎大付	B	B	B	B	\N	\N	3.0	8	0
2022	西東京	日大三	B	B	B	B	\N	\N	3.0	8	0
2022	石川	星稜	B	B	B	B	\N	\N	3.0	8	0
2022	福井	敦賀気比	B	B	B	B	\N	\N	3.0	8	0
2022	愛知	愛工大名電	B	B	B	B	\N	\N	3.0	8	0
2022	岐阜	大垣日大	B	B	B	B	\N	\N	3.0	8	0
2022	京都	龍谷大平安	B	B	B	B	\N	\N	3.0	8	0
2022	兵庫	社	B	B	B	B	\N	\N	3.0	8	0
2022	奈良	天理	B	B	B	B	\N	\N	3.0	8	0
2022	和歌山	智辯和歌山	B	B	B	B	\N	\N	3.0	8	0
2022	岡山	創志学園	B	B	B	B	\N	\N	3.0	8	0
2022	香川	高松商	B	B	B	B	\N	\N	3.0	8	0
2022	徳島	鳴門	B	B	B	B	\N	\N	3.0	8	0
2022	高知	明徳義塾	B	B	B	B	\N	\N	3.0	8	0
2022	大分	明豊	B	B	B	B	\N	\N	3.0	8	0
2022	鹿児島	鹿児島実	B	B	B	B	\N	\N	3.0	8	0
2022	沖縄	興南	B	B	B	B	\N	\N	3.0	8	0
2022	岩手	一関学院	C	B	B	C	\N	\N	2.8	28	1
2022	栃木	国学院栃木	B	B	B	C	\N	\N	2.8	28	0
2022	埼玉	聖望学園	B	B	B	C	\N	\N	2.8	28	0
2022	長野	上田西	B	B	B	C	\N	\N	2.8	28	0
2022	南北海道	札幌大谷	C	B	B	C	\N	\N	2.6	32	0
2022	山形	鶴岡東	B	B	B	C	\N	\N	2.6	32	0
2022	北北海道	旭川大高	C	B	B	C	\N	\N	2.4	34	0
2022	群馬	樹徳	C	C	B	B	\N	\N	2.4	34	0
2022	秋田	能代松陽	C	C	C	C	\N	\N	2.0	36	0
2022	山梨	日本航空	C	C	C	C	\N	\N	2.0	36	0
2022	新潟	日本文理	C	C	C	C	\N	\N	2.0	36	0
2022	富山	高岡商	C	C	C	C	\N	\N	2.0	36	0
2022	静岡	浜松開誠館	C	C	C	C	\N	\N	2.0	36	0
2022	三重	津田学園	C	C	C	C	\N	\N	2.0	36	0
2022	鳥取	米子東	C	C	C	C	\N	\N	2.0	36	0
2022	島根	石見智翠館	C	C	C	C	\N	\N	2.0	36	0
2022	山口	南陽工	C	C	C	C	\N	\N	2.0	36	0
2022	愛媛	松山聖陵	C	C	C	C	\N	\N	2.0	36	0
2022	佐賀	有田工	C	C	C	C	\N	\N	2.0	36	0
2022	長崎	海星	C	C	C	C	\N	\N	2.0	36	0
2022	熊本	文徳	C	C	C	C	\N	\N	2.0	36	0
2022	宮崎	日南学園	C	C	C	C	\N	\N	2.0	36	0
2023	宮城	仙台育英	A	特	A	A	\N	\N	4.2	1	5
2023	神奈川	慶應義塾	A	A	A	A	\N	\N	4.0	2	5
2023	滋賀	近江	A	A	A	A	\N	\N	4.0	2	5
2023	大阪	大阪桐蔭	A	A	A	A	\N	\N	4.0	2	5
2023	兵庫	報徳学園	A	A	A	A	\N	\N	4.0	2	5
2023	広島	広陵	A	A	A	A	\N	\N	4.0	2	5
2023	福岡	九州国際大付	A	A	A	A	\N	\N	4.0	2	5
2023	鹿児島	神村学園	A	A	A	A	\N	\N	4.0	2	5
2023	岩手	花巻東	B	B	A	B	\N	\N	3.2	9	1
2023	青森	八戸学院光星	B	B	B	B	\N	\N	3.0	10	0
2023	茨城	土浦日大	B	B	B	B	\N	\N	3.0	10	0
2023	埼玉	浦和学院	B	B	B	B	\N	\N	3.0	10	0
2023	千葉	専大松戸	B	B	B	B	\N	\N	3.0	10	0
2023	東東京	関東一	B	B	B	B	\N	\N	3.0	10	0
2023	西東京	日大三	B	B	B	B	\N	\N	3.0	10	0
2023	石川	星稜	B	B	B	B	\N	\N	3.0	10	0
2023	愛知	愛工大名電	B	B	B	B	\N	\N	3.0	10	0
2023	京都	京都国際	B	B	B	B	\N	\N	3.0	10	0
2023	奈良	智辯学園	B	B	B	B	\N	\N	3.0	10	0
2023	香川	高松商	B	B	B	B	\N	\N	3.0	10	0
2023	高知	明徳義塾	B	B	B	B	\N	\N	3.0	10	0
2023	大分	明豊	B	B	B	B	\N	\N	3.0	10	0
2023	沖縄	沖縄尚学	B	B	B	B	\N	\N	3.0	10	0
2023	南北海道	北海	C	B	B	B	\N	\N	2.8	24	0
2023	山形	日大山形	B	B	B	C	\N	\N	2.8	24	0
2023	群馬	前橋商	B	B	B	C	\N	\N	2.8	24	0
2023	山梨	東海大甲府	B	B	B	C	\N	\N	2.8	24	0
2023	長野	上田西	B	B	B	C	\N	\N	2.8	24	0
2023	静岡	聖隷クリストファー	B	B	B	C	\N	\N	2.8	24	0
2023	岐阜	大垣日大	B	B	B	C	\N	\N	2.8	24	0
2023	三重	三重	B	B	B	C	\N	\N	2.8	24	0
2023	和歌山	市和歌山	B	B	B	C	\N	\N	2.8	24	0
2023	岡山	おかやま山陽	B	B	B	C	\N	\N	2.8	24	0
2023	北北海道	クラーク国際	C	B	B	C	\N	\N	2.6	34	0
2023	福島	聖光学院	C	B	B	C	\N	\N	2.6	34	0
2023	栃木	文星芸大付	B	B	C	C	\N	\N	2.6	34	0
2023	秋田	明桜	B	C	B	C	\N	\N	2.4	37	0
2023	新潟	新潟明訓	C	C	C	C	\N	\N	2.0	38	0
2023	富山	富山商	C	C	C	C	\N	\N	2.0	38	0
2023	福井	北陸	C	C	C	C	\N	\N	2.0	38	0
2023	鳥取	鳥取城北	C	C	C	C	\N	\N	2.0	38	0
2023	島根	立正大淞南	C	C	C	C	\N	\N	2.0	38	0
2023	山口	宇部鴻城	C	C	C	C	\N	\N	2.0	38	0
2023	徳島	徳島商	C	C	C	C	\N	\N	2.0	38	0
2023	愛媛	宇和島東	C	C	C	C	\N	\N	2.0	38	0
2023	佐賀	有田工	C	C	C	C	\N	\N	2.0	38	0
2023	長崎	海星	C	C	C	C	\N	\N	2.0	38	0
2023	熊本	熊本工	C	C	C	C	\N	\N	2.0	38	0
2023	宮崎	宮崎商	C	C	C	C	\N	\N	2.0	38	0
2025	群馬	健大高崎	S	A	A	A	A	A	4.2	1	5
2025	東東京	関東一	A	A	A	A	A	A	4.0	2	5
2025	神奈川	東海大相模	A	A	A	A	A	A	4.0	2	5
2025	西東京	横浜	A	A	A	A	A	A	4.0	2	5
2025	京都	京都国際	A	A	A	A	A	A	4.0	2	5
2025	大阪	大阪桐蔭	A	A	A	A	A	A	4.0	2	5
2025	兵庫	報徳学園	A	A	A	A	A	A	4.0	2	5
2025	山梨	山梨学院	A	A	A	A	A	A	4.0	2	5
2025	福岡	九州国際大付	A	A	A	A	A	A	4.0	2	5
2025	鹿児島	神村学園	A	A	A	A	A	A	4.0	2	5
2025	広島	広陵	A	A	A	A	A	A	4.0	2	5
2025	宮城	仙台育英	A	A	A	A	B	B	3.8	12	4
2025	千葉	市立船橋	B	B	B	B	B	B	3.0	13	0
2025	埼玉	叡明	B	B	B	B	B	C	3.0	13	0
2025	新潟	帝京長岡	B	B	B	B	B	B	3.0	13	0
2025	愛知	享栄	B	B	B	B	B	B	3.0	13	0
2025	滋賀	近江	B	B	B	B	B	B	3.0	13	0
2025	三重	菰野	B	B	B	B	B	B	3.0	13	0
2025	奈良	智辯学園	B	B	B	B	B	B	3.0	13	0
2025	岐阜	大垣日大	B	B	B	B	B	B	3.0	13	0
2025	和歌山	智辯和歌山	B	B	B	B	B	B	3.0	13	0
2025	石川	星稜	B	B	B	B	B	B	3.0	13	0
2025	静岡	知徳	B	B	B	B	B	B	3.0	13	0
2025	沖縄	沖縄尚学	B	B	B	B	B	B	3.0	13	0
2025	香川	英明	B	B	B	B	B	B	3.0	13	0
2025	愛媛	今治西	B	B	B	B	B	B	3.0	13	0
2025	大分	明豊	B	B	B	B	B	B	3.0	13	0
2025	高知	明徳義塾	B	B	B	B	B	B	3.0	13	0
2025	岡山	岡山学芸館	B	B	B	B	B	B	3.0	13	0
2025	岩手	花巻東	B	B	B	B	B	B	3.0	13	0
2025	福島	聖光学院	B	B	B	B	B	C	3.0	13	0
2025	茨城	明秀日立	B	B	B	B	B	B	3.0	13	0
2025	南北海道	北海	C	B	B	B	B	B	2.8	33	0
2025	秋田	金足農	B	C	B	B	B	B	2.8	33	0
2025	栃木	青藍泰斗	B	C	B	C	C	C	2.4	35	0
2025	山形	日大山形	C	B	B	C	C	C	2.4	35	0
2025	青森	弘前学院聖愛	C	C	B	B	C	C	2.4	35	0
2025	北北海道	旭川志峯	C	C	C	C	B	C	2.2	38	0
2025	福井	北陸	C	C	C	C	C	C	2.0	39	0
2025	長野	松商学園	C	C	C	C	C	C	2.0	39	0
2025	富山	富山商	C	C	C	C	C	C	2.0	39	0
2025	徳島	阿南光	C	C	C	C	C	C	2.0	39	0
2025	鳥取	鳥取城北	C	C	C	C	C	C	2.0	39	0
2025	山口	宇部鴻城	C	C	C	C	C	C	2.0	39	0
2025	長崎	長崎日大	C	C	C	C	C	C	2.0	39	0
2025	佐賀	唐津商	C	C	C	C	C	C	2.0	39	0
2025	熊本	熊本工	C	C	C	C	C	C	2.0	39	0
2025	島根	開星	C	C	C	C	C	C	2.0	39	0
2025	宮崎	日章学園	C	C	C	C	C	C	2.0	39	0
2024	群馬	健大高崎	A	特	A	A	A	A	4.2	1	5
2024	東東京	関東一	A	A	A	A	A	A	4.0	2	5
2024	埼玉	花咲徳栄	A	A	A	A	A	A	4.0	2	5
2024	神奈川	東海大相模	A	A	A	A	A	A	4.0	2	5
2024	兵庫	報徳学園	A	A	A	A	A	A	4.0	2	5
2024	京都	京都国際	A	A	A	A	A	A	4.0	2	5
2024	大阪	大阪桐蔭	A	A	A	A	A	A	4.0	2	5
2024	広島	広陵	A	A	A	A	A	A	4.0	2	5
2024	鹿児島	神村学園	A	A	A	A	A	A	4.0	2	5
2024	青森	青森山田	A	A	B	B	B	A	3.4	10	2
2024	和歌山	智辯和歌山	B	B	B	B	B	B	3.0	11	0
2024	静岡	掛川西	B	B	B	B	B	B	3.0	11	0
2024	山梨	山梨学院	B	B	B	B	B	B	3.0	11	0
2024	千葉	木更津総合	B	B	B	B	B	B	3.0	11	0
2024	愛知	愛工大名電	B	B	B	B	B	B	3.0	11	0
2024	奈良	智辯学園	B	B	B	B	B	B	3.0	11	0
2024	岡山	創志学園	B	B	B	B	B	B	3.0	11	0
2024	沖縄	興南	B	B	B	B	B	B	3.0	11	0
2024	大分	明豊	B	B	B	B	B	B	3.0	11	0
2024	福岡	西日本短大附	B	B	B	B	B	B	3.0	11	0
2024	西東京	早稲田実業	B	B	B	B	B	B	3.0	11	0
2024	高知	明徳義塾	B	B	B	B	B	B	3.0	11	0
2024	岐阜	大垣日大	B	B	C	B	B	B	2.8	23	0
2024	岩手	花巻東	B	B	B	C	B	B	2.8	23	0
2024	香川	英明	B	B	B	C	B	B	2.8	23	0
2024	山形	鶴岡東	B	B	B	C	B	B	2.8	23	0
2024	福島	聖光学院	B	B	B	C	B	A	2.8	23	0
2024	南北海道	札幌日大	C	B	C	B	B	B	2.6	28	0
2024	秋田	金足農	C	B	B	C	B	C	2.6	28	0
2024	宮城	聖和学園	B	B	C	C	B	C	2.6	28	0
2024	茨城	霞ケ浦	B	C	C	C	B	C	2.4	31	0
2024	北北海道	白樺学園	C	C	C	C	C	C	2.0	32	0
2024	三重	菰野	C	C	C	C	C	C	2.0	32	0
2024	滋賀	滋賀学園	C	C	C	C	C	C	2.0	32	0
2024	福井	北陸	C	C	C	C	C	C	2.0	32	0
2024	長野	上田西	C	C	C	C	C	C	2.0	32	0
2024	富山	富山商	C	C	C	C	C	C	2.0	32	0
2024	新潟	新潟明訓	C	C	C	C	C	C	2.0	32	0
2024	石川	小松大谷	C	C	C	C	C	C	2.0	32	0
2024	栃木	石橋	C	C	C	C	C	C	2.0	32	0
2024	愛媛	帝京五	C	C	C	C	C	C	2.0	32	0
2024	徳島	阿南光	C	C	C	C	C	C	2.0	32	0
2024	山口	南陽工	C	C	C	C	C	C	2.0	32	0
2024	島根	石見智翠館	C	C	C	C	C	C	2.0	32	0
2024	長崎	海星	C	C	C	C	C	C	2.0	32	0
2024	佐賀	有田工	C	C	C	C	C	C	2.0	32	0
2024	熊本	熊本工	C	C	C	C	C	C	2.0	32	0
2024	鳥取	鳥取城北	C	C	C	C	C	C	2.0	32	0
2024	宮崎	聖心ウルスラ	C	C	C	C	C	C	2.0	32	0
\.


--
-- Data for Name: tmp_team_batting_stats; Type: TABLE DATA; Schema: koshien; Owner: -
--

COPY koshien.tmp_team_batting_stats (year, tournament, school_name, prefecture_name, game_count, team_batting_avg, batting_avg_rank, total_runs, total_runs_rank, runs_per_game, runs_per_game_rank, home_runs, home_runs_rank, home_runs_per_game, home_runs_per_game_rank, total_stolen_bases, stolen_bases_rank, stolen_bases_per_game, stolen_bases_per_game_rank, total_sacrifice_bunts, sacrifice_bunts_rank, sacrifice_bunts_per_game, sacrifice_bunts_per_game_rank) FROM stdin;
2022	summer	旭川大高	北北海道	6	0.303	41	37.0	33	6.2	43	2.0	23	0.3	28	8.0	26	1.3	30	12.0	27	2.0	34
2022	summer	札幌大谷	南北海道	6	0.425	3	64.0	4	10.7	4	2.0	23	0.3	28	7.0	31	1.2	31	24.0	3	4.0	3
2022	summer	八戸学院光星	青森	5	0.293	45	26.0	48	5.2	49	3.0	13	0.6	12	3.0	42	0.6	41	16.0	20	3.2	12
2022	summer	一関学院	岩手	6	0.343	31	46.0	20	7.7	20	10.0	1	1.7	2	9.0	20	1.5	28	15.0	23	2.5	26
2022	summer	能代松陽	秋田	5	0.348	29	40.0	28	8.0	19	1.0	35	0.2	37	6.0	33	1.2	31	6.0	47	1.2	47
2022	summer	鶴岡東	山形	5	0.411	7	37.0	33	7.4	24	1.0	35	0.2	37	12.0	17	2.4	15	15.0	23	3.0	19
2022	summer	仙台育英	宮城	5	0.345	30	32.0	44	6.4	41	0.0	43	0.0	43	24.0	2	4.8	1	17.0	15	3.4	7
2022	summer	聖光学院	福島	6	0.371	19	50.0	16	8.3	18	2.0	23	0.3	28	6.0	33	1.0	35	20.0	9	3.3	10
2022	summer	明秀日立	茨城	6	0.404	8	55.0	8	9.2	10	6.0	5	1.0	7	19.0	7	3.2	7	19.0	12	3.2	12
2022	summer	國學院栃木	栃木	6	0.356	26	46.0	20	7.7	20	3.0	13	0.5	18	15.0	13	2.5	13	9.0	40	1.5	44
2022	summer	樹徳	群馬	6	0.286	46	40.0	28	6.7	38	1.0	35	0.2	37	14.0	15	2.3	16	11.0	32	1.8	38
2022	summer	山梨学院	山梨	5	0.429	2	72.0	2	14.4	1	3.0	13	0.6	12	21.0	4	4.2	3	17.0	15	3.4	7
2022	summer	聖望学園	埼玉	7	0.332	33	42.0	25	6.0	44	2.0	23	0.3	28	8.0	26	1.1	34	22.0	5	3.1	16
2022	summer	市立船橋	千葉	7	0.389	12	59.0	5	8.4	16	3.0	13	0.4	22	12.0	17	1.7	24	31.0	1	4.4	1
2022	summer	横浜	神奈川	7	0.398	9	51.0	13	7.3	26	4.0	10	0.6	12	3.0	42	0.4	46	22.0	5	3.1	16
2022	summer	二松学舎	東東京	6	0.367	22	55.0	8	9.2	10	3.0	13	0.5	18	17.0	10	2.8	10	16.0	20	2.7	24
2022	summer	日大三	西東京	6	0.413	6	74.0	1	12.3	2	3.0	13	0.6	12	14.0	15	2.3	16	17.0	15	2.8	20
2022	summer	佐久長聖	長野	7	0.364	23	51.0	13	7.3	26	0.0	43	0.0	43	25.0	1	3.6	5	27.0	2	3.9	5
2022	summer	日本文理	新潟	6	0.323	38	38.0	31	6.3	42	2.0	23	0.3	28	2.0	47	0.3	48	9.0	40	1.5	44
2022	summer	高岡商業	富山	5	0.372	18	47.0	19	9.4	8	2.0	23	0.4	22	3.0	42	0.6	41	11.0	32	2.2	32
2022	summer	星稜	石川	5	0.331	34	34.0	39	6.8	34	1.0	35	0.2	37	8.0	26	1.6	25	6.0	47	1.2	47
2022	summer	敦賀気比	福井	5	0.396	10	37.0	33	7.4	24	3.0	13	0.6	12	9.0	20	1.8	19	9.0	40	1.8	38
2022	summer	日大三島	静岡	6	0.297	43	39.0	30	6.5	40	0.0	43	0.0	43	3.0	42	0.5	43	23.0	4	3.8	6
2022	summer	愛工大名電	愛知	6	0.423	4	57.0	6	9.5	7	8.0	3	1.3	3	15.0	13	2.5	13	5.0	49	0.8	49
2022	summer	県立岐阜商業	岐阜	6	0.361	24	54.0	10	9.0	12	2.0	23	0.3	28	20.0	5	3.3	6	10.0	37	1.7	40
2022	summer	三重	三重	6	0.380	16	44.0	24	7.3	26	0.0	43	0.0	43	6.0	33	1.0	35	12.0	27	2.0	34
2022	summer	近江	滋賀	5	0.350	28	36.0	36	7.2	30	3.0	13	0.6	12	5.0	39	1.0	35	17.0	15	3.4	7
2022	summer	京都国際	京都	6	0.357	25	51.0	13	8.5	15	1.0	35	0.2	37	5.0	37	0.8	38	20.0	9	3.3	10
2022	summer	天理	奈良	5	0.393	11	56.0	7	11.2	3	6.0	5	1.2	4	9.0	20	1.8	19	9.0	40	1.8	38
2022	summer	智辯和歌山	和歌山	5	0.383	15	45.0	23	9.0	12	9.0	2	1.8	1	8.0	26	1.6	25	7.0	46	1.4	46
2022	summer	大阪桐蔭	大阪	7	0.371	19	54.0	10	7.7	20	7.0	4	1.0	7	18.0	9	2.6	12	15.0	23	2.1	33
2022	summer	社	兵庫	7	0.274	48	46.0	20	6.6	39	3.0	13	0.4	22	16.0	11	2.3	16	22.0	5	3.1	16
2022	summer	創志学園	岡山	5	0.387	14	38.0	31	7.6	23	0.0	43	0.0	43	8.0	26	1.6	25	11.0	32	2.2	32
2022	summer	盈進	広島	7	0.376	17	66.0	3	9.4	8	2.0	23	0.3	28	20.0	5	2.9	9	12.0	27	1.7	42
2022	summer	鳥取商業	鳥取	4	0.279	47	29.0	45	7.3	26	1.0	35	0.3	28	11.0	19	2.8	10	10.0	37	2.5	26
2022	summer	浜田	島根	5	0.296	44	35.0	38	7.0	33	2.0	23	0.4	22	19.0	7	3.8	4	9.0	40	1.8	38
2022	summer	下関国際	山口	5	0.325	37	36.0	36	7.2	30	2.0	23	0.4	22	10.0	19	2.0	18	14.0	25	2.8	20
2022	summer	高松商業	香川	5	0.438	1	50.0	16	10.0	6	3.0	13	0.6	12	23.0	3	4.6	2	20.0	9	4.0	3
2022	summer	鳴門	徳島	5	0.419	5	47.0	18	9.4	8	0.0	43	0.0	43	0.0	49	0.0	49	9.0	40	1.8	38
2022	summer	帝京第五	愛媛	6	0.327	36	41.0	27	6.8	34	0.0	43	0.0	43	9.0	20	1.5	28	19.0	12	3.2	12
2022	summer	明徳義塾	高知	6	0.331	34	44.0	24	7.3	26	2.0	23	0.3	28	6.0	33	1.0	35	11.0	32	1.8	38
2022	summer	九国大付	福岡	7	0.356	26	50.0	16	7.1	32	6.0	5	0.9	9	4.0	40	0.6	41	16.0	20	2.3	28
2022	summer	有田工業	佐賀	5	0.318	39	29.0	45	5.8	46	1.0	35	0.2	37	2.0	47	0.4	46	22.0	5	4.4	1
2022	summer	海星	長崎	5	0.388	13	34.0	39	6.8	34	1.0	35	0.2	37	3.0	42	0.6	41	16.0	20	3.2	12
2022	summer	九州学院	熊本	5	0.338	32	34.0	39	6.8	34	0.0	43	0.0	43	6.0	33	1.2	31	15.0	23	3.0	19
2022	summer	明豊	大分	5	0.369	21	52.0	12	10.4	5	6.0	5	1.2	4	16.0	11	3.2	7	11.0	32	2.2	30
2022	summer	富島	宮崎	5	0.264	49	27.0	47	5.4	48	1.0	35	0.2	37	6.0	33	1.2	31	8.0	45	1.6	43
2022	summer	鹿児島実業	鹿児島	6	0.299	42	34.0	39	5.7	47	0.0	43	0.0	43	6.0	33	1.0	35	17.0	15	2.8	20
2022	summer	興南	沖縄	5	0.316	40	34.0	39	6.8	34	6.0	5	1.2	4	6.0	33	1.2	31	13.0	26	2.6	25
2023	spring	クラーク	北海道	8	0.306	24	53.0	22	6.6	20	0.0	29	0.0	29	15.0	17	1.9	21	\N	\N	\N	\N
2023	spring	仙台育英	宮城	11	0.279	31	62.0	14	5.6	27	3.0	14	0.3	19	28.0	5	2.5	6	\N	\N	\N	\N
2023	spring	東北	宮城	10	0.273	33	54.0	20	5.4	30	6.0	8	0.6	8	13.0	23	1.3	29	\N	\N	\N	\N
2023	spring	能代松陽	秋田	8	0.300	26	48.0	25	6.0	24	0.0	29	0.0	29	9.0	31	1.1	31	\N	\N	\N	\N
2023	spring	山梨学院	山梨	10	0.345	11	79.0	9	7.9	10	10.0	2	1.0	3	24.0	8	2.4	8	\N	\N	\N	\N
2023	spring	専大松戸	千葉	12	0.326	19	95.0	6	7.9	8	9.0	3	0.8	5	31.0	3	2.6	4	\N	\N	\N	\N
2023	spring	健大高崎	群馬	8	0.266	34	36.0	34	4.5	35	3.0	14	0.4	13	18.0	13	2.3	12	\N	\N	\N	\N
2023	spring	慶應義塾	神奈川	12	0.393	2	140.0	1	11.7	1	15.0	1	1.3	1	26.0	6	2.2	14	\N	\N	\N	\N
2023	spring	作新学院	栃木	7	0.358	9	51.0	24	7.3	16	3.0	14	0.4	10	16.0	16	2.3	11	\N	\N	\N	\N
2023	spring	東海大菅生	東京	9	0.335	15	59.0	15	6.6	21	2.0	20	0.2	21	10.0	29	1.1	32	\N	\N	\N	\N
2023	spring	二松学舎	東京	8	0.371	6	67.0	13	8.4	5	6.0	8	0.8	5	10.0	29	1.3	30	\N	\N	\N	\N
2023	spring	東邦	愛知	15	0.370	7	111.0	3	7.4	14	5.0	10	0.3	15	38.0	1	2.5	7	\N	\N	\N	\N
2023	spring	常葉大菊川	静岡	11	0.330	17	84.0	8	7.6	12	4.0	11	0.4	14	21.0	11	1.9	20	\N	\N	\N	\N
2023	spring	大垣日大	岐阜	9	0.296	27	54.0	20	6.0	24	3.0	14	0.3	15	25.0	7	2.8	3	\N	\N	\N	\N
2023	spring	北陸	福井	11	0.278	32	55.0	19	5.0	33	0.0	29	0.0	29	19.0	12	1.7	24	\N	\N	\N	\N
2023	spring	敦賀気比	福井	7	0.254	36	38.0	32	5.4	29	1.0	22	0.1	23	15.0	17	2.1	15	\N	\N	\N	\N
2023	spring	大阪桐蔭	大阪	15	0.337	13	125.0	2	8.3	6	4.0	11	0.3	20	6.0	34	0.4	35	\N	\N	\N	\N
2023	spring	報徳学園	兵庫	12	0.339	12	95.0	6	7.9	8	7.0	6	0.6	9	34.0	2	2.8	2	\N	\N	\N	\N
2023	spring	智辯和歌山	和歌山	6	0.333	16	41.0	30	6.8	19	7.0	6	1.2	2	8.0	32	1.3	28	\N	\N	\N	\N
2023	spring	龍谷大平安	京都	9	0.380	5	73.0	11	8.1	7	3.0	14	0.3	15	23.0	9	2.6	5	\N	\N	\N	\N
2023	spring	履正社	大阪	10	0.385	3	96.0	5	9.6	3	9.0	3	0.9	4	23.0	9	2.3	10	\N	\N	\N	\N
2023	spring	彦根総合	滋賀	8	0.307	23	58.0	16	7.3	17	1.0	22	0.1	25	15.0	17	1.9	21	\N	\N	\N	\N
2023	spring	社	兵庫	7	0.266	34	36.0	34	5.1	31	1.0	22	0.1	23	12.0	26	1.7	25	\N	\N	\N	\N
2023	spring	広陵	広島	14	0.310	22	105.0	4	7.5	13	9.0	3	0.6	7	30.0	4	2.1	15	\N	\N	\N	\N
2023	spring	光	山口	9	0.291	30	42.0	29	4.7	34	0.0	29	0.0	29	7.0	33	0.8	33	\N	\N	\N	\N
2023	spring	鳥取城北	鳥取	7	0.365	8	48.0	25	6.9	18	2.0	20	0.3	18	15.0	17	2.1	15	\N	\N	\N	\N
2023	spring	英明	香川	10	0.294	28	56.0	18	5.6	28	0.0	29	0.0	29	6.0	34	0.6	34	\N	\N	\N	\N
2023	spring	高松商業	香川	9	0.301	25	53.0	22	5.9	26	1.0	22	0.1	26	13.0	23	1.4	26	\N	\N	\N	\N
2023	spring	高知	高知	7	0.313	21	44.0	27	6.3	23	0.0	29	0.0	29	15.0	17	2.1	15	\N	\N	\N	\N
2023	spring	沖縄尚学	沖縄	10	0.407	1	77.0	10	7.7	11	4.0	11	0.4	12	4.0	36	0.4	35	\N	\N	\N	\N
2023	spring	長崎日大	長崎	9	0.348	10	57.0	17	6.3	22	1.0	22	0.1	26	18.0	13	2.0	19	\N	\N	\N	\N
2023	spring	海星	長崎	8	0.292	29	34.0	36	4.3	36	1.0	22	0.1	25	18.0	13	2.3	12	\N	\N	\N	\N
2023	spring	大分商業	大分	8	0.329	18	41.0	30	5.1	32	0.0	29	0.0	29	11.0	28	1.4	27	\N	\N	\N	\N
2023	spring	氷見(21世紀枠)	富山	7	0.322	20	68.0	12	9.7	2	3.0	14	0.4	10	13.0	23	1.9	23	\N	\N	\N	\N
2023	spring	城東(21世紀枠)	徳島	5	0.336	14	37.0	33	7.4	14	1.0	22	0.2	22	15.0	17	3.0	1	\N	\N	\N	\N
2023	spring	石橋(21世紀枠)	栃木	5	0.385	3	43.0	28	8.6	4	0.0	29	0.0	29	12.0	26	2.4	8	\N	\N	\N	\N
2023	summer	北海	南北海道	6	0.392	11	46.0	16	7.7	22	6.0	4	1.0	5	4.0	39	0.7	41	23.0	5	3.8	5
2023	summer	クラーク	北北海道	6	0.362	19	39.0	27	6.5	35	5.0	8	0.8	8	14.0	9	2.3	10	12.0	36	2.0	39
2023	summer	八戸学院光星	青森	5	0.353	21	41.0	23	8.2	14	6.0	4	1.2	3	6.0	27	1.2	25	10.0	41	2.0	39
2023	summer	花巻東	岩手	5	0.344	22	44.0	20	8.8	10	1.0	29	0.2	29	11.0	14	2.2	12	16.0	14	3.2	11
2023	summer	明桜	秋田	5	0.269	45	35.0	37	7.0	30	1.0	29	0.2	29	11.0	14	2.2	12	8.0	45	1.6	45
2023	summer	日大山形	山形	5	0.322	34	39.0	27	7.8	18	3.0	18	0.6	17	4.0	39	0.8	35	9.0	43	1.8	44
2023	summer	仙台育英	宮城	5	0.396	7	51.0	8	10.2	3	4.0	12	0.8	8	19.0	2	3.8	1	7.0	47	1.4	47
2023	summer	聖光学院	福島	5	0.428	3	59.0	5	11.8	1	0.0	49	0.0	49	15.0	7	3.0	2	16.0	14	3.2	11
2023	summer	土浦日大	茨城	6	0.335	30	48.0	12	8.0	16	2.0	24	0.3	27	16.0	5	2.7	8	13.0	32	2.2	35
2023	summer	文星芸大附属	栃木	5	0.394	9	34.0	38	6.8	31	3.0	18	0.6	17	4.0	39	0.8	35	16.0	14	3.2	11
2023	summer	前橋商業	群馬	6	0.395	8	45.0	18	7.5	25	4.0	12	0.7	12	5.0	31	0.8	35	16.0	14	2.7	26
2023	summer	東海大甲府	山梨	5	0.433	2	55.0	6	11.0	2	2.0	24	0.4	24	8.0	20	1.6	19	14.0	27	2.8	22
2023	summer	浦和学院	埼玉	7	0.379	14	66.0	2	9.4	6	4.0	12	0.6	16	13.0	12	1.9	17	20.0	8	2.9	21
2023	summer	専大松戸	千葉	7	0.383	13	62.0	3	8.9	8	5.0	8	0.7	12	20.0	1	2.9	5	30.0	1	4.3	3
2023	summer	慶應義塾	神奈川	7	0.377	15	62.0	3	8.9	8	6.0	4	0.9	7	5.0	31	0.7	41	14.0	27	2.0	39
2023	summer	共栄学園	東東京	6	0.322	34	43.0	21	7.2	28	1.0	29	0.2	29	17.0	4	2.8	6	16.0	14	2.7	26
2023	summer	日大三	西東京	6	0.394	9	53.0	7	8.8	10	6.0	4	1.0	5	3.0	43	0.5	45	17.0	13	2.8	22
2023	summer	上田西	長野	6	0.308	42	36.0	34	6.0	38	3.0	18	0.5	22	7.0	23	1.2	25	13.0	32	2.2	35
2023	summer	東京学館新潟	新潟	6	0.389	12	48.0	12	8.0	16	3.0	18	0.5	22	13.0	12	2.2	14	15.0	22	2.5	29
2023	summer	富山商業	富山	5	0.316	38	32.0	39	6.4	36	2.0	24	0.4	24	5.0	31	1.0	32	15.0	22	3.0	17
2023	summer	星稜	石川	5	0.329	33	43.0	21	8.6	12	4.0	12	0.8	8	9.0	18	1.8	18	6.0	48	1.2	48
2023	summer	北陸	福井	4	0.320	37	25.0	43	6.3	37	0.0	49	0.0	49	9.0	18	2.3	10	11.0	39	2.8	22
2023	summer	浜松開誠館	静岡	6	0.335	30	36.0	34	6.0	38	1.0	29	0.2	29	9.0	18	1.5	22	15.0	22	2.5	29
2023	summer	愛工大名電	愛知	6	0.322	34	40.0	25	6.7	32	1.0	29	0.2	29	8.0	20	1.3	23	16.0	14	2.7	26
2023	summer	大垣日大	岐阜	6	0.315	39	49.0	11	8.2	14	7.0	2	1.2	3	18.0	3	3.0	2	13.0	32	2.2	35
2023	summer	いなべ総合	三重	5	0.358	20	39.0	27	7.8	18	3.0	18	0.6	17	3.0	43	0.6	43	12.0	36	2.4	31
2023	summer	近江	滋賀	5	0.435	1	37.0	32	7.4	26	4.0	12	0.8	8	3.0	43	0.6	43	25.0	3	5.0	1
2023	summer	立命館宇治	京都	6	0.363	17	46.0	16	7.7	22	3.0	18	0.5	22	3.0	43	0.5	45	15.0	22	2.5	29
2023	summer	智辯学園	奈良	5	0.403	4	51.0	8	10.2	3	12.0	1	2.4	1	8.0	20	1.6	19	10.0	41	2.0	39
2023	summer	市立和歌山	和歌山	5	0.273	44	44.0	20	8.8	10	1.0	29	0.2	29	6.0	27	1.2	25	15.0	22	3.0	17
2023	summer	履正社	大阪	7	0.401	5	70.0	1	10.0	5	5.0	8	0.7	12	14.0	9	2.0	16	23.0	5	3.3	10
2023	summer	社	兵庫	7	0.363	17	46.0	16	6.6	34	0.0	49	0.0	49	10.0	17	1.4	21	26.0	2	3.7	8
2023	summer	おかやま山陽	岡山	5	0.340	27	29.0	40	5.8	41	0.0	49	0.0	49	4.0	39	0.8	35	14.0	27	2.8	22
2023	summer	広陵	広島	6	0.315	39	40.0	25	6.7	32	2.0	24	0.3	27	16.0	5	2.7	8	16.0	14	2.7	26
2023	summer	鳥取商業	鳥取	4	0.243	48	11.0	49	2.8	49	0.0	49	0.0	49	1.0	49	0.3	49	16.0	14	4.0	4
2023	summer	立正大淞南	島根	5	0.399	6	45.0	18	9.0	7	3.0	18	0.6	17	3.0	43	0.6	43	16.0	14	3.2	11
2023	summer	宇部鴻城	山口	5	0.344	22	37.0	32	7.4	26	0.0	49	0.0	49	5.0	31	1.0	32	15.0	22	3.0	17
2023	summer	英明	香川	5	0.337	28	39.0	27	7.8	18	2.0	24	0.4	24	5.0	31	1.0	32	19.0	9	3.8	5
2023	summer	徳島商業	徳島	5	0.335	30	40.0	25	8.0	16	2.0	24	0.4	24	11.0	14	2.2	12	19.0	9	3.8	5
2023	summer	川之江	愛媛	6	0.343	24	50.0	10	8.3	13	1.0	29	0.2	29	7.0	23	1.2	25	14.0	27	2.3	33
2023	summer	高知中央	高知	4	0.230	49	16.0	47	4.0	45	0.0	49	0.0	49	5.0	31	1.3	23	9.0	43	2.3	33
2023	summer	九州国際大付	福岡	7	0.343	24	50.0	10	7.1	29	0.0	49	0.0	49	2.0	46	0.3	48	13.0	32	1.9	43
2023	summer	鳥栖工業	佐賀	5	0.341	26	29.0	40	5.8	41	0.0	49	0.0	49	9.0	18	1.8	18	24.0	4	4.8	2
2023	summer	創成館	長崎	5	0.252	46	17.0	46	3.4	47	0.0	49	0.0	49	6.0	27	1.2	25	16.0	14	3.2	11
2023	summer	東海大熊本星翔	熊本	5	0.311	41	36.0	34	7.2	28	1.0	29	0.2	29	5.0	31	1.0	32	10.0	41	2.0	39
2023	summer	明豊	大分	5	0.377	15	38.0	31	7.6	24	1.0	29	0.2	29	9.0	18	1.8	18	6.0	48	1.2	48
2023	summer	宮崎学園	宮崎	5	0.245	47	14.0	48	2.8	48	0.0	49	0.0	49	4.0	39	0.8	35	13.0	32	2.6	28
2023	summer	神村学園	鹿児島	6	0.337	28	47.0	14	7.8	18	2.0	24	0.3	27	6.0	27	1.0	32	15.0	22	2.5	29
2023	summer	沖縄尚学	沖縄	5	0.299	43	29.0	40	5.8	41	1.0	29	0.2	29	2.0	46	0.4	46	13.0	32	2.6	28
2024	spring	北海	北海道	8	0.319	19	73.0	13	9.1	3	1.0	25	0.1	26	5.0	30	0.6	30	\N	\N	\N	\N
2024	spring	青森山田	青森	10	0.284	29	63.0	17	6.3	24	7.0	1	0.7	1	5.0	30	0.5	31	\N	\N	\N	\N
2024	spring	八戸学院光星	青森	9	0.316	20	58.0	22	6.4	20	2.0	19	0.2	21	16.0	15	1.8	12	\N	\N	\N	\N
2024	spring	学法石川	福島	9	0.308	23	52.0	28	5.8	27	1.0	25	0.1	27	10.0	24	1.1	23	\N	\N	\N	\N
2024	spring	作新学院	栃木	11	0.325	16	75.0	12	6.8	16	3.0	13	0.3	18	14.0	18	1.3	21	\N	\N	\N	\N
2024	spring	山梨学院	山梨	9	0.299	25	57.0	24	6.3	23	1.0	25	0.1	27	33.0	3	3.7	1	\N	\N	\N	\N
2024	spring	健大高崎	群馬	9	0.397	1	85.0	6	9.4	2	2.0	19	0.2	21	26.0	7	2.9	3	\N	\N	\N	\N
2024	spring	常総学院	茨城	12	0.343	13	82.0	7	6.8	15	3.0	13	0.3	19	18.0	12	1.5	17	\N	\N	\N	\N
2024	spring	中央学院	千葉	13	0.342	14	107.0	3	8.2	6	3.0	13	0.2	25	42.0	2	3.2	2	\N	\N	\N	\N
2024	spring	関東第一	東京	11	0.386	4	108.0	2	9.8	1	7.0	1	0.6	2	19.0	10	1.7	14	\N	\N	\N	\N
2024	spring	星稜	石川	13	0.320	18	91.0	4	7.0	11	6.0	4	0.5	6	30.0	4	2.3	9	\N	\N	\N	\N
2024	spring	敦賀気比	福井	9	0.345	11	62.0	18	6.9	13	0.0	32	0.0	32	16.0	15	1.8	12	\N	\N	\N	\N
2024	spring	日本航空石川	石川	8	0.309	22	51.0	29	6.4	22	2.0	19	0.3	20	6.0	28	0.8	29	\N	\N	\N	\N
2024	spring	豊川	愛知	17	0.395	2	153.0	1	9.0	4	7.0	1	0.4	10	45.0	1	2.6	6	\N	\N	\N	\N
2024	spring	愛工大名電	愛知	11	0.393	3	77.0	10	7.0	11	5.0	6	0.5	7	14.0	18	1.3	21	\N	\N	\N	\N
2024	spring	宇治山田商業	三重	11	0.366	7	80.0	8	7.3	10	5.0	6	0.5	7	18.0	12	1.6	15	\N	\N	\N	\N
2024	spring	大阪桐蔭	大阪	12	0.310	21	77.0	10	6.4	21	6.0	4	0.5	4	12.0	21	1.0	24	\N	\N	\N	\N
2024	spring	京都外大西	京都	10	0.295	28	65.0	16	6.5	19	3.0	13	0.3	15	28.0	5	2.8	4	\N	\N	\N	\N
2024	spring	京都国際	京都	10	0.337	15	59.0	20	5.9	25	0.0	32	0.0	32	19.0	10	1.9	11	\N	\N	\N	\N
2024	spring	耐久	和歌山	9	0.276	30	53.0	27	5.9	26	2.0	19	0.2	22	10.0	24	1.1	23	\N	\N	\N	\N
2024	spring	報徳学園	兵庫	10	0.297	27	57.0	24	5.7	28	0.0	32	0.0	32	12.0	21	1.2	22	\N	\N	\N	\N
2024	spring	近江	滋賀	7	0.345	11	30.0	31	4.3	32	0.0	32	0.0	32	3.0	32	0.4	32	\N	\N	\N	\N
2024	spring	広陵	広島	12	0.359	8	89.0	5	7.4	8	4.0	10	0.3	14	28.0	5	2.3	8	\N	\N	\N	\N
2024	spring	創志学園	岡山	11	0.299	25	58.0	22	5.3	29	4.0	10	0.4	13	11.0	22	1.0	24	\N	\N	\N	\N
2024	spring	高知	高知	8	0.304	24	55.0	26	6.9	14	2.0	19	0.3	19	14.0	18	1.8	12	\N	\N	\N	\N
2024	spring	阿南光	徳島	8	0.358	9	59.0	20	7.4	9	5.0	6	0.6	3	18.0	12	2.3	10	\N	\N	\N	\N
2024	spring	熊本国府	熊本	10	0.321	17	66.0	15	6.6	18	3.0	13	0.3	15	10.0	24	1.0	24	\N	\N	\N	\N
2024	spring	明豊	大分	9	0.369	6	61.0	19	6.8	17	4.0	10	0.4	9	25.0	9	2.8	5	\N	\N	\N	\N
2024	spring	神村学園	鹿児島	8	0.380	5	72.0	14	9.0	4	3.0	13	0.4	11	11.0	22	1.4	18	\N	\N	\N	\N
2024	spring	東海大福岡	福岡	10	0.356	10	79.0	9	7.9	7	5.0	6	0.5	4	16.0	15	1.6	16	\N	\N	\N	\N
2024	spring	別海	北海道	6	0.237	32	26.0	32	4.3	31	0.0	32	0.0	32	6.0	28	1.0	24	\N	\N	\N	\N
2024	spring	田辺	和歌山	7	0.272	31	31.0	30	4.4	30	2.0	19	0.3	17	6.0	28	0.9	28	\N	\N	\N	\N
2024	summer	白樺学園	北北海道	6	0.358	12	42.0	17	7.0	20	1.0	20	0.2	29	16.0	9	2.7	10	14.0	32	2.3	38
2024	summer	札幌日大	南北海道	7	0.339	19	57.0	7	8.1	13	0.0	49	0.0	49	9.0	24	1.3	31	25.0	4	3.6	16
2024	summer	青森山田	青森	5	0.401	2	53.0	9	10.6	2	6.0	2	1.2	2	5.0	39	1.0	36	7.0	49	1.4	49
2024	summer	花巻東	岩手	5	0.336	21	32.0	34	6.4	33	2.0	10	0.4	10	17.0	7	3.4	6	21.0	10	4.2	4
2024	summer	金足農業	秋田	5	0.315	34	23.0	44	4.6	44	1.0	20	0.2	29	4.0	41	0.8	41	19.0	14	3.8	10
2024	summer	鶴岡東	山形	5	0.302	37	34.0	32	6.8	25	2.0	10	0.4	10	11.0	18	2.2	17	16.0	19	3.2	19
2024	summer	聖和学園	宮城	5	0.349	16	24.0	42	4.8	43	1.0	20	0.2	29	6.0	36	1.2	33	19.0	14	3.8	10
2024	summer	聖光学院	福島	5	0.325	28	38.0	25	7.6	15	0.0	49	0.0	49	10.0	21	2.0	21	27.0	3	5.4	1
2024	summer	霞ヶ浦	茨城	6	0.292	40	39.0	23	6.5	30	0.0	49	0.0	49	7.0	32	1.2	34	15.0	25	2.5	32
2024	summer	石橋	栃木	5	0.289	41	25.0	40	5.0	41	0.0	49	0.0	49	8.0	29	1.6	27	10.0	43	2.0	47
2024	summer	健大高崎	群馬	5	0.371	9	57.0	7	11.4	1	7.0	1	1.4	1	9.0	24	1.8	24	13.0	36	2.6	31
2024	summer	日本航空	山梨	5	0.379	8	43.0	16	8.6	8	2.0	10	0.4	10	15.0	10	3.0	7	20.0	11	4.0	5
2024	summer	花咲徳栄	埼玉	7	0.332	24	63.0	2	9.0	6	4.0	5	0.6	4	26.0	3	3.7	4	11.0	42	1.6	47
2024	summer	木更津総合	千葉	7	0.332	24	48.0	12	6.9	24	5.0	3	0.7	4	17.0	7	2.4	14	13.0	36	1.9	43
2024	summer	東海大相模	神奈川	7	0.395	3	66.0	1	9.4	5	5.0	3	0.7	4	29.0	1	4.1	2	17.0	18	2.4	34
2024	summer	関東一	東東京	6	0.317	33	42.0	17	7.0	20	2.0	10	0.3	17	7.0	32	1.2	34	16.0	19	2.7	29
2024	summer	早稲田実業	西東京	6	0.354	13	58.0	4	9.7	4	2.0	10	0.3	17	13.0	14	2.2	19	13.0	36	2.2	39
2024	summer	長野日大	長野	6	0.339	19	44.0	14	7.3	18	1.0	20	0.2	29	24.0	4	4.0	3	15.0	25	2.5	32
2024	summer	新潟産業大附	新潟	6	0.314	35	40.0	21	6.7	27	0.0	49	0.0	49	13.0	14	2.2	19	10.0	43	1.7	45
2024	summer	富山商業	富山	5	0.327	27	33.0	33	6.6	29	1.0	20	0.2	29	8.0	29	1.6	27	12.0	39	2.4	35
2024	summer	小松大谷	石川	5	0.273	43	23.0	44	4.6	44	1.0	20	0.2	29	4.0	41	0.8	41	14.0	32	2.8	28
2024	summer	北陸	福井	5	0.271	45	31.0	36	6.2	36	0.0	49	0.0	49	12.0	17	2.4	15	15.0	25	3.0	22
2024	summer	掛川西	静岡	6	0.340	18	40.0	21	6.7	27	2.0	10	0.3	17	6.0	36	1.0	36	22.0	7	3.7	13
2024	summer	中京大中京	愛知	6	0.344	17	41.0	20	6.8	25	2.0	10	0.3	17	4.0	41	0.7	45	22.0	7	3.7	13
2024	summer	岐阜城北	岐阜	6	0.385	5	60.0	3	10.0	3	3.0	8	0.5	8	21.0	5	3.5	5	20.0	11	3.3	18
2024	summer	菰野	三重	5	0.322	32	25.0	40	5.0	41	0.0	49	0.0	49	7.0	32	1.4	30	14.0	32	2.8	28
2024	summer	滋賀学園	滋賀	7	0.362	10	50.0	10	7.1	19	0.0	49	0.0	49	5.0	39	0.7	45	11.0	42	1.6	47
2024	summer	京都国際	京都	6	0.361	11	50.0	10	8.3	10	0.0	49	0.0	49	6.0	36	1.0	36	16.0	19	2.7	29
2024	summer	智辯学園	奈良	5	0.273	43	38.0	25	7.6	15	0.0	49	0.0	49	6.0	36	1.2	33	15.0	25	3.0	22
2024	summer	智辯和歌山	和歌山	5	0.393	4	37.0	28	7.4	16	4.0	5	0.8	3	4.0	41	0.8	41	16.0	19	3.2	19
2024	summer	大阪桐蔭	大阪	6	0.384	6	58.0	4	9.7	4	1.0	20	0.2	29	7.0	32	1.2	34	15.0	25	2.5	32
2024	summer	報徳学園	兵庫	7	0.352	14	50.0	10	7.1	19	0.0	49	0.0	49	9.0	24	1.3	31	28.0	1	4.0	5
2024	summer	岡山学芸館	岡山	6	0.330	26	38.0	25	6.3	35	1.0	20	0.2	29	11.0	18	1.8	24	16.0	19	2.7	29
2024	summer	広陵	広島	6	0.299	39	36.0	29	6.0	38	1.0	20	0.2	29	11.0	18	1.8	24	17.0	18	2.8	27
2024	summer	鳥取城北	鳥取	4	0.313	36	26.0	39	6.5	30	1.0	20	0.3	22	9.0	24	2.3	16	16.0	19	4.0	5
2024	summer	大社	島根	6	0.325	28	39.0	23	6.5	30	0.0	49	0.0	49	29.0	1	4.8	1	16.0	19	2.7	29
2024	summer	南陽工業	山口	5	0.301	38	30.0	38	6.0	38	0.0	49	0.0	49	8.0	29	1.6	27	8.0	47	1.6	46
2024	summer	英明	香川	5	0.262	47	23.0	44	4.6	44	0.0	49	0.0	49	4.0	41	0.8	41	12.0	39	2.4	35
2024	summer	鳴門渦潮	徳島	5	0.323	31	35.0	30	7.0	20	2.0	10	0.4	10	5.0	39	1.0	36	16.0	19	3.2	19
2024	summer	聖カタリナ学園	愛媛	6	0.352	14	47.0	13	7.8	14	0.0	49	0.0	49	10.0	21	1.7	26	28.0	1	4.7	2
2024	summer	明徳義塾	高知	5	0.333	22	41.0	20	8.2	12	1.0	20	0.2	29	10.0	21	2.0	21	14.0	32	2.8	28
2024	summer	西日本短大附	福岡	7	0.381	7	58.0	4	8.3	10	4.0	5	0.6	4	18.0	6	2.6	12	24.0	5	3.4	17
2024	summer	有田工業	佐賀	5	0.333	22	31.0	36	6.2	36	1.0	20	0.2	29	14.0	12	2.8	9	18.0	16	3.6	15
2024	summer	創成館	長崎	5	0.255	48	22.0	46	4.4	46	1.0	20	0.2	29	4.0	41	0.8	41	22.0	7	4.4	3
2024	summer	熊本工業	熊本	5	0.268	46	32.0	34	6.4	33	1.0	20	0.2	29	6.0	36	1.2	33	15.0	25	3.0	22
2024	summer	明豊	大分	5	0.325	28	44.0	14	8.8	7	2.0	10	0.4	10	2.0	46	0.4	46	13.0	36	2.6	31
2024	summer	宮崎商業	宮崎	5	0.247	49	18.0	48	3.6	48	0.0	49	0.0	49	2.0	46	0.4	46	16.0	19	3.2	19
2024	summer	神村学園	鹿児島	5	0.403	1	42.0	17	8.4	9	2.0	10	0.4	10	2.0	46	0.4	46	18.0	16	3.6	15
2024	summer	興南	沖縄	5	0.289	41	19.0	47	3.8	47	1.0	20	0.2	29	2.0	46	0.4	46	13.0	36	2.6	31
2025	summer	旭川志峯	北北海道	6	0.358	15	37.0	23	6.2	34	0.0	49	0.0	49	13.0	7	2.2	16	27.0	4	4.5	2
2025	summer	北海	南北海道	6	0.331	30	44.0	14	7.3	21	2.0	13	0.3	18	3.0	46	0.5	47	21.0	6	3.5	10
2025	summer	聖愛	青森	5	0.291	45	34.0	29	6.8	27	2.0	13	0.4	14	17.0	5	3.4	4	9.0	44	1.8	44
2025	summer	花巻東	岩手	6	0.395	6	57.0	5	9.5	4	2.0	13	0.3	18	6.0	35	1.0	38	12.0	35	2.0	39
2025	summer	金足農業	秋田	5	0.274	47	26.0	42	5.2	44	0.0	49	0.0	49	6.0	35	1.2	32	15.0	23	3.0	19
2025	summer	日大山形	山形	5	0.360	14	33.0	32	6.6	29	0.0	49	0.0	49	13.0	7	2.6	7	16.0	20	3.2	16
2025	summer	仙台育英	宮城	5	0.270	48	31.0	35	6.2	34	0.0	49	0.0	49	4.0	43	0.8	44	11.0	38	2.2	35
2025	summer	聖光学院	福島	5	0.345	23	37.0	23	7.4	18	0.0	49	0.0	49	9.0	23	1.8	23	16.0	20	3.2	16
2025	summer	明秀日立	茨城	6	0.353	17	43.0	16	7.2	22	0.0	49	0.0	49	11.0	15	1.8	21	16.0	20	2.7	26
2025	summer	青藍泰斗	栃木	5	0.335	28	30.0	36	6.0	36	0.0	49	0.0	49	25.0	2	5.0	1	15.0	23	3.0	19
2025	summer	健大高崎	群馬	5	0.329	32	38.0	20	7.6	16	5.0	4	1.0	4	7.0	31	1.4	28	15.0	23	3.0	19
2025	summer	山梨学院	山梨	4	0.384	8	33.0	32	8.3	10	6.0	3	1.5	1	9.0	23	2.3	14	10.0	40	2.5	30
2025	summer	叡明	埼玉	7	0.346	22	63.0	3	9.0	6	1.0	21	0.1	29	9.0	23	1.3	33	10.0	40	1.4	49
2025	summer	市立船橋	千葉	7	0.365	12	64.0	2	9.1	5	5.0	4	0.7	6	10.0	19	1.4	26	30.0	2	4.3	5
2025	summer	横浜	神奈川	7	0.347	21	56.0	6	8.0	11	4.0	6	0.6	10	6.0	35	0.9	42	14.0	26	2.0	39
2025	summer	関東第一	東東京	7	0.352	18	45.0	13	6.4	30	3.0	8	0.4	12	26.0	1	3.7	2	19.0	13	2.7	27
2025	summer	日大三	西東京	6	0.364	13	51.0	10	8.5	9	3.0	8	0.5	11	6.0	35	1.0	38	18.0	15	3.0	19
2025	summer	松商学園	長野	7	0.249	49	24.0	46	3.4	49	0.0	49	0.0	49	13.0	7	1.9	20	31.0	1	4.4	4
2025	summer	中越	新潟	6	0.328	33	47.0	12	7.8	14	2.0	13	0.3	18	7.0	31	1.2	35	16.0	20	2.7	25
2025	summer	未来富山	富山	6	0.426	2	63.0	3	10.5	2	3.0	8	0.5	8	8.0	29	1.3	29	13.0	31	2.2	37
2025	summer	小松大谷	石川	5	0.313	36	37.0	23	7.4	18	2.0	13	0.4	14	7.0	31	1.4	28	12.0	35	2.4	32
2025	summer	敦賀気比	福井	4	0.397	3	32.0	34	8.0	12	1.0	21	0.3	21	3.0	46	0.8	45	12.0	35	3.0	24
2025	summer	聖隷クリストファー	静岡	6	0.335	28	34.0	29	5.7	40	0.0	49	0.0	49	2.0	49	0.3	49	13.0	31	2.2	36
2025	summer	豊橋中央	愛知	7	0.354	16	54.0	7	7.7	15	1.0	21	0.1	29	6.0	35	0.9	42	17.0	17	2.4	33
2025	summer	県立岐阜商業	岐阜	6	0.396	4	53.0	8	8.8	8	8.0	1	1.3	3	5.0	39	0.8	44	18.0	15	3.0	19
2025	summer	津田学園	三重	5	0.297	41	25.0	44	5.0	46	1.0	21	0.2	25	6.0	35	1.2	32	8.0	45	1.6	46
2025	summer	綾羽	滋賀	5	0.367	11	49.0	11	9.8	3	2.0	13	0.4	14	7.0	31	1.4	28	13.0	31	2.6	29
2025	summer	京都国際	京都	6	0.336	26	43.0	16	7.2	22	2.0	13	0.3	18	6.0	35	1.0	38	15.0	23	2.5	31
2025	summer	天理	奈良	5	0.373	9	40.0	19	8.0	12	7.0	2	1.4	2	4.0	43	0.8	44	15.0	23	3.0	19
2025	summer	智辯和歌山	和歌山	5	0.351	19	36.0	26	7.2	25	1.0	21	0.2	25	6.0	35	1.2	32	14.0	26	2.8	24
2025	summer	東大阪大柏原	大阪	7	0.298	39	44.0	14	6.3	31	0.0	49	0.0	49	22.0	3	3.1	5	17.0	17	2.4	33
2025	summer	東洋大姫路	兵庫	7	0.396	4	52.0	9	7.4	18	3.0	8	0.4	12	8.0	28	1.1	37	29.0	3	4.1	6
2025	summer	岡山学芸館	岡山	5	0.292	44	26.0	42	5.2	44	0.0	49	0.0	49	7.0	31	1.4	28	13.0	31	2.6	29
2025	summer	広陵	広島	6	0.313	36	34.0	29	5.7	40	1.0	21	0.2	28	22.0	3	3.7	3	14.0	26	2.3	34
2025	summer	鳥取城北	鳥取	5	0.345	23	27.0	40	5.4	42	0.0	49	0.0	49	10.0	19	2.0	17	15.0	23	3.0	19
2025	summer	開星	島根	5	0.430	1	70.0	1	14.0	1	3.0	8	0.6	8	10.0	19	2.0	17	16.0	20	3.2	16
2025	summer	高川学園	山口	5	0.345	23	38.0	20	7.6	16	2.0	13	0.4	14	7.0	31	1.4	28	15.0	23	3.0	19
2025	summer	尽誠学園	香川	5	0.295	43	35.0	28	7.0	26	2.0	13	0.4	14	15.0	6	3.0	6	13.0	31	2.6	29
2025	summer	鳴門	徳島	4	0.316	34	25.0	44	6.3	31	1.0	21	0.3	21	6.0	35	1.5	25	18.0	15	4.5	2
2025	summer	済美	愛媛	5	0.304	38	29.0	38	5.8	39	0.0	49	0.0	49	8.0	28	1.6	24	16.0	20	3.2	16
2025	summer	高知中央	高知	5	0.315	35	34.0	29	6.8	27	0.0	49	0.0	49	9.0	23	1.8	23	16.0	20	3.2	16
2025	summer	西日本短大附	福岡	6	0.337	25	38.0	20	6.3	31	2.0	13	0.3	18	10.0	19	1.7	24	13.0	31	2.2	36
2025	summer	佐賀北	佐賀	5	0.350	20	26.0	42	5.2	44	0.0	49	0.0	49	11.0	15	2.2	15	26.0	5	5.2	1
2025	summer	創成館	長崎	5	0.297	41	27.0	40	5.4	42	0.0	49	0.0	49	8.0	28	1.6	24	13.0	31	2.6	29
2025	summer	東海大熊本星翔	熊本	5	0.289	46	30.0	36	6.0	36	0.0	49	0.0	49	6.0	35	1.2	32	16.0	20	3.2	16
2025	summer	明豊	大分	5	0.344	26	36.0	26	7.2	22	2.0	13	0.4	14	9.0	23	1.8	23	16.0	20	3.2	16
2025	summer	宮崎商業	宮崎	5	0.284	47	23.0	47	4.6	47	0.0	49	0.0	49	11.0	15	2.2	15	13.0	31	2.6	29
2025	summer	神村学園	鹿児島	5	0.331	30	40.0	19	8.0	12	1.0	21	0.2	25	9.0	23	1.8	23	15.0	23	3.0	19
2025	summer	沖縄尚学	沖縄	5	0.298	39	28.0	39	5.6	41	0.0	49	0.0	49	9.0	23	1.8	23	16.0	20	3.2	16
2026	spring	北照高校	北海道	8	0.306	18	33.0	29	4.1	31	1.0	16	0.1	19	5.0	29	0.6	29	\N	\N	\N	\N
2026	spring	花巻東	岩手	11	0.309	17	75.0	6	6.8	12	7.0	2	0.6	3	23.0	5	2.1	12	\N	\N	\N	\N
2026	spring	八学光星	青森	9	0.275	26	47.0	22	5.2	23	4.0	8	0.4	7	6.0	27	0.7	27	\N	\N	\N	\N
2026	spring	東北高校	宮城	9	0.310	15	53.0	20	5.9	18	0.0	32	0.0	32	23.0	5	2.6	3	\N	\N	\N	\N
2026	spring	山梨学院	山梨	9	0.320	14	67.0	10	7.4	7	3.0	11	0.3	11	10.0	20	1.1	21	\N	\N	\N	\N
2026	spring	花咲徳栄	埼玉	11	0.325	11	82.0	3	7.5	6	5.0	6	0.5	6	12.0	18	1.1	23	\N	\N	\N	\N
2026	spring	専大松戸	千葉	11	0.390	1	89.0	2	8.1	4	2.0	14	0.2	15	26.0	4	2.4	6	\N	\N	\N	\N
2026	spring	佐野日大	栃木	8	0.340	8	47.0	22	5.9	19	0.0	32	0.0	32	9.0	22	1.1	20	\N	\N	\N	\N
2026	spring	横浜高校	神奈川	8	0.327	10	68.0	9	8.5	2	7.0	2	0.9	1	28.0	3	3.5	1	\N	\N	\N	\N
2026	spring	帝京高校	東京	9	0.354	5	65.0	12	7.2	9	7.0	2	0.8	2	14.0	16	1.6	16	\N	\N	\N	\N
2026	spring	帝京長岡	新潟	11	0.286	21	58.0	15	5.3	22	0.0	32	0.0	32	37.0	1	3.4	2	\N	\N	\N	\N
2026	spring	日本文理	新潟	10	0.343	7	69.0	8	6.9	11	1.0	16	0.1	24	15.0	14	1.5	17	\N	\N	\N	\N
2026	spring	中京大中京	愛知	11	0.283	25	65.0	12	5.9	17	1.0	16	0.1	25	9.0	22	0.8	25	\N	\N	\N	\N
2026	spring	三重高校	三重	8	0.323	12	54.0	17	6.8	13	1.0	16	0.1	19	17.0	10	2.1	10	\N	\N	\N	\N
2026	spring	大垣日大	岐阜	7	0.350	6	61.0	14	8.7	1	1.0	16	0.1	16	15.0	14	2.1	9	\N	\N	\N	\N
2026	spring	神戸国際大附	兵庫	14	0.286	21	70.0	7	5.0	24	8.0	1	0.6	4	9.0	22	0.6	28	\N	\N	\N	\N
2026	spring	智辯学園	奈良	9	0.296	20	54.0	17	6.0	16	5.0	6	0.6	5	9.0	22	1.0	24	\N	\N	\N	\N
2026	spring	大阪桐蔭	大阪	10	0.355	4	80.0	4	8.0	5	4.0	8	0.4	10	21.0	8	2.1	11	\N	\N	\N	\N
2026	spring	滋賀学園	滋賀	8	0.310	15	35.0	28	4.4	30	1.0	16	0.1	19	4.0	30	0.5	30	\N	\N	\N	\N
2026	spring	近江高校	滋賀	7	0.371	3	57.0	16	8.1	3	2.0	14	0.3	13	14.0	16	2.0	13	\N	\N	\N	\N
2026	spring	東洋大姫路	兵庫	7	0.239	29	38.0	27	5.4	21	1.0	16	0.1	16	0.0	32	0.0	32	\N	\N	\N	\N
2026	spring	崇徳高校	広島	12	0.322	13	78.0	5	6.5	14	3.0	11	0.3	14	30.0	2	2.5	4	\N	\N	\N	\N
2026	spring	高川学園	山口	9	0.232	30	45.0	24	5.0	24	1.0	16	0.1	23	22.0	7	2.4	5	\N	\N	\N	\N
2026	spring	英明高校	香川	12	0.268	27	54.0	17	4.5	29	1.0	16	0.1	26	17.0	10	1.4	18	\N	\N	\N	\N
2026	spring	阿南光	徳島	8	0.285	23	45.0	24	5.6	20	0.0	32	0.0	32	6.0	27	0.8	26	\N	\N	\N	\N
2026	spring	九州国際大付	福岡	14	0.340	8	99.0	1	7.1	10	6.0	5	0.4	9	17.0	10	1.2	19	\N	\N	\N	\N
2026	spring	長崎日大	長崎	9	0.261	28	41.0	26	4.6	28	3.0	11	0.3	11	10.0	20	1.1	21	\N	\N	\N	\N
2026	spring	神村学園	鹿児島	9	0.382	2	66.0	11	7.3	8	4.0	8	0.4	7	17.0	10	1.9	14	\N	\N	\N	\N
2026	spring	熊本工業	熊本	8	0.284	24	49.0	21	6.1	15	1.0	16	0.1	19	18.0	9	2.3	8	\N	\N	\N	\N
2026	spring	沖縄尚学	沖縄	7	0.303	19	32.0	30	4.6	27	1.0	16	0.1	16	3.0	31	0.4	31	\N	\N	\N	\N
2026	spring	高知農業(21世紀枠)	高知	3	0.212	31	15.0	32	5.0	24	0.0	32	0.0	32	7.0	26	2.3	7	\N	\N	\N	\N
2026	spring	長崎西(21世紀枠)	長崎	7	0.211	32	25.0	31	3.6	32	0.0	32	0.0	32	11.0	19	1.6	15	\N	\N	\N	\N
\.


--
-- Data for Name: tmp_team_pitching_stats; Type: TABLE DATA; Schema: koshien; Owner: -
--

COPY koshien.tmp_team_pitching_stats (year, tournament, school_name, prefecture_name, game_count, team_era, era_rank, total_runs_allowed, total_runs_allowed_rank, runs_allowed_per_game, runs_allowed_per_game_rank, total_errors, total_errors_rank, errors_per_game, errors_per_game_rank) FROM stdin;
2023	spring	クラーク	北海道	8	0.67	1	17.0	10	2.1	10	16.0	35	2.0	34
2023	spring	仙台育英	宮城	11	1.76	15	19.0	14	1.7	5	5.0	4	0.5	3
2023	spring	東北	宮城	10	1.43	9	14.0	4	1.4	2	9.0	20	0.9	18
2023	spring	能代松陽	秋田	8	2.25	23	21.0	21	2.6	24	7.0	11	0.9	15
2023	spring	山梨学院	山梨	10	2.56	30	28.0	31	2.8	31	3.0	2	0.3	2
2023	spring	専大松戸	千葉	12	2.08	21	33.0	34	2.8	30	10.0	26	0.8	13
2023	spring	健大高崎	群馬	8	1.06	3	13.0	3	1.6	4	6.0	8	0.8	11
2023	spring	慶應義塾	神奈川	12	2.93	35	29.0	32	2.4	21	8.0	14	0.7	6
2023	spring	作新学院	栃木	7	2.81	34	19.0	14	2.7	27	5.0	4	0.7	10
2023	spring	東海大菅生	東京	9	1.36	6	18.0	13	2.0	9	9.0	20	1.0	20
2023	spring	二松学舎	東京	8	1.60	12	17.0	10	2.1	10	4.0	3	0.5	4
2023	spring	東邦	愛知	15	2.27	24	41.0	36	2.7	29	30.0	36	2.0	34
2023	spring	常葉大菊川	静岡	11	1.66	13	26.0	26	2.4	19	15.0	33	1.4	32
2023	spring	大垣日大	岐阜	9	1.74	14	20.0	17	2.2	13	12.0	29	1.3	30
2023	spring	北陸	福井	11	2.02	19	26.0	26	2.4	19	13.0	31	1.2	27
2023	spring	敦賀気比	福井	7	1.80	16	15.0	6	2.1	12	1.0	1	0.1	1
2023	spring	大阪桐蔭	大阪	15	1.46	11	27.0	28	1.8	7	14.0	32	0.9	19
2023	spring	報徳学園	兵庫	12	1.19	5	16.0	7	1.3	1	8.0	14	0.7	6
2023	spring	智辯和歌山	和歌山	6	1.84	17	14.0	4	2.3	18	8.0	14	1.3	30
2023	spring	龍谷大平安	京都	9	2.59	31	24.0	22	2.7	25	9.0	20	1.0	20
2023	spring	履正社	大阪	10	2.59	31	25.0	23	2.5	22	7.0	11	0.7	9
2023	spring	彦根総合	滋賀	8	2.03	20	25.0	23	3.1	33	7.0	11	0.9	15
2023	spring	社	兵庫	7	2.76	33	27.0	28	3.9	35	8.0	14	1.1	25
2023	spring	広陵	広島	14	1.37	7	25.0	23	1.8	6	11.0	28	0.8	12
2023	spring	光	山口	9	3.18	36	35.0	35	3.9	36	15.0	33	1.7	33
2023	spring	鳥取城北	鳥取	7	2.29	25	16.0	7	2.3	16	9.0	20	1.3	29
2023	spring	英明	香川	10	2.44	28	29.0	32	2.9	32	12.0	29	1.2	28
2023	spring	高松商業	香川	9	1.44	10	20.0	17	2.2	13	6.0	8	0.7	6
2023	spring	高知	高知	7	1.42	8	16.0	7	2.3	16	6.0	8	0.9	14
2023	spring	沖縄尚学	沖縄	10	2.38	27	27.0	28	2.7	26	5.0	4	0.5	4
2023	spring	長崎日大	長崎	9	1.95	18	20.0	17	2.2	13	8.0	14	0.9	17
2023	spring	海星	長崎	8	2.37	26	20.0	17	2.5	22	9.0	20	1.1	23
2023	spring	大分商業	大分	8	0.93	2	12.0	2	1.5	3	9.0	20	1.1	23
2023	spring	氷見(21世紀枠)	富山	7	2.53	29	19.0	14	2.7	27	8.0	14	1.1	25
2023	spring	城東(21世紀枠)	徳島	5	2.19	22	17.0	10	3.4	34	10.0	26	2.0	34
2023	spring	石橋(21世紀枠)	栃木	5	1.06	3	9.0	1	1.8	8	5.0	4	1.0	20
2023	summer	北海	南北海道	6	\N	\N	10.0	22	1.7	20	2.0	7	0.3	7
2023	summer	クラーク	北北海道	6	\N	\N	18.0	46	3.0	43	8.0	46	1.3	45
2023	summer	八戸学院光星	青森	5	\N	\N	11.0	26	2.2	29	3.0	14	0.6	17
2023	summer	花巻東	岩手	5	\N	\N	8.0	15	1.6	18	1.0	4	0.2	4
2023	summer	明桜	秋田	5	\N	\N	15.0	38	3.0	43	6.0	38	1.2	41
2023	summer	日大山形	山形	5	\N	\N	12.0	31	2.4	35	4.0	23	0.8	25
2023	summer	仙台育英	宮城	5	\N	\N	2.0	1	0.4	1	9.0	47	1.8	48
2023	summer	聖光学院	福島	5	\N	\N	17.0	43	3.4	47	7.0	44	1.4	46
2023	summer	土浦日大	茨城	6	\N	\N	7.0	13	1.2	10	5.0	31	0.8	25
2023	summer	文星芸大附属	栃木	5	\N	\N	11.0	26	2.2	29	3.0	14	0.6	17
2023	summer	前橋商業	群馬	6	\N	\N	15.0	38	2.5	36	7.0	44	1.2	41
2023	summer	東海大甲府	山梨	5	\N	\N	26.0	49	5.2	49	5.0	31	1.0	33
2023	summer	浦和学院	埼玉	7	\N	\N	5.0	6	0.7	4	3.0	14	0.4	10
2023	summer	専大松戸	千葉	7	\N	\N	18.0	46	2.6	37	4.0	23	0.6	17
2023	summer	慶應義塾	神奈川	7	\N	\N	11.0	26	1.6	18	3.0	14	0.4	10
2023	summer	共栄学園	東東京	6	\N	\N	17.0	43	2.8	39	4.0	23	0.7	23
2023	summer	日大三	西東京	6	\N	\N	13.0	33	2.2	29	5.0	31	0.8	25
2023	summer	上田西	長野	6	\N	\N	11.0	26	1.8	21	0.0	1	0.0	1
2023	summer	東京学館新潟	新潟	6	\N	\N	17.0	43	2.8	39	2.0	7	0.3	7
2023	summer	富山商業	富山	5	\N	\N	6.0	8	1.2	10	0.0	1	0.0	1
2023	summer	星稜	石川	5	\N	\N	16.0	40	3.2	45	5.0	31	1.0	33
2023	summer	北陸	福井	4	\N	\N	11.0	26	2.8	39	3.0	14	0.8	25
2023	summer	浜松開誠館	静岡	6	\N	\N	16.0	40	2.7	38	6.0	38	1.0	33
2023	summer	愛工大名電	愛知	6	\N	\N	12.0	31	2.0	24	5.0	31	0.8	25
2023	summer	大垣日大	岐阜	6	\N	\N	13.0	33	2.2	29	4.0	23	0.7	23
2023	summer	いなべ総合	三重	5	\N	\N	16.0	40	3.2	45	4.0	23	0.8	25
2023	summer	近江	滋賀	5	\N	\N	9.0	18	1.8	21	2.0	7	0.4	10
2023	summer	立命館宇治	京都	6	\N	\N	9.0	18	1.5	16	6.0	38	1.0	33
2023	summer	智辯学園	奈良	5	\N	\N	9.0	18	1.8	21	2.0	7	0.4	10
2023	summer	市立和歌山	和歌山	5	\N	\N	10.0	22	2.0	24	11.0	49	2.2	49
2023	summer	履正社	大阪	7	\N	\N	8.0	15	1.1	8	3.0	14	0.4	10
2023	summer	社	兵庫	7	\N	\N	14.0	36	2.0	24	6.0	38	0.9	32
2023	summer	おかやま山陽	岡山	5	\N	\N	10.0	22	2.0	24	5.0	31	1.0	33
2023	summer	広陵	広島	6	\N	\N	5.0	6	0.8	5	1.0	4	0.2	4
2023	summer	鳥取商業	鳥取	4	\N	\N	6.0	8	1.5	16	4.0	23	1.0	33
2023	summer	立正大淞南	島根	5	\N	\N	10.0	22	2.0	24	5.0	31	1.0	33
2023	summer	宇部鴻城	山口	5	\N	\N	6.0	8	1.2	10	3.0	14	0.6	17
2023	summer	英明	香川	5	\N	\N	14.0	36	2.8	39	6.0	38	1.2	41
2023	summer	徳島商業	徳島	5	\N	\N	3.0	2	0.6	2	1.0	4	0.2	4
2023	summer	川之江	愛媛	6	\N	\N	22.0	48	3.7	48	9.0	47	1.5	47
2023	summer	高知中央	高知	4	\N	\N	9.0	18	2.3	34	4.0	23	1.0	33
2023	summer	九州国際大付	福岡	7	\N	\N	8.0	15	1.1	8	0.0	1	0.0	1
2023	summer	鳥栖工業	佐賀	5	\N	\N	4.0	4	0.8	5	2.0	7	0.4	10
2023	summer	創成館	長崎	5	\N	\N	3.0	2	0.6	2	3.0	14	0.6	17
2023	summer	東海大熊本星翔	熊本	5	\N	\N	6.0	8	1.2	10	7.0	44	1.4	46
2023	summer	明豊	大分	5	\N	\N	6.0	8	1.2	10	6.0	38	1.2	41
2023	summer	宮崎学園	宮崎	5	\N	\N	7.0	13	1.4	15	4.0	23	0.8	25
2023	summer	神村学園	鹿児島	6	\N	\N	13.0	33	2.2	29	4.0	23	0.7	23
2023	summer	沖縄尚学	沖縄	5	\N	\N	4.0	4	0.8	5	2.0	7	0.4	10
2024	spring	北海	北海道	8	1.18	4	14.0	4	1.8	6	8.0	13	1.0	18
2024	spring	青森山田	青森	10	1.55	7	23.0	15	2.3	13	12.0	22	1.2	24
2024	spring	八戸学院光星	青森	9	1.97	16	14.0	4	1.6	5	3.0	1	0.3	1
2024	spring	学法石川	福島	9	2.50	28	25.0	17	2.8	23	7.0	10	0.8	13
2024	spring	作新学院	栃木	11	2.16	22	30.0	26	2.7	21	12.0	22	1.1	21
2024	spring	山梨学院	山梨	9	2.73	30	25.0	17	2.8	23	5.0	5	0.6	6
2024	spring	健大高崎	群馬	9	2.15	21	21.0	13	2.3	14	7.0	10	0.8	10
2024	spring	常総学院	茨城	12	1.98	17	26.0	20	2.2	11	10.0	19	0.8	13
2024	spring	中央学院	千葉	13	2.31	26	39.0	31	3.0	26	11.0	20	0.8	15
2024	spring	関東第一	東京	11	2.30	24	26.0	20	2.4	15	12.0	22	1.1	21
2024	spring	星稜	石川	13	1.95	14	27.0	22	2.1	7	7.0	10	0.5	5
2024	spring	敦賀気比	福井	9	1.75	11	20.0	11	2.2	12	8.0	13	0.9	17
2024	spring	日本航空石川	石川	8	2.09	19	24.0	16	3.0	26	5.0	5	0.6	7
2024	spring	豊川	愛知	17	2.91	32	66.0	32	3.9	32	22.0	32	1.3	26
2024	spring	愛工大名電	愛知	11	2.30	24	30.0	26	2.7	21	9.0	15	0.8	10
2024	spring	宇治山田商業	三重	11	2.23	23	37.0	29	3.4	30	16.0	30	1.5	29
2024	spring	大阪桐蔭	大阪	12	1.78	12	29.0	23	2.4	16	18.0	31	1.5	29
2024	spring	京都外大西	京都	10	2.04	18	29.0	23	2.9	25	15.0	29	1.5	29
2024	spring	京都国際	京都	10	0.71	1	9.0	1	0.9	1	7.0	10	0.7	9
2024	spring	耐久	和歌山	9	1.73	10	22.0	14	2.4	18	14.0	28	1.6	31
2024	spring	報徳学園	兵庫	10	0.88	2	10.0	3	1.0	2	4.0	2	0.4	2
2024	spring	近江	滋賀	7	1.40	5	9.0	1	1.3	3	6.0	9	0.9	16
2024	spring	広陵	広島	12	1.58	8	29.0	23	2.4	16	10.0	19	0.8	18
2024	spring	創志学園	岡山	11	1.03	3	15.0	6	1.4	4	9.0	15	0.8	11
2024	spring	高知	高知	8	1.81	13	17.0	9	2.1	9	4.0	2	0.5	4
2024	spring	阿南光	徳島	8	2.74	31	25.0	17	3.1	29	9.0	15	1.1	23
2024	spring	熊本国府	熊本	10	2.12	20	30.0	26	3.0	26	13.0	27	1.3	27
2024	spring	明豊	大分	9	1.95	14	19.0	10	2.1	8	4.0	2	0.4	3
2024	spring	神村学園	鹿児島	8	2.33	27	20.0	11	2.5	19	5.0	5	0.6	7
2024	spring	東海大福岡	福岡	10	2.54	29	37.0	29	3.7	31	12.0	22	1.2	24
2024	spring	別海	北海道	6	1.50	6	16.0	8	2.7	20	5.0	5	0.8	13
2024	spring	田辺	和歌山	7	1.59	9	15.0	6	2.1	10	11.0	20	1.6	32
2024	summer	白樺学園	北北海道	6	\N	\N	6.0	15	1.0	11	5.0	31	0.8	31
2024	summer	札幌日大	南北海道	7	\N	\N	11.0	36	1.6	28	4.0	26	0.6	17
2024	summer	青森山田	青森	5	\N	\N	4.0	4	0.8	6	3.0	13	0.6	20
2024	summer	花巻東	岩手	5	\N	\N	6.0	15	1.2	18	3.0	13	0.6	20
2024	summer	金足農業	秋田	5	\N	\N	7.0	20	1.4	21	7.0	44	1.4	47
2024	summer	鶴岡東	山形	5	\N	\N	7.0	20	1.4	21	3.0	13	0.6	20
2024	summer	聖和学園	宮城	5	\N	\N	15.0	43	3.0	44	5.0	31	1.0	34
2024	summer	聖光学院	福島	5	\N	\N	12.0	39	2.4	42	1.0	2	0.2	4
2024	summer	霞ヶ浦	茨城	6	\N	\N	12.0	39	2.0	33	5.0	31	0.8	31
2024	summer	石橋	栃木	5	\N	\N	11.0	36	2.2	38	2.0	6	0.4	8
2024	summer	健大高崎	群馬	5	\N	\N	18.0	46	3.6	48	5.0	31	1.0	34
2024	summer	日本航空	山梨	5	\N	\N	6.0	15	1.2	18	3.0	13	0.6	20
2024	summer	花咲徳栄	埼玉	7	\N	\N	21.0	48	3.0	44	3.0	13	0.4	12
2024	summer	木更津総合	千葉	7	\N	\N	5.0	9	0.7	5	4.0	26	0.6	17
2024	summer	東海大相模	神奈川	7	\N	\N	10.0	28	1.4	24	4.0	26	0.6	17
2024	summer	関東一	東東京	6	\N	\N	14.0	41	2.3	40	6.0	38	1.0	34
2024	summer	早稲田実業	西東京	6	\N	\N	31.0	49	5.2	49	8.0	46	1.3	45
2024	summer	長野日大	長野	6	\N	\N	2.0	1	0.3	1	2.0	6	0.3	6
2024	summer	新潟産業大附	新潟	6	\N	\N	14.0	41	2.3	40	3.0	13	0.5	13
2024	summer	富山商業	富山	5	\N	\N	10.0	28	2.0	33	5.0	31	1.0	34
2024	summer	小松大谷	石川	5	\N	\N	5.0	9	1.0	11	3.0	13	0.6	20
2024	summer	北陸	福井	5	\N	\N	4.0	4	0.8	6	0.0	1	0.0	1
2024	summer	掛川西	静岡	6	\N	\N	9.0	26	1.5	27	4.0	26	0.7	28
2024	summer	中京大中京	愛知	6	\N	\N	15.0	43	2.5	43	9.0	49	1.5	48
2024	summer	岐阜城北	岐阜	6	\N	\N	19.0	47	3.2	46	3.0	13	0.5	13
2024	summer	菰野	三重	5	\N	\N	4.0	4	0.8	6	2.0	6	0.4	8
2024	summer	滋賀学園	滋賀	7	\N	\N	5.0	9	0.7	5	3.0	13	0.4	12
2024	summer	京都国際	京都	6	\N	\N	10.0	28	1.7	29	3.0	13	0.5	13
2024	summer	智辯学園	奈良	5	\N	\N	10.0	28	2.0	33	6.0	38	1.2	42
2024	summer	智辯和歌山	和歌山	5	\N	\N	2.0	1	0.4	2	3.0	13	0.6	20
2024	summer	大阪桐蔭	大阪	6	\N	\N	10.0	28	1.7	29	1.0	2	0.2	2
2024	summer	報徳学園	兵庫	7	\N	\N	8.0	24	1.1	17	7.0	44	1.0	34
2024	summer	岡山学芸館	岡山	6	\N	\N	6.0	15	1.0	11	8.0	46	1.3	45
2024	summer	広陵	広島	6	\N	\N	4.0	4	0.7	4	2.0	6	0.3	6
2024	summer	鳥取城北	鳥取	4	\N	\N	8.0	24	2.0	33	2.0	6	0.5	13
2024	summer	大社	島根	6	\N	\N	5.0	9	0.8	10	1.0	2	0.2	3
2024	summer	南陽工業	山口	5	\N	\N	17.0	45	3.4	47	5.0	31	1.0	34
2024	summer	英明	香川	5	\N	\N	5.0	9	1.0	11	5.0	31	1.0	34
2024	summer	鳴門渦潮	徳島	5	\N	\N	10.0	28	2.0	33	6.0	38	1.2	42
2024	summer	聖カタリナ学園	愛媛	6	\N	\N	10.0	28	1.7	29	6.0	38	1.0	34
2024	summer	明徳義塾	高知	5	\N	\N	7.0	20	1.4	21	3.0	13	0.6	20
2024	summer	西日本短大附	福岡	7	\N	\N	10.0	28	1.4	24	3.0	13	0.4	12
2024	summer	有田工業	佐賀	5	\N	\N	7.0	20	1.4	21	3.0	13	0.6	20
2024	summer	創成館	長崎	5	\N	\N	5.0	9	1.0	11	3.0	13	0.6	20
2024	summer	熊本工業	熊本	5	\N	\N	4.0	4	0.8	6	4.0	26	0.8	30
2024	summer	明豊	大分	5	\N	\N	11.0	36	2.2	38	1.0	2	0.2	4
2024	summer	宮崎商業	宮崎	5	\N	\N	9.0	26	1.8	32	6.0	38	1.2	42
2024	summer	神村学園	鹿児島	5	\N	\N	3.0	3	0.6	3	6.0	38	1.2	42
2024	summer	興南	沖縄	5	\N	\N	6.0	15	1.2	18	8.0	46	1.6	49
2025	summer	旭川志峯	北北海道	6	\N	\N	7.0	18	1.2	15	5.0	34	0.8	34
2025	summer	北海	南北海道	6	\N	\N	11.0	34	1.8	31	3.0	15	0.5	14
2025	summer	聖愛	青森	5	\N	\N	15.0	43	3.0	46	2.0	5	0.4	8
2025	summer	花巻東	岩手	6	\N	\N	12.0	39	2.0	33	4.0	24	0.7	25
2025	summer	金足農業	秋田	5	\N	\N	3.0	2	0.6	4	4.0	24	0.8	29
2025	summer	日大山形	山形	5	\N	\N	13.0	41	2.6	45	3.0	15	0.6	21
2025	summer	仙台育英	宮城	5	\N	\N	3.0	2	0.6	4	2.0	5	0.4	8
2025	summer	聖光学院	福島	5	\N	\N	15.0	43	3.0	46	2.0	5	0.4	8
2025	summer	明秀日立	茨城	6	\N	\N	9.0	27	1.5	22	8.0	47	1.3	46
2025	summer	青藍泰斗	栃木	5	\N	\N	10.0	29	2.0	33	11.0	49	2.2	49
2025	summer	健大高崎	群馬	5	\N	\N	3.0	2	0.6	4	2.0	5	0.4	8
2025	summer	山梨学院	山梨	4	\N	\N	4.0	11	1.0	13	1.0	3	0.3	4
2025	summer	叡明	埼玉	7	\N	\N	14.0	42	2.0	33	5.0	34	0.7	27
2025	summer	市立船橋	千葉	7	\N	\N	16.0	45	2.3	41	4.0	24	0.6	19
2025	summer	横浜	神奈川	7	\N	\N	10.0	29	1.4	21	2.0	5	0.3	5
2025	summer	関東第一	東東京	7	\N	\N	5.0	13	0.7	12	2.0	5	0.3	5
2025	summer	日大三	西東京	6	\N	\N	10.0	29	1.7	27	7.0	44	1.2	44
2025	summer	松商学園	長野	7	\N	\N	3.0	2	0.4	2	0.0	1	0.0	1
2025	summer	中越	新潟	6	\N	\N	8.0	22	1.3	18	6.0	41	1.0	35
2025	summer	未来富山	富山	6	\N	\N	13.0	41	2.2	37	9.0	48	1.5	47
2025	summer	小松大谷	石川	5	\N	\N	11.0	34	2.2	37	3.0	15	0.6	21
2025	summer	敦賀気比	福井	4	\N	\N	7.0	18	1.8	29	2.0	5	0.5	14
2025	summer	聖隷クリストファー	静岡	6	\N	\N	3.0	2	0.5	3	3.0	15	0.5	14
2025	summer	豊橋中央	愛知	7	\N	\N	21.0	49	3.0	46	7.0	44	1.0	35
2025	summer	県立岐阜商業	岐阜	6	\N	\N	8.0	22	1.3	18	3.0	15	0.5	14
2025	summer	津田学園	三重	5	\N	\N	3.0	2	0.6	4	4.0	24	0.8	29
2025	summer	綾羽	滋賀	5	\N	\N	16.0	45	3.2	49	4.0	24	0.8	29
2025	summer	京都国際	京都	6	\N	\N	11.0	34	1.8	31	2.0	5	0.3	7
2025	summer	天理	奈良	5	\N	\N	6.0	14	1.2	16	5.0	34	1.0	35
2025	summer	智辯和歌山	和歌山	5	\N	\N	3.0	2	0.6	4	5.0	34	1.0	35
2025	summer	東大阪大柏原	大阪	7	\N	\N	16.0	45	2.3	41	4.0	24	0.6	19
2025	summer	東洋大姫路	兵庫	7	\N	\N	18.0	48	2.6	44	7.0	44	1.0	35
2025	summer	岡山学芸館	岡山	5	\N	\N	8.0	22	1.6	24	5.0	34	1.0	35
2025	summer	広陵	広島	6	\N	\N	6.0	14	1.0	13	4.0	24	0.7	25
2025	summer	鳥取城北	鳥取	4	\N	\N	9.0	27	2.3	40	6.0	41	1.5	47
2025	summer	開星	島根	5	\N	\N	12.0	39	2.4	43	5.0	34	1.0	35
2025	summer	高川学園	山口	5	\N	\N	7.0	18	1.4	20	5.0	34	1.0	35
2025	summer	尽誠学園	香川	5	\N	\N	6.0	14	1.2	16	1.0	3	0.2	3
2025	summer	鳴門	徳島	4	\N	\N	6.0	14	1.5	22	4.0	24	1.0	35
2025	summer	済美	愛媛	5	\N	\N	10.0	29	2.0	33	6.0	41	1.2	45
2025	summer	高知中央	高知	4	\N	\N	7.0	18	1.8	29	3.0	15	0.8	28
2025	summer	西日本短大附	福岡	6	\N	\N	4.0	11	0.7	11	3.0	15	0.5	14
2025	summer	佐賀北	佐賀	5	\N	\N	3.0	2	0.6	4	3.0	15	0.6	21
2025	summer	創成館	長崎	5	\N	\N	8.0	22	1.6	24	2.0	5	0.4	8
2025	summer	東海大星翔	熊本	5	\N	\N	3.0	2	0.6	4	4.0	24	0.8	29
2025	summer	明豊	大分	5	\N	\N	8.0	22	1.6	24	2.0	5	0.4	8
2025	summer	宮崎商業	宮崎	5	\N	\N	11.0	34	2.2	37	4.0	24	0.8	29
2025	summer	神村学園	鹿児島	5	\N	\N	11.0	34	2.2	37	3.0	15	0.6	21
2025	summer	沖縄尚学	沖縄	5	\N	\N	2.0	1	0.4	1	0.0	1	0.0	1
2026	spring	北照高校	北海道	8	1.32	8	12.0	4	1.5	4	5.0	7	0.6	8
2026	spring	花巻東	岩手	11	2.08	19	25.0	21	2.3	17	12.0	25	1.1	24
2026	spring	八学光星	青森	9	1.18	4	20.0	15	2.2	13	12.0	25	1.3	28
2026	spring	東北高校	宮城	9	1.87	17	20.0	15	2.2	13	6.0	11	0.7	10
2026	spring	山梨学院	山梨	9	2.50	26	26.0	23	2.9	25	6.0	11	0.7	10
2026	spring	花咲徳栄	埼玉	11	3.21	31	40.0	31	3.6	32	12.0	25	1.1	24
2026	spring	専大松戸	千葉	11	1.22	6	19.0	13	1.7	8	10.0	20	0.9	22
2026	spring	佐野日大	栃木	8	2.70	29	26.0	23	3.3	29	7.0	17	0.9	20
2026	spring	横浜高校	神奈川	8	1.83	16	18.0	10	2.3	15	4.0	4	0.5	5
2026	spring	帝京高校	東京	9	1.61	12	15.0	7	1.7	5	6.0	11	0.7	10
2026	spring	帝京長岡	新潟	11	2.33	25	28.0	27	2.5	21	15.0	30	1.4	30
2026	spring	日本文理	新潟	10	3.41	32	35.0	30	3.5	31	9.0	19	0.9	21
2026	spring	中京大中京	愛知	11	2.20	23	27.0	26	2.5	20	6.0	11	0.5	7
2026	spring	三重高校	三重	8	2.30	24	19.0	13	2.4	18	3.0	3	0.4	3
2026	spring	大垣日大	岐阜	7	1.71	14	14.0	6	2.0	11	5.0	7	0.7	13
2026	spring	神戸国際大附	兵庫	14	1.54	11	26.0	23	1.9	10	11.0	22	0.8	16
2026	spring	智辯学園	奈良	9	2.08	19	29.0	28	3.2	28	17.0	31	1.9	32
2026	spring	大阪桐蔭	大阪	10	0.85	1	17.0	8	1.7	7	11.0	22	1.1	26
2026	spring	滋賀学園	滋賀	8	2.10	21	21.0	17	2.6	22	6.0	11	0.8	15
2026	spring	近江高校	滋賀	7	2.62	28	22.0	18	3.1	27	2.0	2	0.3	1
2026	spring	東洋大姫路	兵庫	7	2.73	30	23.0	20	3.3	30	6.0	11	0.9	18
2026	spring	崇徳高校	広島	12	1.76	15	22.0	18	1.8	9	10.0	20	0.8	17
2026	spring	高川学園	山口	9	2.00	18	25.0	21	2.8	24	12.0	25	1.3	28
2026	spring	英明高校	香川	12	1.70	13	32.0	29	2.7	23	21.0	32	1.8	31
2026	spring	阿南光	徳島	8	2.12	22	18.0	10	2.3	15	4.0	4	0.5	5
2026	spring	九州国際大付	福岡	14	2.57	27	41.0	32	2.9	26	12.0	25	0.9	18
2026	spring	長崎日大	長崎	9	1.46	9	18.0	10	2.0	11	11.0	22	1.2	27
2026	spring	神村学園	鹿児島	9	0.99	2	12.0	4	1.3	2	4.0	4	0.4	4
2026	spring	熊本工業	熊本	8	1.21	5	9.0	2	1.1	1	5.0	7	0.6	8
2026	spring	沖縄尚学	沖縄	7	1.22	6	10.0	3	1.4	3	7.0	17	1.0	23
2026	spring	高知農業(21世紀枠)	高知	3	1.09	3	5.0	1	1.7	5	1.0	1	0.3	2
2026	spring	長崎西(21世紀枠)	長崎	7	1.48	10	17.0	8	2.4	19	5.0	7	0.7	13
2022	summer	旭川大高	北北海道	6	\N	\N	9.0	19	1.5	19	3.0	13	0.5	13
2022	summer	札幌大谷	南北海道	6	\N	\N	8.0	17	1.3	17	8.0	45	1.3	44
2022	summer	八戸学院光星	青森	5	\N	\N	13.0	38	2.6	41	2.0	9	0.4	11
2022	summer	一関学院	岩手	6	\N	\N	2.0	2	0.3	2	7.0	36	1.2	37
2022	summer	能代松陽	秋田	5	\N	\N	13.0	38	2.6	41	3.0	13	0.6	15
2022	summer	鶴岡東	山形	5	\N	\N	2.0	2	0.4	3	1.0	1	0.2	1
2022	summer	仙台育英	宮城	5	\N	\N	5.0	9	1.0	8	2.0	9	0.4	11
2022	summer	聖光学院	福島	6	\N	\N	12.0	34	2.0	29	4.0	21	0.7	22
2022	summer	明秀日立	茨城	6	\N	\N	14.0	43	2.3	39	5.0	27	0.8	23
2022	summer	國學院栃木	栃木	6	\N	\N	12.0	34	2.0	29	4.0	21	0.7	22
2022	summer	樹徳	群馬	6	\N	\N	13.0	38	2.2	35	1.0	1	0.2	1
2022	summer	山梨学院	山梨	5	\N	\N	5.0	9	1.0	8	1.0	1	0.2	1
2022	summer	聖望学園	埼玉	7	\N	\N	11.0	27	1.6	23	7.0	36	1.0	32
2022	summer	市立船橋	千葉	7	\N	\N	25.0	49	3.6	45	6.0	33	0.9	31
2022	summer	横浜	神奈川	7	\N	\N	4.0	7	0.6	4	4.0	21	0.6	15
2022	summer	二松学舎	東東京	6	\N	\N	11.0	27	1.8	27	7.0	36	1.2	37
2022	summer	日大三	西東京	6	\N	\N	11.0	27	1.8	27	7.0	36	1.2	37
2022	summer	佐久長聖	長野	7	\N	\N	11.0	27	1.6	23	2.0	9	0.3	8
2022	summer	日本文理	新潟	6	\N	\N	8.0	16	1.3	16	8.0	45	1.3	44
2022	summer	高岡商業	富山	5	\N	\N	24.0	48	4.8	49	4.0	21	0.8	23
2022	summer	星稜	石川	5	\N	\N	6.0	12	1.2	13	3.0	13	0.6	15
2022	summer	敦賀気比	福井	5	\N	\N	11.0	27	2.2	35	4.0	21	0.8	23
2022	summer	日大三島	静岡	6	\N	\N	14.0	43	2.3	39	2.0	9	0.3	8
2022	summer	愛工大名電	愛知	6	\N	\N	12.0	34	2.0	29	7.0	36	1.2	37
2022	summer	県立岐阜商業	岐阜	6	\N	\N	22.0	47	3.7	47	5.0	27	0.8	23
2022	summer	三重	三重	6	\N	\N	13.0	38	2.2	35	3.0	13	0.5	13
2022	summer	近江	滋賀	5	\N	\N	10.0	23	2.0	29	6.0	33	1.2	37
2022	summer	京都国際	京都	6	\N	\N	12.0	34	2.0	29	9.0	48	1.5	47
2022	summer	天理	奈良	5	\N	\N	3.0	4	0.6	4	1.0	1	0.2	1
2022	summer	智辯和歌山	和歌山	5	\N	\N	5.0	9	1.0	8	7.0	36	1.4	46
2022	summer	大阪桐蔭	大阪	7	\N	\N	1.0	1	0.1	1	4.0	21	0.6	15
2022	summer	社	兵庫	7	\N	\N	7.0	15	1.0	8	4.0	21	0.6	15
2022	summer	創志学園	岡山	5	\N	\N	8.0	16	1.6	23	1.0	1	0.2	1
2022	summer	盈進	広島	7	\N	\N	10.0	23	1.4	17	7.0	36	1.0	32
2022	summer	鳥取商業	鳥取	4	\N	\N	3.0	4	0.8	7	3.0	13	0.8	23
2022	summer	浜田	島根	5	\N	\N	20.0	46	4.0	48	8.0	45	1.6	48
2022	summer	下関国際	山口	5	\N	\N	10.0	23	2.0	29	5.0	27	1.0	32
2022	summer	高松商業	香川	5	\N	\N	18.0	45	3.6	45	3.0	13	0.6	15
2022	summer	鳴門	徳島	5	\N	\N	4.0	7	0.8	7	1.0	1	0.2	1
2022	summer	帝京第五	愛媛	6	\N	\N	9.0	19	1.5	19	5.0	27	0.8	23
2022	summer	明徳義塾	高知	6	\N	\N	11.0	27	1.8	27	2.0	9	0.3	8
2022	summer	九国大付	福岡	7	\N	\N	10.0	23	1.4	17	7.0	36	1.0	32
2022	summer	有田工業	佐賀	5	\N	\N	13.0	38	2.6	41	9.0	48	1.8	49
2022	summer	海星	長崎	5	\N	\N	6.0	12	1.2	13	1.0	1	0.2	1
2022	summer	九州学院	熊本	5	\N	\N	8.0	16	1.6	23	1.0	1	0.2	1
2022	summer	明豊	大分	5	\N	\N	5.0	9	1.0	8	3.0	13	0.6	15
2022	summer	富島	宮崎	5	\N	\N	3.0	4	0.6	4	5.0	27	1.0	32
2022	summer	鹿児島実業	鹿児島	6	\N	\N	9.0	19	1.5	19	3.0	13	0.5	13
2022	summer	興南	沖縄	5	\N	\N	6.0	12	1.2	13	3.0	13	0.6	15
\.


--
-- Data for Name: tmp_tournament_games; Type: TABLE DATA; Schema: koshien; Owner: -
--

COPY koshien.tmp_tournament_games (year, tournament_no, game_date, game_order, round_name, winner_school, winner_score, loser_score, loser_school, remarks) FROM stdin;
2022	第104回	8月6日	1	1回戦	国学院栃木	10	3	日大三島	\N
2022	第104回	8月6日	2	1回戦	明豊	7	3	樹徳	\N
2022	第104回	8月6日	3	1回戦	一関学院	6	5	京都国際	延長11回
2022	第104回	8月7日	1	1回戦	八戸学院光星	7	5	愛工大名電	\N
2022	第104回	8月7日	2	1回戦	愛工大名電	14	2	星稜	\N
2022	第104回	8月7日	3	1回戦	鶴岡東	12	7	盈進	\N
2022	第104回	8月7日	4	1回戦	近江	8	2	鳴門	\N
2022	第104回	8月8日	1	1回戦	海星	11	0	日本文理	\N
2022	第104回	8月8日	2	1回戦	天理	2	1	山梨学院	\N
2022	第104回	8月8日	3	1回戦	敦賀気比	13	3	高岡商	\N
2022	第104回	8月8日	4	1回戦	市船橋	6	5	興南	\N
2022	第104回	8月9日	1	1回戦	横浜	4	2	三重	\N
2022	第104回	8月9日	2	1回戦	聖光学院	4	2	日大三	\N
2022	第104回	8月9日	3	1回戦	二松学舎大付	3	2	札幌大谷	延長
2022	第104回	8月9日	4	1回戦	県岐阜商	9	2	社	\N
2022	第104回	8月10日	1	1回戦	仙台育英	10	0	鳥取商	\N
2022	第104回	8月10日	2	1回戦	明秀日立	2	1	鹿児島実	\N
2022	第104回	8月10日	3	1回戦	旭川大高	5	4	能代松陽	\N
2022	第104回	8月10日	4	1回戦	大阪桐蔭	12	2	聖望学園	\N
2022	第104回	8月11日	1	1回戦	高松商	14	4	佐久長聖	\N
2022	第104回	8月11日	2	1回戦	九州国際大付	7	1	明徳義塾	\N
2022	第104回	8月11日	3	1回戦	下関国際	5	0	富島	\N
2022	第104回	8月11日	4	1回戦	近江	8	2	鶴岡東	\N
2022	第104回	8月12日	1	1回戦	明豊	7	5	一関学院	\N
2022	第104回	8月12日	2	1回戦	八戸学院光星	5	3	創志学園	延長10回
2022	第104回	8月12日	3	1回戦	近江	8	3	鶴岡東	\N
2022	第104回	8月12日	4	1回戦	海星	4	2	天理	\N
2022	第104回	8月13日	1	1回戦	浜田	5	3	有田工	コロナ延期初戦
2022	第104回	8月13日	2	1回戦	九州学院	14	4	帝京第五	コロナ延期初戦
2022	第104回	8月13日	3	1回戦	国学院栃木	5	3	智辯和歌山	コロナ延期初戦
2022	第104回	8月13日	4	1回戦	市船橋	6	5	興南	コロナ延期（再掲）
2022	第104回	8月14日	1	2回戦	聖光学院	3	2	横浜	\N
2022	第104回	8月14日	2	2回戦	二松学舎大付	7	5	社	\N
2022	第104回	8月14日	3	2回戦	近江	7	1	海星	\N
2022	第104回	8月14日	4	2回戦	大阪桐蔭	6	3	旭川大高	\N
2022	第104回	8月15日	1	2回戦	仙台育英	5	4	明秀日立	\N
2022	第104回	8月15日	2	2回戦	九州国際大付	2	1	高松商	\N
2022	第104回	8月15日	3	2回戦	明豊	2	0	一関学院	\N
2022	第104回	8月15日	4	2回戦	近江	7	3	鶴岡東	\N
2022	第104回	8月16日	1	2回戦	下関国際	9	3	浜田	\N
2022	第104回	8月16日	2	2回戦	九州学院	4	0	国学院栃木	\N
2022	第104回	8月16日	3	2回戦	市船橋	6	1	敦賀気比	延長
2022	第104回	8月16日	4	2回戦	愛工大名電	6	5	八戸学院光星	延長
2022	第104回	8月17日	1	3回戦	仙台育英	5	1	明豊	\N
2022	第104回	8月17日	2	3回戦	近江	3	2	二松学舎大付	\N
2022	第104回	8月17日	3	3回戦	下関国際	5	2	九州学院	\N
2022	第104回	8月17日	4	3回戦	大阪桐蔭	5	2	県岐阜商	\N
2022	第104回	8月18日	1	3回戦	愛工大名電	4	3	聖光学院	\N
2022	第104回	8月18日	2	3回戦	高松商	6	5	九州国際大付	\N
2022	第104回	8月18日	3	3回戦	市船橋	3	2	明豊	\N
2022	第104回	8月18日	4	3回戦	近江	5	3	海星	\N
2022	第104回	8月18日	1	準々決勝	仙台育英	6	2	愛工大名電	\N
2022	第104回	8月18日	2	準々決勝	近江	7	6	高松商	\N
2022	第104回	8月18日	3	準々決勝	下関国際	5	4	大阪桐蔭	\N
2022	第104回	8月18日	4	準々決勝	聖光学院	10	5	九州学院	\N
2022	第104回	8月20日	1	準決勝	仙台育英	18	4	聖光学院	\N
2022	第104回	8月20日	2	準決勝	下関国際	8	2	近江	\N
2022	第104回	8月22日	1	決勝	仙台育英	8	1	下関国際	\N
2025	第107回	8月5日	1	1回戦	創成館	3	1	小松大谷	\N
2025	第107回	8月6日	1	1回戦	仙台育英	5	0	鳥取城北	\N
2025	第107回	8月6日	2	1回戦	開星	6	5	宮崎商	延長10回
2025	第107回	8月6日	3	1回戦	沖縄尚学	1	0	金足農	\N
2025	第107回	8月6日	4	1回戦	鳴門	5	4	天理	\N
2025	第107回	8月7日	3	1回戦	津田学園	5	4	叡明	延長12回
2025	第107回	8月7日	4	1回戦	広陵	3	1	旭川志峯	\N
2025	第107回	8月8日	1	1回戦	花巻東	4	1	智辯和歌山	\N
2025	第107回	8月8日	2	1回戦	東洋大姫路	5	3	済美	\N
2025	第107回	8月8日	3	1回戦	横浜	5	0	敦賀気比	\N
2025	第107回	8月8日	4	1回戦	綾羽	6	4	高知中央	延長10回
2025	第107回	8月9日	1	1回戦	西日本短大付	4	3	弘前学院聖愛	延長10回
2025	第107回	8月9日	2	1回戦	聖隷クリストファー	5	1	明秀日立	\N
2025	第107回	8月9日	3	1回戦	佐賀北	5	4	青藍泰斗	延長10回
2025	第107回	8月9日	4	1回戦	明豊	6	2	市船橋	\N
2025	第107回	8月11日	1	1回戦	県岐阜商	6	3	日大山形	\N
2025	第107回	8月11日	2	1回戦	東海大熊本星翔	10	7	北海	\N
2025	第107回	8月11日	3	2回戦	高川学園	8	5	未来富山	\N
2025	第107回	8月11日	4	2回戦	日大三	3	2	豊橋中央	\N
2025	第107回	8月12日	1	2回戦	山梨学院	6	2	聖光学院	\N
2025	第107回	8月12日	2	2回戦	岡山学芸館	3	0	松商学園	\N
2025	第107回	8月12日	3	2回戦	尽誠学園	3	0	東大阪大柏原	\N
2025	第107回	8月13日	1	2回戦	京都国際	6	3	健大高崎	\N
2025	第107回	8月13日	2	2回戦	関東第一	6	1	中越	\N
2025	第107回	8月13日	3	2回戦	創成館	1	0	神村学園	\N
2025	第107回	8月14日	1	2回戦	仙台育英	6	2	開星	\N
2025	第107回	8月14日	2	2回戦	沖縄尚学	3	0	鳴門	\N
2025	第107回	8月14日	3	2回戦	横浜	5	1	綾羽	\N
2025	第107回	8月14日	4	2回戦	津田学園	\N	\N	広陵	不戦勝（広陵辞退）
2025	第107回	8月15日	1	2回戦	東洋大姫路	8	4	花巻東	\N
2025	第107回	8月15日	2	2回戦	西日本短大付	2	1	聖隷クリストファー	\N
2025	第107回	8月15日	3	2回戦	明豊	6	1	佐賀北	\N
2025	第107回	8月15日	4	2回戦	県岐阜商	4	3	東海大熊本星翔	\N
2025	第107回	8月16日	1	3回戦	日大三	9	4	高川学園	\N
2025	第107回	8月16日	2	3回戦	山梨学院	14	0	岡山学芸館	\N
2025	第107回	8月16日	3	3回戦	京都国際	3	2	尽誠学園	\N
2025	第107回	8月16日	4	3回戦	関東第一	4	1	創成館	\N
2025	第107回	8月17日	1	3回戦	沖縄尚学	5	3	仙台育英	延長11回
2025	第107回	8月17日	2	3回戦	横浜	5	0	津田学園	\N
2025	第107回	8月17日	3	3回戦	東洋大姫路	3	2	西日本短大付	\N
2025	第107回	8月17日	4	3回戦	県岐阜商	3	1	明豊	\N
2025	第107回	8月19日	1	準々決勝	山梨学院	11	4	京都国際	\N
2025	第107回	8月19日	2	準々決勝	日大三	5	3	関東第一	\N
2025	第107回	8月19日	3	準々決勝	県岐阜商	8	7	横浜	延長10回
2025	第107回	8月19日	4	準々決勝	沖縄尚学	2	1	東洋大姫路	\N
2025	第107回	8月21日	1	準決勝	日大三	4	2	県岐阜商	延長10回
2025	第107回	8月21日	2	準決勝	沖縄尚学	5	4	山梨学院	\N
2025	第107回	8月23日	1	決勝	沖縄尚学	3	1	日大三	\N
2023	第105回	8月6日	1	1回戦	土浦日大	8	3	上田西	延長10回TB
2023	第105回	8月6日	2	1回戦	聖光学院	9	3	共栄学園	\N
2023	第105回	8月6日	3	1回戦	仙台育英	8	9	浦和学院	\N
2023	第105回	8月7日	1	1回戦	川之江	4	3	履正社	\N
2023	第105回	8月7日	2	1回戦	履正社	10	0	鳥取商	\N
2023	第105回	8月7日	3	1回戦	智弁学園	7	6	英明	延長10回TB
2023	第105回	8月7日	4	1回戦	愛工大名電	1	0	徳島商	\N
2023	第105回	8月8日	1	1回戦	花巻東	5	4	浜松開誠館	\N
2023	第105回	8月8日	2	1回戦	前橋商	5	4	日大三	\N
2023	第105回	8月8日	3	1回戦	日大山形	2	9	おかやま山陽	\N
2023	第105回	8月8日	4	1回戦	大垣日大	7	2	近江	\N
2023	第105回	8月9日	1	1回戦	鳥栖工	3	2	日大三	延長12回TB
2023	第105回	8月9日	2	1回戦	日大三	3	0	社	\N
2023	第105回	8月9日	3	1回戦	市和歌山	5	4	東京学館新潟	\N
2023	第105回	8月9日	4	1回戦	神村学園	11	2	立命館宇治	\N
2023	第105回	8月10日	1	1回戦	東海大熊本星翔	4	2	北海	\N
2023	第105回	8月10日	2	1回戦	北海	3	8	明豊	延長10回TB
2023	第105回	8月10日	3	1回戦	創成館	6	3	星稜	\N
2023	第105回	8月10日	4	1回戦	沖縄尚学	3	0	いなべ総合	台風延期初戦
2023	第105回	8月11日	1	1回戦	広陵	8	3	立正大淞南	\N
2023	第105回	8月11日	2	1回戦	慶應義塾	9	4	北陸	\N
2023	第105回	8月11日	3	1回戦	文星芸大付	9	7	宮崎学園	\N
2023	第105回	8月11日	4	1回戦	八戸学院光星	7	0	ノースアジア大明桜	\N
2023	第105回	8月12日	1	1回戦	専大松戸	7	5	東海大甲府	\N
2023	第105回	8月12日	2	1回戦	土浦日大	10	0	九州国際大付	\N
2023	第105回	8月12日	3	1回戦	履正社	6	0	花巻東	\N
2023	第105回	8月12日	4	1回戦	おかやま山陽	4	3	大垣日大	延長10回TB
2023	第105回	8月13日	1	1回戦	高知中央	9	4	川之江	\N
2023	第105回	8月13日	2	1回戦	智弁学園	12	6	徳島商	\N
2023	第105回	8月13日	3	1回戦	花巻東	5	4	浜松開誠館	\N
2023	第105回	8月13日	4	1回戦	富山商	2	13	おかやま山陽	延長10回TB
2023	第105回	8月14日	1	2回戦	鳥栖工	2	1	富山商	\N
2023	第105回	8月14日	2	2回戦	市和歌山	1	11	神村学園	\N
2023	第105回	8月14日	3	2回戦	浜松開誠館	5	2	北海	\N
2023	第105回	8月14日	4	2回戦	前橋商	3	0	日大三	\N
2023	第105回	8月16日	1	2回戦	沖縄尚学	5	1	創成館	\N
2023	第105回	8月16日	2	2回戦	慶應義塾	6	3	広陵	延長10回TB
2023	第105回	8月16日	3	2回戦	八戸学院光星	6	3	文星芸大付	\N
2023	第105回	8月16日	4	2回戦	土浦日大	10	6	専大松戸	\N
2023	第105回	8月17日	1	3回戦	仙台育英	19	4	聖光学院	\N
2023	第105回	8月17日	2	3回戦	智弁学園	2	2	前橋商	\N
2023	第105回	8月17日	3	3回戦	おかやま山陽	7	2	近江	\N
2023	第105回	8月17日	4	3回戦	神村学園	10	4	浜松開誠館	\N
2023	第105回	8月18日	1	3回戦	慶應義塾	6	2	土浦日大	\N
2023	第105回	8月18日	2	3回戦	八戸学院光星	7	3	鳥栖工	\N
2023	第105回	8月18日	3	3回戦	高知中央	4	9	履正社	\N
2023	第105回	8月18日	4	3回戦	花巻東	5	4	智弁学園	\N
2023	第105回	8月19日	1	準々決勝	慶應義塾	7	2	沖縄尚学	\N
2023	第105回	8月19日	2	準々決勝	土浦日大	9	2	八戸学院光星	\N
2023	第105回	8月19日	3	準々決勝	神村学園	6	0	おかやま山陽	\N
2023	第105回	8月19日	4	準々決勝	仙台育英	9	4	花巻東	\N
2023	第105回	8月21日	1	準決勝	仙台育英	6	2	神村学園	\N
2023	第105回	8月21日	2	準決勝	慶應義塾	2	0	土浦日大	\N
2023	第105回	8月23日	1	決勝	慶應義塾	8	2	仙台育英	\N
2024	第106回	8月7日	1	1回戦	有田工	6	4	滋賀学園	\N
2024	第106回	8月7日	2	1回戦	健大高崎	1	2	英明	\N
2024	第106回	8月7日	3	1回戦	岐阜城北	6	7	智弁学園	延長11回TB
2024	第106回	8月8日	1	1回戦	大阪桐蔭	5	3	小松大谷	\N
2024	第106回	8月8日	2	1回戦	小松大谷	8	4	明豊	\N
2024	第106回	8月8日	3	1回戦	京都国際	7	3	札幌日大	\N
2024	第106回	8月9日	1	1回戦	新潟産大付	2	1	花咲徳栄	\N
2024	第106回	8月9日	2	1回戦	金足農	4	0	西日本短大付	\N
2024	第106回	8月9日	3	1回戦	菰野	6	2	南陽工	\N
2024	第106回	8月10日	1	1回戦	中京大中京	4	3	宮崎商	\N
2024	第106回	8月10日	2	1回戦	神村学園	7	5	木更津総合	\N
2024	第106回	8月10日	3	1回戦	岡山学芸館	2	0	聖カタリナ	\N
2024	第106回	8月10日	4	1回戦	掛川西	8	4	日本航空	\N
2024	第106回	8月11日	1	1回戦	早稲田実	8	4	鳴門渦潮	\N
2024	第106回	8月11日	2	1回戦	聖光学院	1	0	鶴岡東	\N
2024	第106回	8月11日	3	1回戦	大社	3	1	報徳学園	延長
2024	第106回	8月11日	4	1回戦	創成館	4	0	白樺学園	\N
2024	第106回	8月12日	1	1回戦	広陵	2	1	熊本工	\N
2024	第106回	8月12日	2	1回戦	東海大相模	4	0	富山商	\N
2024	第106回	8月12日	3	1回戦	明徳義塾	7	0	鳥取城北	\N
2024	第106回	8月12日	4	1回戦	関東第一	7	1	北陸	\N
2024	第106回	8月13日	1	1回戦	青森山田	9	1	長野日大	\N
2024	第106回	8月13日	2	1回戦	石橋	5	0	聖和学園	\N
2024	第106回	8月13日	3	1回戦	霞ヶ浦	5	4	智辯和歌山	延長11回TB
2024	第106回	8月13日	4	1回戦	滋賀学園	5	0	花巻東	\N
2024	第106回	8月14日	1	2回戦	健大高崎	1	2	智弁学園	\N
2024	第106回	8月14日	2	2回戦	大阪桐蔭	0	3	小松大谷	\N
2024	第106回	8月14日	3	2回戦	京都国際	4	1	新潟産大付	\N
2024	第106回	8月14日	4	2回戦	西日本短大付	13	6	金足農	\N
2024	第106回	8月15日	1	2回戦	中京大中京	3	4	神村学園	\N
2024	第106回	8月15日	2	2回戦	岡山学芸館	2	1	掛川西	\N
2024	第106回	8月15日	3	2回戦	早稲田実	1	0	聖光学院	延長10回TB
2024	第106回	8月15日	4	2回戦	大社	5	1	創成館	延長10回TB
2024	第106回	8月16日	1	2回戦	東海大相模	8	1	広陵	\N
2024	第106回	8月16日	2	2回戦	関東第一	3	2	明徳義塾	\N
2024	第106回	8月16日	3	2回戦	青森山田	5	0	石橋	\N
2024	第106回	8月16日	4	2回戦	滋賀学園	6	2	霞ヶ浦	\N
2024	第106回	8月17日	1	3回戦	智弁学園	9	6	菰野	\N
2024	第106回	8月17日	2	3回戦	京都国際	4	0	西日本短大付	\N
2024	第106回	8月17日	3	3回戦	神村学園	8	7	岡山学芸館	\N
2024	第106回	8月17日	4	3回戦	早稲田実	2	0	大社	延長11回TB
2024	第106回	8月19日	1	準々決勝	関東第一	2	1	東海大相模	\N
2024	第106回	8月19日	2	準々決勝	青森山田	1	0	滋賀学園	\N
2024	第106回	8月19日	3	準々決勝	京都国際	4	0	智弁学園	\N
2024	第106回	8月19日	4	準々決勝	神村学園	8	2	大社	\N
2024	第106回	8月21日	1	準決勝	関東第一	2	1	神村学園	\N
2024	第106回	8月21日	2	準決勝	京都国際	3	2	青森山田	\N
2024	第106回	8月23日	1	決勝	京都国際	2	1	関東第一	延長10回TB
\.


--
-- Name: tmp_media_rank pk_code_schoolname; Type: CONSTRAINT; Schema: koshien; Owner: -
--

ALTER TABLE ONLY koshien.tmp_media_rank
    ADD CONSTRAINT pk_code_schoolname PRIMARY KEY (year, school_name);


--
-- Name: tmp_koshien_appearances_summer pk_code_schoolname_appearances_summer; Type: CONSTRAINT; Schema: koshien; Owner: -
--

ALTER TABLE ONLY koshien.tmp_koshien_appearances_summer
    ADD CONSTRAINT pk_code_schoolname_appearances_summer PRIMARY KEY (year, school_name);


--
-- Name: tmp_coaching_career pk_rank_no_manager_name; Type: CONSTRAINT; Schema: koshien; Owner: -
--

ALTER TABLE ONLY koshien.tmp_coaching_career
    ADD CONSTRAINT pk_rank_no_manager_name PRIMARY KEY (rank_no, manager_name);


--
-- Name: tmp_tournament_games pk_year_date_round_school; Type: CONSTRAINT; Schema: koshien; Owner: -
--

ALTER TABLE ONLY koshien.tmp_tournament_games
    ADD CONSTRAINT pk_year_date_round_school PRIMARY KEY (year, game_date, round_name, winner_school);


--
-- Name: tmp_team_batting_stats pk_year_tournament_school_name; Type: CONSTRAINT; Schema: koshien; Owner: -
--

ALTER TABLE ONLY koshien.tmp_team_batting_stats
    ADD CONSTRAINT pk_year_tournament_school_name PRIMARY KEY (year, tournament, school_name);


--
-- Name: tmp_team_pitching_stats pk_year_tournament_school_name2; Type: CONSTRAINT; Schema: koshien; Owner: -
--

ALTER TABLE ONLY koshien.tmp_team_pitching_stats
    ADD CONSTRAINT pk_year_tournament_school_name2 PRIMARY KEY (year, tournament, school_name);


--
-- PostgreSQL database dump complete
--

\unrestrict rFOcqASFpGGoRzajLSVcJ1ODcjnMyn3qkDDof5ezvnHEe7gzvO3tjsDYE6K6iiG

