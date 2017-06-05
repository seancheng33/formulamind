<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Production Batch Sheet</title>
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
				class="icon-plus"></i> Print</a> <a href="previonsBatchDetails"
				class="btn">Back to Batch List</a>
			<div class="btn-group"></div>
		</div>
		<div class="well">
<table>
  <tr>
    <td></td>
    <td><label>Serial No:</label><s:property /></td>
  </tr>
  <tr>
    <td></td>
    <td><label>Batch No:</label><s:property/></td>
  </tr>
  <tr>
    <td><label>Product Name:</label><s:property/></td>
    <td><label>Batch Date:</label><s:property/></td>
  </tr>
  <tr>
    <td><label>Operator:</label><s:property/></td>
    <td><label>Total Quantity:</label><s:property/></td>
  </tr>
  <tr>
    <td colspan="2"><hr></td>
  </tr>
  <tr>
    <td><label>Chemical Name:</label></td>
    <td><label>Quantity(Kg):</label></td>
  </tr>
    <tr>
    <td colspan="2"><hr></td>
  </tr>
  <tr>
    <td colspan="2">
    <table>
      <tr>
    <td><label>Chemical Name:</label></td>
    <td><label>Quantity(Kg):</label></td>
  </tr></table>
    </td>
  </tr>
    <tr>
    <td colspan="2">Other Information:</td>
  </tr>
      <tr>
    <td colspan="2"></td>
  </tr>
</table>
		</div>
	</div></div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
