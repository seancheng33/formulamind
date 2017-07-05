<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Supplier</title>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<script src="lib/jquery.min.js" type="text/javascript"></script>
    <!-- Demo page code -->
    
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>
<!--  -->
 <script src="lib/jquery.edittable.js"></script>
    <script>
        $(function() {
            //$('.edit').handleTable({"cancel" : "<span class='glyphicon glyphicon-remove'></span>"});
            $('.editable').handleTable({
                "handleFirst" : true,
                "cancel" : " <span class='glyphicon glyphicon-remove'></span> ",
                "edit" : " <span class='glyphicon glyphicon-edit'></span> ",
                "add" : " <span class='glyphicon glyphicon-plus'></span> ",
                "save" : " <span class='glyphicon glyphicon-saved'></span> ",
                "confirm" : " <span class='glyphicon glyphicon-ok'></span> ",
                "operatePos" : -1,
                "editableCols" : [2,3,4],
                "order": ["add","edit"],
                "saveCallback" : function(data, isSuccess) { //这里可以写ajax内容，用于保存编辑后的内容
                    //data: 返回的数据
                    //isSucess: 方法，用于保存数据成功后，将可编辑状态变为不可编辑状态
                    var flag = true; //ajax请求成功（保存数据成功），才回调isSuccess函数（修改保存状态为编辑状态）
                    if(flag) {
                        isSuccess();
                        alert(data + " 保存成功");
                    } else {
                        alert(data + " 保存失败");
                    }
                    return true;
                },
                "addCallback" : function(data,isSuccess) {
                    var flag = true;
                    if(flag) {
                        isSuccess();
                        alert(data + " 增加成功");
                    } else {
                        alert(data + " 增加失败");
                    }
                },
                "delCallback" : function(isSuccess) {
                    var flag = true;
                    if(flag) {
                        isSuccess();
                        alert("删除成功");
                    } else {
                        alert("删除失败");
                    }
                }
            });
        });
    </script>
<!--  --> 
 
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="javascripts/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7"> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8"> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9"> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body> 
  <!--<![endif]-->

	<jsp:include page="../header.jsp" />
	<div class="container-fluid">
	<div class="row-fluid">
	<jsp:include page="../left.jsp" />

	<div class="span9">
		<h1 class="page-title">New Product</h1>
		<div class="well">
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane active in" id="home">
					<s:form action="/addSupplier" method="post">
									<div class="btn-toolbar">
					<button type="submit" class="btn btn-primary"> <i class="icon-save"></i>
						Save
					</button> <a href="supplierlist" class="btn">Cancel</a>
					<div class="btn-group"></div>
					<hr>
				</div>
						<table class="table table-hover editable">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Test</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>Operations</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td></td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td><a href="javascript:void(0)"></a></td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td></td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td><a href="javascript:void(0)"></a></td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td></td>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                    <td><a href="javascript:void(0)"></a></td>
                </tr>
                </tbody>
            </table>
					</s:form>
				</div>
			</div>
		</div>
	</div></div></div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
