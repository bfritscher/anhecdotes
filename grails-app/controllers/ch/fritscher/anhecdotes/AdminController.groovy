package ch.fritscher.anhecdotes
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class AdminController {

    def index = { }
	
	def db = {
		org.hsqldb.util.DatabaseManagerSwing.main(new String[0])
		Thread.sleep 100000
	}
}
