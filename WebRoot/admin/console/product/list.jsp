<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>babasport-list</title>
<script type="text/javascript">
var cur_page = 1;
function shouye(){
	getbypage(1);
}
function next(){
	//下一页
	//alert(Number($("#total").html()))
	if(Number(cur_page)>=Number($("#total").html()))
		return ;
	getbypage(cur_page+1);
}
function tiao(){
	var page = Number($("#pageno").val());
	getbypage(page);
}
function prev(){
	//上一页
	if(Number(cur_page)<=1)
		return ;
	//发ajax请求，第cur_page-1页
	getbypage(cur_page-1);
}
function weiye(){
	getbypage(Number($("#total").html()));
}
$(function(){
	//加载分页
	//alert("${size}");
	var size = ${size};
	var page = Math.ceil(size/5);
	var html = '';
	for(var i=1;i<=page;i++){
		html += '<a href="javascript:;" onclick="getbypage('+i+')">'+i+'</a>'
	}
	$("#myspan").html(html);
	var arr = $("#myspan").children();
	$(arr[0]).replaceWith("<strong>1</strong>");
	$("#total").html(page);
	
	//加载品牌
		$.post("<%=basePath%>adminbrand/getbrands",function(data){
		var o = eval(data);
		var s = '<option value="">请选择品牌</option>';
		for(var i=0;i<o.length;i++){
			s+='<option value="'+o[i].id+'">'+o[i].name+'</option>';
		}
		$("#brandid").html(s);
	});
});
function getbypage(page){

	//alert("1");
	$.post("<%=basePath%>adminproduct/getbypage",{page:page},function(data){
		var is_new = "";
		var is_hot = "";
		var is_commend = "";
		var is_show = ""; 
		var arr = eval(data);
		var html = "";
		for(var i=0; i<arr.length;i++){
			is_new = arr[i].is_new == true?"是":"否";
			is_hot = arr[i].is_hot == true?"是":"否";
			is_commend = arr[i].is_commend == true?"是":"否";
			is_show = arr[i].is_show == true?"是":"否";
			var img= "";
			if(arr[i].imgs!=null && arr[i].imgs.length>0)
				img = arr[i].imgs[0];
			else img = "";
			html += '<tr bgcolor="#ffffff" onmouseover="this.bgColor=\'#eeeeee\'" onmouseout="this.bgColor=\'#ffffff\'">'+
			'<td><input type="checkbox" name="ids" value="'+arr[i].id+'"/></td>'+
			'<td>'+arr[i].id+'</td>'+
			'<td align="center">'+arr[i].name+'</td>'+
			'<td align="center"><img width="50" height="50" src="<%=basePath %>bbs'+img+'"/></td>'+
			'<td align="center">'+is_new+'</td>'+
			'<td align="center">'+is_hot+'</td>'+
			'<td align="center">'+is_commend+'</td>'+
			'<td align="center">'+is_show+'</td>'+
			'<td align="center">'+
			'<a href="#" class="pn-opt">查看</a> | <a href="#" class="pn-opt">修改</a> | <a href="#" onclick="if(!confirm(\'您确定删除吗？\')) {return false;}" class="pn-opt">删除</a> | <a href="<%=basePath%>adminsku/getsku?productid='+arr[i].id+'" class="pn-opt">库存</a>'+
			'</td>'+
			'</tr>';
		}
		
		$("#tbody").html(html);
		var arr = $("#myspan").children();
		//以前页变成<a>
		$(arr[cur_page-1]).replaceWith('<a href="javascript:;" onclick="getbypage('+cur_page+')">'+cur_page+'</a>');
		//当前页变成<strong>
		$(arr[page-1]).replaceWith("<strong>"+page+"</strong>");
		cur_page = page;
	});
}

//上架
function isShow(){
	//请至少选择一个
	var size = $("input[name='ids']:checked").size();
	if(size == 0){
		alert("请至少选择一个");
		return;
	}
	//你确定删除吗
	if(!confirm("你确定上架吗")){
		return;
	}
	//提交 Form表单
	$("#jvForm").attr("action","/brand/isShow.do");
	$("#jvForm").attr("method","post");
	$("#jvForm").submit();
	
}
function myselect(){
	var myname = $("#myname").val();
	var mybrandid = Number($("#brandid").val());
	var myisshow = Number($("#isshow").val());
	//alert(myname+","+mybrandid+","+myisshow);
	var is_new="";
	$.post("<%=basePath%>adminproduct/select",
	{name:myname,brandid:mybrandid,isshow:myisshow},function(data){
		var is_new = "";
		var is_hot = "";
		var is_commend = "";
		var is_show = ""; 
		var arr = eval(data);
		//alert(arr.length);
		var html = "";
		for(var i=0; i<arr.length;i++){
			is_new = arr[i].is_new == true?"是":"否";
			is_hot = arr[i].is_hot == true?"是":"否";
			is_commend = arr[i].is_commend == true?"是":"否";
			is_show = arr[i].is_show == true?"上架":"下架";
			
			html += '<tr bgcolor="#ffffff" onmouseover="this.bgColor=\'#eeeeee\'" onmouseout="this.bgColor=\'#ffffff\'">'+
			'<td><input type="checkbox" name="ids" value="'+arr[i].id+'"/></td>'+
			'<td>'+arr[i].id+'</td>'+
			'<td align="center">'+arr[i].name+'</td>'+
			'<td align="center"><img width="50" height="50" src="<%=basePath %>bbs'+arr[i].imgs[0]+'"/></td>'+
			'<td align="center">'+is_new+'</td>'+
			'<td align="center">'+is_hot+'</td>'+
			'<td align="center">'+is_commend+'</td>'+
			'<td align="center">'+is_show+'</td>'+
			'<td align="center">'+
			'<a href="#" class="pn-opt">查看</a> | <a href="#" class="pn-opt">修改</a> | <a href="#" onclick="if(!confirm(\'您确定删除吗？\')) {return false;}" class="pn-opt">删除</a> | <a href="<%=basePath%>adminsku/getsku?productid='+arr[i].id+'" class="pn-opt">库存</a>'+
			'</td>'+
			'</tr>';
		}
		
		$("#tbody").html(html);
	});
}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 商品管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="window.location.href='<%=basePath%>admin/console/product/add.jsp'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">

名称: <input type="text" name="name" id="myname"/>
	<select name="brandId" id="brandid" id="mybrandid">
		<option value="">请选择品牌</option>
		<option value="1">依琦莲</option>
		<option value="2">凯速（KANSOON）</option>
	</select>
	<select name="isShow" id="isshow">
		<option value="1">上架</option>
		<option selected="selected" value="0">下架</option>
	</select>
	<input type="button" class="query" value="查询" onclick="myselect()"/>
	
<form id="jvForm">
<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onclick="Pn.checkbox('ids',this.checked)"/></th>
			<th>商品编号</th>
			<th>商品名称</th>
			<th>图片</th>
			<th width="4%">新品</th>
			<th width="4%">热卖</th>
			<th width="4%">推荐</th>
			<th width="4%">上下架</th>
			<th width="12%">操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody" id="tbody">
	<c:forEach items="${data }" var="p">
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="ids" value="73"/></td>
			<td>${p.id}</td>
			<td align="center">${p.name }</td>
			<td align="center"><img width="50" height="50" src="<%=basePath %>bbs${p.imgs[0]}"/></td>
			<td align="center">${p.is_new==true?'是':'否'}</td>
			<td align="center">${p.is_hot==true?'是':'否'}</td>
			<td align="center">${p.is_commend==true?'是':'否'}</td>
			<td align="center">${p.is_show==true?'上架':'下架'}</td>
			<td align="center">
			<a href="#" class="pn-opt">查看</a> | <a href="#" class="pn-opt">修改</a> | 
			<a href="#" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> | 
			<a href="<%=basePath%>adminsku/getsku?productid=${p.id}" class="pn-opt">库存</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="page pb15">
	<span class="r inb_a page_b">
	
		<a href="javascript:;" onclick="shouye()"><font size="2">首页</font></a>
	
		<a href="javascript:;" onclick="prev()"><font size="2">上一页</font></a>
		<span id="myspan">
			<strong>1</strong>
			<a href="javascript:;" onclick="getbypage(2)">2</a>
			<a href="javascript:;" onclick="getbypage(3)">3</a>
			<a href="javascript:;" onclick="getbypage(4)">4</a>
			<a href="javascript:;" onclick="getbypage(5)">5</a>
		</span>
		<a href="javascript:;" onclick="next()"><font size="2">下一页</font></a>
		
		<a href="javascript:;" onclick="weiye()"><font size="2">尾页</font></a>
	
		共<var id="total">5</var>页 到第<input type="text" size="3" id="pageno"/>页 
		<input type="button" onclick="tiao()" value="确定" class="hand btn60x20" id="skip"/>
	
	</span>
</div>
<div style="margin-top:15px;"><input class="del-button" type="button" value="删除" onclick="optDelete();"/><input class="add" type="button" value="上架" onclick="isShow();"/><input class="del-button" type="button" value="下架" onclick="isHide();"/></div>
</form>
</div>
</body>
</html>