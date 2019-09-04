<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" src="<%=basePath %>bbs/js/jquery-1.6.4.js"></script>
<script type="text/javascript" src="<%=basePath %>admin/js/jquery.form.js"></script>
<title>babasport-add</title>
<style type="">
.h2_ch a:hover, .h2_ch a.here {
    color: #FFF;
    font-weight: bold;
    background-position: 0px -32px;
}
.h2_ch a {
    float: left;
    height: 32px;
    margin-right: -1px;
    padding: 0px 16px;
    line-height: 32px;
    font-size: 14px;
    font-weight: normal;
    border: 1px solid #C5C5C5;
    background: url('/images/admin/bg_ch.gif') repeat-x scroll 0% 0% transparent;
}
a {
    color: #06C;
    text-decoration: none;
}
</style>
<script type="text/javascript">
$(function(){
	//加载颜色
	$.post("<%=basePath%>admincolor/getcolors",function(data){
		var o = eval(data);
		var s = "";
		for(var i=0;i<o.length;i++){
			s+='<input type="checkbox" value="'+o[i].id +'" name="colorarr"/>'+o[i].name;
		}
		$("#colortd").html(s);
	});
	//加载品牌
		$.post("<%=basePath%>adminbrand/getbrands",function(data){
		var o = eval(data);
		var s = '<option value="">请选择品牌</option>';
		for(var i=0;i<o.length;i++){
			s+='<option value="'+o[i].id+'">'+o[i].name+'</option>';
		}
		$("#brandid").html(s);
	});
	
	//---------------以下是tab标签点击切换界面的代码----------------------
	var tObj;
	$("#tabs a").each(function(){
		if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
		$(this).click(function(){
			var c = $(this).attr("class");
			if(c.indexOf("here") == 0){return;}
			var ref = $(this).attr("ref");
			var ref_t = tObj.attr("ref");
			tObj.attr("class","nor");
			$(this).attr("class","here");
			$(ref_t).hide();
			$(ref).show();
			tObj = $(this);
			if(ref == '#tab_3'){
				// 编辑器参数
		 		var kingEditorParams = {
					//指定上传文件参数名称
					filePostName  : "uploadFile",
					//指定上传文件请求的url。
					uploadJson : '/upload/uploadFck.do',
					//上传类型，分别为image、flash、media、file
					dir : "image"//,
// 					width : '1000px',
// 					height : '400px'
				}; 
				KindEditor.create('#productdesc',kingEditorParams);
				KindEditor.sync();
			}
		});
	});
});
//上传商品图片
function uploadPic(){
	//上传图片 异步的  	Jquery.form.js
	var options = {
			url : "<%=basePath %>adminproduct/uploadfiles",
			type : "post",
			dataType : "json",
			success : function(data){
				//多图片回显
				var html = '<tr>'
						 + '<td width="20%" class="pn-flabel pn-flabel-h"></td>'
						 + '<td width="80%" class="pn-fcontent">';
				for(var i=0;i<data.length;i++){
					html += '<img width="100" height="100" src="<%=basePath%>bbs' + data[i] + '" />'
					     +  '<input type="hidden" name="imgs" value="' + data[i] + '"/>'
				}
				html += '<a href="javascript:;" class="pn-opt" onclick="jQuery(this).parents(\'tr\').remove()">删除</a>'
					 +  '</td>'
					 +  '</tr>';
				//回显
				$("#tab_2").append(html);
				
			}
	}
	$("#jvForm").ajaxSubmit(options);
}
//上传商品描述图片
function uploadPic1(){
	//上传图片 异步的  	Jquery.form.js
	var options = {
			url : "<%=basePath %>adminproduct/uploadfiles1",
			type : "post",
			dataType : "json",
			success : function(data){
				//多图片回显
				var html = '<tr>'
						 + '<td width="20%" class="pn-flabel pn-flabel-h"></td>'
						 + '<td width="80%" class="pn-fcontent">';
				for(var i=0;i<data.length;i++){
					var tmp = "<img src='<%=basePath %>bbs" +data[i]+ "'/>";
					html += '<img width="100" height="100" src="<%=basePath%>bbs' + data[i] + '" />'
					     +  '<input type="hidden" name="descurlarr" value="' + tmp + '"/>'
				}
				html += '<a href="javascript:;" class="pn-opt" onclick="jQuery(this).parents(\'tr\').remove()">删除</a>'
					 +  '</td>'
					 +  '</tr>';
				//回显
				$("#tab_3").append(html);
				
			}
	}
	$("#jvForm").ajaxSubmit(options);
}
function mysubmit(){
	//alert("1234");
	/*
	var arr = $("input[name=color]");
	var colors = "";
	for(var i=0;i<arr.length;i++){
		if( $(arr[i]).prop("checked")==true ){
			colors += arr[i].value + ",";
		}
	}
	colors = colors.substring(0,colors.length-1);
	//alert(colors);
	
	arr = $("input[name=size]");
	var sizes = "";
	for(var i=0;i<arr.length;i++){
		if($(arr[i]).prop("checked")==true){
			//alert(sizes);
			sizes += arr[i].value + ",";
		}
	}
	sizes = sizes.substring(0,sizes.length-1);
	$("#sizes").val(sizes);
	$("#colors").val(colors);
	*/
	//alert(sizes);
	$("#jvForm").submit();
}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 商品管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='v_list.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<h2 class="h2_ch"><span id="tabs">
<a href="javascript:void(0);" ref="#tab_1" title="基本信息" class="here">基本信息</a>
<a href="javascript:void(0);" ref="#tab_2" title="商品图片" class="nor">商品图片</a>
<a href="javascript:void(0);" ref="#tab_3" title="商品描述" class="nor">商品描述</a>
<a href="javascript:void(0);" ref="#tab_4" title="包装清单" class="nor">包装清单</a>
</span></h2>
<div class="body-box" style="float:right">
	<form id="jvForm" action="<%=basePath %>adminproduct/add" method="post" enctype="multipart/form-data">
		<input type="hidden" name="sizes" value="" id="sizes"/>
		<input type="hidden" name="colors" value="" id="colors"/>
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						商品类型:</td><td width="80%" class="pn-fcontent">
								<select name="typeId">
									<option value="">请选择</option>
									<option value="2">瑜珈服</option>
									<option value="3">瑜伽辅助</option>
									<option value="4">瑜伽铺巾</option>
									<option value="5">瑜伽垫</option>
									<option value="6">舞蹈鞋服</option>
									<option value="7">其它</option>
								</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						商品名称:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="name" maxlength="100" size="100"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						商品品牌:</td><td width="80%" class="pn-fcontent">
						<select name="brand_id" id="brandid"> </select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						商品毛重:</td><td width="80%" class="pn-fcontent">
						<input type="text" value="0.6" class="required" name="weight" maxlength="10"/>KG
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						颜色:
					</td>
						<td width="80%" class="pn-fcontent" id="colortd"> </td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						尺码:</td><td width="80%" class="pn-fcontent">
						<input type="checkbox" name="sizearr" value="S"/>S
						<input type="checkbox" name="sizearr" value="M"/>M
						<input type="checkbox" name="sizearr" value="L"/>L
						<input type="checkbox" name="sizearr" value="XL"/>XL
						<input type="checkbox" name="sizearr" value="XXL"/>XXL
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						状态:</td><td width="80%" class="pn-fcontent">
						<input type="checkbox" name="is_new" value="1"/>新品
						<input type="checkbox" name="is_commend" value="1"/>推荐
						<input type="checkbox" name="is_hot" value="1"/>热卖
					</td>
				</tr>
			</tbody>
			<tbody id="tab_2" style="display: none">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						上传商品图片(90x150尺寸):</td>
						<td width="80%" class="pn-fcontent">
						注:该尺寸图片必须为90x150。
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h"></td>
						<td width="80%" class="pn-fcontent">
						<input type="file" onchange="uploadPic()" name="pics" multiple="multiple"/>
					</td>
				</tr>
			</tbody>
			<tbody id="tab_3" style="display: none">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						上传商品描述图片(90x150尺寸):</td>
						<td width="80%" class="pn-fcontent">
						注:该尺寸图片必须为90x150。
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h"></td>
						<td width="80%" class="pn-fcontent">
						<input type="file" onchange="uploadPic1()" name="pics1" multiple="multiple"/>
					</td>
				</tr>
			</tbody>
			<tbody id="tab_4" style="display: none">
				<tr>
					<td >
						<textarea rows="20" cols="180" id="productList" name="packageList"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="button" class="submit" onclick="mysubmit()" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>