package ch.fritscher.anhecdotes

class Anecdote {
	String content
	ItemStatus status = ItemStatus.UNAPPROVED
	Integer year
	Category category
	User user
	User approver
	
	Date dateCreated
	
	static hasMany = [ votes: Vote, comments: Comment ]
	
	
	Integer votesTotal = null
	static transients = ['votesTotal']
	
    static constraints = {
		content blank: false, minSize: 10, maxSize: 1000
		status nullable: false
		year nullable: true, range: 1900..2100
		category nullable:true
		user nullable:true
		approver nullable:true
    }
	
	Integer getVotesTotal(force = false){
		if(this.id && (force || !this.votesTotal)){
			return Vote.executeQuery("SELECT SUM(v.value) FROM Anecdote a LEFT JOIN a.votes v WHERE a.id = ?", this.id)[0]
		} else {
			return this.votesTotal
		}
	}
	
	static def listVotes(params){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.offset ?: 0

		def page = Anecdote.pageCondition(params)
		
		def anecdoteInstanceList = Anecdote.executeQuery("""SELECT a.id, a.content, a.year, a.dateCreated, c.name, u.id, u.username, SUM(v.value) as votes, a.status
							   FROM Anecdote as a LEFT JOIN a.category as c LEFT JOIN a.user as u LEFT JOIN a.votes as v
							   WHERE a.status = :unapproved OR a.status = :approved
							   GROUP BY a.id, a.content, a.year, a.dateCreated, c.name, u.id, u.username, a.status
							   """ +  (page.clean ? "HAVING SUM(v.value) > 2 ": "") + """
							   ORDER BY """ + page.order,
			[unapproved: ItemStatus.UNAPPROVED, approved: ItemStatus.APPROVED], [max: params.max, offset: params.offset])
	}
	static def listVotesTotal(params){
		def page = Anecdote.pageCondition(params)
		
		def anecdoteInstanceTotal = Anecdote.executeQuery("""SELECT a.id
							   FROM Anecdote as a LEFT JOIN a.category as c LEFT JOIN a.user as u LEFT JOIN a.votes as v
							   WHERE a.status = :unapproved OR a.status = :approved
							   GROUP BY a.id, a.content, a.year, a.dateCreated, c.name, u.id, u.username, a.status
							   """ +  (page.clean ? "HAVING SUM(v.value) > 2 ": ""),
									[unapproved: ItemStatus.UNAPPROVED, approved: ItemStatus.APPROVED])
		anecdoteInstanceTotal.size()
	}
	
	static private pageCondition(params){
		def order = 'a.dateCreated desc'
		def clean = false
		switch (params.action) {
			case 'latest':
				break;
			
			case 'top':
				order = 'sum(v.value) desc'
				break;
				
			case 'index':
			default:
				clean = true
				break;
		}
		[order:order, clean:clean]
	}
	
	static def rowToAnecdote(row){
		[id: row[0],
		 content: row[1],
		 year: row[2],
		 dateCreated: row[3],
		 category: [name: row[4]],
		 user: [id: row[5], username: row[6]],
		 votesTotal: row[7],
		 status: row[8]
		]
	}
}
