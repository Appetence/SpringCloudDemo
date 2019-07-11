<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>主页</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />

<link rel="stylesheet" type="text/css"
	href="/Qiqiang/static/css/iconfont.css">
<style>
.sec {
	position: relative;
	border-bottom: 1px solid #ccc;
}

section div {
	display: inline-block;
	padding: 13px;
	vertical-align:middle;
}

.arr-right {
	display: block;
	position: absolute;
	right: 0.15rem;
	width: 0.14rem;
	height: 0.24rem;
	background-size: 0.14rem 0.24rem;
}
section .iconfont {
	color:#48a3da;
	font-size: 20px;
}
.mytop{
    margin-top:10px;;
	border-top:1px solid #ccc;
}
</style>
</head>
<body>
	<div class="container">
	<c:choose>
	  	<c:when test="${sessionScope.selectInfo != null }">
		  <input type="hidden" id="footKey" value="single">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="footKey" value="all">
		</c:otherwise>
	  </c:choose>
		<div class="row">
		<c:choose>
	  	<c:when test="${sessionScope.selectInfo == null }">
	  	<div class="row"
						style="margin:0rem 0rem 0rem 0rem;width: 100%;text-align:center;height:180px;vertical-align:middle;padding-top: 55px;background-color: #48a3da;color:white;">
						<span>今日收益（元）</span><br>
						<span style="font-size:40px"><c:if test="${profit==null or profit=='' }">0.00</c:if>
						<c:if test="${profit!=null and profit!='' }"><fmt:formatNumber value="${profit}" pattern="#,#00.00#"/></c:if></span>
					</div>
	  	</c:when>
	  	<c:otherwise>
			<div class="col-md-12 bcg-head "
				style="display:flex;padding-left:0px;padding-right:0px;	">
				<div class="col-md-2" style="padding-right: 0px;">
					<img src="${selInfo.headimgurl }" alt="" style="    margin-top: 50%; ">
				</div>
				<div class="col-md-10" style='    width: 80%;display:flex'>
					<div class="col-md-8"
						style="width: 80%; padding-right: 0px;margin-top: 16%;margin-bottom:10%">
						<div class="col-md-12"
							style="padding-left:0px;padding-right:0px;height:40px;">
							<span class="iconfont  icon-kehuxinxi"
								style="font-size: 16px!important;"></span> <span>${selInfo.name
								}</span>
						</div>
						<div class="col-md-12" style="padding-left:0px;padding-right:0px;white-space:nowrap;">
							<span class="iconfont  icon-huiyuanqia-xianxing"
								style="font-size: 16px!important;"></span> <span>${selInfo.mobile
								}</span>
						</div>
					</div>
					<div class="col-md-4" style="padding-right: 0px;margin-top: 16%">
						<div class="col-md-12"
							style="padding-left:0px;padding-right:0px;height:40px;">
							<span class="iconfont  icon-che"
								style="font-size: 16px!important;"></span> <span><c:if test='${fn:contains(selInfo.plateno," ")}'>${fn:substringBefore(selInfo.plateno,  ' ')}</c:if>
								<c:if test='${fn:contains(selInfo.plateno," ")==false}'>${selInfo.plateno }</c:if></span><%-- ${selInfo.plateno } --%>
						</div>
						<div class="col-md-12"
							style="padding-left:0px;padding-right:0px;height:40px;white-space:nowrap;">
							<span class="iconfont  icon-huiyuanqia-xianxing"
								style="font-size: 16px!important;"></span> <span>${selInfo.level }</span>
						</div>
					</div>
				</div>
			</div>
			</c:otherwise>
			</c:choose>
			<div class="info-con">
				<c:if test="${falg== true}">
					<section class="sec selfInfo _item"
						style="margin-top:10px;border-top:1px solid #ccc">
						
						<div class="sec-order ">
							<span class="pull-left"><i class="iconfont  icon-chongzhi"></i>&nbsp;&nbsp;<span class="menuname">充值<span></span>
							<i style="top: 0.38rem;right:0.35rem;" class="arr-right"></i>
							<input type="hidden" name="perUrl" value="${permissions.recharge }">
						</div>
					</section>
					<section class="sec recharge _item">
						<div class="sec-order ">
							<span class="pull-left"><i
								class="iconfont icon-jiesuankoujianjine"></i>&nbsp;&nbsp;<span class="menuname">扣减</span></span> <i
								style="top: 0.38rem;right:0.35rem;" class="arr-right"></i>
							<input type="hidden" name="perUrl" value="${permissions.consume }">
						</div>
					</section>
					<section class="sec address _item" style="">
						<div class="sec-order ">
							<span class="pull-left"><i class="iconfont icon-kehuxinxi"></i>&nbsp;&nbsp;<span class="menuname">客户信息</span></span>
							<i style="top: 0.38rem;right:0.35rem;" class="arr-right"></i>
						    <input type="hidden" name="perUrl" value="${permissions.customerInfo}">
						</div>
					</section>
				</c:if>
				<section class="sec myPtsearch _item" style="">
					<div class="sec-order ">
						<span class="pull-left"><i
							class="iconfont  icon-permissions-gl"></i>&nbsp;&nbsp;<span class="menuname">权限管理</span></span> <i
							style="top: 0.38rem;right:0.35rem;" class="arr-right"></i>
						<input type="hidden" name="perUrl" value="${permissions.permissionManage}">
					</div>
				</section>
				<section class="sec myKJ _item" style="">
					<div class="sec-order ">
						<span class="pull-left"><i
							class="iconfont icon-leixingshezhi"></i>&nbsp;&nbsp;<span class="menuname">卡片类型</span></span> <i
							style="top: 0.38rem;right:0.35rem;" class="arr-right"></i>
						<input type="hidden" name="perUrl" value="${permissions.levelManage}">
					</div>
				</section>
				<c:if test="${sessionScope.selectInfo == null }">
				<section class="sec myKJ _item" style="">
					<div class="sec-order ">
						<span class="pull-left"><i
							class="iconfont icon-xiangmuweihu"></i>&nbsp;&nbsp;<span class="menuname">项目维护</span></span> <i
							style="top: 0.38rem;right:0.35rem;" class="arr-right"></i>
						<input type="hidden" name="perUrl" value="${permissions.itemManage}">
					</div>
				</section>
				</c:if>
				<%-- <c:if test="${sessionScope.selectInfo == null }">
				<section class="sec myKJ _item" style="">
					<div class="sec-order ">
						<span class="pull-left"><i
							class="iconfont icon-xiangmuweihu"></i>&nbsp;&nbsp;<span class="menuname">统计报表</span></span> <i
							style="top: 0.38rem;right:0.35rem;" class="arr-right"></i>
						<input type="hidden" name="perUrl" value="${permissions.statistics}">
					</div>
				</section>
				</c:if> --%>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="/Qiqiang/static/js/footerPS.js"></script>

	<script>
		(function(doc, win) {
			var docEl = doc.documentElement, resizeEvt = 'orientationchange' in window ? 'orientationchange'
					: 'resize', recalc = function() {
				var clientWidth = docEl.clientWidth;
				if (!clientWidth)
					return;
				docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
			};

			if (!doc.addEventListener)
				return;
			win.addEventListener(resizeEvt, recalc, false);
			doc.addEventListener('DOMContentLoaded', recalc, false);
		})(document, window);
	</script>
	<script type="text/javascript"
		src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/mask.js"></script>
	<script>
	
		$.each($("._item"),function(idx,val) {
			var $_item = $(this)
			var perUrl = $_item.find("input[name='perUrl']").val();
			if (perUrl == null || perUrl == '') {
				//$_item.find("i").css("color", "rgb(202,202,202)");
				//$_item.find("p").css("color", "rgb(202,202,202)");
				//$_item.find(".menuname").css("color", "rgb(202,202,202)");
				
				$_item.remove();
			}
		});
		$("._item").first().addClass("mytop");
		$("._item").click(function() {
			var $_item = $(this)
			var perUrl = $_item.find("input[name='perUrl']").val();
			if (perUrl != null && perUrl != '') {
				location.href = "/Qiqiang" + perUrl;
			}
		})
		/* $("._zq").click(function(){
			location.href="/Qiqiang/SelfInfoController/jqqd";
		}) */
	</script>
</body>
</html>
