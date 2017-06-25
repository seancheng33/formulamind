<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="lib/bootstrap-table/bootstrap-table-all.js"></script>
<%-- <script type="text/javascript" --%>
<%-- 	src="lib/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script> --%>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap-table/bootstrap-table.min.css">
<!--  -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="external nofollow"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/productadd.js"></script>
<!--  -->
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
<!-- 						<s:form action="/addProduct" method="post"></s:form> -->
						<s:form action="" method="post">
							<div class="btn-toolbar">
								<button type="submit" class="btn btn-primary" onclick="savePro()">
									<i class="icon-save"></i> Save
								</button>
								<a href="productlist" class="btn">Cancel</a>
								<div class="btn-group"></div>
								<hr>
							</div>
							<table>
								<tr>
									<th style="text-align:left" width="70%">Product Name:</th>
									<th style="text-align:left" width="15%">Code:</th>
									<th style="text-align:left" width="15%">Date Created:</th>
								</tr>
								<tr>
									<td><input type="text" /></td>
									<td><input type="text" /></td>
									<td><input type="text" /></td>
								</tr>
							</table>
							<!--  -->
							<table class="table table-bordered" id="para_table">
								<thead>
									<tr>
										<th style="text-align:center" width="50">Position</th>
										<th style="text-align:center" width="50">Chem ID</th>
										<th style="text-align:left" width="260">Chemical Name</th>
										<th style="text-align:center" width="30">Price</th>
										<th style="text-align:center" width="30">%</th>
										<th style="text-align:center" width="30">Amount</th>
										<th style="text-align:center" width="30"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick=""><select></select></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick="tdclick(this)"></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick="deletetr(this)"><button
												type="button" class="btn btn-xs btn-link">
												<i class="icon-trash"></i>Delete
											</button></td>
									</tr>
								</tbody>
							</table>
							<div id="addtrdiv"
								style="margin-top:-15px; width: 15%; float: right;">
								<button type="button" class="btn btn-xs btn-link"
									onclick="addtr()">
									<i class="icon-plus"></i>Add Chemical
								</button>
							</div>
							<!--  -->
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div></div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>