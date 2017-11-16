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
drop table gameHasPublisher cascade;

CREATE TABLE game(game_id SERIAL PRIMARY KEY,
				  name VARCHAR(255) NOT NULL,
				  comments VARCHAR(255));
				  
GRANT SELECT,INSERT,UPDATE,DELETE ON game TO vgsearch;

create table ratings(rating_id SERIAL PRIMARY KEY,
				age INT NOT NULL,
				name VARCHAR(255) NOT NULL);
					
create table genre(genre_id SERIAL PRIMARY KEY,
				   name VARCHAR(255) NOT NULL);
				   
create table region(region_id SERIAL PRIMARY KEY,
				    name VARCHAR(255) NOT NULL);
				   
create table platform(platform_id SERIAL PRIMARY KEY,
				      name VARCHAR(255) NOT NULL);

create table publisher(publisher_id SERIAL PRIMARY KEY,
					name VARCHAR(255) NOT NULL,
					country_founded VARCHAR(255) NOT NULL,
					city_founded VARCHAR(255));

create table developer(developer_id SERIAL PRIMARY KEY,
						name VARCHAR(255) NOT NULL,
						country_founded VARCHAR(255) NOT NULL,
						city_founded VARCHAR(255));
				  
create table releases(release_id SERIAL PRIMARY KEY,
				  rating_id INT NOT NULL,
				  publisher_id INT NOT NULL,
				  region_id INT NOT NULL,
				  platform_id INT NOT NULL,
				  FOREIGN KEY (rating_id) REFERENCES ratings (rating_id),
				  FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
				  FOREIGN KEY (region_id) REFERENCES region (region_id),
				  FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				  dates date);
				 

					  
create table pc(pc_id SERIAL PRIMARY KEY,
		  		platform_id INT NOT NULL,
				FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				store VARCHAR(255) NOT NULL);
				
create table console(console_id SERIAL PRIMARY KEY,
                platform_id INT NOT NULL,
				FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				generation VARCHAR(255) NOT NULL);
				

					


create table gameHasGenre(
                        game_id INT NOT NULL,
                        genre_id INT NOT NULL,
				        PRIMARY KEY (game_id, genre_id),
						FOREIGN KEY (game_id) REFERENCES game (game_id),
						FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
						);

create table gameHasPublisher();


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
												 (92, 'Crackdown 2','A departure from the first game.')
												 (93, 'Doritos Crash Course','Fun and slightly challenging'),
												 (94, 'Red Trigger','Not bad at all, in fact its pretty good'),
												 (95, 'The Cat Lady','Was not expecting this dark of a story.'),
												 (96, 'Downfall','What a freaking journey'),
												 (97, 'Titanfall','Love wall running.'),
												 (98, 'Titanfall 2','Finally, titanfall with a story.'),
												 (99, 'Destiny', 'Space Magic done right.'),
												 (100, 'Destiny 2','Story! Finally they added a story.')
										;

/* Data entry for releases*/
insert into releases(dates) values  ('2013-12-13'), /*'7 Days to die' computer*/
									('2016-1-6'), /*'7 Days to die' console*/
									('2015-10-15'), /*'Broforce' computer*/
									('2016-3-1'), /*'Broforce' console*/
									('2011-9-28'), /*The Binding of Isaac*/
									('2013-5-30'), /*Cloudberry Kingdom*/
									('2015-4-9'), /*I am Bread*/
									('2007-10-10'), /*Team Fortress 2*/
									('2015-5-5'), /*Tabletop Simulator*/
									('2011-1-25'), /*Magicka*/
									('2015-6-7'), /*Rocket League*/
									('2016-2-17'), /*Rocket League*/
									('2006-9-15'), /*The Ship EU*/
									('2007-2-15'), /*The Ship NA*/
									('2010-3-25'), /*Blur NA*/
									('2010-3-28'), /*Blur EU*/
									('2006-11-7'), /*Gears of War*/
									('2001-11-15'), /*Halo: Combat Evolved*/
									('2006-11-29'), /*Garry's Mod */
									('2008-11-17'), /* Left 4 Dead*/
									('2004-11-9'), /*Halo 2 Xbox release*/ 
									('2007-5-31'), /*Halo 2 PC release*/
									('2017-3-23'), /*PlayerUnknown's Battlegrounds PC */
									(NULL), /*PlayerUnknown's Battlegrounds Console*/
									('2013-12-19'), /*The Stanley Parabol*/
									('2012-9-14'),/*FTL: Faster Than Light PC*/
									('2014-4-3'),/*FTL: Faster Than Light IOS*/
									('2011-4-8'),/*Dino D-Day*/
									('2013-4-23'),/* Don't Starve*/
									('2016-3-13'),/*Doom PC Consoles*/
									('2017-11-10'),/*Doom Switch*/
									('2013-6-5'), /* State of Decay*/
									('2010-10-20'), /*Super Meat Boy*/
									('2012-8-1'), /*Deadlight xbox*/
									('2012-10-25'), /*Deadlight PC*/
									('2016-6-21'), /*Deadlight the rest*/
									('1987-12-17'), /*Rockman NES*/
									('1986-2-21'), /*Legend of Zeld NES Japanese*/
									('1986-8-22'), /*Legend of Zeld NES American*/
									('1989-8-15'), /*Where in Time is Carmen Sandiego? NES*/
									('1991-3-29'), /*Shining in the darkness Sega*/
									('1991-4-26'), /*Langrisser*/
									('1985-9-13'), /*Super Mario Brothers NES JP*/
									('1985-10-18'),/*Super Mario Brothers NES US*/
									('1993-12-17'), /*Mega Man X SNES*/
									('1997-1-31'), /*Final Fantasy VII PS1 JP*/
									('1997-11-17'), /*Final Fantasy VII PS1 EN*/
									('1997-9-7'), /*Final Fantasy VII PS1 US*/
									('2000-7-7'), /*Final Fantasy IX PS1*/
									('2002-5-16'), /*Final Fantasy XI PS2 and PC*/
									('2013-8-24'), /*Final Fantasy XIV PS3 PS4 PC*/
									('2015-3-15'), /*Senran Kagura: Estival Versus PS4 JP*/
									('1997-8-15'), /*Time Crisis PS1*/
									('2007-10-26'), /*The Witcher PC*/
									('2011-5-17'), /*The Witcher 2: Assassins of Kings PC + xbox360*/
									('2015-5-19'), /*The Witcher 3: Wild Hunt PC PS4*/
									('1998-6-1'), /*Quest 64 N64*/
									('2005-9-22'), /*Suikoden Tatics PS2*/
									('2006-2-23'), /*Suikoden V PS2*/
									('2004-8-19'), /*Suikoden IV PS2*/
									('2002-7-11'), /*Suikoden III PS2*/
									('1998-12-17'), /*Suikoden II PS1*/
									('1995-12-15'), /*Suikoden PS1*/
									('2002-9-23'), /*Summoner 2 PS2 GameCube*/
									('2000-10-24'), /*Summoner PS2 PC*/
									('2005-3-24'), /*Wild Arms 4 PS2*/
									('2002-3-14'), /*Wild Arms 3 PS2*/
									('1999-9-2'), /*Wild Arms 2 PS1*/
									('1996-12-20'), /*Wild Arms PS1*/
									('2013-10-10'), /*Tales of Symphonia Chronicales PS3*/
									('2013-10-10'), /*Fairy Fencer F PS3*/
									('2011-8-18'), /*HyperDimension Neptunia mk2 PS3 Playstation Vita*/
									('2004-10-26'), /*Bards Tale PS2*/
									('2008-6-12'), /*Metal Gear Solid 4:Guns of the Patriots PS3*/
									('2008-9-25'), /*Cross Edge PS3*/
									('1989-7-18'), /*Willow NES*/
									('1992-12-17'), /*World of Illusion Starring Mickey Mouse and Donald Duck Sega*/
									('1990-11-10'), /*Silver Surfer NES*/
									('2010-8-19'), /*HyperDimension Neptunia V PS4*/
									('2007-4-12'), /*GrimGrimoire PS2*/
									('2009-10-1'), /*Trinity Universe PS3*/
									('2009-6-25'), /*Record of Agarest War Zero PS3 Xbox360*/
									('2010-7-8'), /*White Knight Chronicles  II PS3*/
									('2008-12-25'), /*White Knight Chronicles  PS3*/
									('2013-1-24'), /*The Guided Fate ParaDox PS3*/
									('2012-3-22'), /*Mugen Souls PS3*/
									('2015-3-26'), /*Sword Art Online: Lost Song PS4 PS3 PSVista*/
									('2013-4-25'), /*Mugen Souls Z PS3*/
									('2002-2-28'), /*XenoSaga PS2*/
									('2005-8-4'), /*Grandia III PS2*/
									('2000-8-3'), /*Grandia II PS2*/
									('1997-12-18'), /*Grandia PS1*/
									('1989-12-16'), /*Sword OF Vermilion Sega*/
									('1986-12-11'), /*Valis Sega*/
									('1989-6-23'), /*Valis II Sega*/
									('1990-9-7'), /*Valis III Sega*/
									('1992-2-14'), /*Traysia Sega*/
									('1993-8-6'), /*Rocket Knight Adventures Sega JP*/
									('1993-8-5'), /*Rocket Knight Adventures Sega US*/
									('1993-8-7'), /*Rocket Knight Adventures Sega EU*/
									('2003-1-30'), /*Disgaea: Hour of Darkness PS2*/
									('2014-10-7'), /*Project Spark NA*/
									('2014-10-9'), /*Project Spark AU*/
									('2014-10-10'), /*Project Spark EU*/
									('2014-10-28'), /*Sunset Overdrive NA*/ 
									('2014-10-30'), /*Sunset Overdrive AU*/ 
									('2014-10-31'), /*Sunset Overdrive EU*/ 
									('2006-8-8'), /*Dead Rising NA*/
									('2006-9-8'), /*Dead Rising EU*/
									('2006-9-14'), /*Dead Rising AU*/
									('2006-9-28'), /*Dead Rising JP*/
									('2016-9-13'), /*Dead Rising Rerelease ps4, X1, MWS*/
									('2004-9-14'), /*Fable*/
									('2008-8-21'), /*Fable 2 NA*/
									('2008-8-23'), /*Fable 2 AU*/
									('2008-8-24'), /*Fable 2 EU*/
									('2007-2-20'), /*Crackdown NA*/
									('2007-2-22'), /*Crackdown AU*/
									('2007-2-23'), /*Crackdown EU*/
									('2010-7-6'), /*Crackdown 2 NA*/
									('2010-7-8'), /*Crackdown 2 AU*/
									('2010-7-9'), /*Crackdown 2 EU*/
									('2010-12-8'), /*Doritos Crash Course*/
									('2016-7-8'), /*Red Trigger*/
									('2012-12-7'), /*The Cat Lady*/
									('2016-2-15'), /*Downfall*/
									('2014-3-11'), /*Titanfall*/
									('2016-10-28'), /*Titanfall 2*/
									('2014-9-9'), /*Destiny*/
									('2017-9-6'), /*Destiny 2 console*/
									('2017-10-24') /*Destiny 2 pc*/
									;

/* Data entry for ratings*/
insert into ratings( age, name) values      (0, 'EC'),
											(0, 'E'),
											(10, 'E10'),
											(13, 'T'),
											(17, 'M'),
											(18, 'A');

/*Data entry for gameHasGenre */
insert into gameHasGenre (game_id, genre_id) values (),
													;

/*Data entry for gameHasDeveloper*/
insert into gameHasDeveloper

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
											(24, 'action'),
											(25, 'adventure')
											;

/* Data entry for region*/
insert into region(region_id, name) values  (1, 'WW'),
											(2, 'NA'),
											(3, 'AU'),
											(4, 'AUS'),
											(5, 'PAL'),
											(6, 'SEA'),
											(7, 'AS'),
											(8, 'SA'),
											(9, 'OC'),
											(10, 'JP')
											;

/* Data entry for platform*/
insert into platform(name) values   ('PC'),
									('console');

/* Data entry for pc*/
insert into pc (platform_id,store) values   (1, 'steam'),
											(1, 'origin'),
											(1, 'retail')
											;

/* Data entry for console*/
insert into console(platform_id,generation) values  (2, 'xbox'),
										(2, 'playstation'),
										(2, 'nintendo'),
										(2, 'Sega'),
										(2, 'playstation 2'),
										(2, 'playstation 3'),
										(2, 'playstation 4'),
										(2, 'Super Nintendo'),
										(2, 'Nintendo 64'),
										(2, 'xbox 360'),
										(2, 'gamecube'),
										(2,'playstation vita'),
										(2, 'wii');

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
																	(24, 'Electronic Arts','US','San Mateo') /*Titanfall*/ /*Titanfall 2*/ /*Bards Tale PS2*/
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
																	('Bandai Namco','JP','Tokyo'), /*The Witcher 3: Wild Hunt PC PS4*/ /*Tales of Symphonia Chronicales PS3*/ /*Sword Art Online: Lost Song PS4 PS3 PSVista*/
																	('THQ','US','Agorura Hills'), /*Summoner 2 PS2 GameCube*/ /*Summoner PS2 PC*/
																	('Marvelous USA','US','Torrance'), /*Wild Arms 4 PS2*/
																	('Compile Heart','JP','Tokyo'), /*Fairy Fencer F PS3*/ /*Record of Agarest War Zero PS3 Xbox360*/
																	('Nippon Ichi Software','JP','Kakamigahara'), /*HyperDimension Neptunia mk2 PS3 Playstation Vita*/ /*Cross Edge PS3*/ /*HyperDimension Neptunia V PS4*/ /*Trinity Universe PS3*/  /*The Guided Fate ParaDox PS3*/ /*Mugen Souls PS3*/ /*Mugen Souls Z PS3*/ /*Disgaea: Hour of Darkness PS2*/
																	('Arcadia Systems','US','Costa Mesa'), /*Silver Surfer NES*/
																	('Koei Tecmo Games','JP','Yokohama'), /*GrimGrimoire PS2*/
																	('Namco','JP','Tokyo'), /*XenoSaga PS2*/
																	('Telenet Japan','JP','Tokyo'), /*Valis Sega*/ /*Valis II Sega*/ /*Traysia Sega*/
																	;
																	

/* Data entry for developer*/
insert into developer(name, country_founded, city_founded) values   ('The Fun Pimps Entertainment LLC', 'US', 'Dallas'),/*'7 Days to die' */
																	('Free Lives', 'ZA', 'Cape Town'), /*Broforce */
																	('Edmund McMillen Florian Himsl', 'US','Santa Cruz'),/*The Binding of Isaac*/
																	('Pwnee Studios', 'US' , 'New York'), /*Cloudberry Kingdom*/
																	('Bossa Studios','GB','London'), /*I am Bread*/
																	('Valve','US','Bellevue'), /*Team Fortress 2*/ /* Left 4 Dead*/
																	('Berserk','US','Stuart'), /*Tabletop Simulator*/
																	('Arrowhead Game Studios','SE','Stockholm'), /*Magicka*/
																	('Psyonix','US','Satellite Beach'), /*Rocket League*/
																	('Outright', 'GB', 'Edinburgh' ), /*The Ship*/
																	('Bizarre Creations','GB','Liverpool'), /*blur*/
																	('Epic Games','US','Cary'),/*Gears of War*/
																	('Bungie','US','Chicago'), /*Halo: Combat Evolved*/ /*Halo 2 */ /*Destiny*/ /*Destiny 2*/
																	('Facepunch Studios','GB','Walsall'), /*garry's mod*/
																	('Bluehole studio','KR','YeokSam-Dong'), /*PlayerUnknown BattleGrounds*/
																	('Galactic Cafe','',''), /* The Stanley Parable*/
																	('Subset Games','CN','Shanghai'),/*FTL: Faster Than Light*/
																	('800 North','US','Burbank'),/*Dino D-Day*/	
																	('Digital','US','Millcreek'), /*Dino D-Day*/
																	('Klei Entertainment','CA','Vancouver'),/* Don't Starve*/
																	('id Software','US','Mesquite'), /*Doom*/
																	('Undead Labs','US','Seattle'),	 /* State of Decay*/
																	('Team Meat','US','Asheville'), /*super meat boy*/
																	('Tequila','ES','Madrid'), /*Deadlight*/
																	('SkyBox labs','CA','Burnaby'), /*Project Spark*/
																	('Insomniac Games','US','Burbank'), /*Sunset Overdrive*/ 	
																	('Capcom','JP','Chūō-ku'), /*Deadrising*/ /*rockman*/ /*Mega Man X SNES*/ /*Cross Edge PS3*/ /*Willow NES*/
																	('Microsoft Studios','US','Redmond'), /*Fable*/
																	('Lionhead Studios','GB','London')/*Fable 2*/
																	('Realtime','SCT','Dundee'),  /*Crackdown*/
																	('Ruffian Games','SCT','Dundee'), /*Crackdown 2*/
																	('Wanako Games','CL','Santiago'), /*Doritos Crash Course*/
																	('Behaviour Interactive','CA','Quebec City'), /*Doritos Crash Course*/
																	('Maxime Vézina','CA','Montreal'),/*Red Trigger*/	
																	('Harvester Games','GB','Oxfordshire'), /*The Cat Lady*/ /*Downfall*/
																	('Respawn Entertainment','US','Sherman Oaks'), /*Titanfall*/ /*Titanfall 2*/
																	('Nintendo','JP','Kyoto'), /*Legend of Zelda JP*/ /*Super Mario Brothers NES JP*/
																	('Nintendo','US','Seattle'), /*Legend of Zelda US*/ /*Super Mario Brothers NES US*/
																	('Borderbund','US','Novato'), /*Where in Time is Carmen Sandiego? NES*/
																	('Camelot Software Planing','JP','Tokyo'), /*Shining in the darkness Sega*/
																	('Masaya','JP','Tokyo'), /*Langrisser*/
																	('Squaresoft','JP','Tokyo'), /*Final Fantasy VII PS1 JP*/ /*Final Fantasy IX PS1*/ /*Final Fantasy XI PS2 and PC*/
																	('Squaresoft','US','El Segundo'), /*Final Fantasy VII PS1 US*/
																	('Squaresoft','GB','London'), /*Final Fantasy VII PS1 EN*/
																	('Square Enix','JP','Tokyo'),/*Final Fantasy XIV PS3 PS4 PC*/
																	('Tamsoft','JP','Tokyo'), /*Senran Kagura: Estival Versus PS4*/
																	('Namco','JP','Tokyo'), /*Time Crisis PS1*/
																	('CD Projekt','PL','Warsaw'), /*The Witcher PC*/ /*The Witcher 2: Assassins of Kings PC + xbox360*/
																	('Bandai Namco','JP','Tokyo'), /*The Witcher 3: Wild Hunt PC PS4*/ /*Tales of Symphonia Chronicales PS3*/ /*XenoSaga PS2*/
																	('Imangineer','JP','Tokyo'), /*Quest 64 N64*/
																	('Konami','JP','Tokyo'), /*Suikoden Tatics PS2*/ /*Suikoden V PS2*/ /*Suikoden IV PS2*/ /*Suikoden III PS2*/ /*Suikoden II PS1*/ /*Suikoden PS1*/ /*Rocket Knight Adventures Sega*/ /*Rocket Knight Adventures Sega US*/ /*Rocket Knight Adventures Sega EU*/
																	('Volition','US','Champaign'), /*Summoner 2 PS2 GameCube*/ /*Summoner PS2 PC*/
																	('Media.Vision','JP','Tokyo'), /*Wild Arms 4 PS2*/ /*Wild Arms 3 PS2*/ /*Wild Arms 2 PS1*/ /*Wild Arms PS1*/
																	('Compile Heart','JP','Tokyo'), /*Fairy Fencer F PS3*/ /*Mugen Souls PS3*/ /*Mugen Souls Z PS3*/
																	('Idea Factory','JP','Tokyo'),/*HyperDimension Neptunia mk2 PS3 Playstation Vita*/ /*HyperDimension Neptunia V PS4*/ /*Trinity Universe PS3*/ /*Record of Agarest War Zero PS3 Xbox360*/
																	('inXile Entertainment','US','Newport Beach'), /*Bards Tale PS2*/
																	('Kojima Productions','JP','Tokyo'), /*Metal Gear Solid 4:Guns of the Patriots PS3*/
																	('Sega','JP','Tokyo'),  /*World of Illusion Starring Mickey Mouse and Donald Duck Sega*/ /*Sword OF Vermilion Sega*/
																	('Software Creation','GB','Manchester'), /*Silver Surfer NES*/
																	('Vanillaware','JP','Osaka'), /*GrimGrimoire PS2*/
																	('Level 5','JP','Fukuoka'), /*White Knight Chronicles  II PS3*/ /*White Knight Chronicles  PS3*/
																	('Nippon Ichi Software','JP','Kakamigahara'), /*The Guided Fate ParaDox PS3*/ /*Disgaea: Hour of Darkness PS2*/
																	('Artdink','JP','Tokyo'), /*Sword Art Online: Lost Song PS4 PS3 PSVista*/
																	('Game Arts','JP','Tokyo'), /*Grandia III PS2*/ /*Grandia II PS2*/ /*Grandia PS1*/
																	('Telenet Japan','JP','Tokyo'), /*Valis Sega*/ /*Valis II Sega*/ /*Valis III Sega*/ /*Traysia Sega*/
																	;
																	
