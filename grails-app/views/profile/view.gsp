
<%@ page import="ch.fritscher.anhecdotes.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="anhecdotes" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="box">
            <h2>${fieldValue(bean: userInstance, field: "username")}</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.description.label" default="Description" />:</td>
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "description")}</td>
                        </tr>
     
                        <tr class="prop">
                            <td valign="top" class="name">Anhecdotes:</td>
                            
                            <td valign="top" style="text-align: left;" class="value">
							<%userInstance.anecdotes %>
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
        </div>
    </body>
</html>
