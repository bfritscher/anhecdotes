<div class="a-box">
	<div class="a-main">
		<g:link action="view" id="${anecdoteInstance.id}" class="a-count color-${anecdoteInstance.id % 3}">${anecdoteInstance.votesTotal ?: 0}</g:link>
		<div class="a-content"><sec:ifAnyGranted roles="ROLE_ADMIN">
			<g:link class="a-admin-link" controller="anecdote" action="edit" id="${anecdoteInstance.id}">&Pi;</g:link>
		</sec:ifAnyGranted>${anecdoteInstance.content.encodeAsHTML()}</div>
		<br class="lclear"/>
		<div class="a-more"><a class="addthis_counter addthis_pill_style"></a> ${anecdoteInstance?.category?.name} ${anecdoteInstance.year}</div>
	</div>
	<div class="a-footer">#<g:link action="view" id="${anecdoteInstance.id}">${anecdoteInstance.id}</g:link>
		votez <g:link controller="main" action="voteplus" id="${anecdoteInstance.id}" class="vote">[+]</g:link> | <g:link controller="main" action="voteminus" id="${anecdoteInstance.id}" class="vote">[-]</g:link>
		<span class="a-time"><my:prettyTime date="${anecdoteInstance.dateCreated}" /></span>
		<span class="a-msg"></span>
		<g:if test="${anecdoteInstance?.user?.id}">
			<g:link controller="profile" action="view" id="${anecdoteInstance.user.id}" class="a-user">${anecdoteInstance.user.username}</g:link>
		</g:if>
		<g:else>
			<span class="a-user">anonyme</span>
		</g:else>
	</div>
</div>
