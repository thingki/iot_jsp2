<%
if(user==null){
	//response.sendRedirect("/view/user/login");
}else{
	String userImg="";
	if(user.getUiName().equals("SinkySang")){
		userImg="'/ui/img/sink.png' class='img-circle' alt='Cinque Terre'";
	}else{
		userImg="'/ui/img/user.png'";
	}	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>IOT_TEST</title>
</head>

<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
    <div class="container">
      <div class="starter-template"  style="color:#efe4e4">
      
      
      
        <h1>Welcome</h1>
        <p class="lead">
        Let bygones be bygones.
        </p>
        <img src=<%=userImg%> width="304" height="236">
        <h2><%=user.getUiName()%> was Connected</h2>
        <p class="lead">
        The computer is only a fast idiot; it has no imagination; it cannot originate action.<br>
        It is, and will remain, only a tool of man.
		</p>
		<p>Man with all his noble qualities...with his godlike intellect which has penetrated <br>into the movements and constitution of the solar system...<br>
		still bears in his bodily frame the indelible stamp of his lowly origin.
		</p>
		<h4>We are an intelligent species and the use of our intelligence quite properly gives us pleasure.<br>
		In this respect the brain is like a muscle. When it is in use we feel very good. Understanding is joyous. 
		</h4>
		<p>

		</div>
    </div><!-- /.container -->
<footer class="container-fluid text-center" style='color:#efe4e4'>
<address>
   <strong>Written by HyungSoo Kim</strong><br> 
    Example.com<br>
    Box 564, Disneyland<br>
    USA<br>
  </address>
  
  <span><img src=/ui/img/kakao.png width="35" height="35" class='img-circle' alt='Cinque Terre' style='filter:grayscale(100%)'></span>
  <span><img src=/ui/img/Facebook.png width="35" height="35" class='img-circle' alt='Cinque Terre' style='filter:grayscale(100%)'></span>
  <span><img src=/ui/img/twitter.png width="35" height="35" class='img-circle' alt='Cinque Terre' style='filter:grayscale(100%)'></span>
</footer>
</body>
</html>

<%
}
%>
