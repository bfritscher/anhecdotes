package ch.fritscher.anhecdotes

class Category {
	String name
	
	static hasMany = [ anecdotes : Anecdote]
	
    static constraints = {
		name blank: false, unique: true
    }
	String toString(){
		return name
	}
}
