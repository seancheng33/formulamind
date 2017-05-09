<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Chemical</title>
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
	<s:form action="/doSupplierModify" method="post">
										<div class="btn-toolbar">
					<button type="submit" class="btn btn-primary"> <i class="icon-save"></i>
						Modify
					</button> <a href="supplierlist" class="btn">Cancel</a>
					<div class="btn-group"></div>
					<hr>
					</div>
	<s:hidden name="supplier.sid" value="%{#request.supplier.sid}" />
	<s:hidden name="supplier.screatedate" value="%{#request.supplier.screatedate}" />
		<s:textfield label="Supplier Name" name="supplier.sname" value="%{#request.supplier.sname}"/>
		<s:textfield label="Address" name="supplier.address" value="%{#request.supplier.address}"/>
		<s:textfield label="Suburb" name="supplier.suburb" value="%{#request.supplier.suburb}"/>
		<s:textfield label="Postcode" name="supplier.postcode" value="%{#request.supplier.postcode}"/>
		<s:textfield label="Phone" name="supplier.phone" value="%{#request.supplier.phone}"/>
		<s:textfield label="Fax" name="supplier.fax" value="%{#request.supplier.fax}"/>
		<s:textfield label="Contact" name="supplier.contact" value="%{#request.supplier.contact}" />
<!-- 		<s:submit value="Update Supplier"></s:submit> -->
	</s:form>
	</div>
			</div>
		</div>
	</div></div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
