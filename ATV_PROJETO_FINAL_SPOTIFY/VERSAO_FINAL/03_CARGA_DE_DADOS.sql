USE SPOTYMUSIC_120;

-- ==========================================================
-- 1. GÊNEROS
-- ==========================================================
CALL sp_ins_genero('Rock'); 
CALL sp_ins_genero('Pop'); 
CALL sp_ins_genero('Indie'); 
CALL sp_ins_genero('Electronic');

-- ==========================================================
-- 2. ARTISTAS (10)
-- ==========================================================
CALL sp_ins_artista('Linkin Park');        -- ID 1
CALL sp_ins_artista('Imagine Dragons');   -- ID 2
CALL sp_ins_artista('Arctic Monkeys');    -- ID 3
CALL sp_ins_artista('The Weeknd');         -- ID 4
CALL sp_ins_artista('Bruno Mars');         -- ID 5
CALL sp_ins_artista('Daft Punk');          -- ID 6
CALL sp_ins_artista('Coldplay');           -- ID 7
CALL sp_ins_artista('Gorillaz');           -- ID 8
CALL sp_ins_artista('Red Hot Chili Peppers'); -- ID 9
CALL sp_ins_artista('Tame Impala');        -- ID 10

-- ==========================================================
-- 3. COMPOSITORES (10)
-- ==========================================================
CALL sp_ins_compositor('Chester Bennington'); -- ID 1
CALL sp_ins_compositor('Dan Reynolds');       -- ID 2
CALL sp_ins_compositor('Alex Turner');        -- ID 3
CALL sp_ins_compositor('Abel Tesfaye');       -- ID 4
CALL sp_ins_compositor('Bruno Mars');         -- ID 5
CALL sp_ins_compositor('Thomas Bangalter');   -- ID 6
CALL sp_ins_compositor('Chris Martin');       -- ID 7
CALL sp_ins_compositor('Damon Albarn');       -- ID 8
CALL sp_ins_compositor('Anthony Kiedis');     -- ID 9
CALL sp_ins_compositor('Kevin Parker');       -- ID 10

-- ==========================================================
-- 4. ÁLBUNS (20 - Dois por Artista)
-- ==========================================================
CALL sp_ins_album('Meteora', 1); CALL sp_ins_album('Hybrid Theory', 1);
CALL sp_ins_album('Night Visions', 2); CALL sp_ins_album('Evolve', 2);
CALL sp_ins_album('AM', 3); CALL sp_ins_album('Humbug', 3);
CALL sp_ins_album('Starboy', 4); CALL sp_ins_album('After Hours', 4);
CALL sp_ins_album('Doo-Wops & Hooligans', 5); CALL sp_ins_album('Unorthodox Jukebox', 5);
CALL sp_ins_album('Discovery', 6); CALL sp_ins_album('Random Access Memories', 6);
CALL sp_ins_album('Parachutes', 7); CALL sp_ins_album('A Rush of Blood to the Head', 7);
CALL sp_ins_album('Demon Days', 8); CALL sp_ins_album('Plastic Beach', 8);
CALL sp_ins_album('Californication', 9); CALL sp_ins_album('By the Way', 9);
CALL sp_ins_album('Currents', 10); CALL sp_ins_album('Lonerism', 10);

-- ==========================================================
-- 5. PLAYLISTS (4)
-- ==========================================================
CALL sp_ins_playlist('Top Hits 2024', CURDATE());   -- ID 1
CALL sp_ins_playlist('Rock Classics', CURDATE());   -- ID 2
CALL sp_ins_playlist('Indie Focus', CURDATE());     -- ID 3
CALL sp_ins_playlist('Electronic Night', CURDATE()); -- ID 4

-- ==========================================================
-- 6. AS 200 MÚSICAS (10 por Álbum)
-- ==========================================================
INSERT INTO musica (titulo, duracao, fk_genero_id_genero) VALUES
-- Linkin Park (1-20)
('Foreword',13,1),('Don\'t Stay',187,1),('Somewhere I Belong',213,1),('Lying from You',175,1),('Hit the Floor',164,1),('Easier to Run',204,1),('Faint',162,1),('Figure.09',197,1),('Breaking the Habit',196,1),('From the Inside',175,1),
('Papercut',184,1),('One Step Closer',155,1),('With You',203,1),('Points of Authority',200,1),('Crawling',209,1),('Runaway',183,1),('By Myself',189,1),('In the End',216,1),('A Place for My Head',224,1),('Forgotten',194,1),
-- Imagine Dragons (21-40)
('Radioactive',186,2),('Tiptoe',194,2),('It\'s Time',240,2),('Demons',177,2),('On Top of the World',192,2),('Amsterdam',241,2),('Hear Me',235,2),('Every Night',217,2),('Bleeding Out',223,2),('Underdog',209,2),
('I Don\'t Know Why',190,2),('Whatever It Takes',201,2),('Believer',204,2),('Walking the Wire',232,2),('Rise Up',231,2),('I\'ll Make It Up to You',262,2),('Yesterday',205,2),('Mouth of the River',221,2),('Thunder',187,2),('Start Over',186,2),
-- Arctic Monkeys (41-60)
('Do I Wanna Know?',272,3),('R U Mine?',200,3),('One for the Road',206,3),('Arabella',207,3),('I Want It All',184,3),('No.1 Party Anthem',243,3),('Mad Sounds',215,3),('Fireside',181,3),('Why\'d You Only Call Me When You\'re High?',161,3),('Snap Out of It',192,3),
('My Propeller',207,3),('Crying Lightning',224,3),('Dangerous Animals',221,3),('Secret Door',223,3),('Potion Approaching',212,3),('Fire and the Thud',237,3),('Cornerstone',197,3),('Dance Little Liar',283,3),('Pretty Visitors',220,3),('The Jeweller\'s Hands',342,3),
-- The Weeknd (61-80)
('Starboy',230,2),('Party Monster',249,2),('False Alarm',220,2),('Reminder',218,2),('Rockin’',232,2),('Secrets',265,2),('True Colors',206,2),('Stargirl Interlude',111,2),('Sidewalks',231,2),('Six Feet Under',237,2),
('Alone Again',250,2),('Too Late',239,2),('Hardest To Love',211,2),('Scared To Live',191,2),('Snowchild',247,2),('Escape from LA',355,2),('Heartless',198,2),('Faith',283,2),('Blinding Lights',200,2),('In Your Eyes',237,2),
-- Bruno Mars (81-100)
('Grenade',222,2),('Just the Way You Are',220,2),('Our First Time',243,2),('Runaway Baby',147,2),('The Lazy Song',189,2),('Marry You',230,2),('Talking to the Moon',217,2),('Liquor Store Blues',229,2),('Count on Me',197,2),('The Other Side',227,2),
('Young Girls',228,2),('Locked Out of Heaven',233,2),('Gorilla',244,2),('Treasure',178,2),('Moonshine',228,2),('When I Was Your Man',213,2),('Natalie',225,2),('Show Me',207,2),('Money Make Her Smile',203,2),('If I Knew',133,2),
-- Daft Punk (101-120)
('One More Time',320,4),('Aerodynamic',207,4),('Digital Love',298,4),('Harder Better Faster Stronger',224,4),('Crescendolls',211,4),('Nightvision',104,4),('Superheroes',237,4),('High Life',202,4),('Something About Us',231,4),('Voyager',227,4),
('Give Life Back to Music',274,4),('The Game of Love',322,4),('Giorgio by Moroder',544,4),('Within',228,4),('Instant Crush',337,4),('Lose Yourself to Dance',353,4),('Touch',498,4),('Get Lucky',248,4),('Beyond',290,4),('Motherboard',341,4),
-- Coldplay (121-140)
('Don\'t Panic',137,1),('Shiver',299,1),('Spies',318,1),('Sparks',227,1),('Yellow',269,1),('Trouble',270,1),('Parachutes',46,1),('High Speed',254,1),('We Never Change',249,1),('Everything\'s Not Lost',448,1),
('Politik',318,1),('In My Place',228,1),('God Put a Smile upon Your Face',297,1),('The Scientist',309,1),('Clocks',307,1),('Daylight',327,1),('Green Eyes',223,1),('Warning Sign',331,1),('A Whisper',238,1),('Amsterdam',319,1),
-- Gorillaz (141-160)
('Intro',63,4),('Last Living Souls',190,4),('Kids with Guns',225,4),('O Green World',272,4),('Dirty Harry',227,4),('Feel Good Inc',221,4),('El Mañana',230,4),('Every Planet We Reach Is Dead',293,4),('November Has Come',161,4),('All Alone',210,4),
('Orchestral Intro',69,4),('Welcome to the World',215,4),('White Flag',223,4),('Rhinestone Eyes',200,4),('Stylo',270,4),('Superfast Jellyfish',179,4),('Empire Ants',283,4),('Glitter Freeze',243,4),('Some Kind of Nature',179,4),('On Melancholy Hill',233,4),
-- Red Hot Chili Peppers (161-180)
('Around the World',238,1),('Parallel Universe',270,1),('Scar Tissue',217,1),('Otherside',255,1),('Get on Top',198,1),('Californication',321,1),('Easily',231,1),('Porcelain',163,1),('Emit Remmus',240,1),('I Like Dirt',157,1),
('By the Way',217,1),('Universally Speaking',259,1),('This Is the Place',257,1),('Dosed',312,1),('Don\'t Forget Me',277,1),('The Zephyr Song',232,1),('Can\'t Stop',269,1),('I Feel Love',215,1),('Midnight',295,1),('Throw Away Your Television',224,1),
-- Tame Impala (181-200)
('Let It Happen',467,3),('Nags',107,3),('The Moment',255,3),('Yes I\'m Changing',270,3),('Eventually',319,3),('Gossip',55,3),('The Less I Know the Better',218,3),('Past Life',227,3),('Disciples',108,3),('Cause I\'m a Man',280,3),
('Be Above It',201,3),('Endors Toi',180,3),('Apocalypse Dreams',359,3),('Mind Mischief',271,3),('Music to Walk Home By',312,3),('Why Won\'t They Talk to Me?',286,3),('Feels Like We Only Go Backwards',192,3),('Keep on Lying',354,3),('Elephant',211,3),('She Just Won\'t Believe Me',57,3);

-- ==========================================================
-- 7. PREENCHIMENTO DAS ASSOCIATIVAS (MANUAL E SEGURO)
-- ==========================================================

-- Vínculo Artista e Música (20 por artista)
INSERT INTO artista_musica (fk_artista_id_artista, fk_musica_id_musica)
SELECT 1, id_musica FROM musica WHERE id_musica BETWEEN 1 AND 20 UNION ALL
SELECT 2, id_musica FROM musica WHERE id_musica BETWEEN 21 AND 40 UNION ALL
SELECT 3, id_musica FROM musica WHERE id_musica BETWEEN 41 AND 60 UNION ALL
SELECT 4, id_musica FROM musica WHERE id_musica BETWEEN 61 AND 80 UNION ALL
SELECT 5, id_musica FROM musica WHERE id_musica BETWEEN 81 AND 100 UNION ALL
SELECT 6, id_musica FROM musica WHERE id_musica BETWEEN 101 AND 120 UNION ALL
SELECT 7, id_musica FROM musica WHERE id_musica BETWEEN 121 AND 140 UNION ALL
SELECT 8, id_musica FROM musica WHERE id_musica BETWEEN 141 AND 160 UNION ALL
SELECT 9, id_musica FROM musica WHERE id_musica BETWEEN 161 AND 180 UNION ALL
SELECT 10, id_musica FROM musica WHERE id_musica BETWEEN 181 AND 200;

-- Vínculo Compositor e Música (Seguindo os mesmos artistas)
INSERT INTO compositor_musica (fk_compositor_id_compositor, fk_musica_id_musica)
SELECT 1, id_musica FROM musica WHERE id_musica BETWEEN 1 AND 20 UNION ALL
SELECT 2, id_musica FROM musica WHERE id_musica BETWEEN 21 AND 40 UNION ALL
SELECT 3, id_musica FROM musica WHERE id_musica BETWEEN 41 AND 60 UNION ALL
SELECT 4, id_musica FROM musica WHERE id_musica BETWEEN 61 AND 80 UNION ALL
SELECT 5, id_musica FROM musica WHERE id_musica BETWEEN 81 AND 100 UNION ALL
SELECT 6, id_musica FROM musica WHERE id_musica BETWEEN 101 AND 120 UNION ALL
SELECT 7, id_musica FROM musica WHERE id_musica BETWEEN 121 AND 140 UNION ALL
SELECT 8, id_musica FROM musica WHERE id_musica BETWEEN 141 AND 160 UNION ALL
SELECT 9, id_musica FROM musica WHERE id_musica BETWEEN 161 AND 180 UNION ALL
SELECT 10, id_musica FROM musica WHERE id_musica BETWEEN 181 AND 200;

-- Vínculo Playlists (10 músicas cada)
INSERT INTO playlist_musica (fk_playlist_id_playlist, fk_musica_id_musica) VALUES 
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),
(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),
(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),
(4,101),(4,102),(4,103),(4,104),(4,105),(4,106),(4,107),(4,108),(4,109),(4,110);