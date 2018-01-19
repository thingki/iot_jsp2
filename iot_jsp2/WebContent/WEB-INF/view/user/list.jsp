<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User List</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />
<style>
table {
	border-collapse: collapse;
	width: 100%;
}
th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 2px solid #ddd;
}
tr:hover {
	background-color: #f5f5f5;
}
</style>
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	<div class="col-sm-2"></div>
	<div class="col-sm-8" style="color: white">
		<h3>IOT_TEST All User List</h3>
		<p>
			Two cheers for democracy: one because it admit variety and two
			because it permits criticism. <br> Two cheers are quite enough:
			There is no occasion to give three.	
		</p>
		<div class="col-md-10 col-md-offset-1">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					<div class="row">
						<div class="col col-xs-6">
							<h3 style="margin-top: 3px">User List</h3>
						</div>
						<div class="col col-xs-6 text-right">
							<input type="text" class="input">
							<button type="button" class="btn btn-sm btn-success">
								<span class="glyphicon glyphicon-search"></span> Search
							</button>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<table id="grid1" data-key="uiNo" class="table table-hover">
					
						<thead>
							<tr>
								<th class="text-center" data-field="uiNo,ro">번호</th>
								<th class="text-center" data-field="uiName,txt">이름</th>
								<th class="text-center" data-field="uiAge,txt">나이</th>
								<th class="text-center" data-field="uiId,txt">ID</th>
								<th class="text-center" data-field="uiRegdate,ro">회원 가입 일자</th>
								<th class="text-center" data-field="address,txt">주소</th>
								<th class="text-center" data-field="BTN"><em
									class="glyphicon glyphicon-wrench"></em></th>
							</tr>
						</thead>
						<tbody id="result_tb" >
							<c:forEach items="${userList}" var="user">
							<tr>
							<td class='text-center'>
							<input type ='text' id='${user.uiNo}' value="${user.uiNo}" style='text-align:center; height: 25px; width: 130px;'>
							</td>
							<td>
							<input type ='text' id='${user.uiName}' value='${user.uiName}' style='text-align:center; height: 25px; width: 130px;'>
							</td>
							<td class='text-center'>
							<input type ='text' id='${user.uiAge}' value='${user.uiAge}' style='text-align:center; height: 25px; width: 130px;'>
							</td>
							<td class='text-center'>
							<input type ='text' id='${user.uiId}' value='${user.uiId}' style='text-align:center; height: 25px; width: 130px;'>
							</td>
							<td class='text-center'>
							<input type ='text' id='${user.uiRegdate}' value='${user.uiRegdate}' style='text-align:center; height: 25px; width: 130px;'>
							</td>
							<td class='text-center'>
							<input type ='text' id='${user.address}' value='${user.address}' style='text-align:center; height: 25px; width: 130px;'>
							</td>
							<td class='text-center'>
							<a class="btn btn-default" onclick="updateUser(' +key+ ')"><em class="glyphicon glyphicon-scissors"></em></a>
							<a class="btn btn-danger" onclick="deleteUser(' +key+ ')"><em class="glyphicon glyphicon-trash"></em></a>
							</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-2"></div>
	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4" style='color:white'>
			<p>
			Better the last smile than the first laughter.Envy and wrath shorten the life. 
			Faith is a higher faculty than reason.
			 I never think of the future. It comes soon enough. Nature never deceives us; <br>
			 it is always we who deceive ourselves.
		</p>
	</div>
	<div class="col-sm-4"></div>
	</div>
</body>
<script> 
function updateUser(uiNo){
var isUpdate = confirm("Update??");
   var uiName = $("#uiName" + uiNo).val().trim();
   var uiAge = $("#uiAge" + uiNo).val().trim();
   var address = $("#address" + uiNo).val().trim();
   var uiId = $("#uiId" + uiNo).val().trim();
   var param = {uiNo:uiNo, uiName:uiName, uiAge:uiAge, address:address, uiId:uiId};
   param = "param=" + JSON.stringify(param);
   if(isUpdate){
   $.ajax({
      url : '/user/update',
      type : 'post',
      data : param,
      dataType:"json",
      success:function(res){
         alert(res.msg);
         if(res.result =="ok"){
            location.reload();
         }
      },
      error:function(xhr,status,error){ 
      }
   })
   }
}

function deleteUser(uiNo){
   var isDelete = confirm("Really? Delete??");
   var param ="uiNo=" + uiNo;
   if(isDelete){
      $.ajax({
         url : '/user/delete',
         type : 'post',
         data : param,
         dataType:"json",
         success:function(res){
            alert(res.msg);
            if(res.result =="ok"){
               location.reload();
            }
         },
         error:function(xhr,status,error){
         }
      })     
   }
}

/*
var colsInfo= [];      //Array()  요거야
$(document).ready(function(){
   var colList = $("#grid1 th[data-field]"); // #는     id=grid1일때 th[data-field] 값을 가져온다 
   for(var i=0; i<colList.length;i++){
      colsInfo.push(colList[i].getAttribute("data-field"));   //colsInfo[colsInfo.length] 라고 예전에는 권고 사항으로 썻다
   }
   var keyCol = $("#grid1").attr("data-key");    //jquery 라서 attr 쓸수있는거다 
   
   $.ajax({
      url : '/user/list',
      type : 'get',
      success:function(res){
         var list = JSON.parse(res);
         var str ="";
         for(var uc of list){            
            var key =uc[keyCol];
            str +="<tr>";
            for(var field of colsInfo){
               str += "<td class='text-center'>";
               if(field =="BTN"){
                  str += '<a class="btn btn-default" onclick="updateUser(' +key+ ')"><em class="glyphicon glyphicon-scissors"></em></a>';      //버튼생성
                  str += '<a class="btn btn-danger" onclick="deleteUser(' +key+ ')"><em class="glyphicon glyphicon-trash"></em></a>';      
            }else{
               var colName = field.split(",")[0];
               var colType = field.split(",")[1];
            if(colType=="ro"){
               str += uc[colName];
            }else{
               str += "<input type ='text' id='" + colName + key + "' value='" + uc[colName]+ "' style='text-align:center; height: 25px; width: 130px;'>"; 
            }       
               }
               str += "</td>";
            }
            str += "</tr>";
         }
         $("#result_tb").html(str);
      },
      error:function(xhr,status,error){
      }
   });  
});
*/
</script>
</html>