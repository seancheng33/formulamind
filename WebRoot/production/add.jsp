<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Supplier</title>
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
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
<!--  -->
<script type="text/javascript">
	function save_para_table() {
		var tableinfo = gettableinfo();
		alert(tableinfo);


	}
	//get table infomation  
	function gettableinfo() {
		var key = "";
		var value = "";
		var tabledata = "";
		var table = $("#para_table");
		var tbody = table.children();
		var trs = tbody.children();
		for (var i = 1; i < trs.length; i++) {
			var tds = trs.eq(i).children();
			for (var j = 0; j < tds.length; j++) {
				if (j == 0) {
					if (tds.eq(j).text() == null || tds.eq(j).text() == "") {
						return null;
					}
					key = "key\":\"" + tds.eq(j).text();
				}
				if (j == 1) {
					if (tds.eq(j).text() == null || tds.eq(j).text() == "") {
						return null;
					}
					value = "value\":\"" + tds.eq(j).text();
				}
			}
			if (i == trs.length - 1) {
				tabledata += "{\"" + key + "\",\"" + value + "\"}";
			} else {
				tabledata += "{\"" + key + "\",\"" + value + "\"},";
			}
		}
		tabledata = "[" + tabledata + "]";
		return tabledata;
	}

	function tdclick(tdobject) {
		var td = $(tdobject);
		td.attr("onclick", "");
		//1,取出当前td中的文本内容保存起来  
		var text = td.text();
		//2,清空td里面的内容  
		td.html(""); //也可以用td.empty();  
		//3，建立一个文本框，也就是input的元素节点  
		var input = $("<input>");
		//4，设置文本框的值是保存起来的文本内容  
		input.attr("value", text);
		input.bind("blur", function() {
			var inputnode = $(this);
			var inputtext = inputnode.val();
			var tdNode = inputnode.parent();
			tdNode.html(inputtext);
			tdNode.click(tdclick);
			td.attr("onclick", "tdclick(this)");
		});
		input.keyup(function(event) {
			var myEvent = event || window.event;
			var kcode = myEvent.keyCode;
			if (kcode == 13) {
				var inputnode = $(this);
				var inputtext = inputnode.val();
				var tdNode = inputnode.parent();
				tdNode.html(inputtext);
				tdNode.click(tdclick);
			}
		});

		//5，将文本框加入到td中  
		td.append(input);
		var t = input.val();
		input.val("").focus().val(t);
		//              input.focus();  

		//6,清除点击事件  
		td.unbind("click");
	}

	function loadchem(tdobject) {
		$.ajax({
			type : "post",
			url : "ajaxChem",
			dataType : "json",
			success : function(data) {
				var d=eval("("+data+")");
				for (var key in d) { //第一层循环取到各个d 
					var chem = d[key];
					//alert(chem.cname);
					$(".chemlist").append("<option value='"+chem.cid+"'>"+chem.cname+"</option>");
				}
			},
			error : function() {
				alert("系统异常，稍后再试")
			}
		});
		}

	function chemselected(){
		alert("success")
	}

	function addtr() {
		var table = $("#para_table");
		var tr = $("<tr>" +
			"<td  onclick=''>" + "</td>" +
			"<td  onclick=''><select class='chemlist' onchange='chemselected()'></select>" + "</td>" +
			"<td  onclick=''>" + "</td>" +
			"<td  onclick=''>" + "</td>" +
			"<td  onclick='tdclick(this)'>" + "</td>" +
			"<td  onclick=''>" + "</td>" +
			"<td  style='text-align:center;' align='center' onclick='deletetr(this)'><button type='button'  class='btn btn-xs btn-link' >" + 
			"<i class='icon-trash'></i> Delete" + "</button></td></tr>");
		table.append(tr);
		loadchem(this);
	}
	function deletetr(tdobject) {
		var td = $(tdobject);
		td.parents("tr").remove();
	}
</script>
<!--  -->

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="javascripts/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7"> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8"> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body onload='loadchem(this)'>
	<!--<![endif]-->

	<jsp:include page="../header.jsp" />
	<div class="container-fluid">
		<div class="row-fluid">
			<jsp:include page="../left.jsp" />

			<div class="span9">
				<h1 class="page-title">New Product</h1>
				<div class="well">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane active in" id="home">
							<s:form action="/addSupplier" method="post">
								<div class="btn-toolbar">
									<button type="submit" class="btn btn-primary">
										<i class="icon-save"></i> Save
									</button>
									<a href="supplierlist" class="btn">Cancel</a>
									<div class="btn-group"></div>
									<hr>
								</div>

								<table class="table  table-bordered" id="para_table">
									<tr>
										<th style="text-align:center" width="80">positon</th>
										<th style="text-align:center" width="80">chem ID</th>
										<th style="text-align:center" width="300">chemical</th>
										<th style="text-align:center" width="80">price</th>
										<th style="text-align:center" width="80">%percent</th>
										<th style="text-align:center" width="80">Amount</th>
										<th style="text-align:center" width="100">Operation</th>
									</tr>
									<tr>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick=""><select onchange="chemselected()" class='chemlist' theme="simple"></select></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick="tdclick(this)"></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick="deletetr(this)">
											<button type="button" class="btn btn-xs btn-link"><i class="icon-trash"></i> Delete</button>
										</td>
									</tr>
								</table>

								<div id="addtrdiv"
									style="margin-top:-15px; width: 15%; float: right;">
									<button type="button" class="btn btn-xs btn-link"
										onclick="addtr()">Add New Chemical</button>
								</div>


							</s:form>
						</div>
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
