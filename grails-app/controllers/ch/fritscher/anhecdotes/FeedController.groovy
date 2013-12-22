package ch.fritscher.anhecdotes

class FeedController {

    def index = { 
		renderRss("Index")
	}
	
	def latest = {
		renderRss("Dernières")
	}
	
	def top = {
		renderRss("Top")
	}
	
	private def renderRss(String desc){
		render(feedType:"rss", feedVersion:"2.0") {
			title = "an|hec|dotes"
			link = g.createLink(controller: 'feed', action:'latest')
			description = desc
			Anecdote.listVotes(params).each() { row ->
				def e = Anecdote.rowToAnecdote(row)
				entry(e.id) {
					link = g.createLink(controller:'main', action:'view', id:e.id, absolute:true)
					publishedDate = e.dateCreated
					e.content
					
				}
			}
		}
	}
	
}
