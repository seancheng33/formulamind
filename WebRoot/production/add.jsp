<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		//5，将文本框加入到td中  ,计算及添加值到amount列中
		td.append(input);
		var t = input.val();
		input.val("").focus().val(t);
		//              input.focus();  

		//6,清除点击事件  
		td.unbind("click");
	}

	function loadchem(tdobject) {
		$.ajax({
			type : "get",
			url : "ajaxChem",
			dataType : "json",
			success : function(data) {
				var d=eval("("+data+")");
				for (var key in d) { //循环取到各个d 
					var chem = d[key];
					//alert(chem.cname);
					//var chemdetails = chem.cid+" | "+chem.cname+" | "+chem.price;
					$(".chemlist").append("<option value='"+chem.cid+"'>"+chem.cid+"</option>");
				}
			},
			error : function() {
				alert("系统异常，稍后再试")
			}
		});
	}

	function chemselected(tdobject) {
		//$(tdobject).find("option:selected").val()如果是val是取select的值，如果是text是取select的key
		var chemname = $(tdobject).find("option:selected").val();
		$.ajax({
			type : "post",
			url : "ajaxChemDetail",
			data:{cid:$(tdobject).find("option:selected").val()},
			dataType : "json",
			success : function(data) {
				var d=eval("("+data+")");
				$(tdobject).parent("td").parent("tr").find("td:eq(2)").html(d.cname);
				$(tdobject).parent("td").parent("tr").find("td:eq(3)").html(d.price);
			},
			error : function() {
				alert("系统异常，稍后再试")
			}
		});
		//var td = $(tdobject).partent("td");

		//alert(td.innerHTML);
	}

	function addtr() {
		var table = $("#para_table");
		var tr = $("<tr>" +
			"<td  style='text-align:center;' onclick=''>" + "</td>" +
			"<td  onclick=''><select class='chemlist' onchange='chemselected(this)'></select>" + "</td>" +
			"<td  style='text-align:center;' onclick=''>" + "</td>" +
			"<td  style='text-align:center;' onclick=''>" + "</td>" +
			"<td  style='text-align:center;' onclick='tdclick(this)'>" + "</td>" +
			"<td  style='text-align:center;' onclick=''>" + "</td>" +
			"<td  style='text-align:center;' align='center'><button type='button'  class='btn btn-xs btn-link' onclick='deletetr(this)'>" + 
			"<i class='icon-remove'></i> Delete" + "</button></td></tr>");
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
							<s:form action="/addProduct" method="post">
								<div class="btn-toolbar">
									<button type="submit" class="btn btn-primary">
										<i class="icon-save"></i> Save
									</button>
									<a href="productlist" class="btn">Cancel</a>
									<div class="btn-group"></div>
									<hr>
								</div>
								<table class="table  table-bordered">
								<tr>
								<td>Product Name:</td>
								<td>Product Code:</td>
								<td>Date Created:</td>
								</tr>
								<tr>
								<td><input type="text" /></td>
								<td><input type="text" /></td>
								<td><input type="datetime" /></td>
								</tr>
								<tr >
								<td colspan="3">Other Information:</td>
								</tr>
								<tr >
								<td colspan="3"><input type="text" /></td>
								</tr>
								</table>
								<div id="addtrdiv"
									style="margin-top:-15px; width: 15%; float: right;">
									<button type="button" class="btn btn-xs btn-link"
										onclick="addtr()"><i class="icon-plus"></i> Add New Chemical</button>
								</div>
								<table class="table  table-bordered" id="para_table">
									<tr>
										<th style="text-align:center" width="80">positon</th>
										<th style="text-align:center" width="80">chem ID</th>
										<th style="text-align:center" width="300">chemical</th>
										<th style="text-align:center" width="80">price</th>
										<th style="text-align:center" width="80">%</th>
										<th style="text-align:center" width="80">Amount</th>
										<th style="text-align:center" width="100">Operation</th>
									</tr>
									<tr>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick=""><select onchange="chemselected(this)" class='chemlist' ></select></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " onclick="tdclick(this)"></td>
										<td style="text-align:center; " onclick=""></td>
										<td style="text-align:center; " >
											<button type="button" class="btn btn-xs btn-link" onclick="deletetr(this)"><i class="icon-remove"></i> Delete</button>
										</td>
									</tr>
								</table>

								<div id="addtrdiv"
									style="margin-top:-15px; width: 15%; float: right;">
									<button type="button" class="btn btn-xs btn-link"
										onclick="addtr()"><i class="icon-plus"></i> Add New Chemical</button>
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
