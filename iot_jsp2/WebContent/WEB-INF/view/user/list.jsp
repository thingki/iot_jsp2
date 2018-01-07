<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저리스트</title>

 <!-- Bootstrap Core CSS -->
    <link href="/ui/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/ui/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/ui/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/ui/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/ui/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/ui/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jsp" flush="false" />
<br>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>나이</th>
                                        <th>ID</th>
                                        <th>가입일자</th>
                                        <th>주소</th>
                                        <th class="text-center"><em class="glyphicon glyphicon-asterisk"></em></th>
                                    </tr>
                                </thead>
                                <tbody id="result_tb">
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <div class="well">
                                <h4>DataTables Usage Information</h4>
                                <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
</body>
<script>
$(document).ready(function(){
	$.ajax({
		url : '/user/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str ="";
			for(var uc of list){
				str += "<tr class="odd gradeX">";
				str += "<td class='text-center'>" + uc.uiNo + "</td>";
				str += "<td class='text-center'>" + uc.uiName + "</td>";
				str += "<td class='text-center'>" + uc.uiAge + "</td>";
				str += "<td class='text-center'>" + uc.uiId + "</td>";
				str += "<td class='text-center'>" + uc.uiRegdate + "</td>";
				str += "<td class='text-center'>" + uc.address + "</td>";
				str += '<td align="center">';
				str += '<a class="btn btn-default"><em class="glyphicon glyphicon-refresh"></em></a>';
				str += '<a class="btn btn-danger"><em class="glyphicon glyphicon-trash"></em></a>';
				str += '</td>';
			}
			$("#result_tb").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});
</script>
</html>