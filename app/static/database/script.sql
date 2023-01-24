PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE CANTORES (
            id_cantor INTEGER NOT NULL,
            nome TEXT NOT NULL,
            sexualidade TEXT NOT NULL,
            pronomes TEXT NOT NULL,
            n_de_albuns INTEGER NOT NULL,
            PRIMARY KEY (id_cantor)
        );
INSERT INTO CANTORES VALUES(001,'Jao', 'Bissexual', 'ELE/DELE', 4);
INSERT INTO CANTORES VALUES(002,'Pabllo Vittar', 'GAY','ELA/DELA', 10);
INSERT INTO CANTORES VALUES(003,'Gloria Groove','GAY', 'ELA/DELA', 4);
INSERT INTO CANTORES VALUES(004,'Linn da Quebrada', 'indefinida','ELA/DELA', 1);
INSERT INTO CANTORES VALUES(005,'Renato Russo', 'Bissexual', 'ELE/DELE', 8);
INSERT INTO CANTORES VALUES(006,'Luisa Sonza', 'BISSEXUAL', 'ELA/DELA', 5);
INSERT INTO CANTORES VALUES(007,'Cazuza', 'BISSEXUAL', 'ELE/DELE', 14);
INSERT INTO CANTORES VALUES(008,'Lulu Santos', 'BISSEXUAL', 'ELE/DELE', 31);
INSERT INTO CANTORES VALUES(009,'DAY Limns', 'LESBICA', 'ELA/DELA', 3);
INSERT INTO CANTORES VALUES(010,'Carol Biazin', 'LESBICA', 'ELA/DELA', 3);
INSERT INTO CANTORES VALUES(011,'Cassia Eller', 'LESBICA', 'ELA/DELA', 25);
INSERT INTO CANTORES VALUES(012,'Ludmilla', 'BISSEXUAL', 'ELA/DELA', 9);
INSERT INTO CANTORES VALUES(013,'Anitta', 'BISSEXUAL', 'ELA/DELA', 9);
INSERT INTO CANTORES VALUES(014,'Danny Bond', 'indefinida', 'ELA/DELA', 1);
INSERT INTO CANTORES VALUES(015,'Charmeleo', 'GAY', 'ELE/DELE', 2);
INSERT INTO CANTORES VALUES(016,'Gabeu', 'GAY', 'ELE/DELE', 1);
INSERT INTO CANTORES VALUES(017,'Elana Dara', 'BISSEXUAL', 'ELA/DELA', 1);


CREATE TABLE ALBUNS (
            id_album INTEGER NOT NULL,
            id_cantor INTEGER NOT NULL,
            nome TEXT NOT NULL,
            nome_album TEXT NOT NULL,
            gravadora TEXT NOT NULL,
            ano INTEGER NOT NULL,
            PRIMARY KEY (id_album, id_cantor),
            FOREIGN KEY (id_cantor) REFERENCES CANTORES(id_cantor)
        );
INSERT INTO ALBUNS VALUES(101, 'Jão','Pirata', 'Universal', 2021, 001);
INSERT INTO ALBUNS VALUES(102, 'Jão', 'Anti-Herói', 'Universal', 2019, 001);
INSERT INTO ALBUNS VALUES(103,'Jão', 'Lobos', 'Universal', 2018, 001);
INSERT INTO ALBUNS VALUES(104, 'Pabllo Vittar', 'Batidão Tropical', 'Sony', 2021, 002);
INSERT INTO ALBUNS VALUES(105, 'Pabllo Vittar', 'Vai Passar Mal', 'BMT', 2017, 002);
INSERT INTO ALBUNS VALUES(106, 'Pabllo Vittar', 'Não para Não', 'Sony', 2018, 002);
INSERT INTO ALBUNS VALUES(107, 'Glória Groove', 'Affair', 'SB Music', 2020, 003);
INSERT INTO ALBUNS VALUES(108, 'Glória Groove', 'Lady Leste', 'SB Music', 2022, 003);
INSERT INTO ALBUNS VALUES(109, 'Linn da Querada', 'Pajubá', 'Badsista', 2017, 004);
INSERT INTO ALBUNS VALUES(110, 'Renato Russo', 'Que país é esse?', 'EMI', 1987, 005);
INSERT INTO ALBUNS VALUES(111, 'Renato Russo', 'O Trovador Solitário', 'Discobertas', 2008, 005);
INSERT INTO ALBUNS VALUES(112, 'Luísa Sonza', 'Pandora', 'Universal', 2019, 006);
INSERT INTO ALBUNS VALUES(113, 'Luísa Sonza', 'Doce 22', 'Universal', 2022, 006);
INSERT INTO ALBUNS VALUES(114, 'Cazuza', 'Exagerado', 'Som Livre', 1985, 007);
INSERT INTO ALBUNS VALUES(115, 'Cazuza', 'Ideologia', 'Philips', 1988, 007);
INSERT INTO ALBUNS VALUES(116, 'Cazuza', 'Só se for a dois', 'Philips', 1987, 007);
INSERT INTO ALBUNS VALUES(117, 'Lulu Santos', 'Tempos Modernos', 'Warner', 1982, 008);
INSERT INTO ALBUNS VALUES(118, 'Lulu Santos', 'O Ritimo do Momento', 'Warner', 1983, 008);
INSERT INTO ALBUNS VALUES(119, 'Lulu Santos', 'Toda forma de Amor', 'RCA', 1988, 008);
INSERT INTO ALBUNS VALUES(120, 'Day Limns', 'Day', 'Universal', 2018, 009);
INSERT INTO ALBUNS VALUES(121, 'Day Limns', 'Bem-vindo Ao Clube', 'Universal', 2021, 009);
INSERT INTO ALBUNS VALUES(122, 'Day Limns', 'A Culpa é do Meu Signo', 'Universal', 2020, 009);
INSERT INTO ALBUNS VALUES(123, 'Carol Biazin', 'Beijo de Judas', 'Universal', 2021, 010);
INSERT INTO ALBUNS VALUES(124, 'Carol Biazin', 'S', 'Universal', 2019, 010);
INSERT INTO ALBUNS VALUES(125, 'Cássia Eller', 'Relicário', 'Universal', 2012, 011);
INSERT INTO ALBUNS VALUES(126, 'Cássia Eller', 'Acústico MTV', 'Universal', 2001, 011);
INSERT INTO ALBUNS VALUES(127, 'Ludmilla', 'Numanice 2', 'Warner', 2022, 012);
INSERT INTO ALBUNS VALUES(128, 'Ludmilla', 'A Danada sou Eu', 'Warner', 2016, 012);
INSERT INTO ALBUNS VALUES(129, 'Ludmilla', 'Hello Mundo', 'Warner', 2019, 012);
INSERT INTO ALBUNS VALUES(130, 'Anitta', 'BANG', 'Warner', 2015, 013);
INSERT INTO ALBUNS VALUES(131, 'Anitta', 'Anitta', 'Warner', 2013, 013);
INSERT INTO ALBUNS VALUES(132, 'Anitta', 'Versions of Me', 'Warner', 2022, 013);
INSERT INTO ALBUNS VALUES(133, 'Danny Bond', 'Épica', 'Danny Bond', 2017, 014);
INSERT INTO ALBUNS VALUES(134, 'Charmeleo', 'Ecdise', 'Charmeleo', 2021, 015);
INSERT INTO ALBUNS VALUES(135, 'Charmeleo', 'Utopiataboo', 'Charmeleo', 2019, 015);
INSERT INTO ALBUNS VALUES(136, 'Gabeu', 'Agropoc', 'Gabeu', 2021, 016);
INSERT INTO ALBUNS VALUES(137, 'Elana Dara', 'Teoria do Caos', 'Warner', 2021, 017);

CREATE TABLE TOP_5 (
            id_cantor INTEGER NOT NULL,
            musica_1 TEXT NOT NULL,
            musica_2 TEXT NOT NULL,
            musica_3 TEXT NOT NULL,
            musica_4 TEXT NOT NULL,
            musica_5 TEXT NOT NULL,
            PRIMARY KEY (id_cantor),
            FOREIGN KEY (id_cantor) REFERENCES CANTORES(id_cantor)
        );
INSERT INTO TOP_5 VALUES(001,'Idiota', 'Meninos e Meninas', 'Acontece', 'Imaturo', 'Essa eu fiz pro nosso amor');
INSERT INTO TOP_5 VALUES(002,'Disk me', 'Amor de que', 'K.O', 'Triste com T', 'Indestrutivel');
INSERT INTO TOP_5 VALUES(003,'A tua voz', 'Apaga a Luz', 'Radar', 'A Queda', 'Vermelho');
INSERT INTO TOP_5 VALUES(004,'Oração', 'Medrosa', 'Tudo', 'A lenda', 'Absolutas');
INSERT INTO TOP_5 VALUES(005,'Mais uma vez', 'Tempo perdido', 'Eduardo e Monica', '´Por enquanto', 'Pais e Filhos');
INSERT INTO TOP_5 VALUES(006,'Penhasco', 'Melhor sozinha', 'Olhos castanhos', 'Cachorrinhas', 'Flores');
INSERT INTO TOP_5 VALUES(007,'exagerado', 'codinome beija-flor', 'o tempo nao para', 'Eu preciso Dizer que te amo', 'Faz parte do meu show');
INSERT INTO TOP_5 VALUES(008,'tempos modernos', 'apenas mais uma noite de amor', 'toda forma de amor', 'um certo alguem', 'como uma onda');
INSERT INTO TOP_5 VALUES(009,'finais mentem', 'diluvio', 'cliche', 'geminiana', 'Inevital');
INSERT INTO TOP_5 VALUES(010,'inicio do fim', 'beijo de judas', 'suas linhas', 'talvez', 'sempre que der');
INSERT INTO TOP_5 VALUES(011,'malandragem,', 'o segundo sol', 'por enquanto', 'palavras ao vento', 'luz dos olhos');
INSERT INTO TOP_5 VALUES(012,'maldivas', 'modo aviao', '700 por hora', 'a boba fui eu', 'te amar demais');
INSERT INTO TOP_5 VALUES(013,'meiga e abusada', 'cobertor', 'bang', 'shoe das poderosas', 'envolver');
INSERT INTO TOP_5 VALUES(014,'tcheca', 'ai meu deus', 'aquecimento da bond', 'barbie', 'prikito');
INSERT INTO TOP_5 VALUES(015,'tokyo', 'voce me f**', 'frequente(mente)', 'enigma', 'vai querer');
INSERT INTO TOP_5 VALUES(016,'amor rural', 'bailao', 'sugar daddy', 'bem te vi', 'cowboy');
INSERT INTO TOP_5 VALUES(017,'Aff...', 'sem fim', 'acredito em fadas', 'carente pra sempre', 'opala');


CREATE TABLE CANTOR_ALBUM (
            id_cantor INTEGER NOT NULL,
            id_album INTEGER NOT NULL,
            PRIMARY KEY (id_cantor, id_album),
            FOREIGN KEY (id_cantor) REFERENCES CANTORES(id_cantor),
            FOREIGN KEY (id_album) REFERENCES ALBUNS(id_album)
        );
INSERT INTO CANTOR_ALBUM VALUES(001, 101);
INSERT INTO CANTOR_ALBUM VALUES(001, 102);
INSERT INTO CANTOR_ALBUM VALUES(001, 103);
INSERT INTO CANTOR_ALBUM VALUES(002, 104);
INSERT INTO CANTOR_ALBUM VALUES(002, 105);
INSERT INTO CANTOR_ALBUM VALUES(002, 106);
INSERT INTO CANTOR_ALBUM VALUES(003, 107);
INSERT INTO CANTOR_ALBUM VALUES(003, 108);
INSERT INTO CANTOR_ALBUM VALUES(004, 109);
INSERT INTO CANTOR_ALBUM VALUES(005, 110);
INSERT INTO CANTOR_ALBUM VALUES(005, 111);
INSERT INTO CANTOR_ALBUM VALUES(006, 112);
INSERT INTO CANTOR_ALBUM VALUES(006, 113);
INSERT INTO CANTOR_ALBUM VALUES(007, 114);
INSERT INTO CANTOR_ALBUM VALUES(007, 115);
INSERT INTO CANTOR_ALBUM VALUES(007, 116);
INSERT INTO CANTOR_ALBUM VALUES(008, 117);
INSERT INTO CANTOR_ALBUM VALUES(008, 118);
INSERT INTO CANTOR_ALBUM VALUES(008, 119);
INSERT INTO CANTOR_ALBUM VALUES(009, 120);
INSERT INTO CANTOR_ALBUM VALUES(009, 121);
INSERT INTO CANTOR_ALBUM VALUES(009, 122);
INSERT INTO CANTOR_ALBUM VALUES(010, 123);
INSERT INTO CANTOR_ALBUM VALUES(010, 124);
INSERT INTO CANTOR_ALBUM VALUES(011, 125);
INSERT INTO CANTOR_ALBUM VALUES(011, 126);
INSERT INTO CANTOR_ALBUM VALUES(012, 127);
INSERT INTO CANTOR_ALBUM VALUES(012, 128);
INSERT INTO CANTOR_ALBUM VALUES(012, 129);
INSERT INTO CANTOR_ALBUM VALUES(013, 130);
INSERT INTO CANTOR_ALBUM VALUES(013, 131);
INSERT INTO CANTOR_ALBUM VALUES(013, 132);
INSERT INTO CANTOR_ALBUM VALUES(014, 133);
INSERT INTO CANTOR_ALBUM VALUES(015, 134);
INSERT INTO CANTOR_ALBUM VALUES(015, 135);
INSERT INTO CANTOR_ALBUM VALUES(016, 136);
INSERT INTO CANTOR_ALBUM VALUES(017, 137);


COMMIT;
