class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/profile/$id"{
			 controller = "profile"
			 action = "view"
			 constraints {
				 id matches:/\d/
			 }
		}
		"/$id"{
			controller = "main"
			action = "view"
			constraints {
				id matches:/\d/+
			}
		}
		"/$action"{
			controller = 'main'
			constraints {
				//action inList: ['latest', 'top', 'about', 'voteplus', 'voteminus', 'savenote']
			}
		}
		"/"{
			controller = 'main'
			action:"index"
		}
		"500"{
			view = '/error'
		}
	}
}
