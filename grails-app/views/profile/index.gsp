
<%@ page import="ch.fritscher.anhecdotes.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="anhecdotes" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="box">
            <h2>${fieldValue(bean: userInstance, field: "username")}</h2>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post">
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <g:hiddenField name="version" value="${userInstance?.version}" />
            <div class="dialog">
                <table>
                    <tbody>    
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                              <label for="description"><g:message code="user.description.label" default="Description" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'description', 'errors')}">
                                <g:textArea name="description" cols="40" rows="5" value="${userInstance?.description}" />
                            </td>
                        </tr>
                                    
                        <tr class="prop">
                            <td valign="top" class="name">
                              <label for="email"><g:message code="user.email.label" default="Email" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                <g:textField name="email" value="${userInstance?.email}" />
                            </td>
                        </tr>
                    

                        
                        <tr class="prop">
                            <td valign="top" class="name">
                              <label for="password"><g:message code="user.password.label" default="Password" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                <g:textField name="password" /> laisser vide pour ne pas changer
                            </td>
                        </tr>
     
                        <tr class="prop">
                            <td valign="top" class="name">Anhecdotes:</td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                             ${userInstance?.anecdotes.size()?: 0}
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.comments.label" default="Commentaires" />:</td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                 ${userInstance?.comments.size()?: 0}
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.votes.label" default="Votes" />:</td>
                            <td valign="top" style="text-align: left;" class="value">
                           		 ${userInstance?.votes.size()?: 0}
                            </td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
              <span class="button"><g:actionSubmit class="save" action="update" value="Mettre à jour" /></span>
          </div>
      </g:form>
        </div>
    </body>
</html>
