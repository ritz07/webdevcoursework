CREATE TABLE users (
  Email varchar(255) PRIMARY KEY,
  Username varchar(255) NOT NULL,
  Hash varchar(255) NOT NULL
);

CREATE TABLE usersbooks (
  ID int PRIMARY KEY AUTO_INCREMENT,
  ReviewID int NOT NULL,
  Email varchar(255) NOT NULL,
  PageID int NOT NULL,
  created_at datetime NOT NULL DEFAULT (now())
);

CREATE TABLE reviews (
  ID int PRIMARY KEY AUTO_INCREMENT,
  ISBN varchar(255) NOT NULL,
  Review varchar(255),
  Rating int DEFAULT 0,
  Visible boolean
);

CREATE TABLE profile (
  Username varchar(255) PRIMARY KEY,
  Bio varchar(255),
  Picture varchar(255),
  created_at datetime DEFAULT (now())
);

CREATE TABLE books (
  ISBN varchar(255) PRIMARY KEY,
  Author varchar(255) NOT NULL,
  Title varchar(255) NOT NULL,
  DateReleased date NOT NULL,
  Description varchar(255) NOT NULL,
  Picture varchar(255)
);

CREATE TABLE author (
  Name varchar(255) PRIMARY KEY,
  DOB date NOT NULL
);

CREATE TABLE pages (
  ID int PRIMARY KEY AUTO_INCREMENT,
  Page int NOT NULL,
  TotalPages int NOT NULL
);

CREATE TABLE comments (
  ID int PRIMARY KEY AUTO_INCREMENT,
  Comment varchar(255)
);

CREATE TABLE posts (
  ID int PRIMARY KEY AUTO_INCREMENT,
  CommentID int NOT NULL,
  ReviewID int NOT NULL,
  created_at datetime DEFAULT (now())
);

ALTER TABLE usersbooks ADD FOREIGN KEY (Email) REFERENCES users (Email);

ALTER TABLE usersbooks ADD FOREIGN KEY (ReviewID) REFERENCES reviews (ID);

ALTER TABLE users ADD FOREIGN KEY (Username) REFERENCES profile (Username);

ALTER TABLE reviews ADD FOREIGN KEY (ISBN) REFERENCES books (ISBN);

ALTER TABLE books ADD FOREIGN KEY (Author) REFERENCES author (Name);

ALTER TABLE usersbooks ADD FOREIGN KEY (PageID) REFERENCES pages (ID);

ALTER TABLE posts ADD FOREIGN KEY (CommentID) REFERENCES comments (ID);

ALTER TABLE posts ADD FOREIGN KEY (ReviewID) REFERENCES reviews (ID);