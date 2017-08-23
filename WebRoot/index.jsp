<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Formula and Production Managemnet</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-responsive.css">
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

<jsp:include page="header.jsp" />
    <div class="container-fluid">
        
        <div class="row-fluid">
          <jsp:include page="left.jsp" />
        <div class="span9">
            <script type="text/javascript" src="lib/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" charset="utf-8" src="javascripts/graphDemo.js"></script>

<div class="stats">
    <p class="stat"><span class="number">53</span>Production</p>
    <p class="stat"><span class="number">27</span>Total Batch</p>
    <p class="stat"><span class="number">15</span>Today New Batch</p>
</div>
<h1 class="page-title">Home</h1>

<div class="row-fluid">
    <div class="block">
        <p class="block-heading" data-toggle="collapse" data-target="#chart-container">Performance Chart</p>
        <div id="chart-container" class="block-body collapse in">
            <div id="line-chart"></div>
        </div>
    </div>
</div>

<div class="row-fluid">
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#tablewidget">Previons Batch</div>
        <div id="tablewidget" class="block-body collapse in">
            <table class="table">
              <thead>
                <tr>
                  <th width="30">Batch NO</th>
                  <th width="100">Product</th>
                  <th width="50">Date</th>
                  <th width="50">Quantity</th>
                </tr>
              </thead>
              <tbody>
                <s:iterator id="batch" value="#request.batchList">
							<tr>
							<td>${batch.batchCode}</td>
							<td>${batch.product.pname}</td>
							<td>${batch.batchDate}</td>
							<td>${batch.batchQuantity}</td>
							</tr>
			</s:iterator>
              </tbody>
            </table>
            <p><a href="previonsBatchDetails">More...</a></p>
        </div>
    </div>
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#widget1container">Production </div>
        <div id="widget1container" class="block-body collapse in">
            <table class="table">
              <thead>
                <tr>
                  <th width="30">#</th>
                  <th width="180">Product Name</th>
                  <th width="150">Other Infomation</th>
                </tr>
              </thead>
              <tbody>
			<s:iterator id="product" value="#request.productList">
							<tr>
							<td>${product.pid}</td>
							<td>${product.pname}</td>
							<td>${product.pinfo}</td>
							</tr>
			</s:iterator>
			 </tbody>
            </table>
        </div>
    </div>
</div>
<div class="row-fluid">
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#widget2container">Chemical</div>
        <div id="widget2container" class="block-body collapse in">
            <table class="table">
              <thead>
                <tr>
                  <th width="20">#</th>
                  <th width="180">Chemical Name</th>
                  <th width="50">Price</th>
                </tr>
              </thead>
              <tbody>
                <s:iterator id="chemical" value="#request.chemicalList">
							<tr>
							<td>${chemical.cid}</td>
							<td>${chemical.cname}</td>
							<td>${chemical.price}</td>
							</tr>
			</s:iterator>
              </tbody>
            </table>
        </div>
    </div>
    <div class="block span6">
        <div class="block-heading" data-toggle="collapse" data-target="#widget3container">Supplier</div>
        <div id="widget3container" class="block-body collapse in">
            <table class="table">
              <thead>
                <tr>
                  <th width="20">ID</th>
                  <th width="180">Supplier Name</th>
                  <th width="80">Phone</th>
                  <th width="50">Contact</th>
                </tr>
              </thead>
              <tbody>
			<s:iterator id="supplier" value="#request.supplierList">
							<tr>
							<td>${supplier.sid}</td>
							<td>${supplier.sname}</td>
							<td>${supplier.phone}</td>
							<td>${supplier.contact}</td>
							</tr>
			</s:iterator>
			 </tbody>
            </table>
        </div>
    </div>
</div>

        </div>
    </div>
    <footer>
<jsp:include page="footer.jsp" />
    </footer>
  </body>
</html>
