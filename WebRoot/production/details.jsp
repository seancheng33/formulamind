<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Product Details</title>
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
			<h1 class="page-title">Show Product Details</h1>
			<div class="well">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active in" id="home">
						<div class="btn-toolbar">
							<a href='toSupplierModify?sid=<s:property value="%{#request.supplier.sid}" />' class="btn btn-primary">Edit</a>
							<a href="productlist" class="btn">Product List</a>
							<div class="btn-group"></div>
							<hr>
						</div>
						
						<table class="table">
						<tr>
						<th>Product Id</th>
						<th>Product Name</th>
						<th>Date Created</th>
						</tr>
						<tr>
						<td><s:property value="%{#request.product.pid}" /></td>
						<td><s:property value="%{#request.product.pname}" /></td>
						<td><s:property value="%{#request.product.pdate}" /></td>
						</tr>
						</table>
						<hr>
						
						<table class="table">
							<tr>
								<th>position</th>
								<th>chem id</th>
								<th>chemical</th>
								<th>price</th>
								<th>% (precent)</th>
								<th>amount</th>
							</tr>
							<s:iterator id="details" value="#request.productDetailses">
							<tr>
								<td>${details.position}</td>
								<td>${details.chemical.cid}</td>
								<td>${details.chemical.cname}</td>
								<td>${details.chemical.price}</td>
								<td>${details.percent}</td>
								<td>${details.amount}</td>
							</tr>
							</s:iterator>
						</table>
						<hr>
						<h4>Other Infomation:</h4>
						<s:property value="%{#request.product.pinfo}"/>
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
