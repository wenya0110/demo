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
<title>${product.name }- 新巴巴</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>bbs/css/babasport.css"/>
<link href="<%=basePath %>bbs/css/a.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="<%= basePath %>bbs/css/pshow.css" media="all" />
<script type="text/javascript" src="<%=basePath %>bbs/js/jquery-1.6.4.js"></script>
<script type="text/javascript">
var skuId;
var colorId;
function jianshao(){
	//alert("减少");
	var num = $("#buy-num").val();
	if (Number(num) > 1){
		$("#buy-num").val(Number(num)-1);
	}
}
function zengjia(){
	//获取购买上限
	var upperlimit;
	var num = $("#buy-num").val();
	<c:forEach items="${skus }" var="sku">
		//alert("skuid="+skuId+",库存列表当前的id"+${sku.id});
		if(skuId == ${sku.id} ){
			upperlimit = Number(${sku.upperLimit});
		}
	</c:forEach>
	if( Number(num) < upperlimit){
		$("#buy-num").val(Number(num)+1);
	}	
}

function xianzhi(){
	var num = Number( $("#buy-num").val() );//获取输入的值
	//1.输入的值是小于等于0
	if(num <= 0){
		$("#buy-num").val(1);
	}
	//2.输入的值大于购买限制
	//获取购买上限
	var upperlimit;
	<c:forEach items="${skus }" var="sku">
		//alert("skuid="+skuId+",库存列表当前的id"+${sku.id});
		if(skuId == ${sku.id} ){
			upperlimit = Number(${sku.upperLimit});
		}
	</c:forEach>
	if( num > upperlimit){
		$("#buy-num").val(upperlimit);
	}
	
}

window.pageConfig = {
	compatible : true,
	product : {
		skuid : 1221882,
		name : '\u957f\u8679\uff08\u0043\u0048\u0041\u004e\u0047\u0048\u004f\u004e\u0047\uff09\u004c\u0045\u0044\u0034\u0032\u0035\u0033\u0038\u0045\u0053\u0020\u0034\u0032\u82f1\u5bf8\u0020\u7a84\u8fb9\u84dd\u5149\u004c\u0045\u0044\u6db2\u6676\u7535\u89c6\uff08\u9ed1\u8272\uff09',
		skuidkey : 'E804B1D153D29E36088A33A134D85EEA',
		href : 'http://item.jd.com/1221882.html',
		src : 'jfs/t304/157/750353441/93159/e4ee9876/54227256N20d4f5ec.jpg',
		cat : [ 737, 794, 798 ],
		brand : 20710,
		nBrand : 20710,
		tips : false,
		type : 1,
		venderId : 0,
		shopId : '0',
		TJ : '0',
		specialAttrs : [ "HYKHSP-0", "isHaveYB", "isSelfService-0",
				"isWeChatStock-0", "isCanUseJQ", "isOverseaPurchase-0",
				"YuShou", "is7ToReturn-1", "isCanVAT" ],
		videoPath : '',
		HM : '0'
	}
};
$(function(){
	
	$("#colors a:first").trigger("click");
});
//全局变量
//skuId
var skuId;
var colorId;

//点击颜色  颜色的ID == id
function colorToRed(target,id){
	colorId = id;
	$("#buy-num").val(1);
	//清理红色
	//所有颜色 a 标签 全部变成白色
	$("#colors div").removeClass("selected");
	$(target).addClass("selected");
	
	//清理尺码 不可点
	$("#sizes div").removeClass("selected");
	//标识
	var flag = 0;
	
	var html = '';
	// 此颜色对应哪些有货的尺码 
	<c:forEach items="${skus }" var="sku">
		//颜色Id
		if(id == '${sku.colorId}'){  //库存里有该颜色
			//第一次变成红 
			if(flag == 0){
				html += '<div class="item selected" onclick="sizeToRed(this,\'${sku.size}\')"><b></b>';
			    html += '<a href="javascript:;" title="${sku.size}" >${sku.size}</a></div>';
				flag = 1;
				//设置售价
				$("#bbs-price").html('￥' + '${sku.price}');
				//skuId
				skuId = '${sku.id}';
				
			}else{
				html += '<div class="item" onclick="sizeToRed(this,\'${sku.size}\')"><b></b>';
			   	html += '<a href="javascript:;" title="${sku.size}" >${sku.size}</a></div>';
			}
		}
	</c:forEach>
	$("#sizes").html(html);
	
}
//点击尺码  id == 尺码 ID
function sizeToRed(target,id){
	$("#buy-num").val(1);
	//清理尺码 不可点
	$("#sizes div").removeClass("selected");
	$(target).addClass("selected");
	//设置价格
	<c:forEach items="${skus }" var="sku">
		//判断颜色及尺码 
		if(id == '${sku.size}' && colorId == '${sku.colorId}'){
			//设置售价
			$("#bbs-price").html('￥' + '${sku.price}');
			//skuId
			skuId = '${sku.id}';
		}
	</c:forEach>
	
}

//加入购物车
function addCart(){
	//获取选中的尺码
	var size = '';
	var arr = $("#sizes").children();
	for(var i=0;i<arr.length;i++){
		if( $(arr[i]).hasClass("selected") ){
			size = $( $(arr[i]).children()[1]).html();
		}
	}
	//获取价格
	var price = $("#bbs-price").html();
	price = price.substring(1);
	
	//发ajax请求 "/cart/addone"
	$.post("<%=basePath %>cart/addone",{
	buyerid:     1,
	productid:   ${product.id},
	num:         $("#buy-num").val(),
	colorid:     colorId,
	sizename:    size,
	babaprice:   Number(price),
	price:       Number(price),
	isdel:       0
	},function(){
		//发送Ajax请求成功后，回调函数
		$("#shopping-amount").html( Number($("#shopping-amount").html())+Number($("#buy-num").val()));
	});
	
}
</script>
</head>
<body>
<!-- header start -->
<jsp:include page="commons/header.jsp" />
<!-- header end -->
	<div class="w">
		<div class="breadcrumb">
			<strong>
				<a href="javascript:;">运动户外</a>
			</strong>
			<span>&nbsp;&gt;&nbsp;
				<a href="javascript:;">健身训练</a>&nbsp;&gt;&nbsp;
				<a href="javascript:;">瑜伽舞蹈</a>&nbsp;&gt;&nbsp;
			</span>
			<script type="text/javascript">
				pageConfig.product.cat = [ 737, 794, 798 ];
			</script>
			<span><a href="javascript:;">${product.brandname }</a>&nbsp;&gt;&nbsp;<a
				href="javascript:;">${product.name }</a>
			</span>
		</div>
	</div>
	<!--breadcrumb end-->
	<div class="w">
		<div id="product-intro">
			<div id="name">
				<h1>${product.name }</h1>
				<strong>${product.name}</strong>
			</div>
			<!--name end-->
			<div class="clearfix">
				<ul id="summary">
					<li id="summary-price">
						<div class="dt">巴&nbsp;巴&nbsp;价：</div>
						<div class="dd">
							<strong class="p-price" id="bbs-price">￥888.00</strong> <a
								id="notice-downp" href="#none" target="_blank">(降价通知)</a>
						</div>
					</li>
					<li id="summary-market"><div class="dt">商品编号：</div>
						<div class="dd">
							<span>${product.id }</span>
						</div></li>
					<li id="summary-grade">
						<div class="dt">商品评分：</div>
						<div class="dd">
							<span class="star  sa0"></span><a href="javascript:;"></a>
						</div>
					</li>
					<!-- 商品评分-->
					<li id="summary-stock" style="display: none;">
						<div class="dt">配&nbsp;送&nbsp;至：</div>
						<div class="dd">
							<div id="store-selector" class="">
								<div class="text">
									<div></div>
									<b></b>
								</div>
								<div class="content">
									<span class="clr"></span>
								</div>
								<div class="close"
									onclick="$('#store-selector').removeClass('hover')"></div>
							</div>
							<!--store-selector end-->
							<div id="store-prompt"></div>
							<!--store-prompt end--->
						</div> <span class="clr"></span>
					</li>
					<li id="summary-service" class="hide">
						<div class="dt">服&#x3000;&#x3000;务：</div>
						<div class="dd">由 新巴巴 发货并提供售后服务。</div>
					</li>
					<li id="summary-tips" class="hide">
						<div class="dt">温馨提示：</div>
						<div class="dd"></div>
					</li>
					<li id="summary-gifts" class="hide">
						<div class="dt">赠&#x3000;&#x3000;品：</div>
						<div class="dd"></div>
					</li>
					<li id="summary-promotion-extra" class="none">
						<div class="dt">促销信息：</div>
						<div class="dd"></div>
					</li>
					
				</ul>
				<!--summary end-->
				<div id="choose" class="clearfix p-choose-wrap">
			<div id="choose-color" class="li choose-color-shouji p-choose">
				<div class="dt">选择颜色：</div>
				<div class="dd" id="colors">
				  <c:forEach items="${colors }" var="color">
					<div class="item" onclick="colorToRed(this,'${color.id}')">
						<b></b>
						<a href="javascript:;" title="${color.name }" >
						<img data-img="1"
							src="<%=basePath %>bbs/images/53f44cc2N0b714cb2_002.jpg"
							alt="灰色三件套" height="25" width="25"/><i>${color.name }</i></a>
					</div>
				  </c:forEach>
				</div>
			</div>
			<div id="choose-version" class="li p-choose">
				<div class="dt">选择尺码：</div>
				<div class="dd" id="sizes">
					<c:forEach items="${product.sizearr }" var="ss">
						<div class="item" id="${ss }" onclick="sizeToRed(this,'${ss}')">
						<b></b>
							<a href="javascript:;" >${ss }</a>
					    </div>
					</c:forEach>
				</div>
			</div>
				<!--brand-bar-->
				<ul id="choose">
					<li id='choose-type'></li>
					<li id="choose-amount">
						<div class="dt">购买数量：</div>
						<div class="dd">
							<div class="wrap-input">
								<a class="btn-reduce" href="javascript:;"
									onclick="jianshao()">减少数量</a> 
								<a class="btn-add" href="javascript:;"
									onclick="zengjia()">增加数量</a> 
								<input class="text" id="buy-num" value="1" onkeyup="xianzhi()" />
							</div>
						</div>
					</li>
					<li id="choose-btns">
						<div id="choose-btn-append" class="btn">
							<a class="btn-append" href="javascript:;" onclick="addCart()">加入购物车<b></b></a>
						</div>
						<div id="choose-btn-easybuy" class="btn"></div>
						<div id="choose-btn-divide" class="btn"></div>
					</li>
				</ul>
				<!--choose end-->
				<span class="clr"></span>
			</div>

			<div id="preview">
				<div id="spec-n1" class="jqzoom"
					clstag="shangpin|keycount|product|spec-n1">
					<img data-img="1" width="350" height="350" src="<%=basePath %>bbs${product.imgs[0]}"
						alt="${product.name}" jqimg="<%=basePath %>bbs${product.imgs[0]}" />
				</div>

				<div id="spec-list" clstag="shangpin|keycount|product|spec-n5">
					<a href="javascript:;" class="spec-control" id="spec-forward"></a>
					<a href="javascript:;" class="spec-control" id="spec-backward"></a>
					<div class="spec-items">
						<ul class="lh">
							<c:forEach items="${product.imgs}" var="pic" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0 }">
										<li><img data-img="1" class="img-hover"
											alt="<%=basePath %>bbs${product.name}" src="<%=basePath %>bbs${pic}" width="50" height="50"/></li>
									</c:when>
									<c:otherwise>
										<li><img data-img="1" alt="<%=basePath %>bbs${product.name}" src="<%=basePath %>bbs${pic}"
											width="50" height="50" /></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="short-share">
					<div id="view-bigimg" class="fl">
						<b></b><a href="<%=basePath %>bbs/images/example1.jpg"
							target="_blank">查看大图</a>
					</div>
					<div id="share-list" class="share-list"
						clstag="shangpin|keycount|product|share">
						<div class="share-bd">
							<em class="share-hd">分享到：</em>
							<ul class="share-list-item clearfix">
								<li><a href="javascript:;" id="site-sina" title="分享到新浪微博">新浪微博</a></li>
								<li><a href="javascript:;" id="site-qq" title="分享到给QQ好友">QQ</a></li>
								<li><a href="javascript:;" id="site-qzone" title="分享到腾讯微博">腾讯微博</a></li>
								<li><a href="javascript:;" id="site-renren" title="分享到人人网">人人网</a></li>
								<li><a href="javascript:;" id="site-kaixing" title="分享到开心网">开心网</a></li>
								<li><a href="javascript:;" id="site-douban" title="分享到豆瓣">豆瓣</a></li>
								<li><a href="javascript:;" id="site-msn" title="分享给MSN好友">MSN</a></li>
								<li><a href="javascript:;" id="site-email" title="邮件分享给好友">邮件</a></li>
							</ul>
						</div>
						<div class="share-ft">
							<b></b>
						</div>
					</div>
					<div class="clb"></div>
				</div>
			</div>
			<!--preview end-->
		</div>
		<!--product-intro end-->
	</div>
	<div class="w">
		<div class="right">
			<div id="product-detail" class="m m1" data-widget="tabs"
				clstag="shangpin|keycount|product|detail">
				<div class="mt">
					<ul class="tab">
						<li clstag="shangpin|keycount|product|pinfotab"
							data-widget="tab-item" class="curr"><a href="javascript:;">商品介绍</a></li>
						<li clstag="shangpin|keycount|product|pcanshutab"
							data-widget="tab-item"><a href="javascript:;">规格参数</a></li>
						<li clstag="shangpin|keycount|product|packlisttab"
							data-widget="tab-item"><a href="javascript:;">包装清单</a></li>
						<li clstag="shangpin|keycount|product|pingjiatab"
							data-widget="tab-item"><a href="javascript:;">商品评价</a></li>
						<li clstag="shangpin|keycount|product|psaleservice"
							data-widget="tab-item"><a href="javascript:;">售后保障</a></li>
						<li clstag="shangpin|keycount|product|zhinan"
							data-widget='tab-item'><a href='javascript:;'>京博士</a></li>
					</ul>
				</div>
				<div class="mc" data-widget="tab-content" id="product-detail-1">
					<ul class="detail-list">
                        <li>商品名称：格宁 瑜伽服女套装广场舞服装三件套修身显瘦气质款运动服 G4022浅紫+深紫+深紫 L</li>
    					<li title="1479973148">商品编号：1479973148</li>
                        <li title="淘梦服饰专营店">店铺： <a href="http://mall.jd.com/index-110420.html" target="_blank">淘梦服饰专营店</a></li>
                        <li title="2015-03-12 13:55:49">上架时间：2015-03-12 13:55:49</li>
             		    <li title="0.6kg">商品毛重：0.6kg</li>
                        <li title="G4022">货号：G4022</li>
                        <li title="环保人棉">材质：环保人棉</li>
		                <li title="100-149">价位：100-149</li>
		                <li title="女士">适用人群：女士</li>
		                <li title="瑜伽服">类别：瑜伽服</li>
					</ul>
					<div class="detail-correction">
						<b></b>如果您发现商品信息不准确，欢迎纠错
					</div>
					<div id="item-desc" class="detail-content">
						${product.description }</div>
				</div>
				<div class="mc hide" data-widget="tab-content" id="product-detail-2"></div>
				<div class="mc  hide" data-widget="tab-content"
					id="product-detail-3">
					<div class="item-detail">${product.package_list }</div>
				</div>
				<div class="mc  hide" data-widget="tab-content"
					id="product-detail-4"></div>
				<div class="mc hide " data-widget="tab-content"
					id="product-detail-5">
					<div class="item-detail">
						本产品全国联保，享受三包服务，质保期为：一年质保<br />本产品提供上门安装调试、提供上门检测和维修等售后服务，自收到商品之日起，如您所购买家电商品出现质量问题，请先联系厂家进行检测
						，凭厂商提供的故障检测证明，在“我的新巴巴-客户服务-返修退换货”页面提交退换申请，将有专业售后人员提供服务。新巴巴承诺您：30天内可为您退货或换货，180天内无需修理直接换货，超过180天按国家三包规定享受服务。<br />您可以查询本品牌在各地售后服务中心的联系方式，<a
							class="link_1" href="http://www.changhong.com">请点击这儿查询......</a><br />
						<br />售后服务电话：400-811-1666<br />品牌官方网站：<a
							href="http://www.changhong.com" target="_blank">http://www.changhong.com</a>

					</div>
				</div>
				<div id="product-detail-6" class="mc hide" data-widget="tab-content"></div>
				<!--知识库二级标签、标题-->
				<div id="promises">
					<strong>服务承诺：</strong><br />
					新巴巴向您保证所售商品均为正品行货，新巴巴自营商品开具机打发票或电子发票。凭质保证书及新巴巴发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由新巴巴联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。新巴巴还为您提供具有竞争力的商品价格和<a
						href="http://www.jd.com/help/kdexpress.aspx" target="_blank">运费政策</a>，请您放心购买！
					<br />
					<br />
					注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
				</div>
				<div id="state">
					<strong>权利声明：</strong><br />新巴巴上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是新巴巴重要的经营资源，未经许可，禁止非法转载使用。
					<p>
						<b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。
					</p>
				</div>
			</div>
			<!--product-detail end-->
		</div>
		<!--right end-->
		<div class="left">
		<div class="mc"> 
		    <ul>            
		    	<li data-push="1"  class="fore1">
		    	    <div class="p-img"> 
		    	       <a href="//item.jd.com/1409519600.html" title="" target="_blank">
		    	       <img width="160" height="160" data-lazy-img="done" alt="" src="//img10.360buyimg.com/n2/jfs/t1546/262/352310690/199216/a1b1ed81/55779165Nb9a1d958.jpg" class=""/>                    
		    	      </a>                
		    	    </div>                
		    	    <div class="p-name">
		    	     <a href="//item.jd.com/1409519600.html" title="" target="_blank">
		    	     	皮尔瑜伽pieryoga 秋冬舞蹈家居瑜伽服女套装胸垫41343 短橘桃+41868橘桃 M
		    	     </a>
		    	    </div>                
		    	    <div class="p-price">
		    	    	<strong class="J-p-1409519600">￥129.00</strong>
		    	    </div>            
		    	 </li>            
		    	 <li data-push="2" class="fore2">                
		    	  	<div class="p-img"> 
		    	  	   <a href="//item.jd.com/1635706164.html"  target="_blank">
		    	  	    <img width="160" height="160" data-lazy-img="done" alt="" src="//img14.360buyimg.com/n2/jfs/t1441/191/717818107/191061/52fde152/55a4e8a6Nd90a8abb.jpg" class=""/> 
		    	  	   </a>               
		    	  	</div> 
		    	  	<div class="p-name">
		    	  	<a href="//item.jd.com/1635706164.html" title="" target="_blank">
		    	  	皮尔瑜伽pieryoga 2015春夏舞蹈家居瑜伽服女套装胸垫53406M 柔和蓝+水墨兰 M
		    	  	</a>
		    	  	</div>                
		    	  	<div class="p-price">
		    	  		<strong class="J-p-1635706164">￥228.00</strong>
		    	  	</div>            
		    	  </li>    
		    	  </ul>
		    	  </div>
		    	  </div>  
		</div>
		<!--left end-->
		<span class="clr"></span>
	</div>
	<!-- footer start -->-
	<jsp:include page="commons/footer.jsp" />
	<!-- footer end -->
	<script type="text/javascript" src="<%=basePath %>bbs/js/lib-v1.js"></script>
	<script type="text/javascript" src="<%=basePath %>bbs/js/product.js"></script>
	<script type="text/javascript" src="<%=basePath %>bbs/js/iplocation_server.js"></script>
</body>
</html>