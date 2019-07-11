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
<title>会员查询</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css"/>
</head>
<body>
<div class="container">
    <div class="row">
         <div class="col-md-12 bcg-head text-center">
            <div>
                <img src="/Qiqiang/static/images/d4.jpg" alt=""  style="margin-top:16%;">
                <p style="margin-top: 5px;">
                    <span>张三</span>
                </p>
                <p class="text-center NO" style="left: 0rem;">
                    <span class="iconfont  icon-huiyuanqia-xianxing" style="font-size: 16px!important;"></span>
                    <br>
                    <span>ID-123456</span>
                </p>
                <p class="text-center NO" style="right: 0rem;">
                    <span class="iconfont  icon-jifen" style="font-size: 16px!important;"></span>
                    <br>
                    <span>345</span>
                </p>
            </div>
        </div>
        <div class="col-md-12 info-con">
            <p class="titleP"><i class="glyphicon glyphicon-search"></i> 客户查询</p>
            <section class="sec">
                <div class="row" style="margin:0rem;width: 100%;text-align: center;">
                    <span>
                        <input type="text" placeholder="姓名/手机号/车牌号" class="form-control">
                    </span>
                    <button class="btn">搜索</button>
                <form action="">
                    <table class="table" style="margin-top: 10px">
                        <tr>
                            <td>姓名</td>
                            <td>手机号</td>
                            <td>车牌号</td>
                            <td>卡余额</td>
                            <td>操作</td>
                        </tr>
                        <tr>
                            <td>张三</td>
                            <td>189...</td>
                            <td>537...</td>
                            <td>2368</td>
                            <td><a href="./selfInfoC.html">查看</a></td>
                        </tr>
                        <tr>
                            <td>李四</td>
                            <td>182...</td>
                            <td>345...</td>
                            <td>278</td>
                            <td><a href="./selfInfoC.html">查看</a></td>
                        </tr>
                        <tr>
                            <td>王五</td>
                            <td>132...</td>
                            <td>234...</td>
                            <td>542</td>
                            <td><a href="./selfInfoC.html">查看</a></td>
                        </tr>

                    </table>
                </form>
                <div class="text-center">
                    <button class="btn">首页</button>
                    <button class="btn">上一页</button>
                    <button class="btn">下一页</button>
                    <button class="btn">尾页</button>
                </div>
            </section>
        </div>
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
<script type="text/javascript" src="/Qiqiang/static/js/mask.js"></script>
</body>
</html>
