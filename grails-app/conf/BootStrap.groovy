import ch.fritscher.anhecdotes.Role
import ch.fritscher.anhecdotes.User
import ch.fritscher.anhecdotes.UserRole
import ch.fritscher.anhecdotes.Category;

class BootStrap {

	def springSecurityService
	
    def init = { servletContext ->
		if( Role.count() < 2 ||  User.count() < 1  ) {
			def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
			def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
			
			String password = springSecurityService.encodePassword('admin')
			def adminUser = new User(username: 'admin', enabled: true, password: password, email: 'boris.fritscher@unil.ch')
			adminUser.save(flush: true)
			UserRole.create adminUser, adminRole, true
			UserRole.create adminUser, userRole, true
			
			password = springSecurityService.encodePassword('Sup3rS3cr3t')
			def fbUser = new User(username: 'Toi aussi tu as fait HEC Lausanne si...', enabled: true, password: password, email: 'bfritsch@unil.ch')
			fbUser.save(flush: true)
			UserRole.create fbUser, userRole, true
		}  
		
		['Divers', 'Bachelor', 'Master', 'Doctorat', 'Professeur', 'Administratif', 'Loisir'].each{
			if( ! Category.findByName(it)){
				new Category(name: it).save(flush: true)
			}
		}	
		
    }
    def destroy = {
    }
}
