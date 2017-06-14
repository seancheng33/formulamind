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
<script type="text/javascript" src="lib/jquery.PrintArea.js"></script>
<script type="text/javascript">
    function printBatch(){
    	$("#batchPrint").printArea();
    }
</script>
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
<!-- 		<h1 class="page-title">Production Batch Sheet</h1> -->
		<div class="btn-toolbar">
			<button class="btn btn-primary" onclick="printBatch()"><i
				class="icon-print"></i> Print</button>
				<a href="#"
				class="btn" onclick="javascript:history.back(-1);"><i
				class="icon-circle-arrow-left"></i>Back</a>
			<div class="btn-group"></div>
		</div>
		<div class="well" >
		<div id="batchPrint">
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
    <th width="15%">Added  "✔"</th>
  </tr>
  <s:iterator id="chemDetail" value="#request.details">
  <tr>
  <td>${chemDetail.chemName}</td>
  <td>${chemDetail.qtyRequired}</td>
  <td></td>
  <td></td>
  </tr>
  </s:iterator>
    <tr>
  <td></td>
  <td>Total:</td>
  <td></td>
  <td></td>
  </tr>
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
		</div></div>
	</div></div></div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
