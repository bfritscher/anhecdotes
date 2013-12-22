package ch.fritscher.anhecdotes

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource

class ProfileController {
	
	static allowedMethods = [update: "POST"]
	
	def springSecurityService
	def saltSource
	
	 @Secured(['ROLE_USER'])
     def index = { 
		 [userInstance: springSecurityService.currentUser] 
		 
	 }
	
	 def view = {
			 def userInstance = User.get(params.id)
			 if (!userInstance) {
				 flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'Pseudo'), params.id])}"
				 redirect(controller: 'main', action: 'index')
			 }
			 else {
				 [userInstance: userInstance]
			 }
	 } 

	 @Secured(['ROLE_USER'])
	 def update = {
		 
		 //edit
		 
		 //change password?
		 def userInstance = springSecurityService.currentUser
		 if (userInstance) {
			 if (params.version) {
				 def version = params.version.toLong()
				 if (userInstance.version > version) {
					 userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'comment.label', default: 'User')] as Object[], "Another user has updated this Comment while you were editing")
					 render(view: "index", model: [userInstance: userInstance])
					 return
				 }
			 }
			 userInstance.properties['email', 'description'] = params
			 if(params.password != ""){
				 userInstance.properties.password = params
				 String salt = saltSource instanceof NullSaltSource ? null : userInstance.username
				 userInstance.password = springSecurityService.encodePassword(params.password, salt)
			 }
			 if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
				 springSecurityService.reauthenticate userInstance.username
				 flash.message = "Modifications sauvegardées"
				 redirect(action: "index")
			 }
			 else {
				 render(view: "index", model: [userInstance: userInstance])
			 }
		 }
		 else {
			 flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'User'), params.id])}"
			 redirect(controller:"main", action: "index")
		 }
		 //redirect(action: "index")
	 }
}
