<%
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
<title>My Page</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
    <div class="container">
      <div class="jumbotron starter-template"  style="color:black">

        <h1>My Page</h1>
        <p class="lead">
        User Infomation.
        
        </p>
        <img src=<%=userImg%> width="236" height="200">
        <br><br>
                <div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
        <table class="table table-hover" id='grid1'>
				<thead>
					<tr>
						<th>이름</th>
						<td><%=user.getUiName()%></td>
						<td id='tdName' data-id=updatetext>
						<input type ='text' id='uiName' value='<%=user.getUiName()%>'class="form-control"></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><%=user.getUiAge()%></td>
						<td id='tdAge' data-id=updatetext>
						<input type ='text' id='uiAge' value='<%=user.getUiAge()%>'class="form-control"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><%=user.getUiId()%></td>
						<td id='tdId' data-id=updatetext>
						<input type ='text' id='uiId' value='<%=user.getUiId()%>'class="form-control"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><%=user.getUiPwd()%></td>
						<td id='tdPwd' data-id=updatetext>
						<input type ='text' id='uiPwd' value='<%=user.getUiPwd()%>' class="form-control"></td>
					</tr>
					<tr>
						<th>반</th>
						<td><%=user.getCiName()%></td>
						<td id='tdName' data-id=updatetext>
						<select name="ciNo" id="ciNo" class="form-control" class="form-control">
						</select></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%=user.getAddress()%></td>
						<td id='tdAddress' data-id=updatetext>
						<input type ='text' id='address' value='<%=user.getAddress()%>' class="form-control"></td>
					</tr>
					<tr>
						<td colspan="3"><input class="btn btn-lg btn-block" style="background:#a5a5a5; color:white"
							type="button" id="UpdateBtn" value="Update" onclick="myUpdate()">
						</td>
					</tr>
					<tr>
						<td colspan="3"><input class="btn btn-lg btn-block" style="background:#a5a5a5; color:white"
							type="button" id="UpdateBtn" value="Go UserClass" onclick="window.location.href='<%=rootPath%>/view/user/list'">
						</td>
					</tr>
				</thead>

			</table>
							</div>
				<div class="col-sm-2"></div>
      </div>
    </div><!-- /.container -->

</body>
<script>
function myUpdate(uiNo){
	var isUpdate = confirm("Do you want Update??");
	var uiName = $("#uiName").val().trim();
	var uiAge = $("#uiAge").val().trim();
	var uiId = $("#uiId").val().trim();
	var uiPwd = $("#uiPwd").val().trim();
	var ciNo = $("#ciNo").val().trim();
	var address = $("#address").val().trim();
	var uiNo = <%=user.getUiNo() %>;
	   
	   var param = {uiNo:uiNo, uiName:uiName, uiAge:uiAge, address:address, uiId:uiId, uiPwd:uiPwd, ciNo:ciNo};
	   param = "param=" + JSON.stringify(param);
	   if(isUpdate){
	   $.ajax({
	      url : '/user/myupdate',
	      type : 'post',
	      data : param,
	      dataType:"json",
	      success:function(res){
	         alert(res.msg);
	         if(res.result =="ok"){            
	         }
	      },
	      error:function(xhr,status,error){ 
	      }
	   })
	   }location.reload();
	}

$(document).ready(function(){
	$.ajax({
		url : '/class/classlist',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str = "<option disabled selected value>선택사항</option>";
			for(var ci of list){ 
				str += "<option value='" + ci.ciNo + "'>" + ci.ciName +"</option>";
			}
			//document.getElementById("ciNo").insertAdjacentHTML("beforeend",str);
			$("#ciNo").html(str);
		},
		error:function(xhr,status,error){	
		}
	});
});



</script>
</html>

