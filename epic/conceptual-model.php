<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Data Design Project: Conceptual Model</title>
	</head>
	<body>
		<h1>Conceptual Model</h1>
		<h2>Entities and Attributes</h2>
		<h3>Workspaces</h3>
		<ul>
			<li>workspaceId (primary key)</li>
			<li>workspaceChannelId (foreign key)</li>
			<li>workspaceDirectMessagesId(foreign key)</li>
			<li>workspaceMemberId (foreign key)</li>
			<li>workspaceApps (theoretically would be entity unto itself [therefore foreign key] if entities could be > 4.)</li>
			<li>workspaceThreads (theoretically would be entity unto itself [therefore foreign key] if entities could be > 4.)</li>
		</ul>
		<h3>Members </h3>
		<ul>
			<li>memberId (primary key)</li>
			<li>memberWorkspaceId (foreign key)</li>
			<li>memberDisplayName</li>
			<li>memberEmail</li>
			<li>membersFavoriteCaptain</li>
			<li>membersGitHubProfile</li>
			<li>memberHash</li>
			<li>memberName</li>
			<li>memberOnlineStatus</li>
			<li>memberPhoneNumber</li>
			<li>membersStatus</li>
			<li>memberTimeZone</li>
		</ul>
		<h3>Channels</h3>
		<ul>
			<li>channelId (primary key)</li>
			<li>channelMembersId (foreign key)</li>
			<li>channelWorkspaceId (foreign key)</li>
			<li>channelApps (theoretically would be entity unto itself [therefore foreign key] if entities could be > 4.)</li>
			<li>channelCreatedDetails</li>
			<li>channelHighlights</li>
			<li>channelPinnedItems</li>
			<li>channelPurpose</li>
			<li>channelRelatedChannels (by channelId?)</li>
			<li>channelSharedFiles</li>
			<li>channelTitle</li>
		</ul>
		<h3>Direct Messages</h3>
		<ul>
			<li>directMessagesId (primary key)</li>
			<li>directMessagesUserId (foriegn key)</li>
			<li>directMessagesDateAndTime</li>
			<li>directMessagesTextContent</li>
		</ul>
		<h3>RELATIONSHIPS</h3>
		<ul>
			<li>Workspaces has a many to many relationship with Members and a one to many relationship between Channels and messages. </li>
			<li>Members have a many to many relationship with channels and direct messages.</li>
			<li>There is no relationship between messages and channels.</li>
		</ul>
	</body>
</html>
