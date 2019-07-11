<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>权限管理</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css" />
<link rel="stylesheet" type="text/css"
	href="/Qiqiang/static/css/iconfont.css">
	<style>
	.table-responsive {
	border: 0px;
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

			<div class="col-md-12 info-con">
				<p class="titleP">
					<i class="iconfont  icon-permissions-gl" style="font-size: 18px;"></i>
					权限管理
				</p>

				<section class="sec">
					<form action="/Qiqiang/manRight" method="post">
						<div class="row" style="padding: 0px 15px">
							<span> <input type="text" placeholder="姓名/手机号/车牌号"
								class="form-control" name="value" value="${value }"> </span>
							<button class="btn" type="submit">查询</button>
						</div>
					</form>
					<form action="">
					<div class="table-responsive">
						<table class="table" style="margin-top: 10px;margin-top: 0.2rem;">
							<tr>
								<td>姓名</td>
								<td>手机号</td>
								<td>车牌号</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${userlist}" var="list">
								<tr>
									<td>${list.name}</td>
									<td>${list.mobile}</td>
									<td>${list.car.plateno}</td>
									<td><a
										href="/Qiqiang/config/updateUserrole?car_id=${list.car.id}"
										class="sure">配置</a></td>
								</tr>
							</c:forEach>
						</table>
						</div>
					</form>
					<div class="text-center">
						<p>共${page.total}条记录  第${page.pageNum}页  共${page.pages}页</p>
							<a href="manRight?page=${page.firstPage}&value=${value}"><button class="btn">首页</button>
						</a>
							<a <c:if test="${!page.isFirstPage}">href="manRight?page=${page.prePage}&value=${value}"</c:if><c:if test="${page.isFirstPage}">href="manRight?page=${page.pageNum}&value=${value}"</c:if>><button class="btn">上一页</button>
							</a>
							<a <c:if test="${!page.isLastPage}">href="manRight?page=${page.nextPage}&value=${value}"</c:if><c:if test="${page.isLastPage}">href="manRight?page=${page.pageNum}&value=${value}"</c:if>><button class="btn">下一页</button>
							</a>
						
							<a href="manRight?page=${page.lastPage}&value=${value}"><button class="btn">尾页</button>
						</a>
						
						
					</div>
					<input type='hidden' id="success" value="${success}">
				</section>
			</div>
		</div>

	</div>
	<script type="text/javascript" src="/Qiqiang/static/js/footerKP.js"></script>
	<!--弹窗开始
	<div id="mask">
		<div class="simpleAlertBody">
			<i class="simpleAlertBodyClose 	glyphicon glyphicon-remove"></i>
			<div class="rightTop">权限列表</div>
			<div class="simpleAlertBodyContent">
				<p>
					<input id="item1" type="radio" name="item" value="普通用户" checked>
					<label for="item1"></label> <span class="Pspan">普通用户</span>
				</p>
				<p>
					<input id="item2" type="radio" name="item" value="充值操作"> <label
						for="item2"></label> <span class="Pspan">充值操作</span>
				</p>
				<p>
					<input id="item3" type="radio" name="item" value="扣减操作"> <label
						for="item3"></label> <span class="Pspan">扣减操作</span>
				</p>
				<p>
					<input id="item4" type="radio" name="item" value="修车录入"> <label
						for="item4"></label> <span class="Pspan">修车录入</span>
				</p>
				<p>
					<input id="item5" type="radio" name="item" value="超级用户"> <label
						for="item5"></label> <span class="Pspan">超级用户</span>
				</p>
			</div>
			<button class="simpleAlertBtn simpleAlertBtn2">提交</button>
		</div>
	</div>-->
	<!--弹窗结束-->

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

	<script>
		if ($("#success").val() != null && $("#success").val() != '') {
			alert($("#success").val());
		}
		$(".simpleAlertBtn,.simpleAlertBodyClose").click(function() {
			$("#mask").fadeOut();
		})
		$(".sure").click(function() {
			$("#mask").fadeIn();
		})
	</script>
</body>
</html>
