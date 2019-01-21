<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Data Design Project: Conceptual Model</title>
	</head>
	<body>
		<h1>Conceptual Model</h1>
		<h2>Entities and Attributes</h2>
		<h3>Workspace</h3>
		<ul>
			<li>workspaceId (primary key)</li>
<!--			The bellow foreign keys are unnecessary because workspace is the origin. Only workspace would need to be a foriegn key in those entities.-->
<!--			<li>workspaceChannelId (foreign key)</li>-->
<!--			<li>workspaceDirectMessagesId(foreign key)</li>-->
<!--			<li>workspaceMemberId (foreign key)</li>-->
			<li>workspaceApps</li>
<!--			(theoretically would be entity unto itself [therefore foreign key] if entities could be > 4.)-->
			<li>workspaceThreads</li>
<!--			(theoretically would be entity unto itself [therefore foreign key] if entities could be > 4.)-->
		</ul>
		<h3>Member </h3>
		<ul>
			<li>memberId (primary key)</li>
			<li>memberWorkspaceId (foreign key)</li>
			<li>memberDisplayName</li>
			<li>memberEmail</li>
			<li>memberFavoriteCaptain</li>
			<li>memberGitHubProfile</li>
			<li>memberHash</li>
			<li>memberName</li>
			<li>memberOnlineStatus</li>
			<li>memberPhoneNumber</li>
			<li>memberStatus</li>
			<li>memberTimeZone</li>
		</ul>
		<!--Elimnated due to complexity-->
		<!--
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
		-->
		<h3>Direct Message</h3>
		<ul>
			<li>directMessageId (primary key)</li>
			<li>directMessageUserId (foriegn key)(multivalued)</li>
			<li>directMessageWorkspaceId (foreign key)</li>
			<li>directMessageDateAndTime</li>
			<li>directMessageTextContent</li>
		</ul>
		<h3>RELATIONSHIPS</h3>
		<ul>
			<li>Workspaces has a many to many relationship with Members and a one to many relationship between Direct Messages. </li>
			<li>Members has a many to many relationship with Direct Messages.</li>
		</ul>
		<h2>Entity Relationship Diagram</h2>
		<img src="erdplus-diagram-chrow.png" alt="Entity Relationship Diagram"/>
	</body>
</html>
