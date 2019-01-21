-- The statement below sets the collation of the database to utf8
-- bhuffman1 is the username assigned in when you configure the mysql database to this file (i.e. the tab to the right in php storm)
ALTER DATABASE bhuffman1 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!! ESSENTIALLY DON'T DO THIS AT YOUR DAY JOB!
DROP TABLE IF EXISTS workspace;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS directMessages;

-- the CREATE TABLE function is a function that takes tons of arguments to layout the table's schema
-- this creates the workspace entity
CREATE TABLE workspace (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	-- table's attributes list:
	workspaceId BINARY(16) NOT NULL,
	workspaceApps VARCHAR(32),
	workspaceThreads VARCHAR(128),
	-- this officiates the primary key for the entity
	PRIMARY KEY(workspaceId)
);

-- create the member entity
CREATE TABLE member (
	-- table's attributes list:
	-- this is for yet another primary key...
	memberId BINARY(16) NOT NULL,
	-- this is for a foreign key
	memberWorkspaceId BINARY(16) NOT NULL,
	memberDisplayName VARCHAR(140) NOT NULL,
	memberEmail VARCHAR(140) NOT NULL,
	memberFavoriteCaptain VARCHAR(140),
	memberGitHubProfile VARCHAR(140),
	memberHash VARCHAR(140) NOT NULL,
	memberName VARCHAR(140) NOT NULL,
	memberOnlineStatus VARCHAR(140),
	memberPhoneNumber VARCHAR(140),
	memberStatus VARCHAR(140),
	memberTimeZone TIMESTAMP NOT NULL ,
	-- this creates an index before making a foreign key
	INDEX(memberWorkspaceId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(memberWorkspaceId) REFERENCES workspace(workspaceId),
	-- and finally create the primary key
	PRIMARY KEY(memberId)
	);

-- create the directMessage entity (a weak entity from an m-to-n from member and a 1-to-n with workspace)
CREATE TABLE directMessage (
	-- table's attributes list:
	directMessageId BINARY(16) NOT NULL,
	directMessageWorkspaceId BINARY(16) NOT NULL,
	directMessageMemberId BINARY(16) NOT NULL,
	directMessageDateAndTime DATETIME(6) NOT NULL,
	directMessageTextContent VARCHAR(2462) NOT NULL,
	-- index the foreign keys
	INDEX(directMessageWorkspaceId),
	INDEX(directMessageMemberId),
	-- create the foreign key relations
	FOREIGN KEY(directMessageWorkspaceId) REFERENCES workspace(workspaceId),
	FOREIGN KEY(directMessageMemberId) REFERENCES member(memberId),
	-- and finally create the primary key
	PRIMARY KEY(directMessageId)
	);