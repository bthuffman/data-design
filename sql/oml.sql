-- insert data into databases
INSERT INTO workspace(workspaceId, workspaceApps, workspaceThreads)
	VALUE (UNHEX("a6f43e6949804a2f83c6cfe5a91cfa96"), "This is an App", "This is a thread");
INSERT INTO member(memberId, memberWorkspaceId, memberDisplayName, memberEmail, memberFavoriteCaptain, memberGitHubProfile, memberHash, memberName, memberOnlineStatus, memberPhoneNumber, memberStatus, memberTimeZone)
	VALUE (UNHEX("3eff76ab76f347d0880f005d4344498a"), UNHEX("a6f43e6949804a2f83c6cfe5a91cfa96"), "This is a display name", "this@email.com", "Captain Janeway", "bthuffman@github.com", "P***WORD", "Member Name", "Online/Offline", "(XXX) XXX-XXXX", "User in Meeting", "2019-01-21 11:00.10");
-- the following insert covers inserting data into a table with a foreign key from the original table.
INSERT INTO directMessage(directMessageId, directMessageWorkspaceId, directMessageMemberId, directMessageDateAndTime, directMessageTextContent)
	VALUE (UNHEX("71cad04774bf46b2852bfc37f2d6b9d0"), UNHEX("a6f43e6949804a2f83c6cfe5a91cfa96"), UNHEX("3eff76ab76f347d0880f005d4344498a"), "2019-01-21 11:08.10", "Hi this is text content!");
INSERT INTO directMessage(directMessageId, directMessageWorkspaceId, directMessageMemberId, directMessageDateAndTime, directMessageTextContent)
	VALUE (UNHEX("f4bbb59857f8496c86672f0b197f7b68"), UNHEX("a6f43e6949804a2f83c6cfe5a91cfa96"), UNHEX("3eff76ab76f347d0880f005d4344498a"), "2019-01-21 11:08.10", "Hi this is more text content!");

-- example of executable select using the primary key for the selector
-- note that select is equivalent to other databases "READ"
SELECT workspaceId, workspaceApps, workspaceThreads
	from workspace workspaceId = UNHEX("a6f43e6949804a2f83c6cfe5a91cfa96");

-- delete the foreign key in directMessage content prior to dropping the member table so that can correct the timezone element within the member table
DELETE FROM directMessage WHERE directMessageId = UNHEX("71cad04774bf46b2852bfc37f2d6b9d0");
-- also required to drop the directMessage table
DROP TABLE directMessage;
-- delete member table so can reconfigure the timezone element.
DROP TABLE member;

-- upadate statement
UPDATE directMessage
	SET directMessageDateAndTime = NOW(), directMessageTextContent = "This is a text content update!"
	WHERE directMessageId = UNHEX("71cad04774bf46b2852bfc37f2d6b9d0");

-- example of a select statement using where and inner-join
SELECT directMessage.directMessageWorkspaceId, member.memberWorkspaceId
	FROM directMessage
	INNER JOIN member ON directMessage.directMessageWorkspaceId = member.memberWorkspaceId
WHERE directMessageTextContent = "Hi this is more text content!";

-- example of a select statement based of off DDC-Twitter that counts the number of likes for a specific tweet. In this
-- case it is counting the number of directMessages with TextContent.
SELECT COUNT(directMessageTextContent) FROM directMessage;
