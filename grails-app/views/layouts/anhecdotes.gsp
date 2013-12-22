<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'anhecdotes.css')}" type="text/css"/>
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="anhecdotes.js" />
        <!--[if !IE 7]>
		<style type="text/css">
			#wrap {display:table;height:100%}
		</style>
		<![endif]-->
		<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-21449470-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
    </head>
    <body>
		<div id="wrap">
			<div id="main">
				<div id="header">
					<div class="content">
						<div class="col1">
							<h1 class="logo">an</h1>
							<div class="menu">
								<g:link controller="main" action="index">Accueil</g:link>
							</div>
						</div>
						<div class="col2">
							<h1 class="logo">hec</h1>
							<div class="menu">
								<br />
								<br />
							</div>
						</div>
						<div class="col3">
							<h1 class="logo">dotes</h1>
							<div class="menu">
								<g:link controller="main" action="latest">Dernier ajouts</g:link>
								<g:link controller="main" action="top">Top</g:link>
					    		<a href="#" class="a-add-link">Ajoutez</a>
					    		<g:link controller="login" action="auth">Mon compte</g:link>
							</div>
						</div>
			    	</div>
			    	<br class="clear"/>
			    </div>
		    	<div id="main-content" class="content">
		    		<div id="right-content">
						<sec:ifLoggedIn>
							<h3><sec:username/></h3>
							<g:link controller="logout" action="index">Déconnecter</g:link>
							<sec:ifAnyGranted roles="ROLE_ADMIN">
							<br />
							<g:link controller="facebook" action="parse">Facebook parse</g:link>
							<br />
							<g:link controller="user">Springsecurity UI</g:link>
							<br />
							<g:link controller="admin">controllers</g:link>
							</sec:ifAnyGranted>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
							<g:link action='index' controller='register' ><g:message code='spring.security.ui.login.register'/></g:link><br />
							<g:link controller="login" action="auth">Se connecter</g:link>
						</sec:ifNotLoggedIn>
						<div id="logos">
							<p>ce site n'est pas affilié à</p>
		    			 	<p><a href="http://hec.unil.ch"><img src="${resource(dir:'images',file:'hec.png')}"/></a></p>
		    			 	<p><a href="http://www.unil.ch/heclausanne100/"><img src="${resource(dir:'images',file:'hec100.png')}"/></a></p>
		    			 	<p><a href="https://www.facebook.com/pages/Toi-aussi-tu-as-fait-HEC-Lausanne-si/252857537799"><img src="${resource(dir:'images',file:'groupfb.png')}"/></a></p>
		    			 </div>
		    		</div>
		    		<div id="left-content">
		    		    <g:if test="${flash.message}">
   							<div class="message">${flash.message}</div>
   						</g:if>
		    		    <div id="a-add-box" class="add-box">
				    		<h2>Ajoutez anhecdote</h2>
				            <g:form controller="main" action="saveNote" >
				            	<div>
									<g:textArea name="content" /><g:submitButton name="create" value="Envoyer" />
								</div>
				                <div id="a-add-box-bottom">
				                (facultatif) 
				                <label for="year"><g:message code="anecdote.year.label" default="année" />:</label>
				                    <g:textField name="year"  />
				                <label for="category"><g:message code="anecdote.category.label" default="catégorie" />:</label>
				                     <g:select name="category.id" from="${ch.fritscher.anhecdotes.Category.list()}" optionKey="id" noSelection="['null': '']" />
				                utilisateur: 
				                <sec:ifLoggedIn>
				                	<sec:username/>
				                </sec:ifLoggedIn>
								<sec:ifNotLoggedIn>
									<g:link controller="login" action="auth">se connecter?</g:link>
								</sec:ifNotLoggedIn>
				                </div>	
				            </g:form>
    					</div>
        				<g:layoutBody />
        				<s2ui:showFlash/>
        			</div>
        		</div>
			</div>
		</div>
		<div id="footer">
			<div class="content">
				<div class="col1">
					<div class="menu">
						<g:link controller="main" action="index">Accueil</g:link>
					</div>
				</div>
				<div class="col2">
					<div class="menu">
						<br />
					</div>
				</div>
				<div class="col3">
					<div class="menu">
						<g:link controller="main" action="latest">Dernier ajouts</g:link>
						<g:link controller="main" action="top">Top</g:link>
			    		<a href="#" class="a-add-link">Ajoutez</a>
			    		<g:link controller="login" action="auth">Mon compte</g:link>
			   			<g:link controller="main" action="about">A propos</g:link>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">var addthis_config = {"data_track_clickback":true};</script>
		<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=anhecdotes"></script>
    </body>
</html>