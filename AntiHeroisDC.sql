/*
 * Base de Dados
 *
 * Ana Loreiro, 201805397
 * Maria Almeida, 201805265
 * Rui Cardoso, 201805046
 *
 * BD para Anti Herois DC
 * Esquema e dados iniciais.
 */
 
USE guest;

DROP TABLE IF EXISTS CHARACTERS, MOVIES, COMICS, TEAMS, CREATED_IN, HAS, PART_OF, ENTERS, IS_IN, INSPIERD_BY;

CREATE TABLE IF NOT EXISTS CHARACTERS 
(
	CharId               INT PRIMARY KEY NOT NULL,
	Alias                VARCHAR(128) NOT NULL,
	Name                 VARCHAR(128) UNIQUE NOT NULL,
	Occupation           VARCHAR(128) NOT NULL,
	ConfirmedKills       INT,
	Gender               ENUM('M', 'F', 'Other') NOT NULL,
	Status               ENUM('Dead', 'Alive', 'Resurrected', 'Unknown') NOT NULL
);

INSERT INTO 
	CHARACTERS(CharId, Alias, Name, Occupation, ConfirmedKills, Status, Gender) 
VALUES
    (1,'Harley Quinn','Harleen Quinzel',  'Psychiatrist',       0, 'Alive',       'F'),
    (2,'Poison Ivy',  'Pamela Isley',     'Botanist',          22, 'Alive',       'F'),
    (3,'Penguin',     'Oswald Cobblepot', 'Crimelord',         57, 'Alive',       'M'),
    (4,'Bane',        'Unknown',          'Mercenary',          0, 'Alive',       'M'),
    (5,'Red Hood',    'Jason Todd',       'Unknown',           83, 'Resurrected', 'M'),
    (6,'HellBlazer',  'Jonh Constantine', 'Occult Detective', 131, 'Dead',        'M'),
    (7,'Catwoman',    'Selena Kyle',      'Vigilante',          0, 'Dead',        'F');


CREATE TABLE IF NOT EXISTS COMICS 
(
	Title               VARCHAR(128) PRIMARY KEY NOT NULL,
	Issue               VARCHAR(128) NOT NULL,
	ReleaseYear         INT          NOT NULL
    
);

INSERT INTO 
    COMICS(ReleaseYear,Issue,Title)
VALUES
    (1940, '#1',   'Batman #1'),
    (1941, '#58',  'Detective Comics #58'),
    (1966, '#181', 'Batman #181'),
    (1982, '#37',  'The Saga of The Swamp Thing #37'),
    (1983, '#357', 'Batman #357'),
    (1993, '#1',   'Batman: Vengeance of Bane #1'),
    (1993, '#12' , 'Batman Adventures #12'),
    (1959, '#25',  'The Brave and the Bold #25'),
    (2010, '#1',   'Gotham City Sirens #1'),
    (1968, '#1',   'Secret Six #1'),
    (1976, '#1',   'Secret Society of Super Villains #1'),
    (1979, '#481', 'Detective Comics #481'),
    (2010, '#16',  'Batman and Robin #16'),
    (1968, '#215', 'Strange Adventures #215'),
    (1957, '#6',   'Showcase #6'),
    (1998, '#1',   'Young Justice: The Secret #1'),
    (2011, '#1',   'Red Hood and the Outlaws #1'), 
    (1974, '#258', 'Batman #258'),
    (2000, '#1',   'Silver Age: Showcase #1'),
    (1996, '#1',   'Black Canary/Oracle: Birds of Prey #1'),
    (2008, '#29',  'Its All In The Cards; Not On My Watch #29'),
    (1972, '#6',   'Mister Miracle #6'),
    (2013, '#4',   'Injustice: Gods Among Us #4'),
    (1960, '#28',  'The Brave and the Bold #28'),
    (2009, '#1',   'Batman: Battle for the Cowl #1 - A Hostile Takeover'),
    (1974, '#439', 'Detective Comics #439 - Night of the Stalker'),
    (1983, '#200', 'The Brave and the Bold #200'),
    (2014, '#1',   'Injustice: Gods Among Us: Year Two #1'),
    (1996, '#2',   'Kingdom Come #2'),
    (2014, '#0',   'Justice League United #0'),
    (2001, '#1',   'Justice Leagues: Justice League of Atlantis #1'),
    (1964, '#54',  'The Brave and the Bold #54'),
    (1995, '#683', 'Detective Comics #683'),
    (1976, '#1',   'Super Friends #1'),
    (2018, '#1',   'Justice League vol. 4 #1'),
    (1974, '#111', 'Justice League of America #111'), 
    (1971, '#246', 'Superman vol. 1 #246'),
    (1988, '#1',   'Hellblazer #1'),
    (1986, '#1',   'The Dark Knight Returns #1'),
    (1968, '#176', 'Worlds Finest Comics" #176');

CREATE TABLE IF NOT EXISTS CREATED_IN   
(
    CharId         INT          NOT NULL,
    FirstComic     VARCHAR(128) NOT NULL,
        
    PRIMARY KEY(CharId, FirstComic),
    FOREIGN KEY(CharId)     REFERENCES CHARACTERS(CharId) ON DELETE CASCADE,
    FOREIGN KEY(FirstComic) REFERENCES COMICS(Title)      ON DELETE CASCADE
);

INSERT INTO 
    CREATED_IN(CharId,FirstComic)
VALUES
    (1,'Batman Adventures #12'),
    (2,'Batman #181'),
    (3,'Detective Comics #58'),
    (4,'Batman: Vengeance of Bane #1'),
    (5,'Batman #357'),
    (6,'The Saga of The Swamp Thing #37'),
    (7,'Batman #1');

CREATE TABLE IF NOT EXISTS MOVIES  
(
    MovieId            INT PRIMARY KEY NOT NULL,
    Title              VARCHAR(128)    NOT NULL,
    Director           VARCHAR(128)    NOT NULL,
    ReleaseYear        INT(11)         NOT NULL
);

INSERT INTO 
    MOVIES(MovieId,Title,Director,ReleaseYear)
VALUES
    (1,  'Suicide Squad',                       'David Ayer',                    2016),
    (2,  'Batman & Robin',                      'Joel Schumacher',               1997),
    (3,  'Batman Returns',                      'Tim Burton',                    1992),
    (4,  'Constantine',                         'Francis Lawrence',              2005),
    (5,  'Catwoman',                            'Jean-Christophe "Pitof" Comar', 2004),
    (6,  'The Dark Knight Rises',               'Christopher Nolan',             2012),
    (7,  'Birds of Prey',                       'Cathy Yan',                     2020),
    (8,  'Batman: The Movie',                   'Leslie H. Martinson',           1966),
    (9,  'Batman v Superman: Dawn of Justice',  'Zack Snyder',                   2016);

CREATE TABLE IF NOT EXISTS HAS   
(
    CharId  INT NOT NULL,
    MovieId INT NOT NULL,
        
    PRIMARY KEY(CharId, MovieId),
    FOREIGN KEY(CharId)  REFERENCES CHARACTERS(CharId) ON DELETE CASCADE,
    FOREIGN KEY(MovieId) REFERENCES MOVIES(MovieId)    ON DELETE CASCADE
);

INSERT INTO 
    HAS(CharId,MovieId)
VALUES
    (1,1), (1,7),
    (2,2),
    (3,8), (3,3),
    (4,2), (4,6),
    (5,9),
    (6,4),
    (7,3), (7,5), (7,6);

CREATE TABLE IF NOT EXISTS TEAMS (
    TeamId INT          NOT NULL,
    Name   VARCHAR(128) NOT NULL,

 PRIMARY KEY(TeamId)
);

INSERT INTO 
    TEAMS(TeamId, Name)
VALUES
    (1,  'Suicide Squad'),
    (2,  'Gotham City Sirens'),
    (3,  'Secret Six'),
    (4,  'Secret Society of Super Villains'), 
    (5,  'Batman Family'),
    (6,  'Batman Inc.'),
    (7,  'League of Assassins'),
    (8,  'Young Justice'),
    (9,  'Challengers'),
    (10, 'The Outlaws'),
    (11, 'Arkham-Asylum Inmates'),
    (12, 'Injustice League'),
    (13, 'Birds of Prey'),
    (14, 'Dark Arkana'),
    (15, 'Female Furies'),
    (16, 'Insurgency'),
    (17, 'Justice League of America'),
    (18, 'The Network'),
    (19, 'Wayne Family'),
    (20, 'Outsiders'),
    (21, 'One-Earth Regime'),
    (22, 'Mankind Liberation Front'),
    (23, 'Justice League United'),
    (24, 'Justice League of Arkham'),
    (25, 'Teen Titans'),
    (26, 'Iceberg Lounge'),
    (27, 'The Society'),
    (28, 'Super Foes'),
    (29, 'Legion of Doom'),
    (30, 'Injustice Gang'),
    (31, 'S.T.A.R. Labs');

CREATE TABLE IF NOT EXISTS PART_OF   
(
    CharId INT NOT NULL,
    TeamId INT NOT NULL,
        
    PRIMARY KEY(CharId, TeamId),
    FOREIGN KEY(CharId)  REFERENCES CHARACTERS(CharId) ON DELETE CASCADE,
    FOREIGN KEY(TeamId)  REFERENCES TEAMS(TeamId)      ON DELETE CASCADE
);

INSERT INTO 
    PART_OF(CharId,TeamId)
VALUES
    (1,1), (1,2),  (1,3),  (1,4),
    (2,1), (2,2),  (2,4),  (2,12), (2,13), (2,30), (2,31),
    (3,1), (3,12), (3,26), (3,27), (3,28),
    (4,1), (4,3),  (4,4),  (4,7),  (4,29),
    (5,5), (5,6),  (5,7),  (5,8),  (5,9),  (5,10), (5,25),
    (7,1), (7,2),  (7,4),  (7,5),  (7,6),  (7,11), (7,12), (7,13), (7,14), (7,15), 
           (7,16), (7,17), (7,18), (7,19), (7,20), (7,21), (7,22), (7,23), (7,24);

CREATE TABLE IF NOT EXISTS ENTERS   
(
    MovieID INT NOT NULL,
    TeamId  INT NOT NULL,
        
    PRIMARY KEY(MovieID, TeamId),
    FOREIGN KEY(MovieID)  REFERENCES MOVIES(MovieID)   ON DELETE CASCADE,
    FOREIGN KEY(TeamId)   REFERENCES TEAMS(TeamId)     ON DELETE CASCADE
);

-- Inventei forte e feio xb
INSERT INTO 
    ENTERS(MovieID,TeamId)
VALUES
    (1,1),
    (2,5), (2,6),
    (3,5), (3,6), (3,19),
    (4,19),
    (5,12),
    (6,5), (6,6),
    (7,13),
    (8,27),
    (9,30);
    
CREATE TABLE IF NOT EXISTS IS_IN  
(
    TeamId      INT          NOT NULL,
    FirstComic  VARCHAR(128) NOT NULL,
        
    PRIMARY KEY(TeamId, FirstComic),
    FOREIGN KEY(TeamId)       REFERENCES TEAMS(TeamId) ON DELETE CASCADE,
    FOREIGN KEY(FirstComic)   REFERENCES COMICS(Title) ON DELETE CASCADE
);

INSERT INTO 
    IS_IN(TeamId,FirstComic)
VALUES
    (1,  'The Brave and the Bold #25'),
    (2,  'Gotham City Sirens #1'),
    (3,  'Secret Six #1'),
    (4,  'Secret Society of Super Villains #1'),
    (5,  'Detective Comics #481'),
    (6,  'Batman and Robin #16'),
    (7,  'Strange Adventures #215'),
    (8,  'Young Justice: The Secret #1'),
    (9,  'Showcase #6'),
    (10, 'Red Hood and the Outlaws #1'),
    (11, 'Batman #258'),
    (12, 'Silver Age: Showcase #1'),
    (13, 'Black Canary/Oracle: Birds of Prey #1'),
    (14, 'Its All In The Cards; Not On My Watch #29'),
    (15, 'Mister Miracle #6'),
    (16, 'Injustice: Gods Among Us #4'),
    (17, 'The Brave and the Bold #28'),
    (18, 'Batman: Battle for the Cowl #1 - A Hostile Takeover'),
    (19, 'Detective Comics #439 - Night of the Stalker'),
    (20, 'The Brave and the Bold #200'),
    (21, 'Injustice: Gods Among Us: Year Two #1'),
    (22, 'Kingdom Come #2'),
    (23, 'Justice League United #0'),
    (24, 'Justice Leagues: Justice League of Atlantis #1'),
    (25, 'The Brave and the Bold #54'),
    (26, 'Detective Comics #683'),
    (27, 'Secret Society of Super Villains #1'),
    (28, 'Super Friends #1'),
    (29, 'Justice League vol. 4 #1'),
    (30, 'Justice League of America #111'),
    (31, 'Superman vol. 1 #246');

CREATE TABLE IF NOT EXISTS INSPIERD_BY  
(
    MovieId INT          NOT NULL,
    Comic   VARCHAR(128) NOT NULL,
        
    PRIMARY KEY(MovieId, Comic),
    FOREIGN KEY(MovieId)   REFERENCES MOVIES(MovieId)  ON DELETE CASCADE,
    FOREIGN KEY(Comic)     REFERENCES COMICS(Title)    ON DELETE CASCADE
);

INSERT INTO 
    INSPIERD_BY(MovieId,Comic)
VALUES
    (1, 'The Brave and the Bold #25'),
    (4, 'Hellblazer #1'),
    (5, 'Batman #1'),
    (6, 'The Dark Knight Returns #1'), 
    (7, 'Black Canary/Oracle: Birds of Prey #1'),
    (8, 'Batman #1'),
    (9, 'Worlds Finest Comics" #176');


