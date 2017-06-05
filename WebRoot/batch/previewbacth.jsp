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
		<h1 class="page-title">Production Batch Sheet</h1>
		<div class="btn-toolbar">
			<a href="#" class="btn btn-primary"><i
				class="icon-print"></i> Print</a> <a href="#"
				class="btn"><i
				class="icon-circle-arrow-left"></i>Back</a>
			<div class="btn-group"></div>
		</div>
		<div class="well">
<table width="100%">
  <tr align="center">
    <td colspan="2"><h1>Production Batch Sheet</h1></td>
  </tr>
  <tr>
    <td width="70%"></td>
    <td><label>Serial No:</label><s:property value="#request.batch.batchSerials"/></td>
  </tr>
  <tr>
    <td></td>
    <td><label>Batch No:</label><s:property value="#request.batch.batchCode"/></td>
  </tr>
  <tr>
    <td><label>Product Name:</label><s:property value="#request.batch.product.pname"/></td>
    <td><label>Batch Date:</label><s:property value="#request.batch.batchDate"/></td>
  </tr>
  <tr>
    <td><label>Operator:</label><s:property value="#request.batch.operatorName"/></td>
    <td><label>Total Quantity:</label><s:property value="#request.batch.batchQuantity"/></td>
  </tr>
  <tr>
    <td colspan="2"><hr></td>
  </tr>
  <tr>
    <td colspan="2">
    <table width="100%" border="1">
      <tr>
    <th width="50%" align="left">Chemical Name</th>
    <th width="20%">Quantity<br>Required(Kg)</th>
    <th width="15%">Quantity<br>Added(Kg)</th>
    <th width="15%">Added "&radic;"</th>
  </tr>
  <s:iterator id="chemical" value="#request.chemicalList">
  <tr>
  <td>${chemical.cname}</td>
  <td></td>
  <td></td>
  <td></td>
  </tr>
  </s:iterator>
  </table>
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
