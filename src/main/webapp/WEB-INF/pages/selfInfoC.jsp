﻿    <%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>个人信息</title>
        <link rel="stylesheet" href="../../static/css/bootstrap.css"/>
        <link rel="stylesheet" href="../../static/css/commom.css"/>
        <link rel="stylesheet" href="../../static/css/selfInfo.css"/>
        <link rel="stylesheet" type="text/css" href="../../static/css/iconfont.css">
        </head>
        <body>
        <div class="container">
        <div class="row">
        <div class="col-md-12 bcg-head text-center">
        <div>
        <img src="../../static/images/d4.jpg" alt="" style="margin-top:16%;">
        <p style="margin-top: 5px;">
        <span>张三</span>
        </p>
        <p class="text-center NO" style="left: 0rem;">
        <span class="iconfont icon-huiyuanqia-xianxing" style="font-size: 16px!important;"></span>
        <br>
        <span>ID-123456</span>
        </p>
        <p class="text-center NO" style="right: 0rem;">
        <span class="iconfont icon-jifen" style="font-size: 16px!important;"></span>
        <br>
        <span>345</span>
        </p>
        </div>
        </div>
        <div class="info-con" style="margin-bottom: 0rem;">
        <p class="titleP" style="padding-left: 0.3rem;"><i class="glyphicon glyphicon-user"></i> &nbsp;个人信息</p>
        <section class="sec" style="background-color: white;padding: 0.1rem 0rem 0.2rem">
        <div class="row">
        <span class="col-md-2">姓名</span>
        <span class="col-md-10">
        <input type="text" class="form-control" value="张三">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">性别</span>
        <span class="col-md-10">
        <select name="" id="" class="form-control">
        <option value="">男</option>
        <option value="">女</option>
        </select>
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">手机号码</span>
        <span class="col-md-10">
        <input type="number" class="form-control" value="1381300000">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">地址</span>
        <span class="col-md-10">
        <input type="text" class="form-control" value="北京市大兴区金星西路">
        </span>
        </div>

        <div class="row">
        <span class="col-md-2">会员卡号</span>
        <span class="col-md-10">
        <input type="number" class="form-control" value="245773245">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">会员积分</span>
        <span class="col-md-10">
        <input type="number" class="form-control" value="4729">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">会员卡余额</span>
        <span class="col-md-10">
        <input type="number" class="form-control" value="3627.23">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">实际充值余额</span>
        <span class="col-md-10">
        <input type="number" class="form-control" value="3627.23">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">剩余洗车次数</span>
        <span class="col-md-10">
        <input type="number" class="form-control" value="100">
        </span>
        </div>
        </section>
        <!--<div class="text-center" style="margin-top: 20px">-->
        <!--<button class="btn btn-primary" style="background-color: #48a3da">修改</button>-->
        <!--</div>-->
        </div>
        <div class="info-con">
        <p class="titleP" style="padding-left: 0.3rem;">
        <i class="iconfont icon-car"></i> &nbsp;车辆信息
        <span class="pull-right" style="font-size: 14px!important;border: 1px solid #48a3da;padding: 0.04rem
        0.1rem;border-radius: 0.15rem"><i class="glyphicon glyphicon-plus"></i> 新增</span>
        </p>
        <section class="sec" style="background-color: white;padding: 0.1rem 0rem 0.2rem">
        <div class="row">
        <span class="col-md-2">车牌号</span>
        <span class="col-md-10">
        <input type="text" class="form-control" value="京A13930">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">车型</span>
        <span class="col-md-10">
        <input type="text" class="form-control" value="家用车">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">车险日期</span>
        <span class="col-md-10">
        <input type="date" class="form-control" value="1993-08-01">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">验车日期</span>
        <span class="col-md-10">
        <input type="date" class="form-control" value="2017-09-01">
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">车龄</span>
        <span class="col-md-10">
        <select name="" id="" class="form-control">
        <option value="">1年</option>
        <option value="">2年</option>
        <option value="">3年</option>
        </select>
        </span>
        </div>
        </section>
        <div class="text-center" style="margin-top: 20px">
        <button class="btn sure" style="background-color: #48a3da">确定</button>
        </div>
        </div>

        <div class="info-con col-md-12">
        <p class="titleP" style="padding-left: 0rem;"><i class="iconfont icon-car" style="font-size: 20px"></i>
        &nbsp;车辆信息</p>
        <section class="secCar">
        <div class="secCar-top">
        <div><i class="iconfont icon-che secCarI"></i></div>
        <div>
        <p style="font-size: 16px;">法拉利</p>
        </div>
        <!--<div class="pull-right" style="margin-top: 5%;">-->
        <!--<p><i class="glyphicon glyphicon-edit"></i> 编辑</p>-->
        <!--<p><i class="glyphicon glyphicon-plus"></i> 新增</p>-->
        <!--</div>-->
        </div>
        <div class="secCar-con">
        <div class="row">
        <span class="col-md-2">车牌号</span>
        <span class="col-md-10">
        京A13930
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">车型</span>
        <span class="col-md-10">
        法拉利
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">车险日期</span>
        <span class="col-md-10">
        2019/08/07
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">验车日期</span>
        <span class="col-md-10">
        2018/08/07
        </span>
        </div>
        <div class="row">
        <span class="col-md-2">车龄</span>
        <span class="col-md-10">
        3年
        </span>
        </div>
        </div>
        </section>
        </div>

        </div>

        </div>

        <!--弹窗开始-->
        <div id="mask">
        <div class="simpleAlertBody">
        <i class="simpleAlertBodyClose glyphicon glyphicon-remove"></i>
        <p class="simpleAlertBodyContent">确定后信息就修改了哦~</p>
        <button class="simpleAlertBtn simpleAlertBtn2" style="background-color: #aaa!important;">取消</button>
        <button class="simpleAlertBtn simpleAlertBtn1">确定</button>
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

