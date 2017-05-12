<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Chemical Details</title>
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
			<h1 class="page-title">Chemical Details</h1>
			<div class="well">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active in" id="home">
						<div class="btn-toolbar">
							<a href='toChemicalModify?cid=<s:property value="%{#request.chemical.cid}" />' class="btn btn-primary">Edit</a>
							<a href="chemicallist" class="btn">Chemical List</a>
							<div class="btn-group"></div>
							<hr>
						</div>
						<table class="table">
							<tr>
								<td>Chemical Id:</td>
								<td><s:property value="%{#request.chemical.cid}" /></td>
							</tr>
							<tr>
								<td>Chemical Name:</td>
								<td><s:property value="%{#request.chemical.cname}" /></td>
							</tr>
							<tr>
								<td>Supplier Name:</td>
								<td><s:property value="%{#request.chemical.supplier.sname}" /></td>
							</tr>
							<tr>
								<td>Price:</td>
								<td><s:property value="%{#request.chemical.price}" /></td>
							</tr>
						</table>
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
