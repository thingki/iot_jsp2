<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginMenu = "Login";
String loginUrl = rootPath + "/view/user/login";
if(user!=null){
	loginMenu = "Logout";
	loginUrl = rootPath + "/user/logout";
}
%>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="/ui/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/ui/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' 
    rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="/ui/css/clean-blog.min.css" rel="stylesheet">

<script src="<%=rootPath%>/ui/js/jquery-3.2.1.js"></script>
<script src="<%=rootPath%>/ui/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=rootPath%>/ui/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=rootPath%>/ui/css/common.css">
   <!-- Page Header -->
    <header class="masthead" style="background-image: url('/ui/img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>IOT TEST</h1>
              <span class="subheading">2018년 1월!!</span>
            </div>
          </div>
        </div>
      </div>
    </header>
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" style="color : black" href="<%=rootPath%>/">IOT TEST</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" 
        data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" 
        aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive" >
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" style="color : black" href="<%=rootPath%>/">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="color : black" href="<%=loginUrl%>"><%=loginMenu%></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="color : black" href="<%=rootPath%>/view/user/list">User List</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="color : black" href="contact.html">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

 
    