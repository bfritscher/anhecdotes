package ch.fritscher.anhecdotes

import grails.converters.JSON

class ApiController {

    def index = { 
		renderJson()
	}
	
	def latest = {
		renderJson()
	}
	
	def top = {
		renderJson()
	}
	
	private def renderJson(String desc){
		render Anecdote.listVotes(params).collect { row ->
				Anecdote.rowToAnecdote(row)
			} as JSON
	}
}
