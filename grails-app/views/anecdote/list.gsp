
<%@ page import="ch.fritscher.anhecdotes.Anecdote" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anecdote.label', default: 'Anecdote')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'anecdote.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="content" title="${message(code: 'anecdote.content.label', default: 'Content')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'anecdote.status.label', default: 'Status')}" />
                        
                            <g:sortableColumn property="year" title="${message(code: 'anecdote.year.label', default: 'Year')}" />
                        
                            <th><g:message code="anecdote.category.label" default="Category" /></th>
                        
                            <th><g:message code="anecdote.user.label" default="User" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${anecdoteInstanceList}" status="i" var="anecdoteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${anecdoteInstance.id}">${fieldValue(bean: anecdoteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: anecdoteInstance, field: "content")}</td>
                        
                            <td>${fieldValue(bean: anecdoteInstance, field: "status")}</td>
                        
                            <td>${fieldValue(bean: anecdoteInstance, field: "year")}</td>
                        
                            <td>${fieldValue(bean: anecdoteInstance, field: "category")}</td>
                        
                            <td>${fieldValue(bean: anecdoteInstance, field: "user")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${anecdoteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
