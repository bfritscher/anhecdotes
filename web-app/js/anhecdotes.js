$(document).ready(function(){
   $("a.vote").click(function(event){
	   var a = $(this);
	   $.ajax({url: a.attr('href'),
		   	  dataType: 'json',
			  success: function(json){
				  if(json.vote){
					  a.parent().prev().find('.a-count').fadeTo(300, 0.0, function(){
						  $(this).text(json.vote)
						  		 .fadeTo(300, 1);  
					  });
				  }
				  var atime = a.parent().find('.a-time');
				  var amsg = a.parent().find('.a-msg');
				  atime.fadeOut(300, function(){
					  amsg.text(json.msg)
				  	   .fadeIn(300, function(){
				  					   setTimeout(function(){
				  						   amsg.fadeOut(300, function(){
				  							  atime.fadeIn(300); 
				  						   });
				  					   }, 3000);
  					   	});
				  });
				  //TODO: display message
			  }
	   });
	   return false;
   });
   $('a.a-add-link').click(function(event){
	   $('#a-add-box').slideToggle(300);
	   
   });
   
 });