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
	<jsp:include page="../header.jsp" />
	<div class="container-fluid">
	<div class="row-fluid">
		<jsp:include page="../left.jsp" />

		<div class="span9">
			<h1 class="page-title">Edit Chemical</h1>
			<div class="well">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active in" id="home">
						<s:form action="/doChemicalModify" method="post">
							<div class="btn-toolbar">
								<button type="submit" class="btn btn-primary">
									<i class="icon-save"></i> Modify
								</button>
								<a href="chemicallist" class="btn">Cancel</a>
								<div class="btn-group"></div>
								<hr>
							</div>
							<s:hidden name="chemical.cid" value="%{#request.chemical.cid}" />
							<s:textfield label="Chemical Name" name="chemical.cname" />
							<s:select label="Supplier Name" list="#request.supplierList"
								name="sid" listKey="sid" listValue="sname" value="chemical.supplier.sid"></s:select>
							<s:textfield label="Price" name="chemical.price" />
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div></div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
