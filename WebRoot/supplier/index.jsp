<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Supplier</title>
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
		<h1 class="page-title">Suppliers</h1>
		<div class="well search-well">
			<form class="form-inline" method="post" action="supplierlist">
				<s:textfield label="Search supplier name" name="nameSearch" />
				<button class="btn" type="submit">
					<i class="icon-search"></i> Go
				</button>
			</form>
		</div>
		<div class="btn-toolbar">
			<a href="toaddSupplier" class="btn btn-primary"><i
				class="icon-plus"></i> New Supplier</a> <a href="supplierlist"
				class="btn">Show All Supplier</a>
			<button class="btn">Import</button>
			<button class="btn">Export</button>
			<div class="btn-group"></div>
		</div>
		<div class="well">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Supplier Name</th>
						<th>Address</th>
						<th>Phone</th>
						<th>Contact</th>
						<th style="width: 50px;"></th>
					</tr>
				</thead>
				<tbody>
					<!--显示supplier部分-->
					<s:iterator id="supplier" value="#request.supplierList">
						<tr>
							<td>${supplier.sid}</td>
							<td>${supplier.sname}</td>
							<td>${supplier.address}</td>
							<td>${supplier.phone}</td>
							<td>${supplier.contact}</td>
							<td><a href="supplierDetails?sid=${supplier.sid}" title="Show detail"><i class="icon-file"></i>
							</a> <a href="toSupplierModify?sid=${supplier.sid}" title="Edit"><i
									class="icon-pencil"></i> </a> <a
								href="deleteSupplier?sid=${supplier.sid}" data-toggle="modal"
								title="Remove"><i class="icon-trash"></i> </a></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		<div class="pagination">
			<ul>
				<!--分页超链接部分-->
				<s:if test="pager.curPage>1">
					<li><a href="supplierlist?pager.curPage=1&nameSearch=<s:property value="nameSearch"/>">First</a></li>
					<li><a href="supplierlist?pager.curPage=${pager.curPage-1}&nameSearch=<s:property value="nameSearch"/>">Prev</a></li>
				</s:if>
				<s:else>
				<li class="active"><a class="active">First</a></li>
					<li class="active"><a class="active">Prev</a></li>
				</s:else>
				
				<s:if test="pager.curPage<pager.pageCount">
					<li><a href="supplierlist?pager.curPage=${pager.curPage+1}&nameSearch=<s:property value="nameSearch"/>">Next</a></li>
					<li><a href="supplierlist?pager.curPage=${pager.pageCount}&nameSearch=<s:property value="nameSearch"/>">Last</a></li>
				</s:if>
				<s:else>
				<li class="active"><a class="active">Next</a></li>
					<li class="active"><a class="active">Last</a></li>
				</s:else>
			</ul>
		</div>
	</div></div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>