package ch.fritscher.anhecdotes

class Comment {

	String content
	ItemStatus status = ItemStatus.UNAPPROVED
	
	static belongsTo = [user: User, anecdote: Anecdote]
	
	Date lastUpdated
	
    static constraints = {
		content blank: false, maxSize: 1000
    }
}
