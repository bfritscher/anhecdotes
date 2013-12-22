<%
public_transit.split("\n\n").each{
	def matcher = it =~ /^([0-9]+)\) (.*)/
	if(matcher.matches()){
%>
<div>
<h2>${matcher[0][1]}</h2>
${matcher[0][2]}
</div>
<%			
	}
}
%>

<% 
for(int i=0; i < stream?.length(); i++){
println profiles[stream.get(i).get('actor_id')].name
%>	
	<img src="<%= profiles[stream.get(i).get('actor_id')]?.pic_square %>" />
	
<%	
	println  stream.get(i).get('message')
	println  "likes: " + stream.get(i).get('likes').get('count')
	if (stream.get(i).get('comments').get('count')> 0 && stream.get(i).get('comments').get('comment_list').length() > 0){
		println "<br />comments:"
		for( c in 0..stream.get(i).get('comments').get('comment_list').length()-1){
			def comment = stream.get(i).get('comments').get('comment_list').get(c)
			println comment.get("text") + "<br />"
		}
	}
	println "<hr />"
}
println fan_count
%>