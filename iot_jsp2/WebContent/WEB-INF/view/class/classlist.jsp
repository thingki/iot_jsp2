<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Class List</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	<div class="container" style="color: white">
		<h3>IOT_TEST All Class List</h3>
		<p>
			My own art is a negation of society, <br> an affirmation of the
			individual,<br> outside all rules and demands of society.
		</p>

		<div class="container">
			<div class="panel-body">
				<div class="col-md-10 col-md-offset-1">
					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<div class="row">
								<div class="col col-xs-6">
									<h3 style="margin-top: 3px">Class List</h3>
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
							<table id="grid1" data-key="ciNo" class="table table-hover">
								<thead>
									<tr>
										<th class="text-center" data-field="ciNo,ro">번호</th>
										<th class="text-center" data-field="ciName,txt">클래스 네임</th>
										<th class="text-center" data-field="ciDesc,txt">하는 일</th>
										<th class="text-center" data-field="BTN"><em
											class="glyphicon glyphicon-wrench"></em></th>
									</tr>
								</thead>
								<tbody id="result_tb">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4" style='color:white'>
			<p>
			Love does not consist in gazing at each other, but in looking together in the same direction.
			A great writer is, so to speak, a second government in his country.<br>
			And for that reason no regime has ever loved great writers, only minor ones.
		</p>
	</div>
	<div class="col-sm-4"></div>
	</div>
</body>
<script> 
function updateClass(ciNo){
	var isUpdate = confirm("수정하시겠소??");
   var ciName = $("#ciName" + ciNo).val().trim();
   var ciDesc = $("#ciDesc" + ciNo).val().trim();
   var param = {ciNo:ciNo, ciName:ciName, ciDesc:ciDesc};
   param = "param=" + JSON.stringify(param);
   if(isUpdate){
   $.ajax({
      url : '/class/updateclass',
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
function deleteClass(ciNo){
   var isDelete = confirm("진짜지우게?");
   var param ="ciNo=" + ciNo;
   if(isDelete){
      $.ajax({
         url : '/class/deleteclass',
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

var colsInfo= [];      //Array()  요거야
$(document).ready(function(){
   var colList = $("#grid1 th[data-field]"); // #는     id=grid1일때 th[data-field] 값을 가져온다 
   for(var i=0; i<colList.length;i++){
      colsInfo.push(colList[i].getAttribute("data-field"));   //colsInfo[colsInfo.length] 라고 예전에는 권고 사항으로 썻다
   }
   var keyCol = $("#grid1").attr("data-key");    //jquery 라서 attr 쓸수있는거다 
   
   $.ajax({
      url : '/class/classlist',
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
                  str += '<a class="btn btn-default" onclick="updateClass(' +key+ ')"><em class="glyphicon glyphicon-scissors"></em></a>';      //버튼생성
                  str += '<a class="btn btn-danger" onclick="deleteClass(' +key+ ')"><em class="glyphicon glyphicon-trash"></em></a>';      
            }else{
               var colName = field.split(",")[0];
               var colType = field.split(",")[1];
            if(colType=="ro"){
               str += uc[colName];
            }else{
               str += "<input type ='text' id='" + colName + key + "' value='" + uc[colName]+ "' style='text-align:center'>"; 
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
</script>
</html>