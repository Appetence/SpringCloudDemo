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
	href="/Qiqiang/static/css/stylecheck.css" />
<link rel="stylesheet" type="text/css"
	href="/Qiqiang/static/css/iconfont.css">

<style type="text/css">
body {
	height: 100%;
	font: 14px/18px "Microsoft Yahei", Tahoma, Helvetica, Arial, Verdana,
		"\5b8b\4f53", sans-serif;
	color: #51555C;
	background: none;
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
				<p class="titleP">修改用户权限</p>
				<section class="sec">
					<form action="/Qiqiang/config/updateuserrole.action" method="post">
						<table class="table" style="margin-top: 10px;margin-top: 0.2rem;">
							<tr>
								<td>姓名</td>
								<td>手机号</td>
								<td>车牌号</td>
							</tr>
							<tr>
								<td>${us.name}</td>
								<td>${us.mobile}</td>
								<td>${car.plateno}</td>
							</tr>
						</table>
						<i class="iconfont  icon-permissions-gl" style="font-size: 18px;"></i>
						用户权限：<span style="color: red">(*：客户不能和其他角色同时选择)</span>
						<div class="text" style="margin-left: 30%">
							<c:forEach items="${roles}" var="role" varStatus="vs" begin="1">
								<input type="checkbox" id="checkbox_c${vs.index-1}"
									class="chk_3 qx" tag='${role.desc_}' value="${role.id}"
									name="roles"
									<c:forEach items="${myroles}" var="myrole">
							<c:if test="${myrole.id==role.id}">checked</c:if>
							</c:forEach> />
								<label for="checkbox_c${vs.index-1}"></label>
								${role.desc_}
								<br>
							</c:forEach>
						</div>
						<br> <i class="iconfont  icon-permissions-gl1"
							style="font-size: 18px;"></i> 充值扣减消息：
						<div class="text" style="margin-left: 30%">
							<input type="checkbox" id="checkbox_c100" class="chk_3" value="1"
								name="message"
								<c:forEach items="${umessagelist}" var="message">
							<c:if test="${message.type==1}">checked</c:if>
								</c:forEach> />
							<label for="checkbox_c100"></label>充值消息提醒<br> <input
								type="checkbox" id="checkbox_c101" class="chk_3" value="2"
								name="message"
								<c:forEach items="${umessagelist}" var="message">
							<c:if test="${message.type==2}">checked</c:if>
								</c:forEach> />
							<label for="checkbox_c101"></label>扣减消息提醒<br>
						</div>
						<br>
						<br> 操作密码：
						<center>
							<input class='form-control' type="text" name='pass'
								value='${us.pass}'>
						</center>
						<br>
						<br> <input type="hidden" name="user_id" value="${us.id}">
						<center>
							<button class="btn insertBtn" type="submit"
								style="background-color: #48a3da;color:#fff;width:200px">提&nbsp;&nbsp;&nbsp;&nbsp;交</button>
						</center>
					</form>
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
<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>
	<script>
		$(".qx").click(
				function() {
					var val = $(this).val();
					var other = $(this).parent().find("input[type='checkbox']")
							.not($(this));
					/*		 text = $("input:checkbox[name='roles']:checked").map(function(index,elem) {
					        if( $(elem).val()==4){
					        	$(elem).parent().hide();
					        }
					    }).get().join(',');*/
					if ($(this).is(':checked')) {
						if (val == 4 || val == 5) {
							other.removeAttr("checked");
						} else {
							$("input:checkbox[name='roles'][tag='访客']")
									.removeAttr("checked");
							$("input:checkbox[name='roles'][tag='客户']")
									.removeAttr("checked");
							$("input:checkbox[name='roles']").eq(0).removeAttr(
									"checked");
							$("input:checkbox[name='roles'][value='5']")
									.removeAttr("checked");
							$("input:checkbox[name='roles'][value='4']")
									.removeAttr("checked");
						}
					}
				});
				
			$(".insertBtn").click(function(){
				var r = /^[^\u4e00-\u9fa5]+$/
				var str=$("input[name='pass']").val();
				if(str==''){
					layer.msg("操作密码不能为空");
					return false;
				}else{
					if(r.test(str)){
					}else{
					layer.msg("操作密码不能包含中文");
					return false;
					}
				}
			})
	</script>
</body>
</html>
