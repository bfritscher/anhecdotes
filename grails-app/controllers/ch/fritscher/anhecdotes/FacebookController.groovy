package ch.fritscher.anhecdotes

import ch.fritscher.anhecdotes.facebook.Profile

import com.google.code.facebookapi.*
import org.json.JSONObject

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class FacebookController {

    def parse = { 
		def api_key = '0eb06f9b94d97e8890e21e4f08f11c9f'
		def secret = '7e6b911c578fb7fd6ae22f277871cab6'
		//	println userClient.auth_getSession('4NW2QF')
		//	keycode '4NW2QF'
		//	infinite session a7f074cffc78ea8080136850-548516054
		
		
		IFacebookRestClient api = new FacebookJsonRestClient(api_key, secret, 'a7f074cffc78ea8080136850-548516054')
		def page = null
		while(page == null){
			try{
				page = api.fql_query("SELECT name, public_transit, fan_count FROM page WHERE page_id = 252857537799")
			}catch(java.io.IOException ex){
				page = null
			}
		}
		def public_transit = page.get(0).get('public_transit')

		def fbUser = User.findByUsername("Toi aussi tu as fait HEC Lausanne si...")
		def parseTotal = 0
		def newImportCount = 0
		def newImportNbs = ""
		public_transit.split("\n\n").each{
			def matcher = it =~ /^([0-9]+)\) (.*)/
			if(matcher.matches()){
				parseTotal++
				def content = matcher[0][2]
				if( !Anecdote.findByContent(content) ){
					new Anecdote(content: content, status: ItemStatus.UNAPPROVED, user: fbUser).save(flush: true)
					newImportCount++
					newImportNbs += " ${matcher[0][1]}"
				} 
			}
		}
		
		render "Parsed ${parseTotal} elements, imported ${newImportCount} new: ${newImportNbs}"
		/*
		def fan_count = page.get(0).get('fan_count')
		def stream = null
		def users = null
		while(stream == null && users == null){
			try{
				stream = api.fql_query("SELECT post_id, actor_id, target_id, message, updated_time, comments, likes  FROM stream WHERE  source_id = 252857537799")
				users = api.fql_query("SELECT id, name, username, url, pic_square FROM profile WHERE id IN (SELECT actor_id FROM stream WHERE source_id = 252857537799)")
			}catch(java.io.IOException ex){
				stream = null
				users = null
				println ex
			}
		}
		def profiles = [:]
		for(i in 0..users.length()-1){
			def profile = new Profile()
			JSONObject obj = users.get(i)
			obj.keys().each{ key ->
				profile."${key}" = obj.get(key)
			}
			profiles[users.get(i).get('id')] = profile
		}
		
		[public_transit: public_transit, fan_count: fan_count, sream: stream, profiles: profiles]
		*/
	}
}
