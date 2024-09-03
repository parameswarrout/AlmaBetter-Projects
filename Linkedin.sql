-- 1. User Entity
CREATE TABLE Users (
	UserID SERIAL PRIMARY KEY,
	Username VARCHAR(50) NOT NULL UNIQUE,
	Email VARCHAR(100) NOT NULL UNIQUE,
	Full_Name VARCHAR(100),
	Headline VARCHAR(255),
	Profile_Picture_URL VARCHAR(255),
	Location VARCHAR(100),
	Summary TEXT,
	Registration_Date DATE NOT NULL
);

-- 2. Connection Entity

CREATE TABLE Connections (
    ConnectionID SERIAL PRIMARY KEY,
    UserID1 INT NOT NULL,
    UserID2 INT NOT NULL,
    Connection_Date DATE NOT NULL,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (UserID2) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- 3. Post Entity

CREATE TABLE Posts (
    PostID SERIAL PRIMARY KEY,
    UserID INT NOT NULL,
    Content TEXT,
    Media_URL VARCHAR(255),
    Post_Date DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- 4. Comment Entity

CREATE TABLE Comments (
    CommentID SERIAL PRIMARY KEY,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    Text TEXT NOT NULL,
    Comment_Date DATE NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- 5. Skill Entity

CREATE TABLE Skills (
    SkillID SERIAL PRIMARY KEY,
    Skill_Name VARCHAR(100) NOT NULL UNIQUE
);

-- 6. UserSkill Entity

CREATE TABLE UserSkills (
    UserSkillID SERIAL PRIMARY KEY,
    UserID INT NOT NULL,
    SkillID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (SkillID) REFERENCES Skills(SkillID) ON DELETE CASCADE
);

-- 7. Endorsement Entity

CREATE TABLE Endorsements (
    EndorsementID SERIAL PRIMARY KEY,
    EndorserID INT NOT NULL,
    EndorseeID INT NOT NULL,
    SkillID INT NOT NULL,
    Endorsement_Date DATE NOT NULL,
    FOREIGN KEY (EndorserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (EndorseeID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (SkillID) REFERENCES Skills(SkillID) ON DELETE CASCADE
);

-- 8. Job Entity
CREATE TABLE Jobs (
    JobID SERIAL PRIMARY KEY,
    CompanyID INT NOT NULL,
    Job_Title VARCHAR(100),
    Job_Description TEXT,
    Location VARCHAR(100),
    Post_Date DATE NOT NULL
);

-- 9. Application Entity

CREATE TABLE Applications (
    ApplicationID SERIAL PRIMARY KEY,
    JobID INT NOT NULL,
    UserID INT NOT NULL,
    Application_Date DATE NOT NULL,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- 10. Message Entity

CREATE TABLE Messages (
    MessageID SERIAL PRIMARY KEY,
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    Message_Text TEXT NOT NULL,
    Message_Date DATE NOT NULL,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID) ON DELETE CASCADE
);
