DROP TYPE IF EXISTS categ_prajitura;
DROP TYPE IF EXISTS tipuri_produse;

CREATE TYPE categ_prajitura AS ENUM( 'comanda speciala', 'aniversara', 'editie limitata', 'pentru copii', 'dietetica','comuna');
CREATE TYPE tipuri_produse AS ENUM('cofetarie', 'patiserie', 'gelaterie');


CREATE TABLE IF NOT EXISTS prajituri (
   id serial PRIMARY KEY,
   nume VARCHAR(50) UNIQUE NOT NULL,
   descriere TEXT,
   pret NUMERIC(8,2) NOT NULL,
   gramaj INT NOT NULL CHECK (gramaj>=0),   
   tip_produs tipuri_produse DEFAULT 'cofetarie',
   calorii INT NOT NULL CHECK (calorii>=0),
   categorie categ_prajitura DEFAULT 'comuna',
   ingrediente VARCHAR [], --pot sa nu fie specificare deci nu punem NOT NULL
   pt_diabetici BOOLEAN NOT NULL DEFAULT FALSE,
   imagine VARCHAR(300),
   data_adaugare TIMESTAMP DEFAULT current_timestamp
);

INSERT into prajituri (nume,descriere,pret, gramaj, calorii, tip_produs, categorie, ingrediente, pt_diabetici, imagine) VALUES 
('Savarină', 'Prăjitură insiropată, cu frișcă', 7.5 , 200, 400, 'cofetarie', 'comuna', '{"faina","lapte","frisca","zahar"}', False, 'aproximativ-savarina.jpg'),

('Amandină', 'Prăjitură cu ciocolată', 6 , 200, 400, 'cofetarie', 'comuna', '{"faina","ciocolata","lapte","zahar","unt"}', False, 'posibil-amandina.jpg'),

('Tort glazurat', 'Tort pentru evenimente, poate fi decorat cu diverse culori', 35 , 1000, 2500, 'cofetarie', 'comanda speciala', '{"oua","zahar","faina","lapte","ciocolata","alune"}', False,'tort-glazurat.jpg'),

('Dulcelind cu fructe', 'Rețetă proprie, cu conținut sănătos (dacă ignorați tonele de zahăr) de fruncte proaspete', 10 , 250, 620, 'cofetarie', 'aniversara', '{"frisca","zahar","faina","zmeura","lapte","mure","capsuni"}', False,'dulcelind.jpg'),

('Tartă cu căpșuni', 'Sub căpșuni se află o tartă.', 6 , 245, 280, 'cofetarie', 'comuna', '{"vanilie","faina","capsuni","lapte", "indulcitor"}', True,'tarta-capsuni.jpg'),

('Nimic', 'Nimic', 10 , 0, 0, 'cofetarie', 'dietetica', '{}', False, 'nimic.jpg'),

('Cozonac zburător', 'Cineva a vărsat heliu peste aluat.', 25.5 , 1000, 1800, 'patiserie', 'comuna', '{"zahar","unt","faina","lapte","cacao","alune", "nuca"}', False, 'cozonac-zburator.jpg'),

('Brioșe', 'Aluat pufos, cu bucățele de ciocolată. Bucățelele de ciocolata, însă, nu sunt tocmai pufoase.', 8 , 145, 320, 'patiserie', 'comuna', '{"ciocolata","lapte","unt","migdale","faina","zahar"}', False, 'briose.jpg'),

('Turtă dulce', 'Un produs bun de savurat de Craciun. Sau și mai târziu dacă stocul a depășit cererea. De obicei mai găsiți și prin iunie...', 12 , 400, 550, 'patiserie', 'aniversara', '{"faina","lapte","scortisoara","zahar","unt"}', False, 'turta-dulce.jpg'),

('Turtă dulce dietetică', 'Îndulcitor în loc de zahăr. Dar nu vă lăsați păcăliți de nume, în rest nimic nu-i dietetic.', 10 , 400, 520, 'patiserie', 'aniversara', '{"faina","lapte","zaharina","unt","scortisoara"}', True, 'turta-dulce-dietetica.jpg'),

('Căsuță din turtă dulce', 'Vine cu tot cu vrăjitoare și cuptor la pachet. A nu se lăsa în mijlocul pădurii.', 70 , 450, 2700, 'patiserie', 'aniversara', '{"unt","scortisoara", "oua","faina","lapte","zahar"}', False, 'casuta-turta-dulce.jpg'),

('Croissant', 'Un răsfăț pufos și dulce... mda... dulce... dacă nu încurcă Dorelina, iar, sarea cu zahărul!!!', 5 , 150, 285, 'patiserie', 'comuna', '{"faina","lapte","zahar/sare","unt","ciocolata","migdale"}', False, 'croissant.jpg'),

('Prajitura căpșuni', 'Prăjitura se face doar cu comandă specială, fiindcă apoi o comandăm și noi la rândul nostru la cofetăria vecină.', 15 , 180, 385, 'cofetarie', 'comanda speciala', '{"faina","lapte","zahar", "capsuni","unt","gelatina"}', False, 'prajitura-capsuni.jpg'),

('Nasturei cu dulceață', 'Pentru când năstureii normali cedează fiindcă ați mâncat prea multă dulceață', 20.5 , 350, 700, 'patiserie', 'comuna', '{"migdale", "faina","lapte","zahar","unt","dulceata"}', False, 'nasturei-dulceata.jpg'),


('Bomboane de ciocolată pe băț', 'Bățul e cel comestibil, nu bomboana.', 6, 100, 210,'cofetarie', 'pentru copii', '{"ciocolata", "zahar", "lapte", "alune", "faina"}', False, 'bomboane-ciocolata-bat.jpg'),

('Înghețată fumătoare', 'Din când în când, tușește... Dar nu are COVID!', 18.5 , 225, 370, 'gelaterie', 'comuna', '{"smantana","lapte","migdale", "dulceata","zahar","vanilie","ciocolata", "frisca"}', False, 'inghetata-fumatoare.jpg'),


('Înghețată multicoloră', 'Când storci un curcubeu peste înghețată... Ediție limitată; fabricăm doar după ploaie.', 12 , 120, 270, 'gelaterie', 'editie limitata', '{"smantana","lapte","migdale", "dulceata","zahar","vanilie","ciocolata", "frisca"}', False, 'inghetata-multicolora.jpg'),


('Brioșă cu înghețată', 'Nu încercam să fim creativi... Dorelina a încurcat iar rețetele. Măcar are culoare roz', 14 , 235, 340, 'gelaterie', 'pentru copii', '{"frisca", "smantana", "lapte", "ceva roz", "faina","zahar","vanilie"}', False, 'briosa-inghetata.jpg'),

('Înghețată generică', 'Când bușim așa de tare rețeta încât nu se mai încadrează în niuna dintre celelalte categorii.', 8, 90, 130, 'gelaterie','comuna','{"frisca", "smantana", "lapte", "ceva roz", "faina","zahar","vanilie"}', False, 'inghetata-generica.jpg'),

('Imagine cu înghețată', 'Pentru cei aflați la dietă.', 5, 10,10,'gelaterie', 'comuna', '{"hârtie", "tuș"}', False, 'imagine-cu-inghetata.jpg'),


('Bomboane colorate', 'Pentru copiii care doresc să afle devreme cum e o vizită la dentist.', 7, 150,340,'cofetarie', 'pentru copii', '{"zahar", "ciocolata","lapte"}', False, 'bomboane-colorate.jpg');



DROP TYPE IF EXISTS categ_prajitura;
DROP TYPE IF EXISTS tipuri_produse;

CREATE TYPE categ_prajitura AS ENUM( 'comanda speciala', 'aniversara', 'editie limitata', 'pentru copii', 'dietetica','comuna');
CREATE TYPE tipuri_produse AS ENUM('cofetarie', 'patiserie', 'gelaterie');


CREATE TABLE IF NOT EXISTS prajituri (
   id serial PRIMARY KEY,
   nume VARCHAR(50) UNIQUE NOT NULL,
   descriere TEXT,
   pret NUMERIC(8,2) NOT NULL,
   gramaj INT NOT NULL CHECK (gramaj>=0),   
   tip_produs tipuri_produse DEFAULT 'cofetarie',
   calorii INT NOT NULL CHECK (calorii>=0),
   categorie categ_prajitura DEFAULT 'comuna',
   ingrediente VARCHAR [], --pot sa nu fie specificare deci nu punem NOT NULL
   pt_diabetici BOOLEAN NOT NULL DEFAULT FALSE,
   imagine VARCHAR(300),
   data_adaugare TIMESTAMP DEFAULT current_timestamp
);

DROP TYPE IF EXISTS edituri;
DROP TYPE IF EXISTS tematici;

CREATE TYPE edituri AS ENUM( 'humanitas', 'librex', 'epica', 'corint','booklet');
CREATE TYPE tematici AS ENUM('fictiune', 'educational', 'aventura');

CREATE TABLE IF NOT EXISTS carti (
   id serial PRIMARY KEY,
   nume VARCHAR(50) UNIQUE NOT NULL,
   descriere TEXT,
   imagine VARCHAR(300),
   tematica tematici NOT NULL ,
   editura edituri NOT NULL,
   pret NUMERIC(8,2) NOT NULL,
   nr_pagini NUMERIC(4) NOT NULL,
   data_adaugare TIMESTAMP DEFAULT current_timestamp,
   isbn VARCHAR (25) NOT NULL,
   autori VARCHAR[],
   semn_carte BOOLEAN NOT NULL DEFAULT FALSE

);

INSERT INTO carti(nume, descriere, imagine, tematica, editura, pret, nr_pagini, isbn, autori,semn_carte) VALUES
('Cartea gastei', 'Un Saint-Rémy răscolit de război dă la iveală o prietenie remarcabilă între două tinere fete: Fabienne și Agnès, două jumătăți ale aceleiași portocale.', 'cartea-gastei.jpg', 'aventura', 'humanitas', 60, 328, '978-606-097-407-9', '{"Yiyun Li"}', False),
('Val și Cetatea Suﬂetelor', 'Ce talent grozav are Ana Alfianu! Pe de o parte, spune o poveste iniţiatică, în genul celor ale lui Michael Ende sau Peter Beagle, cu băieţei și ţestoase vorbitoare, cu pești care se hrănesc cu lacrimi, cu prelegeri policolore despre puterea cuvintelor, cum foarte rar s-au scris în literatura noastră.','val-cetatea.jpg', 'aventura', 'humanitas', 33, 112, '978-973-50-5701-5', '{"Ana Alfianu"}', True),
('Gargantua & Pantagruel', 'La urma urmei, Gargantua & Pantagruel e, într-o anume măsură, un fel de autobiografie nemărturisită, autobiografie în care amintiri din copilărie și din tinerețe sunt transfigurate, în alt fel decât la Creangă, și strecurate dibaci, sub pretextul fantasticului și-al fabulosului.', 'gargantua_si_pantagruel_01.jpg','fictiune', 'corint', 29, 
368, '9786067936773', '{"Francois Rabelais"}', False),
('TESTE CU DICHIS', 'Lucrarea este realizată în conformitate cu programa școlară în vigoare pentru clasa I, având o abordare atractivă și interdisciplinară.', 'teste-cu-dichis-clasa-i_ana-maria-canavoiu_editura-corint-educational-01.jpg', 'educational', 'corint', 52.5, 88, '978-606-088-140-7', '{"Ana-Maria Cănăvoiu", "Mihaela Cârja", "Felicia-Ramona Focht", "Elena Niculae", "Corina Daciana Oprițoiu", "Laura Piroș"}', False),
('Micul print', 'Cartea este o pledoarie pentru iubire, pace, prietenie, comunicare intre lumea copiilor si cea a adultilor, relationare, incredere, o carte de interpretare a simbolurilor, a mesajelor, o carte despre frumusete si ocrotirea ei, o carte despre valorile omenirii.', 'micul.jpg', 'fictiune', 'librex', 38, 128, '978-606-8998-18-3', '{"Antoine de Saint-Exupery"}', True),
('Fără tine', '. Petrecând mai mult timp cu sora ei mai mică, află
despre ea lucruri nebănuite și intuiește că există o legătură neliniștitoare între
aceasta și Ryke Meadows.', 'coperta-Addicted-_2_Fara-tine-3D.png', 'fictiune', 'epica', 52.9, 368, '978-606-9713-66-2', '{"Krista Ritchie", "Becca Ritchie"}', True),
('Fetele, minți sclipitoare', '25 de femei care au marcat lumea științelor', 'Fetele-minti-sclipitoare_coperta-3D-e1639130722760.png', 'educational', 'epica', 38.9, 120, '978-606-94988-4-2', '{"Irene Civico", "Sergio Parra"}',False),
('Caiet de lectură pentru clasa a IV-a', 'Tematica lecturilor include familia, universul copilului şi relaţiile cu cei din jur, lumea basmelor, istoria şi dragostea de ţară, natura, valorile umane, anotimpuri şi sărbători, jucăriile, călătorii şi aventuri, fiecare temă fiind abordată în două lecturi literare (poezie, fabulă, fragment de basm sau roman) sau non-literare.', 'caiet-de-lectura-cls-IV-jpg-webp-768x768.png', 'educational','booklet', 27.9, 112, '978-606-590-373-9', '{"Aura Motofeanu", "Mihaela Stăneci"}', False),
('Love&Gelato. Vacanță la Florența', 'Bestseller New York Times O vacanță de vară în Italia devine un periplu de neuitat prin Toscana, în acest roman cu mult romance, mister și aventură.Oamenii vin în Italia pentru două lucruri: love și gelato, i-a spus cineva odată. Dar uneori au parte de mult mai mult.', 'coperta-1_LoveGelato.jpg', 'aventura', 'epica', 48.9, 352, '978-606-8754-15-4', '{"Jenna Evans Welch"}', True),
( 'Acasă, pe drum','Viața lor de-a lungul ultimilor ani, când au luat-o teleleu prin lume într-o rulotă de cinci metri pătrați, în care-au trăit, s-au iubit, au scris, au fotografiat și-au suferit împreună, ni se pare o fantastică ficțiune, când în realitate noi suntem cei fictivi.','teleleu.jpg', 'aventura', 'humanitas', 45, 388, '978-973-50-5889-0', '{"Elena Stancu", "Cosmin Bumbuț"}', False);
/* de pus instructiunea in documentatie */