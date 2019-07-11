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
    <title>信息维护</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../static/css/commom.css"/>
    <link rel="stylesheet" href="../../static/css/mainInfo.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/iconfont.css">
    </head>
    <body>
    <div class="container">
    <div class="row">
    <div class="col-md-12 bcg-head text-center">
    <div>
    <img src="../../static/images/d4.jpg" alt=""  style="margin-top:16%;">
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
    <div class="info-con">
    <p class="titleP" style="padding-right: 15px;padding-left: 15px"><i class="glyphicon glyphicon-user"></i> &nbsp;我的信息</p>
    <section class="sec">
    <div class="text-center ">
    <i class="iconfont  icon-chongzhi" style="color: #2b542c"></i>
    <p>充值</p>
    </div><div class="text-center  ">
    <i class="iconfont icon-jiesuankoujianjine" style="color: #843534"></i>
    <p>扣减</p>
    </div><div class="text-center" style="border-right: none;">
    <i class="iconfont icon-tongjibaobiao" style="color: #204d74"></i>
    <p>统计报表</p>
    </div>
    </section>
    <section class="sec" style="border-top: none;">
    <div class="text-center">
    <i class="iconfont icon-kehuxinxi" style="color: #66512c"></i>
    <p>客户信息</p>
    </div><div class="text-center  ">
    <i class="iconfont  icon-permissions-gl" style="color: #67b168"></i>
    <p>权限管理</p>
    </div><div class="text-center" style="border-right: none;">
    <i class="iconfont icon-yonghuxiangmuweihu" style="color: #761c19"></i>
    <p>项目维护</p>
    </div>
    </section>
    <section class="sec" style="border-top: none;"><div class="text-center  ">
    <i class="iconfont  icon-huiyuandengjishezhi" style="color: #533466"></i>
    <p>卡片类型设置</p>
    </div><div class="text-center  ">
    <i class="iconfont icon-peijian" style="color: #269abc"></i>
    <p>配件信息</p>
    </div><div class="text-center" style="border-right: none;">
    <i class="iconfont  icon-icon-test" style="color: #66512c"></i>
    <p>修车记录查询</p>
    </div>
    </section>
    </div>

    </div>
    <footer>
    <div>
    <i class="glyphicon glyphicon-list"></i>
    <p>我的信息</p>
    </div>
    <div>
    <i class="glyphicon glyphicon-list-alt"></i>
    <p>消费详情</p>
    </div>
    <div>
    <i class="glyphicon glyphicon-usd"></i>
    <p>赚钱</p>
    </div>
    </footer>
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

