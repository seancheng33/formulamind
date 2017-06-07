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

<script src="lib/jquery.min.js" type="text/javascript"></script>
<script src="lib/jquery.print.min.js" type="text/javascript" ></script>
<script type="text/javascript"> 
function printit(){ 
  $("#batchPrint").print({iframe:true,prepend:'<br/>'}); 
} 
</script> 
</head>

<body>
	<jsp:include page="../header.jsp" />
<div class="container-fluid">
	<jsp:include page="../left.jsp" />
	<div class="span9">
		<h1 class="page-title">Production Batch Sheet</h1>
		<div class="btn-toolbar">
			<button class="btn btn-primary"><i
				class="icon-print" onclick="printit()"></i> Print</button> <a href="#"
				class="btn" onclick="javascript:history.back(-1);"><i
				class="icon-circle-arrow-left"></i>Back</a>
			<div class="btn-group"></div>
		</div>
		<div class="well" id="batchPrint">
<table width="100%" >
  <tr align="center">
    <td colspan="2"><h1>Production Batch Sheet</h1></td>
  </tr>
  <tr>
    <td width="70%"></td>
    <td>Serial No:<s:property value="#request.batch.batchSerials"/></td>
  </tr>
  <tr>
    <td></td>
    <td>Batch No:<s:property value="#request.batch.batchCode"/></td>
  </tr>
  <tr>
    <td>Product Name:<s:property value="#request.batch.product.pname"/></td>
    <td>Batch Date:<s:property value="#request.batch.batchDate" /></td>
  </tr>
  <tr>
    <td>Operator:<s:property value="#request.batch.operatorName"/></td>
    <td>Total Quantity:<s:property value="#request.batch.batchQuantity"/></td>
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
  <s:iterator id="chemical" value="#request.chemList">
  <tr>
  <td>${chemical.chemName}</td>
  <td></td>
  <td></td>
  <td></td>
  </tr>
  </s:iterator>
  </table>
    </td>
  </tr>
    <tr>
    <td colspan="2">Other Information:<br><s:property value="#request.batch.binfo"/></td>
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
