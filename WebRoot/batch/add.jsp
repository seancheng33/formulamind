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
<script src="lib/jquery.js" type="text/javascript"></script>

<script type="text/javascript">
function saveBatch(){
    document.newbatch.action="doAddBatch";
    document.newbatch.submit();
}

function previewBatch(){
    document.newbatch.action="previewBatch";
    document.newbatch.submit();
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container-fluid">
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
						<label>Serial No:</label><s:property  value="#request.serials"/>
						<s:hidden name="batch.batchSerials" value="%{#request.serials}" />
						<s:select label="Product Name" name="pid" list="#request.productList" listKey="pid" listValue="pname" />
						<s:textfield label="Batch No" name="batch.batchCode" />
						<s:textfield label="Total Quantity" name="batch.batchQuantity" />
						<s:textfield label="Operator" name="batch.operatorName" />
						<sx:datetimepicker label="Batch Date" name="batch.batchDate" displayFormat="yyyy-MM-dd" value="%{'today'}"/>
						<s:textarea label="Other Information" name="batch.binfo" />
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
