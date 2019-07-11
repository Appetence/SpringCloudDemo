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
<title>注册</title>
<link rel="stylesheet" href="../../static/css/bootstrap.css"/>
<script rel="stylesheet" href="../../static/js/bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../../static/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="../../static/css/register.css">
</head>
<body>
<div class="container">
        <form class="bs-example bs-example-form" role="form">
            <div class="row bcg">
                <div class="col-xs-11 col-xs-offset-1">
                    <span> * </span>
                    <input type="text" class="form-control" placeholder="请输入用户名">
                    <i class="glyphicon glyphicon-user"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <span> * </span>
                    <input type="number" class="form-control" placeholder="请输入手机号码">
                    <i class="glyphicon glyphicon-phone"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <span> * </span>
                    <input type="text" class="form-control" placeholder="请输入车牌号码">
                    <i class="iconfont icon-chepaihao"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <input type="date" class="form-control" placeholder="请输入车牌号码">
                    <i class="iconfont icon-cheliang-"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <input type="date" class="form-control" placeholder="请选择验车日期">
                    <i class="iconfont icon-yanche"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <select name="" id="" class="form-control">
                        <option value="">请选择车龄</option>
                        <option value="">5年</option>
                        <option value="">10年</option>
                    </select>
                    <i class="iconfont icon-cheling-" style="font-size: 26px"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <button class="btn btn-block">注册</button>
                    <p>标 * 为必填项</p>
                </div><!-- /.col-xs-6 -->
            </div><!-- /.row -->
        </form>
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
<script type="text/javascript" src="../../static/js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="../../static/js/mask.js"></script>
</body>
</html>
