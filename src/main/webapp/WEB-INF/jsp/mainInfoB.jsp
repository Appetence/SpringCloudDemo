<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>主页</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/mainInfo.css"/>
<link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 bcg-head text-center">
            <div>
                <img src="${user.headimgurl }" alt=""  style="margin-top:16%;">
                <p style="margin-top: 5px;">
                    <span>${user.name }</span>
                </p>
                <p class="text-center NO" style="left: 0rem;">
                    <span class="iconfont  icon-huiyuanqia-xianxing" style="font-size: 16px!important;"></span>
                    <br>
                    <span>${user.mobile }</span>
                </p>
                <p class="text-center NO" style="right: 0rem;">
                    <span class="iconfont  icon-jifen" style="font-size: 16px!important;"></span>
                    <br>
                    <span>0</span>
                </p>
            </div>
        </div>
        <div class="info-con">
                <p class="titleP" style="padding-right: 15px;padding-left: 15px"><i class="glyphicon glyphicon-user"></i> &nbsp;我的信息</p>
                <section class="sec">
                    <div class="text-center _item">
                        <i class="iconfont  icon-chongzhi" style="color: #2b542c"></i>
                        <p>充值</p>
                        <input type="hidden" name="perUrl" value="${permissions.recharge }">
                    </div><div class="text-center _item">
                        <i class="iconfont icon-jiesuankoujianjine" style="color: #843534"></i>
                        <p>扣减</p>
                        <input type="hidden" name="perUrl" value="${permissions.consume }">
                    </div><div class="text-center _item" style="border-right: none;">
                        <i class="iconfont icon-tongjibaobiao" style="color: #204d74"></i>
                        <p>统计报表</p>
                        <input type="hidden" name="perUrl" value="${permissions.statistics}">
                </div>
                </section>
                    <section class="sec" style="border-top: none;">
                    <div class="text-center _item">
                        <i class="iconfont icon-kehuxinxi" style="color: #66512c"></i>
                        <p>客户信息</p>
                        <input type="hidden" name="perUrl" value="${permissions.customerInfo}">
                    </div><div class="text-center _item">
                        <i class="iconfont  icon-permissions-gl" style="color: #67b168"></i>
                        <p>权限管理</p>
                        <input type="hidden" name="perUrl" value="${permissions.permissionManage}">
                    </div><div class="text-center _item" style="border-right: none;">
                        <i class="iconfont icon-xiangmuweihu" style="color: #761c19"></i>
                        <p>项目维护</p>
                        <input type="hidden" name="perUrl" value="${permissions.itemManage}">
                    </div>
                    </section>
                    <section class="sec" style="border-top: none;">
                    <div class="text-center _item">
                        <i class="iconfont icon-leixingshezhi" style="color: #533466"></i>
                        <p>卡片类型设置</p>
                        <input type="hidden" name="perUrl" value="${permissions.levelManage}">
                    </div><div class="text-center _item">
                        <i class="iconfont icon-peijian" style="color: #269abc"></i>
                        <p>配件信息</p>
                        <input type="hidden" name="perUrl" value="${permissions.partsManage}">
                    </div><div class="text-center _item" style="border-right: none;">
                        <i class="iconfont  icon-icon-test" style="color: #66512c"></i>
                        <p>消费详情</p>
                        <input type="hidden" name="perUrl" value="${permissions.conDetailCustomer}">
                    </div>
                </section>
        </div>

    </div></div>
    <script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>
	
<script>
	(function (doc, win) {
	  var docEl = doc.documentElement,
		resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
		recalc = function () {
		  var clientWidth = docEl.clientWidth;
		  if (!clientWidth) return;
		  docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
		};

	  if (!doc.addEventListener) return;
	  win.addEventListener(resizeEvt, recalc, false);
	  doc.addEventListener('DOMContentLoaded', recalc, false);
	})(document, window);
</script>
<script type="text/javascript" src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="/Qiqiang/static/js/mask.js"></script>
<script>
	$("._item").each(function(){
		var $_item = $(this)
		var perUrl = $_item.find("input[name='perUrl']").val();
		if (perUrl == null || perUrl == ''){
			$_item.find("i").css("color","#808080");
			$_item.find("p").css("color","#808080");
		}
	});
	$("._item").click(function(){
		var $_item = $(this)
		var perUrl = $_item.find("input[name='perUrl']").val();
		if (perUrl != null && perUrl != ''){
			location.href="/Qiqiang"+perUrl;
		}
	})
	/* $("._zq").click(function(){
		location.href="/Qiqiang/SelfInfoController/jqqd";
	}) */
	
</script>
</body>
</html>
