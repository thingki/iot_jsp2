<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Class Insert</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/sign.css" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<body>
<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-4">

  <h2>Class Insert</h2>
  <p>The mystery of language was revealed to me.<br>
   I knew then that "w-a-t-e-r" meant the wonderful cool something that was flowing over my hand.<br>
    That living word awakened my soul, gave it light, joy, set it free!<br>
  </p>            
  <table class="table table-hover">
    <thead>
					<tr>
						<th>반 이름</th>
						<td><input type="text" id="ciName" name="ciName"
							class="form-control" placeholder="이름" autofocus></td>
					</tr>
			
					<tr>
						<th>반 설명</th>
						<td><input type="text" id="ciDesc" name="ciDesc"
							class="form-control" placeholder="반 설명"></td>
					</tr>
					<tr>
						<td colspan="2"> 
							<input class="btn btn-lg btn-secondary btn-block" type="button"
								id="singnBtn" value="Insert" onclick="Insert()">
						</td>
					</tr>
    </tbody>
  </table>
    I think that we should be men first, and subjects afterward.<br>
  It is not desirable to cultivate a respect for the law, so much as for the right. 
  </div>
 </div>
 <div class="col-sm-4">
 </div>
 </body>
<script>
function Insert(){

	var ciName = $("#ciName").val().trim();
	var ciDesc = $("#ciDesc").val().trim();
	
	var param= {ciName:ciName, ciDesc:ciDesc};
	param = "param=" + JSON.stringify(param);
	$.ajax({
		url : '/class/classinsert',
		type : 'post',
		data : param,
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result=="ok"){
				location.href="/view/class/classinsert";
			}
		},
		error:function(xhr,status,error){
			
		}		
	})
}
</script>
</html>