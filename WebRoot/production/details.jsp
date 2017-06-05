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
<script src="lib/jquery.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container-fluid">
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
	</div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
