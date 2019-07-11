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
<title>修车记录查询</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css" />
<link rel="stylesheet" type="text/css"
	href="/Qiqiang/static/css/iconfont.css">
</head>
<body>
	<div class="container">
		<div class="row">

			<div class="col-md-12 info-con">
				<p class="titleP">
					<i class="iconfont  icon-icon-test"></i> 修车记录查询
				</p>
				<section class="sec">
					<div>
						<div class="row"
							style="margin:0rem;width: 100%;text-align: center;">
							<span> <input type="text" placeholder="姓名/手机号/车牌号"
								class="form-control"> </span>
							<button class="btn">搜索</button>
							<!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
						</div>
						<form action="">
							<table class="table" style="margin-top: 5px;">
								<tr>
									<td>姓名</td>
									<td>手机号</td>
									<td>车牌号</td>
									<td>扣减日期</td>
									<td>操作</td>
								</tr>
								<tr>
									<td>1</td>
									<td>洗车</td>
									<td>-200.00</td>
									<td>洗车</td>
									<td><a href="">查看详情</a></td>
								</tr>
								<tr>
									<td>2</td>
									<td>打蜡</td>
									<td>-298.00</td>
									<td>洗车</td>
									<td><a href="">查看详情</a></td>
								</tr>

							</table>
						</form>

						<div class="text-center">
							<button class="btn">首页</button>
							<button class="btn">上一页</button>
							<button class="btn">下一页</button>
							<button class="btn">尾页</button>
						</div>

					</div>
					<!--日报结束-->
				</section>
			</div>
		</div>
		
	</div>
	<script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>
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
</body>
</html>
