table CHARACTERS(
_ CharId _ int,
Alias varchar,
Name varchar,
Occupation varchar,
ConfirmedKills varchar,
Gender enum,
Status enum
)

table MOVIES(
_ MovieId _ int,
Title  varchar, 
Director varchar,
ReleaseYear int
)

table COMICS(
_ Title _ varchar, 
Creator varchar,
ReleaseYear int
)

table TEAMS(
_ TeamId _ int,
Name varchar 
)

table CREATED_IN(
_ CharId _ int --> CHARACTERS.CharId,
_ FirstComic _ varchar --> COMICS.Title
)

table HAS(
_ CharId _ int --> CHARACTERS.CharId,
_ MovieId _  int --> MOVIES.MovieId
)

table PART_OF(
_ CharId _ int --> CHARACTERS.CharId,
_ TeamId _ int --> TEAMS.TeamId
)

table ENTERS(
_ MovieId _ int --> MOVIES.MovieId,
_ TeamId _ int --> TEAMS.TeamId
)

table IS_IN(
_ TeamId _ int --> TEAMS.TeamId,
FirstComic varchar --> COMICS.Title
)

table INSPIRED_BY(
_ MovieId _ int --> MOVIES.MovieId,
_ Comic _ varchar --> COMICS.Title
)
