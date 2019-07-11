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
    <title>充值</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../static/css/commom.css"/>
    <link rel="stylesheet" href="../../static/css/memSea.css"/>
    <link rel="stylesheet" href="../../static/css/inde.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/iconfont.css">
    <style>
    .toUpSec .row{
    width: 100%;
    margin: 0.2rem 0rem 0rem;
    }
    .toUpSec .row .col-md-2{
    padding-left: 0rem !important;
    }
    .toUpSec .row .col-md-10{
    display: inline-block;
    width: 75%;
    }
    </style>
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
    <p class="titleP"><i class="iconfont icon-chongzhi" style="font-size: 18px!important;"></i> 充值</p>
    <section class="sec">
    <div>
    <div class="row" style="margin:0rem;width: 100%;text-align: center;">
    <span>
    <input type="text" placeholder="姓名/手机号/车牌号" class="form-control">
    </span>
    <button class="btn">搜索</button>
    <!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
    </div>
    <form action="">
    <table class="table" style="margin-top: 10px;margin-top: 0.2rem;">
    <tr>
    <td>姓名</td>
    <td>手机号</td>
    <td>车牌号</td>
    <td>车型</td>
    <td>卡级别</td>
    <td>选择</td>
    </tr>
    <tr>
    <td>1</td>
    <td>洗车</td>
    <td>-200.00</td>
    <td>1</td>
    <td>洗车</td>
    <td>
    <input type="checkbox">
    </td>
    </tr>
    <tr>
    <td>2</td>
    <td>打蜡</td>
    <td>-298.00</td>
    <td>1</td>
    <td>洗车</td>
    <td>
    <input type="checkbox">
    </td>
    </tr>

    </table>
    </form>
    <!--
    <div class="text-center">
    <button>首页</button>
    <button>上一页</button>
    <button>下一页</button>
    <button>尾页</button>
    </div>
    -->
    </div>
    <!--日报结束-->
    </section>
    <div class="toUpSec">
    <i class="glyphicon glyphicon-remove pull-right"></i>
    <div class="row" style="margin-top:0.3rem;">
    <span class="col-md-2">充值项目</span>
    <span class="col-md-10">
    <select name="" id="" class="form-control">
    <option value="">洗车</option>
    <option value="">打蜡</option>
    <option value="">修理</option>
    </select>
    </span>

    </div>
    <div class="row">
    <span class="col-md-2">卡片类型</span>
    <span class="col-md-10">
    <select name="" id="" class="form-control">
    <option value="">一卡通</option>
    <option value="">季卡</option>
    <option value="">月卡</option>
    </select>
    </span>
    </div>
    <div class="row">
    <span class="col-md-2">充值金额</span>
    <span class="col-md-10">
    <input type="number" class="form-control" placeholder="" value="1000">
    </span>
    </div>
    <div class="row">
    <span class="col-md-2">剩余金额</span>
    <span class="col-md-10">
    500.00
    </span>
    </div>
    <div class="row">
    <span class="col-md-2">充值次数</span>
    <span class="col-md-10">
    <input type="number" class="form-control" placeholder="" value="100">
    </span>
    </div>
    <div class="row">
    <span class="col-md-2">剩余次数</span>
    <span class="col-md-10">
    200
    </span>
    </div>
    </div>
    <div class="text-center" style="margin-top: 20px;">
    <button class="btn " style="background-color: #48a3da;">增加充值项目</button>
    <button class="btn " style="background-color: #48a3da;">确定</button>
    </div>
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
    <script>
    $(".titleDiv span").click(function () {
    $(this).addClass("active").siblings().removeClass("active");
    })
    </script>
    </body>
    </html>

