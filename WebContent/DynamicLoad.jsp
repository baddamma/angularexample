<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dynamic Load</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<div id="results" style="background: #ccc none repeat scroll 0 0;border: 3px solid #666;margin: 5px;padding: 5px;position: relative;width:500px;height: 400px;overflow: auto;" >
<img src="image.png" alt="Loading .." class="animation_image">
</div>



<script>
$(document).ready(function() {

  var track_load = 0; //total loaded record group(s)
  var loading  = false; //to prevents multipal ajax loads
  var total_groups = 10; //total record group(s)
  
  $('#results').load("DynamicContent.jsp", {'page':track_load}, function() {track_load++;}); //load first group
  
  $("#results").bind('scroll', function() { //detect page scroll
      
      if($(this).scrollTop() + $(this).innerHeight() >= this.scrollHeight)  //user scrolled to bottom of the page?
      {
          
          if(track_load <= total_groups && loading==false) //there's more data to load
          {
              loading = true; //prevent further ajax loading
              $('.animation_image').show(); //show loading image
              
              //load data from the server using a HTTP POST request
              $.post('DynamicContent.jsp',{'group_no': track_load}, function(data){
                                  
                  $("#results").append(data); //append received data into the element

                  //hide loading image
                  $('.animation_image').hide(); //hide loading image once data is received
                  
                  track_load++; //loaded group increment
                  loading = false; 
              
              }).fail(function(xhr, ajaxOptions, thrownError) { //any errors?
                  
                  alert(thrownError); //alert with HTTP error
                  $('.animation_image').hide(); //hide loading image
                  loading = false;
              
              });
              
          }
      }
  });
  
});
</script>
</body>
</html>