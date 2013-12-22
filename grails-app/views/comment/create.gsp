

<%@ page import="ch.fritscher.anhecdotes.Comment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commentInstance}">
            <div class="errors">
                <g:renderErrors bean="${commentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content"><g:message code="comment.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'content', 'errors')}">
                                    <g:textArea name="content" cols="40" rows="5" value="${commentInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="anecdote"><g:message code="comment.anecdote.label" default="Anecdote" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'anecdote', 'errors')}">
                                    <g:select name="anecdote.id" from="${ch.fritscher.anhecdotes.Anecdote.list()}" optionKey="id" value="${commentInstance?.anecdote?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="comment.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${ch.fritscher.anhecdotes.ItemStatus?.values()}" keys="${ch.fritscher.anhecdotes.ItemStatus?.values()*.name()}" value="${commentInstance?.status?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="comment.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${ch.fritscher.anhecdotes.User.list()}" optionKey="id" value="${commentInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
