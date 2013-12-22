package ch.fritscher.anhecdotes
class Vote {
	Integer value
	String ip
	Date dateCreated
	
	static belongsTo = [user: User, anecdote: Anecdote]
	
    static constraints = {
		value blank: false, inList: [-1, 1]
		ip nullable: true
		user nullable: true
    }
}
