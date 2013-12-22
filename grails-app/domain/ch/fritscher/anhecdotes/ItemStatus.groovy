package ch.fritscher.anhecdotes

enum ItemStatus {
	UNAPPROVED('Unapproved'),
	APPROVED('Approved'),
	FLAGGED('Flagged'),
	SPAM('Spam'),
	HIDDEN('Hidden')
	
	String name
	
	ItemStatus (String name) {
		this.name = name
	}
	
	static list() {
		[UNAPPROVED, APPROVED, FLAGGED, SPAM, HIDDEN]
	}
	
}