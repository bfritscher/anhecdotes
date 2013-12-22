package ch.fritscher.anhecdotes

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
class MainController {

	def springSecurityService
	
	static allowedMethods = [saveComment: 'POST', saveNote: 'POST']
	
    def index = {
		render view: 'index', model: [anecdoteInstanceList: Anecdote.listVotes(params), anecdoteInstanceTotal: Anecdote.listVotesTotal(params)]
	}
	
	def latest = {
		render view: 'index', model: [anecdoteInstanceList: Anecdote.listVotes(params), anecdoteInstanceTotal: Anecdote.listVotesTotal(params)]
	}

	def top = {
		render view: 'index', model: [anecdoteInstanceList: Anecdote.listVotes(params), anecdoteInstanceTotal: Anecdote.listVotesTotal(params)]
	}
	

	//single view mode with comments
	def view = {
        def anecdoteInstance = Anecdote.get(params.id)
        if (!anecdoteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), params.id])}"
            redirect(action: "index")
        }
        else {
            [anecdoteInstance: anecdoteInstance]
        }
	}
	
	def about = {
		
	}
	
	def voteplus = {
		render parseVote(1) as JSON
	}
	
	def voteminus = {
		render parseVote(-1) as JSON
	}
	
	private parseVote(Integer value){
		def vote = saveVote(value)
		def msg = "déjà voté!"
		if(vote){
			msg = "merci!" 		
		}
		return [msg:msg, vote:vote]
	}
	
	private saveVote(Integer value){
		def anecdote = Anecdote.get(params.id)
		if (springSecurityService.isLoggedIn()) {
			//already voted?
			if(Vote.findByUserAndAnecdote(springSecurityService.currentUser, anecdote)){
				return null
			}
		} else{
			
			if(Vote.findByIpAndAnecdote(request.getHeader("X-Forwarded-For"), anecdote)){
				return null
			}
		}
		new Vote(value:value, ip: request.getHeader("X-Forwarded-For"), user:springSecurityService.currentUser, anecdote:anecdote).save(flush:true)
		return anecdote.getVotesTotal(true)
			
	}
	
	//save new or update an
	def saveNote = {
		params.year = params.int('year')  
		params.user = springSecurityService.currentUser
		def anecdoteInstance = new Anecdote(params)
		if (anecdoteInstance.save(flush: true)) {
			redirect(action: "view", id: anecdoteInstance.id)
		}
		else {
			flash.message = "Erreur lors de l'enregistrement! le texte doit faire plus de 10 caractères."
			redirect(action: "index")
		}
	}
	
	@Secured(['ROLE_USER'])
	def saveComment ={
			params.user = springSecurityService.currentUser
			def commentInstance = new Comment(params)
			commentInstance.save(flush: true)
			redirect(action: "view", id: params.anecdote.id)
	}
	
	//save new or update comment
	def akismetService
	/*
	ipAddress (required)	IP address of the comment submitter.
userAgent (required)	User agent information.
referrer	The content of the HTTP_REFERER header should be sent here.
permalink	The permanent location of the entry the comment was submitted to.
commentType	May be blank, comment, trackback, pingback, or a made up value like "registration".
commentAuthor	Submitted name with the comment
commentAuthorEmail	Submitted email address
commentAuthorUrl	Commenter URL.
commentContent	The content that was submitted.
*/
	//if (!akismetService.isSpam(request.remoteAddr, request.getHeader('User-Agent'), request.getHeader('Referer'), 
               //"http://www.dummy.com", "comment", comment.name, comment.emailAddress, comment.website, comment.text))

}
