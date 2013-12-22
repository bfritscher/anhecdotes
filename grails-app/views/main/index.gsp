<%@ page import="ch.fritscher.anhecdotes.Anecdote" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="anhecdotes" />
        <feed:meta kind="rss" version="2.0" controller="feed" action="${params.action}" />
        <title>an|hec|dotes</title>
    </head>
    <body>
		<g:each in="${anecdoteInstanceList}" status="i" var="anecdoteInstance">
			<g:render template="anecdote" model="['anecdoteInstance':Anecdote.rowToAnecdote(anecdoteInstance)]"/>
		</g:each>
		<div class="paginateButtons">
 			<g:paginate total="${anecdoteInstanceTotal}" />
 		</div>
    </body>
</html>