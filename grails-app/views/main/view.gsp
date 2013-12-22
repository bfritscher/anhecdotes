
<%@ page import="ch.fritscher.anhecdotes.Anecdote" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="anhecdotes" />
        <g:set var="entityName" value="${message(code: 'anecdote.label', default: 'Anecdote')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    	<g:render template="anecdote" model="['anecdoteInstance':anecdoteInstance]"/>
        <g:each in="${anecdoteInstance.comments}" var="c" status="i">
           <div class="c-box border-color-${i% 3}"><a name="${c.id}" /><sec:ifAnyGranted roles="ROLE_ADMIN">
			<g:link class="a-admin-link" controller="comment" action="edit" id="${c.id}">&Pi;</g:link>
		</sec:ifAnyGranted>${c.content.encodeAsHTML()}</div>
           <div class="c-footer">#<g:link controller="main" action="view" id="${anecdoteInstance.id}" fragment="${c.id}">${c.id}</g:link>
           <my:prettyTime date="${c.lastUpdated}" />
           <g:link class="a-user" controller="profile" action="view" id="${c.user.id}">${c.user.username}</g:link></div>
        </g:each>

           <div id="c-add-box" class="add-box">
    			<h3>Ajouter commentaire</h3>
            	<sec:ifLoggedIn>
	            	<g:form controller="main" action="saveComment" >
	            		<g:hiddenField name="anecdote.id" value="${anecdoteInstance.id}" />
		            	<div>
							<g:textArea name="content" /><g:submitButton name="create" value="Envoyer" />
						</div>
					</g:form>
                </sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<g:link controller="login" action="auth">se connecter?</g:link>
				</sec:ifNotLoggedIn>	
			</div>           
    </body>
</html>
