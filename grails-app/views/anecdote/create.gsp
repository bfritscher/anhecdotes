

<%@ page import="ch.fritscher.anhecdotes.Anecdote" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anecdote.label', default: 'Anecdote')}" />
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
            <g:hasErrors bean="${anecdoteInstance}">
            <div class="errors">
                <g:renderErrors bean="${anecdoteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
