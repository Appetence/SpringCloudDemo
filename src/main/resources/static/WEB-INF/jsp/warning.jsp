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
<title>提醒</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
</head>
<body>
<div class="container">
    <div class="text-center" style="margin-top: 20%">
        <p>
            <img src="/Qiqiang/static/images/successLogin.jpg" alt="" style="width: 100px;width: 2rem;border-radius: 50%;">
        </p>
        <p style="font-size: 20px;margin-top: 20px;font-size: 0.4rem;margin-top: 0.4rem ">
            <b>${msg_title }</b>
        </p>
        <p style="color: #666;margin-top: 10px;margin-top: 0.2rem ">
            ${msg_content }
        </p>
        <p style="margin-top: 10%">
            <button class="btn btn-block" style="height: 42px;font-size: 18px;height: 0.84rem;font-size: 0.36rem;background-color: #48a3da!important;
    color: white;" onclick="javascript:history.go(-1);">确定</button>
        </p>
    </div>
</div>
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
</body>
</html>
