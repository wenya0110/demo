<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>babasport-list</title>
<script type="text/javascript">
function updateSku(obj){
	var arr=$(obj).parent().parent().children().children("input[type=text]");
	for(var i=0;i<arr.length;i++){
		$(arr[i]).removeAttr("disabled");
	}
}
function addSku(obj){
	var tr = $(obj).parent().parent();
	var id= $(tr).children().children("input[type=checkbox]").val();
	var marketPrice = $(tr).children().children("input[type=text]")[0].value;
	var price = $(tr).children().children("input[type=text]")[1].value;
	var stock = $(tr).children().children("input[type=text]")[2].value;
	var upperLimit = $(tr).children().children("input[type=text]")[3].value;
	var deliveFee = $(tr).children().children("input[type=text]")[4].value;

	$.post("<%=basePath %>adminsku/update",
		{
			id: id ,
			marketPrice:marketPrice ,
			price:price ,
			deliveFee:deliveFee,
			stock:stock,
			upperLimit:upperLimit
		},
		function(data){
			var arr=$(obj).parent().parent().children().children("input[type=text]");
			for(var i=0;i<arr.length;i++){
				$(arr[i]).attr("disabled","disabled");
	}
		}
	);
}

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 库存管理 - 列表</div>
	<div class="clear"></div>
</div>
<div class="body-box">
<form method="post" id="tableForm">
<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onclick="Pn.checkbox('ids',this.checked)"/></th>
			<th>商品编号</th>
			<th>商品颜色</th>
			<th>商品尺码</th>
			<th>市场价格</th>
			<th>销售价格</th>
			<th>库       存</th>
			<th>购买限制</th>
			<th>运       费</th>
			<th>是否赠品</th>
			<th>操       作</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
	<c:forEach items="${data }" var="s">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td><input type="checkbox" name="ids" value="${s.id }"/></td>
				<td>${s.productId }</td>
				<td align="center">${s.name }</td>
				<td align="center">${s.size }</td>
				<td align="center"><input type="text" id="m52" value="${s.marketPrice }" disabled="disabled" size="10"/></td>
				<td align="center"><input type="text" id="p52" value="${s.price }" disabled="disabled" size="10"/></td>
				<td align="center"><input type="text" id="i52" value="${s.stock }" disabled="disabled" size="10"/></td>
				<td align="center"><input type="text" id="l52" value="${s.upperLimit }" disabled="disabled" size="10"/></td>
				<td align="center"><input type="text" id="f52" value="${s.deliveFee }" disabled="disabled" size="10"/></td>
				<td align="center">不是</td>
				<td align="center"><a href="javascript:;" onclick="updateSku(this)" class="pn-opt">修改</a> | <a href="javascript:;" onclick="addSku(this)" class="pn-opt">保存</a></td>
			</tr>
		</c:forEach>
			
	</tbody>
</table>
</form>
</div>
</body>
</html>