<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/sign.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />

	<div class="container" style="color: black">
		<div class="starter-template">
			<h2 id="hText2" class="form-signin-heading">Login</h2>
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<form>
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i></span> 
							<input id="userId" type="text" class="form-control" name="userId"
								placeholder="userId" style="width: 310px" autofocus>
						</div>
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-lock"></i></span>
							<input id="userPwd" type="password" class="form-control" name="userPwd"
								placeholder="userPwd" style="width: 310px">
						</div>
						<div class="input-group">
							<span class="input-group-addon text-center">
									<label> <input id="saveId" type="checkbox">Remember Me </label>
							</span></div>

							<div class="input-group">
								<input class="btn btn-lg btn-block" type="button" id="loginBtn"
									style="background: #a5a5a5; color: white; width: 350px"
									value="Login" onclick="checkValue()"> <a
									href="/view/user/signin"><h5>Sign in</h5></a>
							</div>
							<p>
								The test of our progress is not whether we add more to the
								abundance of those who have much; <br> it is whether we
								provide enough for those who have too little.<br> What
								experience and history teach is this - that people and
								government never have learned anything from history,<br> or
								acted on principles deduced from it.<br>
							</p>
					</form>
				</div>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>




</body>


<script>

function checkValue(){
	var userId = $("#userId").val().trim();
	var userPwd = $("#userPwd").val().trim();
	var saveId = $("#saveId").prop("checked");
	
	if(userId.length<3){
		alert("Check UserID, More than 3 letters");
		$("#userId").focus();
		return;
	}
	if(userPwd.length<3){
		alert("Check UserPWD, More than 3 letters");
		$("#userPwd").focus();
		return;
	}
	var param = {uiId:userId, uiPwd:userPwd, saveId:saveId};
	param = "param=" + encodeURIComponent(JSON.stringify(param));
	$.ajax({
		url : '<%=rootPath%>/user/login',
		data : param,
		type :'get',
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.login=="ok"){
				location.href="<%=rootPath%>/";
				}
				if (obj.login == "pwdno") {
					$("#userPwd").focus();
				}
				if (obj.login == "idno") {
					$("#userId").focus();
				}
			}
		})
	}

	function getCookie(cname) {
		var name = cname + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}

	$(document).ready(function() {
		var userId = getCookie("userId");
		var saveId = getCookie("saveId");
		if (userId) {
			$("#userId").val(userId);
			$("#saveId").prop("checked", true);
		}
	});
</script>
</html>