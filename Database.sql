CREATE TABLE CricketMatch (
    match_id INT PRIMARY KEY,
    date DATE,
    venue VARCHAR(255)
);

CREATE TABLE Team (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255)
);

CREATE TABLE Player (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE Inning (
    inning_id INT PRIMARY KEY,
    match_id INT,
    batting_team_id INT,
    bowling_team_id INT,
    FOREIGN KEY (match_id) REFERENCES CricketMatch(match_id),
    FOREIGN KEY (batting_team_id) REFERENCES Team(team_id),
    FOREIGN KEY (bowling_team_id) REFERENCES Team(team_id)
);

CREATE TABLE BattingStats (
    batting_stats_id INT PRIMARY KEY,
    inning_id INT,
    player_id INT,
    runs INT,
    balls INT,
    4s INT,
    6s INT,
    FOREIGN KEY (inning_id) REFERENCES Inning(inning_id),
    FOREIGN KEY (player_id) REFERENCES Player(player_id)
);

CREATE TABLE BowlingStats (
    bowling_stats_id INT PRIMARY KEY,
    inning_id INT,
    player_id INT,
    overs DECIMAL(3,1),
    maidens INT,
    runs INT,
    wickets INT,
    FOREIGN KEY (inning_id) REFERENCES Inning(inning_id),
    FOREIGN KEY (player_id) REFERENCES Player(player_id)
);

CREATE TABLE Extras (
    extras_id INT PRIMARY KEY,
    inning_id INT,
    wides INT,
    no_balls INT,
    byes INT,
    leg_byes INT,
    FOREIGN KEY (inning_id) REFERENCES Inning(inning_id)
);

INSERT INTO CricketMatch (match_id, date, venue) VALUES
(1, '2023-01-01', 'Stadium A'),
(2, '2023-01-05', 'Stadium B');

INSERT INTO Team (team_id, team_name) VALUES
(1, 'Team A'),
(2, 'Team B');

INSERT INTO Player (player_id, player_name, team_id) VALUES
(1, 'Player 1', 1),
(2, 'Player 2', 1),
(3, 'Player 3', 2),
(4, 'Player 4', 2);

INSERT INTO Inning (inning_id, match_id, batting_team_id, bowling_team_id) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1);

INSERT INTO BattingStats (batting_stats_id, inning_id, player_id, runs, balls, 4s, 6s) VALUES
(1, 1, 1, 50, 60, 8, 0),
(2, 1, 2, 25, 30, 3, 1),
(3, 2, 3, 40, 45, 5, 2),
(4, 2, 4, 30, 25, 4, 1);

INSERT INTO BowlingStats (bowling_stats_id, inning_id, player_id, overs, maidens, runs, wickets) VALUES
(1, 1, 1, 4.1, 1, 30, 2),
(2, 1, 2, 3.5, 0, 25, 1),
(3, 2, 3, 5.2, 2, 40, 3),
(4, 2, 4, 4.0, 0, 35, 1);

INSERT INTO Extras (extras_id, inning_id, wides, no_balls, byes, leg_byes) VALUES
(1, 1, 5, 2, 3, 1),
(2, 2, 3, 1, 2, 0);
