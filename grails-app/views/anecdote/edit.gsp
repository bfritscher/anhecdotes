

<%@ page import="ch.fritscher.anhecdotes.Anecdote" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anecdote.label', default: 'Anecdote')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${anecdoteInstance}">
            <div class="errors">
                <g:renderErrors bean="${anecdoteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${anecdoteInstance?.id}" />
                <g:hiddenField name="version" value="${anecdoteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="content"><g:message code="anecdote.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anecdoteInstance, field: 'content', 'errors')}">
                                    <g:textField name="content" value="${anecdoteInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="anecdote.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anecdoteInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${ch.fritscher.anhecdotes.ItemStatus?.values()}" keys="${ch.fritscher.anhecdotes.ItemStatus?.values()*.name()}" value="${anecdoteInstance?.status?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="year"><g:message code="anecdote.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anecdoteInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${fieldValue(bean: anecdoteInstance, field: 'year')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="category"><g:message code="anecdote.category.label" default="Category" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anecdoteInstance, field: 'category', 'errors')}">
                                    <g:select name="category.id" from="${ch.fritscher.anhecdotes.Category.list()}" optionKey="id" value="${anecdoteInstance?.category?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="anecdote.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anecdoteInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${ch.fritscher.anhecdotes.User.list()}" optionKey="id" value="${anecdoteInstance?.user?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="approver"><g:message code="anecdote.approver.label" default="Approver" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anecdoteInstance, field: 'approver', 'errors')}">
                                    <g:select name="approver.id" from="${ch.fritscher.anhecdotes.User.list()}" optionKey="id" value="${anecdoteInstance?.approver?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comments"><g:message code="anecdote.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anecdoteInstance, field: 'comments', 'errors')}">
                                    <g:select name="comments" from="${ch.fritscher.anhecdotes.Comment.list()}" multiple="yes" optionKey="id" size="5" value="${anecdoteInstance?.comments*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="votes"><g:message code="anecdote.votes.label" default="Votes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: anecdoteInstance, field: 'votes', 'errors')}">
                                    
<ul>
<g:each in="${anecdoteInstance?.votes?}" var="v">
    <li><g:link controller="vote" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="vote" action="create" params="['anecdote.id': anecdoteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vote.label', default: 'Vote')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
