<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html>
<html>
<head>
<sx:head /> 
<title>New Product Batch</title>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<script src="lib/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">
function saveBatch(){
    document.newbatch.action="doAddBatch";
    document.newbatch.submit();
}

function previewBatch(){
    document.newbatch.action="previewBatch";
    document.newbatch.submit();
}
function checkFormat(){
	
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
		<h1 class="page-title">New Product Batch</h1>
		<div class="well">
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane active in" id="home">
					<s:form name="newbatch" action="/doAddBatch" method="post">
									<div class="btn-toolbar">
					<button type="submit" class="btn btn-primary" onclick="saveBatch()"> <i class="icon-save"></i>
						Save
					</button> <button type="submit" class="btn" onclick="previewBatch()"><i
				class="icon-print"></i>Print preview</button>
					<button type="reset" class="btn">Cancel</button>
					<div class="btn-group"></div>
					<hr>
				</div>
						<s:label>Serial No:</s:label><s:property value="#request.serials"/>
						<s:hidden name="batch.batchSerials" value="%{#request.serials}" />
						<s:select label="Product Name" name="pid" list="#request.productList" listKey="pid" listValue="pname" />
						<s:textfield label="Batch No" name="batch.batchCode" />
						<s:textfield label="Total Quantity" name="batch.batchQuantity" value="0" />
						<s:textfield label="Operator" name="batch.operatorName" value="%{#session.LoginUser.uname}"/>
						<sx:datetimepicker label="Batch Date" name="batch.batchDate" displayFormat="yyyy-MM-dd" value="%{'today'}"/>
						<s:textarea label="Other Information" name="batch.binfo" />
					</s:form>
				</div>
			</div>
		</div>
	</div></div></div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
