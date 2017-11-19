drop table game cascade;
drop table ratings cascade;
drop table genre cascade;
drop table region cascade;
drop table platform cascade;
drop table publisher cascade;
drop table developer cascade;
drop table releases cascade;
drop table pc cascade;
drop table console cascade;
drop table gameHasGenre cascade;
drop table gameHasDeveloper cascade;
drop table platISApc cascade;
drop table platISAconsole cascade;
drop table releaseHasPlatform cascade;


CREATE TABLE game(game_id SERIAL PRIMARY KEY,
				  name VARCHAR(255) NOT NULL,
				  comments VARCHAR(255));
				  
GRANT SELECT,INSERT,UPDATE,DELETE ON game TO vgsearch;

create table ratings(rating_id INT PRIMARY KEY,
				age INT NOT NULL,
				name VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON ratings TO vgsearch;

create table genre(genre_id INT PRIMARY KEY,
				   name VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON genre TO vgsearch;

create table region(region_id INT PRIMARY KEY,
				    name VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON region TO vgsearch;

create table publisher(publisher_id INT PRIMARY KEY,
					name VARCHAR(255) NOT NULL,
					country_founded VARCHAR(255) NOT NULL,
					city_founded VARCHAR(255));
GRANT SELECT,INSERT,UPDATE,DELETE ON publisher TO vgsearch;

create table developer(developer_id INT PRIMARY KEY,
						name VARCHAR(255) NOT NULL,
						country_founded VARCHAR(255) NOT NULL,
						city_founded VARCHAR(255));
GRANT SELECT,INSERT,UPDATE,DELETE ON developer TO vgsearch;
				  				 

create table platform(platform_id INT PRIMARY KEY,
				      name VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON platform TO vgsearch;
					  
create table platISApc(platform_id INT NOT NULL,
					   pc_id INT NOT NULL,
				      PRIMARY KEY (platform_id, pc_id));
GRANT SELECT,INSERT,UPDATE,DELETE ON platISApc TO vgsearch;
					  
create table platISAconsole(platform_id INT NOT NULL,
							console_id INT NOT NULL,
							PRIMARY KEY (platform_id, console_id));
GRANT SELECT,INSERT,UPDATE,DELETE ON platISAconsole TO vgsearch;
				 
create table pc(pc_id INT PRIMARY KEY,
				OS VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON pc TO vgsearch;
				
create table console(console_id INT PRIMARY KEY,
				series VARCHAR(255) NOT NULL,
				creator VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON console TO vgsearch;
				
create table releases(release_id INT PRIMARY KEY,
				  game_id INT NOT NULL,
				  rating_id INT NOT NULL,
				  publisher_id INT NOT NULL,
				  region_id INT NOT NULL,
				  FOREIGN KEY (game_id) REFERENCES game(game_id),
				  FOREIGN KEY (rating_id) REFERENCES ratings (rating_id),
				  FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
				  FOREIGN KEY (region_id) REFERENCES region (region_id),
				  dates date);
GRANT SELECT,INSERT,UPDATE,DELETE ON releases TO vgsearch;
				  
				  
create table gameHasGenre(
                        game_id INT NOT NULL,
                        genre_id INT NOT NULL,
				        PRIMARY KEY (game_id, genre_id),
						FOREIGN KEY (game_id) REFERENCES game (game_id),
						FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
						);
GRANT SELECT,INSERT,UPDATE,DELETE ON gameHasGenre TO vgsearch;

create table gameHasDeveloper(
						game_id INT NOT NULL,
                        developer_id INT NOT NULL,
				        PRIMARY KEY (game_id, developer_id),
						FOREIGN KEY (game_id) REFERENCES game (game_id),
						FOREIGN KEY (developer_id) REFERENCES developer(developer_id)
						);
GRANT SELECT,INSERT,UPDATE,DELETE ON gameHasDeveloper TO vgsearch;


create table releaseHasPlatform(
                        release_id INT NOT NULL,
                        platform_id INT NOT NULL,
				        PRIMARY KEY (release_id, platform_id),
						FOREIGN KEY (release_id) REFERENCES releases (release_id),
						FOREIGN KEY (platform_id) REFERENCES platform(platform_id)
						);
GRANT SELECT,INSERT,UPDATE,DELETE ON releaseHasPlatform TO vgsearch;



/* Data entry for game*/
insert into game(game_id, name,comments) values  (1, '7 Days to Die', 'Fun game, made all the more fun when played with a group of friends, trying to survive against the zombie onslaught.'),
												 (2, 'Broforce', 'Beneath Broforces bad puns and bulging biceps lies a brilliant ode to action cinema and retro gaming.'),
												 (3, 'The Binding of Isaac','Poor Isaac.' ),
												 (4, 'Cloudberry Kingdom', 'Fun platformer, good difficulty'),
												 (5, 'I am Bread', 'You can become toast 10/10'),
												 (6, 'Team Fortress 2', 'BEST HAT SIMULATOR EVER!!!!'),
												 (7, 'Tabletop Simulator','Play poker, monopoly and other board games with friends without nasty cleaning up and extra table flips.'),
												 (8, 'Magicka','Do you want a magic game where one of the best weapons is a M16A1!? I know I do!'),
												 (9, 'Rocket League','A great game to play with friend, easy to learn.'), 
												 (10, 'The Ship','Explosive wallets are the best.'),
												 (11, 'Blur' , 'Fun simple racing '),
												 (12, 'Gears of War', 'Great xbox exclusive'),
												 (13, 'Halo: Combat Evolved','Microsofts best first person shooter'),
												 (14, 'Garrys Mod','i love garrys mod its the best of hundread of worlds'),
												 (15, 'Left 4 Dead','The AI teammates are the closest things Ive ever had to friends.'),
												 (16, 'Halo 2','Great sequal to a fantastic series.'),
												 (17, 'PlayerUnknowns BattleGrounds','I have the pan, I am immortal'),
												 (18, 'The Stanley Parable','very mystireous...'),
												 (19, 'FTL: Faster Than Light','Very hard, and then they added a hard mode.10/10 cant even beat it on normal.'),
												 (20, 'Dino D-Day','Historically more accurate than the new Call of Duty: WWII'), /*Dino D-Day*/
												 (21, 'Dont Starve','Very nice game! Everyone should try it'),
												 (22, 'Doom','Its a survival horror game. But for your enemies.'),
												 (23, 'State of Decay','A really fun zombie game with unique settlement management gameplay.'),
												 (24, 'Super Meat Boy','Amazing game'),
											   	 (25, 'Deadlight','A solid game, experience that I happily played throught at least two times.'),
												 (26, 'Rockman', 'The first mageman which was first released in Japan'),
												 (27, 'Legend of Zelda' , 'First game released on the nintendo'),
												 (28, 'Where in Time is Carmen Sandiego', 'One of the hardest educational games'),
												 (29, 'Shining in the darkness', 'One of the earliest and most fun dungeon crawlers'),
												 (30, 'Shining forces II','One of the earliest tatics games.It is a tone of fun to play'),
												 (31, 'Langrisser', 'Was a amazing tatical game from Japan'),
												 (32, 'Super Mario Brothers','A fun game for the whole family.'),
												 (33, 'Mega Man X','A fun platform game and continuation of the series on the SNES'),
												 (34, 'Final Fantasy VII','One of the most famous RPG for the ps1'),
												 (35, 'Final Fantasy IX','A very well done story and good addition to the series'),
												 (36, 'Final Fantasy XI','The first MMORPG for the series and a good example of sandbox enviroment'),
												 (37, 'Final Fantasy XIV: A Realm Reborn','Not as good of a MMORPG but still fun to play.'),
												 (38, 'Senran Kagura: Estival Versus','A fun hack and slash game taken from a famous anime'),
												 (39, 'Time Crisis','A fun shooting game where you get to actually use a toy gun.'),
												 (40, 'The Witcher','Was a blast to play and really well put to gether.'),
												 (41, 'The Witcher 2: Assassins of Kings','Was a very well done sequal and had a fantasit storyline'),
												 (42, 'The Witcher 3: Wild Hunt','The fact that you did not have to play the other to understand this one was nice.'),
												 (43, 'Quest 64','Was a cute and relaxing RPG and had great replay value'),
												 (44, 'Suikoden Tatics','Had a lot of interesting features'),
												 (45, 'Suikoden V','Was a bit disappointing but stil a fun game'),
												 (46, 'Suikoden IV','The fact that it centered around ship movement and combat was a nice touch'),
												 (47, 'Suikoden III','This ones story was not as good as the other two.'),
												 (48, 'Suikoden II','Was nice that you could upload your save data from the first game to help add to this one.'),
												 (49, 'Suikoden','Loved the fact that your hideout upgrades with the more followers you got.'),
												 (50, 'Summoner 2','Was a fun game that used group tatics with each party member specializing in areas'),
												 (51, 'Summoner','Had the best hidden easter egg ever.I attack the darkness.'),
												 (52, 'Wild Arms 4','Had a problem with a glick that stopped the game randomly'),
												 (53, 'Wild Arms 3','The villian was well scripted.'),
												 (54, 'Wild Arms 2','The added elemtns and storyline made this an enjoyable game'),
												 (55, 'Wild Arms','Was a good mix of puzzles and rpg elements to a western'),
												 (56, 'Tales of Symphonia Chronicales','The ability to make this game weave into the whole series was simply amazing.'),
												 (57, 'Fairy Fencer F','The storyline and the ability to choose being good bad or nutral was a nice touch.'),
												 (58, 'HyperDimension Neptunia mk2','This was one funny game.It made my sides hurt from laughing.'),
												 (59, 'Bards Tale','This game made me smile.Its constant comments to make fun of RPGs was priceless.'),
												 (60, 'Metal Gear Solid 4:Guns of the Patriots','This action packed game was a fun to play.The sneaking in barrels was fun.'),
												 (61, 'Cross Edge','Was and interesting game since they took main characters from other games and created a game around them.'),
												 (62, 'Willow','The game was so much better then the movie and was a blast to play.'),
												 (63, 'World of Illusion Starring Mickey Mouse and Donald Duck','Was a very creative game with Disneys favorite characters.'),
												 (64, 'Silver Surfer','Was one of the hardest games I have ever played.'),
												 (65, 'HyperDimension Neptunia V','This game made me bust a gut and was neat that it had three different endings.'),
												 (66, 'GrimGrimoire','Was a unique real time stratagy game.'),
												 (67, 'Trinity Universe','The multiple endings made for great replay value.'),
												 (68, 'Record of Agarest War Zero','The well done tatical play mixed with a good story, romance, and multipe endings made this game great.'),
												 (69, 'White Knight Chronicles II','The fact that they mixed in mechs into a fantasy game was interesting'),
												 (70, 'White Knight Chronicles ','The fact that they mixed in mechs into a fantasy game was interesting'),
												 (71, 'The Guided Fate ParaDox','The story was interesting and the fact that they said if you had ultimate power how would you use it.'),
												 (72, 'Mugen Souls','The comic mischief and funny rpg elements made me enjoy this game'),
												 (73, 'Sword Art Online: Lost Song','It was fun to run around as one of my favorite anime characters and pretend to be him.'),
												 (74, 'Mugen Souls Z','Was a well done sequal.'),
												 (75, 'XenoSaga','The cutscenes in this game was amazing.'),
												 (76, 'Grandia III','Loved how they changed the magic so that you could find the element eggs in the wild easier.'),
												 (77, 'Grandia II','Had so much fun playing the game I lost track of time.'),
												 (78, 'Grandia','The character developement was so well done I fell in love with the characters.'),
												 (79, 'Sword of Vermilion','Was a unique story about a boy who finds out he is king and sets out to reclaim his kingdom.'),
												 (80, 'Valis: The Fantasm Soldier','Was a Japanese import and had a very sad storyline.'),
												 (81, 'Valis II','Was an interesting cartoonish game in the series.'),
												 (82, 'Valis III','Was an excelent game.The fact that you could choose between three characters at any given point was nice.'),
												 (83, 'Traysia','Was a fun but hard RPG'),
												 (84, 'Rocket Knight Adventures','The battle against the pigs was fun and the rocketpack was a nice touch.'),
												 (85, 'Disgaea: Hour of Darkness','The fact that this game made fun of everything unde the sun was awsome.'),
												 (86, 'Project Spark','World building the game.'),
												 (87, 'Sunset Overdrive','All out blast'),
												 (88, 'Dead Rising','Just keep chopping.'),
												 (89, 'Fable','Greast console RPG'),
												 (90, 'Fable 2','Solid second game, multiplayer is a good addition.'),
												 (91, 'Crackdown','Is it a shooter or is it a platformer? yes'),
												 (92, 'Crackdown 2','A departure from the first game.'),
												 (93, 'Doritos Crash Course','Fun and slightly challenging'),
												 (94, 'Red Trigger','Not bad at all, in fact its pretty good'),
												 (95, 'The Cat Lady','Was not expecting this dark of a story.'),
												 (96, 'Downfall','What a freaking journey'),
												 (97, 'Titanfall','Love wall running.'),
												 (98, 'Titanfall 2','Finally, titanfall with a story.'),
												 (99, 'Destiny', 'Space Magic done right.'),
												 (100, 'Destiny 2','Story! Finally they added a story.')
										;


/* Data entry for ratings*/
insert into ratings(rating_id, age, name) values  (1, 0, 'EC'),
											(2, 0, 'E'),
											(3, 10, 'E10'),
											(4, 13, 'T'),
											(5, 17, 'M'),
											(6, 18, 'A');

/* Data entry for genre*/
insert into genre(genre_id, name) values    (1, 'survival'),
											(2, 'zombie'), 
											(3, 'open world'),
											(4, 'action'),
											(5, '2D'),
											(6, 'rogue-like'),
											(7, 'platformer'),
											(8, 'comedy'),
											(9, 'simulation'),
											(10, 'first person shooter'),
											(11, 'shooter'),
											(12, 'Board Game'),
											(13, 'Racing'),
											(14, 'Sports'),
											(15, 'Stealth'),
											(16, 'third person shooter'),
											(17, 'Sandbox'),
											(18, 'Strategy'),
											(19, 'Adventure'),
											(20, 'RPG'),
											(21, 'MMORPG'),
											(22, 'JRPG'),
											(23, 'Puzzle'),
											(24, 'Dungeon'),
											(25, 'Beat up'),
											(26, 'Hack and Slash'),
											(27, 'Horror')
											;

/* Data entry for region*/
insert into region(region_id, name) values  (1, 'WW'),
											(2, 'NA'),
											(3, 'AU'),
											(4, 'AUS'),
											(5, 'EU'),
											(6, 'SEA'),
											(7, 'AS'),
											(8, 'SA'),
											(9, 'OC'),
											(10, 'JP')
											;
 
/* Data entry for platform*/
insert into platform(platform_id, name) values  (1, 'steam'),
												(2, 'origin'),
												(3, 'windows store'),
												(4, 'Sega'),
												(5, 'playstation'),
												(6, 'playstation 2'),
												(7, 'playstation 3'),
												(8, 'playstation 4'),
												(9, 'Super Nintendo'),
												(10, 'Nintendo 64'),
												(11, 'xbox'),
												(12, 'xbox 360'),
												(13, 'Xbox one'),
												(14, 'gamecube'),
												(15, 'playstation vita'),
												(16,  'wii'),
												(17, 'wii U'),
												(18, 'Nintendo Switch'),
												(19, 'Nintendo Entertainment System'),
												(20, 'BattleNet')
												;
												
insert into platISApc(platform_id, pc_id) values 			(1, 1),
															(1, 2),
															(1, 3),
															(2, 1),
															(2, 2),
															(2, 3),
															(3, 2),
															(20, 1),
															(20, 2),
															(20, 3)
															;
															
															
insert into platISAconsole(platform_id, console_id) values  (4, 1),
															(5, 2),
															(6, 2),
															(7, 2),
															(8, 2),
															(9, 3),
															(10, 3),
															(11, 4),
															(12, 4),
															(13, 4),
															(14, 6),
															(15, 2),
															(16, 5),
															(17, 5),
															(18, 5),
															(19, 3);
															
																														
/* Data entry for pc*/
insert into pc (pc_id, OS) values   (1, 'Linux'),
									(2, 'Windows'),
									(3, 'Macintosh');
											

/* Data entry for console*/
insert into console(console_id, series, creator) values 
										(1, 'Sega Genesis', 'Sega'),
										(2, 'Playstation', 'Sony' ), 
										(3, 'Nintendo','Nintendo' ),
										(4, 'Xbox', 'Microsoft'),
										(5, 'Wii', 'Nintendo'),
										(6, 'Gamecube', 'Nintendo');
										
										
										
									
/* Data entry for publisher*/
insert into publisher(publisher_id, name, country_founded, city_founded) values   (1, 'The Fun Pimps', 'US', 'Dallas'),/*'7 Days to die' */
																	(2, 'Developer Digital', 'US', 'Austin'), /*Broforce*/
																	(3, 'Edmund McMillen', 'US','Asheville'), /*The Binding of Isaac*/
																	(4, 'Ubisoft', 'FR', 'Carentoir'),/*Cloudberry Kingdom*/ /*Wild Arms 3 PS2*/ /*Wild Arms PS1*/
																	(5, 'Bossa Studios','EN','London'), /*I am Bread*/
																	(6, 'Valve','US','Bellevue'), /*Team Fortress 2*/ /*garry's mod*/ /* Left 4 Dead*/
																	(7, 'Berserk','US','Stuart'), /*Tabletop Simulator*/
																	(8, 'Paradox Interactive','SE','Stockholm'), /*Magicka*/
																	(9, 'Psyonix','US','Satellite Beach'), /*Rocket League*/
																	(10, 'Blazing Griffin','GB','Glasgow'), /* The Ship*/
																	(11, 'Activision','US','Santa Monica'), /* Blur*/ /*Destiny*/ /*Destiny 2*/
																	(12, 'Microsoft Studios','US','Redmond'), /*Gears of War*/ /*Halo: Combat Evolved */ /*Halo 2 */ /* State of Decay*//*Deadlight*/ /*Project Spark*/ /*Sunset Overdrive*/ /*Fable*/ /*Fable 2*/ /*Crackdown*/ /*Crackdown 2*/
																	(13, 'Bluehole Studio','KR','YeokSam-Dong'), /*PlayerUnknown BattleGrounds*/
																	(14, 'Galactic Cafe','',''), /* The Stanley Parable*/
																	(15, 'Subset Games','CN','Shanghai'),/*FTL: Faster Than Light*/
																	(16, '800 North','US','Burbank'),/*Dino D-Day*/	
																	(17, 'Klei Entertainment','CA','Vancouver'), /* Don't Starve*/
																	(18, 'Bethesda Softworks','US','Bethesda'), /*Doom*/
																	(19, 'Team Meat','US','Asheville'), /*super meat boy*/
																	(20, 'Deep Silver','DE','Germany'), /*Deadlight everything else*/
																	(21, 'Capcom','JP','Chūō-ku'), /*Deadrising*/ /*rockman*/ /*Mega Man X SNES*/ /*Willow NES*/
																	(22, 'Maxime Vézina','CA','Montreal'),/*Red Trigger*/	
																	(23, 'Screen 7','GB','Oxfordshire'), /*The Cat Lady*/ /*Downfall*/
																	(24, 'Electronic Arts','US','San Mateo'), /*Titanfall*/ /*Titanfall 2*/ /*Bards Tale PS2*/
																	(25, 'Nintendo','JP','Kyoto'), /*Legend of Zelda JP*/ /*Super Mario Brothers NES JP*/
																	(26, 'Nintendo','US','Seattle'), /*Legend of Zelda US*/ /*Super Mario Brothers NES US*/
																	(27, 'Konami','JP','Tokyo'), /*Where in Time is Carmen Sandiego? NES*/ /*Quest 64 N64*/ /*Suikoden Tatics PS2*/ /*Suikoden V PS2*/ /*Suikoden IV PS2*/ /*Suikoden III PS2*/ /*Suikoden II PS1*/ /*Suikoden PS1*/ /*Metal Gear Solid 4:Guns of the Patriots PS3*/ /*Rocket Knight Adventures Sega JP*/ /*Rocket Knight Adventures Sega US*/ /*Rocket Knight Adventures Sega EU*/
																	(28, 'Sega','JP','Tokyo'), /*Shining in the darkness Sega*/ /*World of Illusion Starring Mickey Mouse and Donald Duck Sega*/ /*Sword OF Vermilion Sega*/ /*Valis III Sega*/
																	(29, 'Masaya','JP','Tokyo'), /*Langrisser*/
																	(30, 'Sony Computer Entertainment','US','San Matel'), /*Final Fantasy VII PS1 US*/
																	(31, 'Sony Computer Entertainment','JP','Tokyo'), /*Final Fantasy VII PS1 JP*/ /*Time Crisis PS1*/ /*Wild Arms 2 PS1*/ /*White Knight Chronicles  II PS3*/ /*White Knight Chronicles  PS3*/
																	(32, 'Sony Computer Entertainment','GB','London'), /*Final Fantasy VII PS1 EN*/
																	(33, 'Squaresoft','JP','Tokyo'), /*Final Fantasy IX PS1*/ /*Final Fantasy XI PS2 and PC*/ /*Grandia III PS2*/ /*Grandia II PS2*/ /*Grandia PS1*/
																	(34, 'Square Enix','JP','Tokyo'),/*Final Fantasy XIV PS3 PS4 PC*/
																	(35, 'MARVELOUS!','JP','Tokyo'), /*Senran Kagura: Estival Versus PS4*/
																	(36, 'Atari','US','New York City'), /*The Witcher PC*/ 
																	(37, 'CD Projekt','PL','Warsaw'), /*The Witcher 2: Assassins of Kings PC + xbox360*/
																	(38, 'Bandai Namco','JP','Tokyo'), /*The Witcher 3: Wild Hunt PC PS4*/ /*Tales of Symphonia Chronicales PS3*/ /*Sword Art Online: Lost Song PS4 PS3 PSVista*/
																	(39, 'THQ','US','Agorura Hills'), /*Summoner 2 PS2 GameCube*/ /*Summoner PS2 PC*/
																	(40, 'Marvelous USA','US','Torrance'), /*Wild Arms 4 PS2*/
																	(41, 'Compile Heart','JP','Tokyo'), /*Fairy Fencer F PS3*/ /*Record of Agarest War Zero PS3 Xbox360*/
																	(42, 'Nippon Ichi Software','JP','Kakamigahara'), /*HyperDimension Neptunia mk2 PS3 Playstation Vita*/ /*Cross Edge PS3*/ /*HyperDimension Neptunia V PS4*/ /*Trinity Universe PS3*/  /*The Guided Fate ParaDox PS3*/ /*Mugen Souls PS3*/ /*Mugen Souls Z PS3*/ /*Disgaea: Hour of Darkness PS2*/
																	(43, 'Arcadia Systems','US','Costa Mesa'), /*Silver Surfer NES*/
																	(44, 'Koei Tecmo Games','JP','Yokohama'), /*GrimGrimoire PS2*/
																	(45, 'Namco','JP','Tokyo'), /*XenoSaga PS2*/
																	(46, 'Telenet Japan','JP','Tokyo') /*Valis Sega*/ /*Valis II Sega*/ /*Traysia Sega*/
																	;
																	
																	
/* Data entry for releases*/
insert into releases(release_id, game_id, rating_id, publisher_id, region_id, dates) values  
									(1, 1, 5, 1, 1, '2013-12-13'), /*'7 Days to die' computer*/
									(2, 1, 5, 1, 1, '2016-1-6'), /*'7 Days to die' console*/
									(3, 2, 5, 2, 1, '2015-10-15'), /*'Broforce' computer*/
									(4, 2, 5, 2, 1, '2016-3-1'), /*'Broforce' console*/
									(5, 3, 5, 3, 1, '2011-9-28'), /*The Binding of Isaac*/
									(6, 4, 4, 4, 1, '2013-5-30'), /*Cloudberry Kingdom*/
									(7, 5, 3, 5, 1, '2015-4-9'), /*I am Bread*/
									(8, 6, 5, 6, 1, '2007-10-10'), /*Team Fortress 2*/
									(9, 7, 2, 7, 1, '2015-5-5'), /*Tabletop Simulator*/
									(10, 8, 4, 8, 1, '2011-1-25'), /*Magicka*/
									(11, 9, 2, 9, 1, '2015-6-7'), /*Rocket League PC PS4*/
									(12, 9, 2, 9, 1, '2016-2-17'), /*Rocket League X1*/
									(13, 10, 2, 10, 5, '2006-9-15'), /*The Ship EU*/
									(14, 10, 2, 10, 2, '2007-2-15'), /*The Ship NA*/
									(15, 11, 3, 11, 2, '2010-3-25'), /*Blur NA*/
									(16, 11, 5, 11, 5, '2010-3-28'), /*Blur EU*/
									(17, 12, 5, 12, 1, '2006-11-7'), /*Gears of War*/
									(18, 13, 5, 12, 1, '2001-11-15'), /*Halo: Combat Evolved*/
									(19, 14, 2, 6, 1, '2006-11-29'), /*Garry's Mod */
									(20, 15, 5, 6, 1, '2008-11-17'), /* Left 4 Dead*/
									(21, 16, 5, 12, 1, '2004-11-9'), /*Halo 2 Xbox release*/ 
									(22, 16, 4, 12, 1, '2007-5-31'), /*Halo 2 PC release*/
									(23, 17, 2, 13, 1, '2017-3-23'), /*PlayerUnknown's Battlegrounds PC */
									(24, 17, 3, 13, 1, NULL), /*PlayerUnknown's Battlegrounds Console*/
									(25, 18, 2, 14, 1, '2013-12-19'), /*The Stanley Parabol*/
									(26, 19, 3, 15, 1, '2012-9-14'),/*FTL: Faster Than Light PC*/
									(27, 19, 3, 15, 1, '2014-4-3'),/*FTL: Faster Than Light IOS*/
									(28, 20, 5, 16, 1, '2011-4-8'),/*Dino D-Day*/
									(29, 21, 4, 17, 1, '2013-4-23'),/* Don't Starve*/
									(30, 22, 5, 18, 1, '2016-3-13'),/*Doom PC Consoles*/
									(31, 22, 5, 18, 1, '2017-11-10'),/*Doom Switch*/
									(32, 23, 5, 12, 1, '2013-6-5'), /* State of Decay*/
									(33, 24, 3, 19, 1, '2010-10-20'), /*Super Meat Boy*/
									(34, 25, 5, 20, 1, '2012-8-1'), /*Deadlight xbox*/
									(35, 25, 5, 20, 1, '2012-10-25'), /*Deadlight PC*/
									(36, 25, 5, 20, 1, '2016-6-21'), /*Deadlight the rest*/
									(37, 26, 2, 21, 1, '1987-12-17'), /*Rockman NES*/
									(38, 27, 2, 25, 10, '1986-2-21'), /*Legend of Zeld NES Japanese*/
									(39, 27, 2, 26, 2, '1986-8-22'), /*Legend of Zeld NES American*/
									(40, 28, 2, 27, 1, '1989-8-15'), /*Where in Time is Carmen Sandiego? NES*/
									(41, 29, 2, 28, 1, '1991-3-29'), /*Shining in the darkness Sega*/
									(42, 31, 4, 29, 1, '1991-4-26'), /*Langrisser*/
									(43, 32, 2, 25, 10, '1985-9-13'), /*Super Mario Brothers NES JP*/
									(44, 32, 2, 26, 2, '1985-10-18'),/*Super Mario Brothers NES US*/
									(45, 33, 2, 21, 1, '1993-12-17'), /*Mega Man X SNES*/
									(46, 34, 4, 31, 10, '1997-1-31'), /*Final Fantasy VII PS1 JP*/
									(47, 34, 4, 32, 5, '1997-11-17'), /*Final Fantasy VII PS1 EU*/
									(48, 34, 4, 30, 2, '1997-9-7'), /*Final Fantasy VII PS1 US*/
									(49, 35, 4, 33, 1, '2000-7-7'), /*Final Fantasy IX PS1*/
									(50, 36, 4, 33, 1, '2002-5-16'), /*Final Fantasy XI PS2 and PC*/
									(51, 37, 4, 34, 1, '2013-8-24'), /*Final Fantasy XIV PS3 PS4 PC*/
									(52, 38, 5, 35, 10, '2015-3-15'), /*Senran Kagura: Estival Versus PS4 JP*/
									(53, 39, 4, 31, 1, '1997-8-15'), /*Time Crisis PS1*/
									(54, 40, 5, 36, 1, '2007-10-26'), /*The Witcher PC*/
									(55, 41, 5, 37, 1, '2011-5-17'), /*The Witcher 2: Assassins of Kings PC + xbox360*/
									(56, 42, 5, 38, 1, '2015-5-19'), /*The Witcher 3: Wild Hunt PC PS4*/
									(57, 43, 2, 27, 1, '1998-6-1'), /*Quest 64 N64*/
									(58, 44, 4, 27, 1, '2005-9-22'), /*Suikoden Tatics PS2*/
									(59, 45, 4, 27, 1, '2006-2-23'), /*Suikoden V PS2*/
									(60, 46, 4, 27, 1, '2004-8-19'), /*Suikoden IV PS2*/
									(61, 47, 4, 27, 1, '2002-7-11'), /*Suikoden III PS2*/
									(62, 48, 4, 27, 1, '1998-12-17'), /*Suikoden II PS1*/
									(63, 49, 4, 27, 1, '1995-12-15'), /*Suikoden PS1*/
									(64, 50, 4, 39, 1, '2002-9-23'), /*Summoner 2 PS2 GameCube*/
									(65, 51, 4, 39, 1, '2000-10-24'), /*Summoner PS2 PC*/
									(66, 52, 4, 40, 1, '2005-3-24'), /*Wild Arms 4 PS2*/
									(67, 53, 4, 4, 1, '2002-3-14'), /*Wild Arms 3 PS2*/
									(68, 54, 2, 31, 1, '1999-9-2'), /*Wild Arms 2 PS1*/
									(69, 55, 2, 4, 1, '1996-12-20'), /*Wild Arms PS1*/
									(70, 56, 4, 38, 1, '2013-10-10'), /*Tales of Symphonia Chronicales PS3*/
									(71, 57, 4, 41, 1, '2013-10-10'), /*Fairy Fencer F PS3*/
									(72, 58, 4, 42, 1, '2011-8-18'), /*HyperDimension Neptunia mk2 PS3 Playstation Vita*/
									(73, 59, 4, 24, 1, '2004-10-26'), /*Bards Tale PS2*/
									(74, 60, 5, 27, 1, '2008-6-12'), /*Metal Gear Solid 4:Guns of the Patriots PS3*/
									(75, 61, 4, 42, 1, '2008-9-25'), /*Cross Edge PS3*/
									(76, 62, 3, 21, 1, '1989-7-18'), /*Willow NES*/
									(77, 63, 2, 28, 1, '1992-12-17'), /*World of Illusion Starring Mickey Mouse and Donald Duck Sega*/
									(78, 64, 4, 43, 1, '1990-11-10'), /*Silver Surfer NES*/
									(79, 65, 4, 42, 1, '2010-8-19'), /*HyperDimension Neptunia V PS4*/
									(80, 66, 3, 44, 1, '2007-4-12'), /*GrimGrimoire PS2*/
									(81, 67, 4, 42, 1, '2009-10-1'), /*Trinity Universe PS3*/
									(82, 68, 4, 41, 1, '2009-6-25'), /*Record of Agarest War Zero PS3 Xbox360*/
									(83, 69, 4, 31, 1, '2010-7-8'), /*White Knight Chronicles  II PS3*/
									(84, 70, 4, 31, 1, '2008-12-25'), /*White Knight Chronicles  PS3*/
									(85, 71, 4, 42, 1, '2013-1-24'), /*The Guided Fate ParaDox PS3*/
									(86, 72, 4, 42, 1, '2012-3-22'), /*Mugen Souls PS3*/
									(87, 73, 4, 38, 1, '2015-3-26'), /*Sword Art Online: Lost Song PS4 PS3 PSVista*/
									(88, 74, 4, 42, 1, '2013-4-25'), /*Mugen Souls Z PS3*/
									(89, 75, 4, 45, 1, '2002-2-28'), /*XenoSaga PS2*/
									(90, 76, 4, 33, 1, '2005-8-4'), /*Grandia III PS2*/
									(91, 77, 4, 33, 1, '2000-8-3'), /*Grandia II PS2*/
									(92, 78, 2, 33, 1, '1997-12-18'), /*Grandia PS1*/
									(93, 79, 2, 28, 1, '1989-12-16'), /*Sword OF Vermilion Sega*/
									(94, 80, 2, 46, 1, '1986-12-11'), /*Valis Sega*/
									(95, 81, 2, 46, 1, '1989-6-23'), /*Valis II Sega*/
									(96, 82, 2, 28, 1, '1990-9-7'), /*Valis III Sega*/
									(97, 83, 4, 46, 1, '1992-2-14'), /*Traysia Sega*/
									(98, 84, 3, 27, 10, '1993-8-6'), /*Rocket Knight Adventures Sega JP*/
									(99, 84, 3, 27, 2, '1993-8-5'), /*Rocket Knight Adventures Sega US*/
									(100, 84, 3, 27, 5, '1993-8-7'), /*Rocket Knight Adventures Sega EU*/
									(101, 85, 4, 42, 1, '2003-1-30'), /*Disgaea: Hour of Darkness PS2*/
									(102, 86, 3, 12, 2, '2014-10-7'), /*Project Spark NA*/
									(103, 86, 3, 12, 3, '2014-10-9'), /*Project Spark AU*/
									(104, 86, 3, 12, 5, '2014-10-10'), /*Project Spark EU*/
									(105, 87, 5, 12, 2, '2014-10-28'), /*Sunset Overdrive NA*/ 
									(106, 87, 5, 12, 3, '2014-10-30'), /*Sunset Overdrive AU*/ 
									(107, 87, 5, 12, 5, '2014-10-31'), /*Sunset Overdrive EU*/ 
									(108, 88, 5, 21, 2, '2006-8-8'), /*Dead Rising NA*/
									(109, 88, 5, 21, 5, '2006-9-8'), /*Dead Rising EU*/
									(110, 88, 5, 21, 3, '2006-9-14'), /*Dead Rising AU*/
									(111, 88, 5, 21, 10, '2006-9-28'), /*Dead Rising JP*/
									(112, 88, 5, 21, 1, '2016-9-13'), /*Dead Rising Rerelease ps4, X1, MWS*/
									(113, 89, 4, 12, 1, '2004-9-14'), /*Fable*/
									(114, 90, 5, 12, 2, '2008-8-21'), /*Fable 2 NA*/
									(115, 90, 5, 12, 3, '2008-8-23'), /*Fable 2 AU*/
									(116, 90, 5, 12, 5, '2008-8-24'), /*Fable 2 EU*/
									(117, 91, 5, 12, 2, '2007-2-20'), /*Crackdown NA*/
									(118, 91, 5, 12, 3, '2007-2-22'), /*Crackdown AU*/
									(119, 91, 5, 12, 5, '2007-2-23'), /*Crackdown EU*/
									(120, 92, 5, 12, 2, '2010-7-6'), /*Crackdown 2 NA*/
									(121, 92, 5, 12, 3, '2010-7-8'), /*Crackdown 2 AU*/
									(132, 92, 5, 12, 5, '2010-7-9'), /*Crackdown 2 EU*/
									(122, 93, 2, 12, 1, '2010-12-8'), /*Doritos Crash Course*/
									(123, 94, 4, 22, 1, '2016-7-8'), /*Red Trigger*/
									(124, 95, 5, 23, 1, '2012-12-7'), /*The Cat Lady*/
									(125, 96, 5, 23, 1, '2016-2-15'), /*Downfall*/
									(126, 97, 5, 24, 1, '2014-3-11'), /*Titanfall*/
									(127, 98, 5, 24, 1, '2016-10-28'), /*Titanfall 2*/
									(128, 99, 4, 11, 1, '2014-9-9'), /*Destiny*/
									(129, 100, 4, 11, 1, '2017-9-6'), /*Destiny 2 console*/
									(130, 100, 4, 11, 1, '2017-10-24'), /*Destiny 2 pc*/
									(131, 30, 2, 28, 1, '1993-10-1') /*Shining Force II Sega*/
									;										
										
insert into releaseHasPlatform(release_id, platform_id) values  (1, 1),
																(1, 2),
																(1, 3),
																(2, 8),
																(2, 13),
																(3, 1),
																(3, 3), 
																(4, 8),
																(5, 1),
																(6, 1),
																(6, 7),
																(6, 17),
																(6, 12),
																(7, 1),
																(7, 8),
																(7, 13),
																(7, 2),
																(8, 1),
																(9, 1),
																(10, 1),
																(11, 8),
																(11, 1),
																(11, 2),
																(12, 13),
																(13, 1),
																(13, 2),
																(14, 1),
																(14, 2),
																(15, 12),
																(15, 7),
																(16, 12),
																(16, 7),
																(17, 3),
																(17, 12),
																(17, 13),
																(18, 11),
																(19, 1),
																(20, 1),
																(20, 12),
																(21, 11),
																(22, 3),
																(23, 1),
																(23, 2),
																(24, 13),
																(25, 1),
																(26, 1),
																(27, 3),
																(28, 1),
																(29, 1),
																(29, 7),
																(29, 8),
																(29, 15),
																(29, 17),
																(29, 13),
																(30, 1),
																(30, 8),
																(30, 13),
																(31, 18),
																(32, 12),
																(32, 1),
																(32, 13),
																(33, 1),
																(33, 2),
																(33, 12),
																(33, 8),
																(33, 15),
																(33, 17),
																(33, 18),
																(35, 1),
																(34, 12),
																(36, 13),
																(36, 8),
																(37, 19),
																(38, 19),
																(39, 19),
																(40, 19),
																(41, 4),
																(42, 5),
																(42, 6),
																(43, 19),
																(44, 19),
																(45, 9),
																(46, 5),
																(47, 5),
																(48, 5),
																(49, 5),
																(50, 6),
																(50, 1),
																(51, 7),
																(51, 8),
																(51, 1),
																(52, 8),
																(53, 5),
																(54, 1),
																(55, 1),
																(55, 12),
																(56, 1),
																(56, 8),
																(56, 13),
																(57, 10),
																(58, 6),
																(59, 6),
																(60, 6),
																(61, 6),
																(62, 5),
																(63, 5),
																(64, 6),
																(64, 14),
																(65, 6),
																(65, 14),
																(65, 1),
																(66, 6),
																(67, 6),
																(68, 5),
																(69, 5),
																(70, 7),
																(71, 7),
																(71, 1),
																(72, 7),
																(72, 15),
																(73, 6),
																(73, 1),
																(73, 11),
																(74, 7),
																(75, 7),
																(76, 19),
																(77, 4),
																(78, 19),
																(79, 8),
																(80, 6),
																(81, 7),
																(82, 7),
																(82, 12),
																(83, 7),
																(84, 7),
																(85, 7),
																(86, 7),
																(87, 8),
																(87, 7),
																(87, 15),
																(88, 7),
																(89, 6),
																(90, 6),
																(91, 6),
																(92, 5),
																(93, 4),
																(94, 4),
																(95, 4),
																(96, 4),
																(97, 4),
																(98, 4),
																(99, 4),
																(100, 4),
																(101, 6),
																(102, 3),
																(102, 13),
																(103, 3),
																(103, 13),
																(104, 3),
																(104, 13),
																(105, 13),
																(106, 13),
																(107, 13),
																(108, 12),
																(108, 16),
																(108, 7),
																(108, 8),
																(108, 1),
																(108, 13),
																(109, 12),
																(109, 16),
																(109, 7),
																(109, 8),
																(109, 1),
																(109, 13),
																(110, 12),
																(110, 16),
																(110, 7),
																(110, 8),
																(110, 1),
																(110, 13),
																(111, 12),
																(111, 16),
																(111, 7),
																(111, 8),
																(111, 1),
																(111, 13),
																(112, 8),
																(112, 13),
																(113, 11),
																(113, 12),
																(113, 1),
																(114, 12),
																(115, 12),
																(116, 12),
																(117, 12),
																(118, 12),
																(119, 12),
																(120, 12),
																(121, 12),
																(132, 12),
																(122, 12),
																(122, 3),
																(123, 1),
																(124, 1),
																(125, 1),
																(126, 12),
																(126, 13),
																(127, 8),
																(127, 13),
																(128, 12),
																(128, 13),
																(128, 7),
																(128, 8),
																(129, 8),
																(129, 13),
																(130, 20);
																


																
																	

/* Data entry for developer*/
insert into developer(developer_id, name, country_founded, city_founded) values   (1, 'The Fun Pimps Entertainment LLC', 'US', 'Dallas'),/*'7 Days to die' */
																	(2, 'Free Lives', 'ZA', 'Cape Town'), /*Broforce */
																	(3, 'Edmund McMillen Florian Himsl', 'US','Santa Cruz'),/*The Binding of Isaac*/
																	(4, 'Pwnee Studios', 'US' , 'New York'), /*Cloudberry Kingdom*/
																	(5, 'Bossa Studios','GB','London'), /*I am Bread*/
																	(6, 'Valve','US','Bellevue'), /*Team Fortress 2*/ /* Left 4 Dead*/
																	(7, 'Berserk','US','Stuart'), /*Tabletop Simulator*/
																	(8, 'Arrowhead Game Studios','SE','Stockholm'), /*Magicka*/
																	(9, 'Psyonix','US','Satellite Beach'), /*Rocket League*/
																	(10, 'Outright', 'GB', 'Edinburgh' ), /*The Ship*/
																	(11, 'Bizarre Creations','GB','Liverpool'), /*blur*/
																	(12, 'Epic Games','US','Cary'),/*Gears of War*/
																	(13, 'Bungie','US','Chicago'), /*Halo: Combat Evolved*/ /*Halo 2 */ /*Destiny*/ /*Destiny 2*/
																	(14, 'Facepunch Studios','GB','Walsall'), /*garry's mod*/
																	(15, 'Bluehole studio','KR','YeokSam-Dong'), /*PlayerUnknown BattleGrounds*/
																	(16, 'Galactic Cafe','GB', NULL), /* The Stanley Parable*/
																	(17, 'Subset Games','CN','Shanghai'),/*FTL: Faster Than Light*/
																	(18, '800 North','US','Burbank'),/*Dino D-Day*/	
																	(19, 'Digital','US','Millcreek'), /*Dino D-Day*/
																	(20, 'Klei Entertainment','CA','Vancouver'),/* Don't Starve*/
																	(21, 'id Software','US','Mesquite'), /*Doom*/
																	(22, 'Undead Labs','US','Seattle'),	 /* State of Decay*/
																	(23, 'Team Meat','US','Asheville'), /*super meat boy*/
																	(24, 'Tequila','ES','Madrid'), /*Deadlight*/
																	(25, 'SkyBox labs','CA','Burnaby'), /*Project Spark*/
																	(26, 'Insomniac Games','US','Burbank'), /*Sunset Overdrive*/ 	
																	(27, 'Capcom','JP','Chūō-ku'), /*Deadrising*/ /*rockman*/ /*Mega Man X SNES*/ /*Cross Edge PS3*/ /*Willow NES*/
																	(28, 'Microsoft Studios','US','Redmond'), /*Fable*/
																	(29, 'Lionhead Studios','GB','London'),/*Fable 2*/
																	(30, 'Realtime','SCT','Dundee'),  /*Crackdown*/
																	(31, 'Ruffian Games','SCT','Dundee'), /*Crackdown 2*/
																	(32, 'Wanako Games','CL','Santiago'), /*Doritos Crash Course*/
																	(33, 'Behaviour Interactive','CA','Quebec City'), /*Doritos Crash Course*/
																	(34, 'Maxime Vézina','CA','Montreal'),/*Red Trigger*/	
																	(35, 'Harvester Games','GB','Oxfordshire'), /*The Cat Lady*/ /*Downfall*/
																	(36, 'Respawn Entertainment','US','Sherman Oaks'), /*Titanfall*/ /*Titanfall 2*/
																	(37, 'Nintendo','JP','Kyoto'), /*Legend of Zelda JP*/ /*Super Mario Brothers NES JP*/
																	(38, 'Nintendo','US','Seattle'), /*Legend of Zelda US*/ /*Super Mario Brothers NES US*/
																	(39, 'Borderbund','US','Novato'), /*Where in Time is Carmen Sandiego? NES*/
																	(40, 'Camelot Software Planing','JP','Tokyo'), /*Shining in the darkness Sega*/
																	(41, 'Masaya','JP','Tokyo'), /*Langrisser*/
																	(42, 'Squaresoft','JP','Tokyo'), /*Final Fantasy VII PS1 JP*/ /*Final Fantasy IX PS1*/ /*Final Fantasy XI PS2 and PC*/
																	(43, 'Squaresoft','US','El Segundo'), /*Final Fantasy VII PS1 US*/
																	(44, 'Squaresoft','GB','London'), /*Final Fantasy VII PS1 EN*/
																	(45, 'Square Enix','JP','Tokyo'),/*Final Fantasy XIV PS3 PS4 PC*/
																	(46, 'Tamsoft','JP','Tokyo'), /*Senran Kagura: Estival Versus PS4*/
																	(47, 'Namco','JP','Tokyo'), /*Time Crisis PS1*/
																	(48, 'CD Projekt','PL','Warsaw'), /*The Witcher PC*/ /*The Witcher 2: Assassins of Kings PC + xbox360*/
																	(49, 'Bandai Namco','JP','Tokyo'), /*The Witcher 3: Wild Hunt PC PS4*/ /*Tales of Symphonia Chronicales PS3*/ /*XenoSaga PS2*/
																	(50, 'Imangineer','JP','Tokyo'), /*Quest 64 N64*/
																	(51, 'Konami','JP','Tokyo'), /*Suikoden Tatics PS2*/ /*Suikoden V PS2*/ /*Suikoden IV PS2*/ /*Suikoden III PS2*/ /*Suikoden II PS1*/ /*Suikoden PS1*/ /*Rocket Knight Adventures Sega*/ /*Rocket Knight Adventures Sega US*/ /*Rocket Knight Adventures Sega EU*/
																	(52, 'Volition','US','Champaign'), /*Summoner 2 PS2 GameCube*/ /*Summoner PS2 PC*/
																	(53, 'Media.Vision','JP','Tokyo'), /*Wild Arms 4 PS2*/ /*Wild Arms 3 PS2*/ /*Wild Arms 2 PS1*/ /*Wild Arms PS1*/
																	(54, 'Compile Heart','JP','Tokyo'), /*Fairy Fencer F PS3*/ /*Mugen Souls PS3*/ /*Mugen Souls Z PS3*/
																	(55, 'Idea Factory','JP','Tokyo'),/*HyperDimension Neptunia mk2 PS3 Playstation Vita*/ /*HyperDimension Neptunia V PS4*/ /*Trinity Universe PS3*/ /*Record of Agarest War Zero PS3 Xbox360*/
																	(56, 'inXile Entertainment','US','Newport Beach'), /*Bards Tale PS2*/
																	(57, 'Kojima Productions','JP','Tokyo'), /*Metal Gear Solid 4:Guns of the Patriots PS3*/
																	(58, 'Sega','JP','Tokyo'),  /*World of Illusion Starring Mickey Mouse and Donald Duck Sega*/ /*Sword OF Vermilion Sega*/
																	(59, 'Software Creation','GB','Manchester'), /*Silver Surfer NES*/
																	(60, 'Vanillaware','JP','Osaka'), /*GrimGrimoire PS2*/
																	(61, 'Level 5','JP','Fukuoka'), /*White Knight Chronicles  II PS3*/ /*White Knight Chronicles  PS3*/
																	(62, 'Nippon Ichi Software','JP','Kakamigahara'), /*The Guided Fate ParaDox PS3*/ /*Disgaea: Hour of Darkness PS2*/
																	(63, 'Artdink','JP','Tokyo'), /*Sword Art Online: Lost Song PS4 PS3 PSVista*/
																	(64, 'Game Arts','JP','Tokyo'), /*Grandia III PS2*/ /*Grandia II PS2*/ /*Grandia PS1*/
																	(65, 'Telenet Japan','JP','Tokyo') /*Valis Sega*/ /*Valis II Sega*/ /*Valis III Sega*/ /*Traysia Sega*/
																	;
																	
/*Data entry for gameHasGenre */
insert into gameHasGenre (game_id, genre_id) values (1, 1),
													(1, 2),
													(2, 4),
													(2, 5),
													(3, 4),
													(3, 6),
													(4, 5),
													(4, 7),
													(5, 8),
													(5, 9),
													(6, 10),
													(6, 11),
													(7, 9),
													(7, 12),
													(8, 4),
													(8, 8),
													(9, 13),
													(9 ,14),
													(10, 4),
													(10, 15),
													(11, 13),
													(12, 16),
													(13, 10),
													(14, 17),
													(15, 2),
													(15, 10),
													(16, 10),
													(17, 1),
													(17, 11),
													(18, 8),
													(19, 5),
													(19, 18),
													(20, 4),
													(20, 10),
													(21, 1),
													(21, 19),
													(22, 4),
													(22, 10),
													(23, 1),
													(23, 2),
													(24, 5),
													(24, 7),
													(25, 2),
													(25, 4),
													(26, 4),
													(26, 19),
													(27, 4),
													(27, 19),
													(28, 18),
													(29, 24),
													(30, 18),
													(30, 20),
													(31, 18),
													(31, 20),
													(32, 5),
													(32, 7),
													(33, 4),
													(33, 7),
													(34, 20),
													(35, 20),
													(36, 21),
													(37, 21),
													(38, 25),
													(39, 11),
													(40, 4),
													(40, 20),
													(41, 4),
													(41, 20),
													(42, 4),
													(42, 20),
													(43, 20),
													(44, 18),
													(44, 20),
													(45, 20),
													(46, 20),
													(47, 20),
													(48, 20),
													(49, 20),
													(50, 4),
													(50, 20),
													(51, 4),
													(51, 20),
													(52, 20),
													(53, 20),
													(54, 20),
													(55, 20),
													(56, 20),
													(57, 20),
													(58, 20),
													(59, 20),
													(60, 4),
													(60, 15),
													(61, 18),
													(61, 20),
													(62, 7),
													(62, 11),
													(63, 7),
													(64, 11),
													(65, 20),
													(66, 18),
													(67, 20),
													(68, 18),
													(68, 20),
													(69, 20),
													(70, 20),
													(71, 6),
													(71, 20),
													(72, 20),
													(73, 4),
													(73, 20),
													(74, 19),
													(74, 20),
													(75, 20),
													(76, 20),
													(77, 20),
													(78, 20),
													(79, 4),
													(79, 20),
													(80, 7),
													(80, 20),
													(81, 7),
													(81, 26),
													(82, 7),
													(82, 26),
													(83, 20),
													(84, 7),
													(85, 18),
													(85, 20),
													(86, 17),
													(87, 4),
													(87, 16),
													(88, 1),
													(88, 27),
													(89, 20),
													(89, 4),
													(90, 20),
													(90, 4),
													(91, 4),
													(91, 16),
													(92, 4),
													(92, 16),
													(93, 7),
													(94, 10),
													(94, 23),
													(95, 27),
													(96, 27),
													(97, 10),
													(98, 10),
													(99, 10),
													(99, 20),
													(100, 10),
													(100, 20)
													;

/*Data entry for gameHasDeveloper*/
insert into gameHasDeveloper (game_id, developer_id) values (1, 1),
													(2, 2),
													(3, 3),
													(4, 4),
													(5, 5),
													(6, 6),
													(7, 7),
													(8, 8),
													(9 ,9),
													(10, 10),
													(11, 11),
													(12, 12),
													(13, 13),
													(14, 14),
													(15, 6),
													(16, 13),
													(17, 15),
													(18, 16),
													(19, 17),
													(20, 18),
													(20, 19),
													(21, 20),
													(22, 21),
													(23, 22),
													(24, 23),
													(25, 24),
													(26, 27),
													(27, 37),
													(27, 38),
													(28, 39),
													(29, 40),
													(30, 40),
													(31, 41),
													(32, 37),
													(32, 38),
													(33, 27),
													(34, 42),
													(34, 43),
													(34, 44),
													(35, 42),
													(36, 42),
													(37, 45),
													(38, 46),
													(39, 47),
													(40, 48),
													(41, 48),
													(42, 49),
													(43, 50),
													(44, 51),
													(45, 51),
													(46, 51),
													(47, 51),
													(48, 51),
													(49, 51),
													(50, 52),
													(51, 52),
													(52, 53),
													(53, 53),
													(54, 53),
													(55, 53),
													(56, 49),
													(57, 54),
													(58, 55),
													(59, 56),
													(60, 57),
													(61, 27),
													(62, 27),
													(63, 58),
													(64, 59),
													(65, 55),
													(66, 60),
													(67, 55),
													(68, 55),
													(69, 61),
													(70, 61),
													(71, 62),
													(72, 54),
													(73, 63),
													(74, 54),
													(75, 49),
													(76, 64),
													(77, 64),
													(78, 64),
													(79, 58),
													(80, 65),
													(81, 65),
													(82, 65),
													(83, 65),
													(84, 51),
													(85, 62),
													(86, 25),
													(87, 26),
													(88, 27),
													(89, 28),
													(90, 29),
													(91, 30),
													(92, 31),
													(93, 32),
													(93, 33),
													(94, 34),
													(95, 35),
													(96, 35),
													(97, 36),
													(98, 36),
													(99, 13),
													(100, 13)
													;
