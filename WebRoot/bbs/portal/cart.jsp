<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta name="format-detection" content="telephone=no"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" href="<%=basePath %>bbs/css/base.css"/>
<link type="text/css" rel="stylesheet" href="<%=basePath %>bbs/css/a.css"/>
<link type="text/css" rel="stylesheet" href="<%=basePath %>bbs/css/a_002.css"/>
<link type="text/css" rel="stylesheet" href="<%=basePath %>bbs/css/a_003.css"/>
<link href="<%=basePath %>bbs/css/purchase.2012.css?v=201410141639" rel="stylesheet" type="text/css"/>
<title>我的购物车 - 新巴巴商城</title>
<script type="text/javascript" src="<%=basePath %>bbs/js/jquery-1.6.4.js"></script>

<script type="text/javascript">
$(function(){
	
})
function dels(){
	var ids = "";
	var a = $("input[type=checkbox]");
	for(var i=1;i<a.length;i++){
		if( $(a[i]).prop("checked") == true){
			ids += $(a[i]).val()+",";
			}
	}
	ids = ids.substring(0,ids.length-1);
	window.location.href="<%=basePath %>cart/dels?ids="+ids;
}

//全选 
function checkAll(checked){
	$("input[name=skuIds]").attr("checked",checked);
}
//结算
function trueBuy(){
	var cartids = "";
	var skuids = "";
	var nums = "";
	var a = $("input[type=checkbox]");
	var isChecked = false;
	for(var i=1;i<a.length;i++){
		if($(a[i]).prop("checked") == true){
			skuids+=$(a[i]).next().val()+",";
			cartids+=$(a[i]).val()+",";
			//当前input的父节点，第五个兄弟节点的子节点的第二个子节点就是num所在的input标签
			var parent = $(a[i]).parent();
			var arr = $(parent).next().next().next().next().next().children().children();
			nums += $(arr[1]).val()+",";
			isChecked = true;
		}
	}
	if(isChecked == true){
		skuids = skuids.substring(0,skuids.length-1);
		cartids = cartids.substring(0,cartids.length-1);
		nums = nums.substring(0,nums.length-1);
		window.location.href="<%=basePath %>order/getorder?nums="+nums+"&cartids="+cartids+"&skuids="+skuids;
	}else{
		alert("请勾选购物车中的想要结算的商品！");
	}
	
}
</script>
</head>
<body>
	<!--shortcut start-->
	<jsp:include page="commons/shortcut.jsp" />
	<!--shortcut end-->
	<div class="w w1 header clearfix">
		<div id="logo">
			<a href="/"><img
				src="<%=basePath %>bbs/images/XBB2.png" title="返回新巴巴商城首页" alt="返回新巴巴商城首页" /></a>
		</div>
		<div class="language">
			<a href="javascript:void(0);" onclick="toEnCart()"></a>
		</div>
		<div class="progress clearfix">
			<ul class="progress-1">
				<li class="step-1"><b></b>1.我的购物车</li>
				<li class="step-2"><b></b>2.填写核对订单信息</li>
				<li class="step-3">3.成功提交订单</li>
			</ul>
		</div>
	</div>
<c:if test="${fn:length(data) != 0}">
	<div class="w cart">
		<div class="cart-hd group">
			<h2>我的购物车</h2>
		</div>
		<form id="jvForm" action="/buyer/trueBuy" method="post">
		<div id="show">
			<div class="cart-frame">
				<div class="tl"></div>
				<div class="tr"></div>
			</div>
			<div class="cart-inner">
				<div class="cart-thead clearfix">
					<div class="column t-checkbox form">
						<input type="checkbox" onclick="checkAll(checked)"></input> <label
							for="toggle-checkboxes_up">全选</label>
					</div>
					<div class="column t-goods">商品</div>
					<div class="column t-price">新巴巴价</div>
					<div class="column t-promotion">优惠</div>
					<div class="column t-inventory">库存</div>
					<div class="column t-quantity">数量</div>
					<div class="column t-action">操作</div>
				</div>
				<div id="product-list" class="cart-tbody">
					<!-- ************************商品开始********************* -->
					<c:set var="totalnum" value="0"></c:set>
					<c:set var="tprice" value="0"></c:set>
					<c:set var="free" value="0"></c:set>
					<c:forEach items="${data}" var="item">
						<c:set var="totalnum" value="${totalnum+item.num}"></c:set>
						<c:set var="tprice" value="${tprice+item.num*item.price}"></c:set>
						<c:set var="fee" value="${fee+10}"></c:set>
						<div id="product_11345721" class="item item_selected ">
							<div class="item_form clearfix">
								<div class="cell p-checkbox">
									<input class="checkbox" type="checkbox" name="skuIds" value="${item.id }" />
									<input type="hidden" value="${item.skuid }"/>
								</div>
								<div class="cell p-goods">
									<div class="p-img">
										<a href="javascript:;" target="_blank"> <img
											src="<%=basePath %>bbs${item.imgs[0]}"
											alt="${item.productname}" width="52" height="52"></a>
									</div>
									<div class="p-name">
										<a href="javascrip:;"> ${item.productname}--
											${item.colorname }-- ${item.sizename } </a>
									</div>
								</div>
								<div class="cell p-price">
									<span class="price"> ¥${item.price} </span>
								</div>
								<div class="cell p-price"><span class="price"> ¥${item.price} </span></div>
								<div class="cell p-inventory stock-11345721">有货</div>
								<div class="cell p-quantity" for-stock="for-stock-11345721">
									<div class="quantity-form">
										<a href="javascript:void(0);" class="decrement">-</a> <input
											value="${item.num }" type="text" class="quantity-text">
											<a href="javascript:void(0);" class="increment">+</a>
									</div>
								</div>
								<div class="cell p-remove">
									<a class="cart-remove" href="<%=basePath %>cart/del?id=${item.id}" >删除</a>
								</div>
							</div>
						</div>
					</c:forEach>
				<c:set var="totalprice" value="${fee+tprice}"></c:set>
				</div>
				<!-- product-list结束 -->
				<div class="cart-toolbar clearfix">
					<div class="total fr">
						<p>
							<span class="totalSkuPrice">¥<c:out value="${tprice}"></c:out></span>商品金额：
						</p>
						<p>
							<span id="totalRePrice">¥<c:out value="${fee}"></c:out></span>运费：
						</p>
					</div>
					<div class="amout fr">
						<span id="selectedCount"><c:out value="${totalnum}"></c:out></span> 件商品
					</div>
				</div>
				<div class="ui-ceilinglamp-1" style="width: 988px; height: 49px;">
					<div class="cart-dibu ui-ceilinglamp-current"
						style="width: 988px; height: 49px;">
						<div class="control fdibu fdibucurrent">
						 <span class="delete"> 
						 	<b></b><a href="javascript:void(0);" onclick="dels()">删除选中的商品</a>
						</span> 
						<span class="shopping"> 
							<b></b><a href="/">继续购物</a>
						</span>
						</div>
						<div class="cart-total-2014">
							<div class="cart-button">
								<span class="check-comm-btns">
									<a class="checkout" onclick="trueBuy()">去结算<b></b></a>
								</span>
							</div>
							<div class="total fr">
								总计： <span class="totalSkuPrice">¥<c:out value="${totalprice }"></c:out></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- cart-inner结束 -->
		</div>
		</form>
	</div>
</c:if>
<c:if test="${fn:length(data) == 0}">
<div class="cart" id="container">
<div class="w" >	
	<div class="cart-empty">
		<div class="message">
			<ul>
				<li class="txt">
					购物车内暂时没有商品，登录后将显示您之前加入的商品
				</li>
				<li>
					<a class="btn-1 login-btn mr10" href="#none">登录</a>
					<a class="ftx-05" href="/">去购物&gt;</a>
				</li>
			</ul>
		</div>	
	</div>
</div>
</div>
</c:if>
<!--推荐位html修改处-->
<script type="text/javascript" src="/js/base-v1.js"></script>
<!-- footer start -->
<jsp:include page="commons/footer.jsp" />
<!-- footer end -->

</body>
</html>