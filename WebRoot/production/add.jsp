<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script src="lib/jquery.js" type="text/javascript"></script>
<script src="lib/jquery.dataTables.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="stylesheets/jquery.dataTables.css">

<script id="tpl" type="text/x-handlebars-template">
    {{#each func}}
    <button type="button" class="btn btn-{{this.type}} btn-sm" onclick="{{this.fn}}">{{this.name}}</button>
    {{/each}}
</script>

<script>
$(document).ready(function() {
    var t = $('#example').DataTable();
    var counter = 1;

    $('#addRow').on( 'click', function () {
        t.row.add( [
            counter +'.1',
            counter +'.2',
            counter +'.3',
            counter +'.4',
            counter +'.5'
        ] ).draw();

        counter++;
    } );

    // Automatically add a first row of data
    $('#addRow').click();
} );
</script>

</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container-fluid">
		<jsp:include page="../left.jsp" />

		<div class="span9">
			<h1 class="page-title">New Product</h1>
			<div class="well">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active in" id="home">
						<s:form action="/addProduct" method="post">
							<div class="btn-toolbar">
								<button type="submit" class="btn btn-primary">
									<i class="icon-save"></i> Save
								</button>
								<a href="productlist" class="btn">Cancel</a>
								<div class="btn-group"></div>
								<hr>
							</div>
							<button id="addRow">添加一行</button>
<table id="example" class="display" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Column 1</th>
            <th>Column 2</th>
            <th>Column 3</th>
            <th>Column 4</th>
            <th>Column 5</th>
        </tr>
    </thead>
 
    <tfoot>
        <tr>
            <th>Column 1</th>
            <th>Column 2</th>
            <th>Column 3</th>
            <th>Column 4</th>
            <th>Column 5</th>
        </tr>
    </tfoot>
</table>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>
