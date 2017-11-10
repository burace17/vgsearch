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
GRANT SELECT,INSERT,UPDATE,DELETE ON ratings TO vgsearch;
					
create table genre(genre_id SERIAL PRIMARY KEY,
				   name VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON genre TO vgsearch;
				   
create table region(region_id SERIAL PRIMARY KEY,
				    name VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON region TO vgsearch;
				   
create table platform(platform_id SERIAL PRIMARY KEY,
				      name VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON platform TO vgsearch;

create table publisher(publisher_id SERIAL PRIMARY KEY,
					name VARCHAR(255) NOT NULL,
					country_founded VARCHAR(255) NOT NULL,
					city_founded VARCHAR(255));
GRANT SELECT,INSERT,UPDATE,DELETE ON publisher TO vgsearch;

create table developer(developer_id SERIAL PRIMARY KEY,
						name VARCHAR(255) NOT NULL,
						country_founded VARCHAR(255) NOT NULL,
						city_founded VARCHAR(255));
GRANT SELECT,INSERT,UPDATE,DELETE ON developer TO vgsearch;
				  
create table releases(release_id SERIAL PRIMARY KEY,
				  rating_id INT NOT NULL,
				  publisher_id INT NOT NULL,
				  region_id INT NOT NULL,
				  platform_id INT NOT NULL,
				  game_id INT NOT NULL,
				  FOREIGN KEY (rating_id) REFERENCES ratings (rating_id),
				  FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
				  FOREIGN KEY (region_id) REFERENCES region (region_id),
				  FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				  FOREIGN KEY (game_id) REFERENCES game (game_id),
				  dates date);
GRANT SELECT,INSERT,UPDATE,DELETE ON releases TO vgsearch;			 

					  
create table pc(pc_id SERIAL PRIMARY KEY,
		  		platform_id INT NOT NULL,
				FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				store VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON pc TO vgsearch;
				
create table console(console_id SERIAL PRIMARY KEY,
                platform_id INT NOT NULL,
				FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				generation VARCHAR(255) NOT NULL);
GRANT SELECT,INSERT,UPDATE,DELETE ON console TO vgsearch;				

					


create table gameHasGenre(
                        game_id INT NOT NULL,
                        genre_id INT NOT NULL,
				        PRIMARY KEY (game_id, genre_id),
						FOREIGN KEY (game_id) REFERENCES game (game_id),
						FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
						);
GRANT SELECT,INSERT,UPDATE,DELETE ON gameHasGenre TO vgsearch;

create table gameHasPublisher();
GRANT SELECT,INSERT,UPDATE,DELETE ON gameHasPublisher TO vgsearch;

GRANT USAGE,SELECT ON ALL SEQUENCES IN SCHEMA PUBLIC TO vgsearch;

/* Data entry for game*/
insert into game(name,comments) values  ('7 Days to Die', 'Fun game, made all the more fun when played with a group of friends, trying to survive against the zombie onslaught.'),
									    ('Broforce', 'Beneath Broforces bad puns and bulging biceps lies a brilliant ode to action cinema and retro gaming.'),
									    ('The Binding of Isaac','Poor Isaac.' ),
										('Cloudberry Kingdom', 'Fun platformer, good difficulty'),
										('I am Bread', 'You can become toast 10/10'),
										('Team Fortress 2', 'BEST HAT SIMULATOR EVER!!!!'),
										('Tabletop Simulator','Play poker, monopoly and other board games with friends without nasty cleaning up and extra table flips.'),
										('Magicka','Do you want a magic game where one of the best weapons is a M16A1!? I know I do!'),
										('Rocket League','A great game to play with friend, easy to learn.'), 
										('The Ship','Explosive wallets are the best.'),
										('Blur' , 'Fun simple racing '),
										('Gears of War', 'Great xbox exclusive'),
										('Halo: Combat Evolved','Microsofts best first person shooter'),
										('Garrys Mod','i love garrys mod its the best of hundread of worlds'),
										('Left 4 Dead','The AI teammates are the closest things Ive ever had to friends.'),
										('Halo 2','Great sequal to a fantastic series.'),
										('PlayerUnknowns BattleGrounds','I have the pan, I am immortal'),
										('The Stanley Parable','very mystireous...'),
										('FTL: Faster Than Light','Very hard, and then they added a hard mode.10/10 cant even beat it on normal.'),
										('Dino D-Day','Historically more accurate than the new Call of Duty: WWII'), /*Dino D-Day*/
										('Dont Starve','Very nice game! Everyone should try it'),
										('Doom','Its a survival horror game. But for your enemies.'),
										('State of Decay','A really fun zombie game with unique settlement management gameplay.'),
										('Super Meat Boy','Amazing game'),
										('Deadlight','A solid game, experience that I happily played throught at least two times.'),
										('Rockman', 'The first mageman which was first released in Japan'),
										('Legend of Zelda' , 'First game released on the nintendo'),
										('Where in Time is Carmen Sandiego', 'One of the hardest educational games'),
										('Shining in the darkness', 'One of the earliest and most fun dungeon crawlers'),
										('Shining forces II','One of the earliest tatics games.It is a tone of fun to play'),
										('Langrisser', 'Was a amazing tatical game from Japan'),
										('Super Mario Brothers','A fun game for the whole family.'),
										('Mega Man X','A fun platform game and continuation of the series on the SNES'),
										('Final Fantasy VII','One of the most famous RPG for the ps1'),
										('Final Fantasy IX','A very well done story and good addition to the series'),
										('Final Fantasy XI','The first MMORPG for the series and a good example of sandbox enviroment'),
										('Final Fantasy XIV: A Realm Reborn','Not as good of a MMORPG but still fun to play.'),
										('Senran Kagura: Estival Versus','A fun hack and slash game taken from a famous anime'),
										('Time Crisis','A fun shooting game where you get to actually use a toy gun.'),
										('The Witcher','Was a blast to play and really well put to gether.'),
										('The Witcher 2: Assassins of Kings','Was a very well done sequal and had a fantasit storyline'),
										('The Witcher 3: Wild Hunt','The fact that you did not have to play the other to understand this one was nice.'),
										('Quest 64','Was a cute and relaxing RPG and had great replay value'),
										('Suikoden Tatics','Had a lot of interesting features'),
										('Suikoden V','Was a bit disappointing but stil a fun game'),
										('Suikoden IV','The fact that it centered around ship movement and combat was a nice touch'),
										('Suikoden III','This ones story was not as good as the other two.'),
										('Suikoden II','Was nice that you could upload your save data from the first game to help add to this one.'),
										('Suikoden','Loved the fact that your hideout upgrades with the more followers you got.'),
										('Summoner 2','Was a fun game that used group tatics with each party member specializing in areas'),
										('Summoner','Had the best hidden easter egg ever.I attack the darkness.'),
										('Wild Arms 4','Had a problem with a glick that stopped the game randomly'),
										('Wild Arms 3','The villian was well scripted.'),
										('Wild Arms 2','The added elemtns and storyline made this an enjoyable game'),
										('Wild Arms','Was a good mix of puzzles and rpg elements to a western'),
										('Tales of Symphonia Chronicales','The ability to make this game weave into the whole series was simply amazing.'),
										('Fairy Fencer F','The storyline and the ability to choose being good bad or nutral was a nice touch.'),
										('HyperDimension Neptunia mk2','This was one funny game.It made my sides hurt from laughing.'),
										('Bards Tale','This game made me smile.Its constant comments to make fun of RPGs was priceless.'),
										('Metal Gear Solid 4:Guns of the Patriots','This action packed game was a fun to play.The sneaking in barrels was fun.'),
										('Cross Edge','Was and interesting game since they took main characters from other games and created a game around them.'),
										('Willow','The game was so much better then the movie and was a blast to play.'),
										('World of Illusion Starring Mickey Mouse and Donald Duck','Was a very creative game with Disneys favorite characters.'),
										('Silver Surfer','Was one of the hardest games I have ever played.'),
										('HyperDimension Neptunia V','This game made me bust a gut and was neat that it had three different endings.'),
										('GrimGrimoire','Was a unique real time stratagy game.'),
										('Trinity Universe','The multiple endings made for great replay value.'),
										('Record of Agarest War Zero','The well done tatical play mixed with a good story, romance, and multipe endings made this game great.'),
										('White Knight Chronicles II','The fact that they mixed in mechs into a fantasy game was interesting'),
										('White Knight Chronicles ','The fact that they mixed in mechs into a fantasy game was interesting'),
										('The Guided Fate ParaDox','The story was interesting and the fact that they said if you had ultimate power how would you use it.'),
										('Mugen Souls','The comic mischief and funny rpg elements made me enjoy this game'),
										('Sword Art Online: Lost Song','It was fun to run around as one of my favorite anime characters and pretend to be him.'),
										('Mugen Souls Z','Was a well done sequal.'),
										('XenoSaga','The cutscenes in this game was amazing.'),
										('Grandia III','Loved how they changed the magic so that you could find the element eggs in the wild easier.'),
										('Grandia II','Had so much fun playing the game I lost track of time.'),
										('Grandia','The character developement was so well done I fell in love with the characters.'),
										('Sword of Vermilion','Was a unique story about a boy who finds out he is king and sets out to reclaim his kingdom.'),
										('Valis: The Fantasm Soldier','Was a Japanese import and had a very sad storyline.'),
										('Valis II','Was an interesting cartoonish game in the series.'),
										('Valis III','Was an excelent game.The fact that you could choose between three characters at any given point was nice.'),
										('Traysia','Was a fun but hard RPG'),
										('Rocket Knight Adventures','The battle against the pigs was fun and the rocketpack was a nice touch.'),
										('Disgaea: Hour of Darkness','The fact that this game made fun of everything unde the sun was awsome.')
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
									('1986-2-21'), /*Legend of Zeld NES*/
									('1989-8-15'), /*Where in Time is Carmen Sandiego? NES*/
									('1991-3-29'), /*Shining in the darkness Sega*/
									('1991-4-26'), /*Langrisser*/
									('1985-9-13'), /*Super Mario Brothers NES*/
									('1993-12-17'), /*Mega Man X SNES*/
									('1997-1-31'), /*Final Fantasy VII PS1*/
									('2000-7-7'), /*Final Fantasy IX PS1*/
									('2002-5-16'), /*Final Fantasy XI PS2 and PC*/
									('2013-8-24'), /*Final Fantasy XIV PS3 PS4 PC*/
									('2015-3-15'), /*Senran Kagura: Estival Versus PS4*/
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
									(NULL), /*HyperDimension Neptunia V PS4*/
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
									(NULL), /*Rocket Knight Adventures Sega*/
									('2003-1-30') /*Disgaea: Hour of Darkness PS2*/
									;

/* Data entry for ratings*/
insert into ratings( age, name) values      (0, 'EC'),
											(0, 'E'),
											(10, 'E10'),
											(13, 'T'),
											(17, 'M'),
											(18, 'A');

/*Data entry for gameHasGenre */

/*Data entry for gameHasPublisher*/

/* Data entry for genre*/
insert into genre(name) values  ('survival'),
								('zombie'), 
								('open world'),
								('action'),
								('2D'),
								('rogue-like'),
								('platformer'),
								('comedy'),
								('simulation'),
								('first person shooter'),
								('shooter'),
								('Board Game'),
								('Racing'),
								('Sports'),
								('Stealth'),
								('third person shooter'),
								('Sandbox'),
								('Strategy'),
								('Adventure'),
								('RPG'),
								('MMORPG'),
								('JRPG'),
								('Puzzle'),
								('action'),
								('adventure')
																
;

/* Data entry for region*/
insert into region(name) values ('WW'),
								('NA'),
								('AU'),
								('AUS'),
								('PAL'),
								('SEA'),
								('AS'),
								('SA'),
								('OC'),
								('JP')
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
insert into publisher(name, country_founded, city_founded) values   ('The Fun Pimps', 'US', 'Dallas'),/*'7 Days to die' */
																	('Developer Digital', 'US', 'Austin'), /*Broforce*/
																	('Edmund McMillen', 'US','Asheville'), /*The Binding of Isaac*/
																	('Ubisoft', 'FR', 'Carentoir'),/*Cloudberry Kingdom*/
																	('Bossa Studios','EN','London'), /*I am Bread*/
																	('Valve','US','Bellevue'), /*Team Fortress 2*/ /*garry's mod*/ /* Left 4 Dead*/
																	('Berserk','US','Stuart'), /*Tabletop Simulator*/
																	('Paradox Interactive','SE','Stockholm'), /*Magicka*/
																	('Psyonix','US','Satellite Beach'), /*Rocket League*/
																	('Blazing Griffin','GB','Glasgow'), /* The Ship*/
																	('Activision','US','Santa Monica'), /* Blur*/
																	('Microsoft Studios','US','Redmond'), /*Gears of War*/ /*Halo: Combat Evolved */ /*Halo 2 */ /* State of Decay*//*Deadlight*/
																	('Bluehole Studio','KR','YeokSam-Dong'), /*PlayerUnknown BattleGrounds*/
																	('Galactic Cafe','',''), /* The Stanley Parable*/
																	('Subset Games','CN','Shanghai'),/*FTL: Faster Than Light*/
																	('800 North','US','Burbank'),/*Dino D-Day*/	
																	('Klei Entertainment','CA','Vancouver'), /* Don't Starve*/
																	('Bethesda Softworks','US','Bethesda'), /*Doom*/
																	('Team Meat','US','Asheville'), /*super meat boy*/
																	('Deep Silver','DE','Germany') /*Deadlight everything else*/
																	
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
																	('Bungie','US','Chicago'), /*Halo: Combat Evolved*/ /*Halo 2 */
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
																	('Tequila','ES','Madrid') /*Deadlight*/
																	
;
