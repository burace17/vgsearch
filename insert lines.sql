create table game(game_id SERIAL PRIMARY KEY,
				  name VARCHAR(255) NOT NULL,
				  comments VARCHAR(255));
				  
GRANT SELECT,INSERT,UPDATE,DELETE ON game TO vgsearch;
				  
create table releases(release_id SERIAL PRIMARY KEY,
				  FOREIGN KEY (rating_id) REFERENCES ratings (rating_id),
				  FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
				  FOREIGN KEY (region_id) REFERENCES region (region_id),
				  FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				  dates date);
				 
create table ratings(rating_id SERIAL PRIMARY KEY,
				age INT NOT NULL,
				name VARCHAR(255) NOT NULL);
					
create table genre(genre_id SERIAL PRIMARY KEY,
				   name VARCHAR(255) NOT NULL);
				   
create table region(region_id SERIAL PRIMARY KEY,
				   unique name VARCHAR(255));
				   
create table platform(platform_id SERIAL PRIMARY KEY,
				      name VARCHAR(255) NOT NULL);
					  
create table pc(pc_id SERIAL PRIMARY KEY,
				FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				FOREIGN KEY (release_id) REFERENCES releases (release_id),
				FOREIGN KEY (game_id) REFERENCES game (game_id),
				store VARCHAR(255) NOT NULL);
				
create table console(console_id SERIAL PRIMARY KEY,
				FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
				FOREIGN KEY (release_id) REFERENCES releases (release_id),
				FOREIGN KEY (game_id) REFERENCES game (game_id),
				generation VARCHAR(255) NOT NULL);
				
create table publisher(publisher_id SERIAL PRIMARY KEY,
					name VARCHAR(255) NOT NULL,
					country_founded VARCHAR(255) NOT NULL,
					city_founded VARCHAR(255));
					
create table developer(developer_id SERIAL PRIMARY KEY,
						name VARCHAR(255) NOT NULL,
						country_founded VARCHAR(255) NOT NULL,
						city_founded VARCHAR(255));

create table gameHasGenre(
						FOREIGN KEY (game_id) REFERENCES game (game_id),
						FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
						);

create table gameHasPublisher();


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
										
										;

/* Data entry for releases*/
insert into releases(dates) values  (2013-12-13), /*'7 Days to die' computer*/
									(2016-1-6), /*'7 Days to die' console*/
									(2015-10-15), /*'Broforce' computer*/
									(2016-3-1), /*'Broforce' console*/
									(2011-9-28), /*The Binding of Isaac*/
									(2013-5-30), /*Cloudberry Kingdom*/
									(2015-4-9), /*I am Bread*/
									(2007-10-10), /*Team Fortress 2*/
									(2015-5-5), /*Tabletop Simulator*/
									(2011-1-25), /*Magicka*/
									(2015-6-7), /*Rocket League*/
									(2016-2-17), /*Rocket League*/
									(2006-9-15), /*The Ship EU*/
									(2007-2-15), /*The Ship NA*/
									(2010-3-25), /*Blur NA*/
									(2010-3-28), /*Blur EU*/
									(2006-11-7), /*Gears of War*/
									(2001-11-15), /*Halo: Combat Evolved*/
									(2006-11-29), /*Garry's Mod */
									(2008-11-17), /* Left 4 Dead*/
									(2004-11-9), /*Halo 2 Xbox release*/ 
									(2007-5-31), /*Halo 2 PC release*/
									(2017-3-23), /*PlayerUnknown's Battlegrounds PC */
									(NULL), /*PlayerUnknown's Battlegrounds Console*/
									(2013-12-19), /*The Stanley Parabol*/
									(2012-9-14),/*FTL: Faster Than Light PC*/
									(2014-4-3),/*FTL: Faster Than Light IOS*/
									(2011-4-8),/*Dino D-Day*/
									(2013-4-23),/* Don't Starve*/
									(2016-3-13),/*Doom PC Consoles*/
									(2017-11-10),/*Doom Switch*/
									(2013-6-5), /* State of Decay*/
									(2010-10-20), /*Super Meat Boy*/
									(2012-8-1), /*Deadlight xbox*/
									(2012-10-25), /*Deadlight PC*/
									(2016-6-21), /*Deadlight the rest*/
									
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
								('OC')
								;

/* Data entry for platform*/
insert into platform(name) values   ('PC'),
									('console');

/* Data entry for pc*/
insert into pc (store) values   ('steam'),
								('origin'),
								('retail')
								;

/* Data entry for console*/
insert into console(generation) values  ('xbox'),
										('playstation'),
										('wii');

/* Data entry for publisher*/
insert into publisher(name, country_founded, city_founded) values   ('The Fun Pimps', 'US', 'Dallas'),/*'7 Days to die' */
																	('Developer Digital', 'US', 'Austin'), /*Broforce*/
																	('Edmund McMillen', 'US','Asheville'), /*The Binding of Isaac*/
																	('Ubisoft', 'FR', 'Carentoir'),/*Cloudberry Kingdom*/
																	('Bossa Studios','EN','London'), /*I am Bread*/
																	('Valve','US','Bellevue'), /*Team Fortress 2*/ /*garry's mod*/ /* Left 4 Dead*/
																	('Berserk','US','Stuart'), /*Tabletop Simulator*/
																	('Paradox Interactive','SE','Stockholm') /*Magicka*/
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
																	('Deep Silver','DE','Germany'), /*Deadlight everything else*/
																	
;


/* Data entry for developer*/
insert into developer(name, country_founded, city_founded) values   ('The Fun Pimps Entertainment LLC', 'US', 'Dallas'),/*'7 Days to die' */
																	('Free Lives', 'ZA', 'Cape Town') /*Broforce */
																	('Edmund McMillen Florian Himsl', ,),/*The Binding of Isaac*/
																	('Pwnee Studios', 'US' , 'New York') /*Cloudberry Kingdom*/
																	('Bossa Studios','GB','London'), /*I am Bread*/
																	('Valve','US','Bellevue'), /*Team Fortress 2*/ /* Left 4 Dead*/
																	('Berserk','US','Stuart'), /*Tabletop Simulator*/
																	('Arrowhead Game Studios','SE','Stockholm')/*Magicka*/
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
																	('Tequila','ES','Madrid'), /*Deadlight*/
																	
;