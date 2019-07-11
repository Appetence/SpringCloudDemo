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
    <title>权限管理</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../static/css/commom.css"/>
    <link rel="stylesheet" href="../../static/css/memSea.css"/>
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
    <div class="col-md-12 info-con">
    <p class="titleP"><i class="iconfont  icon-permissions-gl" style="font-size: 18px;"></i> 权限管理</p>
    <section class="sec">
    <div class="row" style="margin: 0rem;width: 100%;text-align: center;">
    <span>
    <input type="text" placeholder="姓名/手机号/车牌号" class="form-control">
    </span>
    <button class="btn">搜索</button>
    </div>

    <form action="">
    <table class="table" style="margin-top: 10px;margin-top: 0.2rem;">
    <tr>
    <td>姓名</td>
    <td>手机号</td>
    <td>车牌号</td>
    <td>操作</td>
    </tr>
    <tr>
    <td>张三</td>
    <td>189...</td>
    <td>537...</td>
    <td><a href="javascript:void(0);" class="sure">权限配置</a></td>
    </tr>
    <tr>
    <td>李四</td>
    <td>182...</td>
    <td>345...</td>
    <td><a href="javascript:void(0);" class="sure">权限配置</a></td>
    </tr>
    <tr>
    <td>王五</td>
    <td>132...</td>
    <td>234...</td>
    <td><a href="javascript:void(0);" class="sure">权限配置</a></td>
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
    <!--弹窗开始-->
    <div id="mask">
    <div class="simpleAlertBody">
    <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove"></i>
    <div class="rightTop">
    权限列表
    </div>
    <div class="simpleAlertBodyContent">
    <p>
    <input id="item1" type="radio" name="item" value="普通用户" checked>
    <label for="item1"></label>
    <span class="Pspan">普通用户</span>
    </p>
    <p>
    <input id="item2" type="radio" name="item" value="充值操作" >
    <label for="item2"></label>
    <span class="Pspan">充值操作</span>
    </p>
    <p>
    <input id="item3" type="radio" name="item" value="扣减操作" >
    <label for="item3"></label>
    <span class="Pspan">扣减操作</span>
    </p>
    <p>
    <input id="item4" type="radio" name="item" value="修车录入" >
    <label for="item4"></label>
    <span class="Pspan">修车录入</span>
    </p>
    <p>
    <input id="item5" type="radio" name="item" value="超级用户" >
    <label for="item5"></label>
    <span class="Pspan">超级用户</span>
    </p>
    </div>
    <button class="simpleAlertBtn simpleAlertBtn2">提交</button>
    </div>
    </div>
    <!--弹窗结束-->
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

    <script>
    $(".simpleAlertBtn,.simpleAlertBodyClose").click(function () {
    $("#mask").fadeOut();
    })
    $(".sure").click(function () {
    $("#mask").fadeIn();
    })
    </script>
    </body>
    </html>

