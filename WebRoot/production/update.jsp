<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Modify Product</title>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="lib/bootstrap/css/bootstrap-responsive.css"> -->
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
var rowsnum = 1;
var tmpprecent;

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
		tmpprecent = input.val("").focus().val(t);//赋值给一个全局变量，方便后面计算amount
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
				//先添加一个空项
				$(".chemlist").append("<option></option>");
				
				for (var key in d) { //循环取到各个d 
					var chem = d[key];
					//alert(chem.cname);
					//var chemdetails = chem.cid+" | "+chem.cname+" | "+chem.price;
					$(".chemlist").append("<option value='"+chem.cid+"'>"+chem.cid+"</option>");
				}
				
			},
			error : function() {
				alert("System exception, try again later.")
			}
		});
	}

	function chemselected(tdobject) {
		//$(tdobject).find("option:selected").val()如果是val是取select的值，如果是text是取select的key
		var chemname = $(tdobject).find("option:selected").val();
		if (chemname !=""){
			$.ajax({
				type : "post",
				url : "ajaxChemDetail",
				data:{cid:$(tdobject).find("option:selected").val()},
				dataType : "json",
				success : function(data) {
					var d=eval("("+data+")");
					$(tdobject).parent("td").parent("tr").find("td:eq(2)").html(d.cname);
					$(tdobject).parent("td").parent("tr").find("td:eq(3)").html(d.price);
					var percentvalue = $(tdobject).parent("td").parent("tr").find("td:eq(4)").text();
					$(tdobject).parent("td").parent("tr").find("td:eq(5)").html(percentvalue*d.price/100);
				},
				error : function() {
					alert("System exception, try again later.")
				}
			});
		}else{
			$(tdobject).parent("td").parent("tr").find("td:eq(2)").html("");
			$(tdobject).parent("td").parent("tr").find("td:eq(3)").html("");
		}
		//var td = $(tdobject).partent("td");
		//alert(percentvalue);
	}
	
	function tdchange(tdobject) {
			var percentvalue = tmpprecent.val();
			var pricevalue = $(tdobject).parent("tr").find("td:eq(3)").text();
			//先计算值出来，后面显示时规定为小数点后两位
			var amountvalue = percentvalue*pricevalue/100;
			$(tdobject).parent("tr").find("td:eq(5)").html(amountvalue.toFixed(2));
			}
	function totalTable(){
		var table = $("#para_table");
		var totalP = 0 ;
		var totalA = 0 ;
		var tbody = table.children();
		var trs = tbody.children();
		//未知表的行数，这里遍历每行取值和运算，从第二行开始取值，因为第一行是表头，取值没有意义
		for (var i = 1; i < trs.length; i++) {
			var tds = trs.eq(i).children();
			
			var tmpValue = parseInt(tds.eq(4).text());
			var tmpAmount = parseFloat(tds.eq(5).text());
			//需要一个isNaN的判断,如果转换值是NaN，就是在输入状态，直接取值全局变量的tmpprecent的值
			if (isNaN(tmpValue)) {
				totalP += parseInt(tmpprecent.val());
			} else {
				totalP += tmpValue;
			}
			if (isNaN(tmpAmount)) {
				totalA = totalA;
			} else {
				totalA += tmpAmount;
			}
		}
		$("#tper").html("Total Percent:"+totalP+"  Total Amount:"+totalA.toFixed(2));
	}
	function addtr() {
		totalTable();
		rowsnum +=1;
		var table = $("#para_table");
		var tr = $("<tr>" +
			"<td  style='text-align:center;' onclick=''>"+ rowsnum + "</td>" +
			"<td  onclick=''><select class='chemlist' onchange='chemselected(this)'></select>" + "</td>" +
			"<td  style='text-align:center;' onclick=''>" + "</td>" +
			"<td  style='text-align:center;' onclick=''>" + "</td>" +
			"<td  style='text-align:center;' onclick='tdclick(this)'  onchange='tdchange(this)'>0" + "</td>" +
			"<td  style='text-align:center;' onclick=''>" + "</td>" +
			"<td  style='text-align:center;' align='center'><button type='button'  class='btn btn-xs btn-link' onclick='deletetr(this)'>" + 
			"<i class='icon-remove'></i> Delete" + "</button></td></tr>");
		table.append(tr);
		loadchem(this);
	}
	function deletetr(tdobject) {
		var td = $(tdobject);
		td.parents("tr").remove();
		totalTable();
	}
	
	function savetable() {
		//ajax提交数据
		var table = $("#para_table tr");
		var pdata=[];
		table.each(function() {
			//遍历获取所有的table格，获得数据，再自己组合
			var jdata = {
				"position" : $(this).find('td').eq(0).text(),
				"chemId" : $(this).find('td').eq(1).find("option:selected").val(),
				"chemName" : $(this).find('td').eq(2).text(),
				"chemPrice" : $(this).find('td').eq(3).text(),
				"percent" : $(this).find('td').eq(4).text(),
				"amount" : $(this).find('td').eq(5).text(),
			}
			pdata.push(jdata);
		});

		$.ajax({
			type : "post",
			url : "doProductModify",
			data : {
			pcode:$("input[name=pcode]").val(),
			pname:$("input[name=pname]").val(),
			pdate:$("input[name=pdate]").val(),
			pinfo:$("textarea[name=pinfo]").val(),
			pdata:JSON.stringify(pdata)
			//pdata:pdata
			},
			datatype : "json",
			success : function() {
				//保存成功后再这里面做页面跳转
				alert("Add new product formula success.");
				//window.location.href='productlist';
				//保存成功后跳转到productlist页面
				window.location.replace("productlist");
			},
			error : function() {
				alert("Save the product fail,try again please.");
			}
		});
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
							<form action="doProductModify" method="post">
								<div class="btn-toolbar">
									<button type="submit" class="btn btn-primary" onclick="savetable()">
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
								<td><input type="text" name="pname" value="${requestScope.product.pname}"/></td>
								<td><input type="text" name="pcode" value="${requestScope.product.pcode}"/></td>
								<td><input type="datetime" name="pdate" value="${requestScope.product.pdate}"/>
								</td>
								</tr>
								<tr >
								<td colspan="3">Other Information:</td>
								</tr>
								<tr >
								<td colspan="3"><textarea cols="60" rows="6" name="pinfo">${requestScope.product.pinfo}</textarea></td>
								</tr>
								</table>
								<div id="addtrdiv"
									style="margin-top:-15px; width: 25%; float: right;">
									<button type="button" class="btn btn-xs btn-link" style="float: right;"
										onclick="addtr()"><i class="icon-plus"></i> Add New Chemical</button>
								</div>
								<table class="table  table-bordered" id="para_table" onchange="totalTable()">
									<tr>
										<th style="text-align:center" width="80">positon</th>
										<th style="text-align:center" width="80">chem ID</th>
										<th style="text-align:center" width="300">chemical</th>
										<th style="text-align:center" width="80">price</th>
										<th style="text-align:center" width="80">%</th>
										<th style="text-align:center" width="80">Amount</th>
										<th style="text-align:center" width="100">Operation</th>
									</tr>
									<s:iterator id="details" value="#request.productDetailses">
									<tr>
										<td style="text-align:center; " onclick="">${details.position}</td>
										<td style="text-align:center; " onclick=""><select onchange="chemselected(this)" class='chemlist'><option>${details.chemId}</option></td>
										<td style="text-align:center; " onclick="">${details.chemName}</td>
										<td style="text-align:center; " onclick="">${details.chemPrice}</td>
										<td style="text-align:center; " onclick="tdclick(this)" onchange="tdchange(this)">${details.percent}</td>
										<td style="text-align:center; " onclick="">${details.amount}</td>
										<td style="text-align:center; " >
											<button type="button" class="btn btn-xs btn-link" onclick="deletetr(this)"><i class="icon-remove"></i> Delete</button>
										</td>
									</tr>
									</s:iterator>
								</table>
								
								<div id="addtrdiv"
									style="margin-top:-15px; width: 25%; float: right;"><div id="tper"></div>
									<button type="button" class="btn btn-xs btn-link" style="float: right;"
										onclick="addtr()"><i class="icon-plus"></i> Add New Chemical</button>
								</div>
							</form>
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
