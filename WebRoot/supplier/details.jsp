<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Supplier Details</title>
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
			<h1 class="page-title">Edit Supplier</h1>
			<div class="well">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active in" id="home">
						<div class="btn-toolbar">
							<a href='toSupplierModify?sid=<s:property value="%{#request.supplier.sid}" />' class="btn btn-primary">Edit</a>
							<a href="supplierlist" class="btn">Supplier List</a>
							<div class="btn-group"></div>
							<hr>
						</div>
						<table class="table">
							<tr>
								<td>Supplier Id:</td>
								<td><s:property value="%{#request.supplier.sid}" /></td>
							</tr>
							<tr>
								<td>Supplier Name:</td>
								<td><s:property value="%{#request.supplier.sname}" /></td>
							</tr>
							<tr>
								<td>Address:</td>
								<td><s:property value="%{#request.supplier.address}" /></td>
							</tr>
							<tr>
								<td>Suburb:</td>
								<td><s:property value="%{#request.supplier.suburb}" /></td>
							</tr>
							<tr>
								<td>Post code:</td>
								<td><s:property value="%{#request.supplier.postcode}" /></td>
							</tr>
							<tr>
								<td>Phone:</td>
								<td><s:property value="%{#request.supplier.phone}" /></td>
							</tr>
							<tr>
								<td>Fax:</td>
								<td><s:property value="%{#request.supplier.fax}" /></td>
							</tr>
							<tr>
								<td>Contact:</td>
								<td><s:property value="%{#request.supplier.contact}" /></td>
							</tr>
							<tr>
								<td>Create Date:</td>
								<td><s:property value="%{#request.supplier.screatedate}" /></td>
							</tr>
							<tr>
								<td>Modify Date:</td>
								<td><s:property value="%{#request.upplier.smodifydate}" /></td>
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
