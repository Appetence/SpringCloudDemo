    <%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
            <title>扣减</title>
            <link rel="stylesheet" href="../../static/css/bootstrap.css"/>
            <link rel="stylesheet" href="../../static/css/commom.css"/>
            <link rel="stylesheet" href="../../static/css/memSea.css"/>
            <link rel="stylesheet" href="../../static/css/inde.css"/>
            <link rel="stylesheet" type="text/css" href="../../static/css/iconfont.css">
            <style>
            .repair,.wash{
            display:none;
            }
            .repairDiv .col-md-2,.otherDiv .col-md-2{
            display: inline-block;
            width: 25%;
            }
            .toUpSec{
            margin-top:0rem;
            }
            .toUpSec .row{
            width: 100%;
            margin: 0.2rem 0rem 0rem;
            }
            .toUpSec .row .col-md-2,.repairDiv .row .col-md-2{
            padding-left: 0rem !important;
            }
            .toUpSec .row .col-md-10,.repairDiv .row .col-md-10{
            display: inline-block;
            width: 70%;
            }
            .toUpSec .row .col-md-10 .form-control,.repairDiv .row .col-md-10 .form-control{
            width: 100%;
            display: inline-block;
            }
            .wCar .col-md-2{
            display: inline-block;
            width: 28%;
            }
            .wCar .col-md-10{
            display: inline-block;
            width: 65%;
            }
            .wCar {
            padding: 0.2rem;
            }
            .wCar .row{
            padding-top: 0.2rem;
            }
            .titleDiv span {
            display: inline-block;
            width: 50%;
            border: 1px solid #48a3da;
            text-align: center;
            color: #48a3da;
            height: 32px;
            line-height: 32px;
            height: 0.64rem;
            line-height: 0.64rem;
            }
            .active {
            background-color: #48a3da;
            color: white!important;
            }
            </style>
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
            <div class="col-md-12 info-con">
            <p class="titleP"><i class="iconfont icon-jiesuankoujianjine"></i> 扣减</p>
            <!--搜索开始-->
            <section class="sec">
            <div>
            <div class="row" style="margin:0rem;width: 100%;text-align: center;">
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
            <td>卡级别</td>
            <td>选择</td>
            </tr>
            <tr>
            <td>1</td>
            <td>洗车</td>
            <td>-200.00</td>
            <td>洗车</td>
            <td>
            <input type="checkbox">
            </td>
            </tr>
            <tr>
            <td>2</td>
            <td>打蜡</td>
            <td>-298.00</td>
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
            </section>
            <!--搜索结束-->
            <div class="titleDiv">
            <span class="active One washBtn">洗车扣减</span><span class="Two repairBtn">修车扣减</span></a>
            </div>
            <!--洗车开始-->
            <div class="wash">
            <div class="wCar">
            <div class="row">
            <span class="col-md-2">支付类型</span>
            <span class="col-md-10">
            <select name="" id="" class="form-control">
            <option value="">一卡通</option>
            </select>
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">剩余金额</span>
            <span class="col-md-10">
            <input type="number" class="form-control" placeholder="" value="1000" disabled>
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">剩余次数</span>
            <span class="col-md-10">
            <input type="number" class="form-control" placeholder="" value="1000" disabled>
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">扣减项目</span>
            <span class="col-md-10">
            <select name="" id="" class="form-control selector">
            <option value="">洗车</option>
            <option value="">打蜡</option>
            <option value="修车">修车</option>
            </select>
            </span>
            </div>

            <div class="row">
            <span class="col-md-2">扣减金额</span>
            <span class="col-md-10">
            <input type="number" class="form-control" placeholder="" value="1000">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">扣减次数</span>
            <span class="col-md-10">
            <input type="number" class="form-control" placeholder="" value="10">
            </span>
            </div>

            </div>
            <div class="text-center" style="margin-top: 20px;">
            <button class="btn" style="background-color: #48a3da;">确定</button>
            </div>
            </div>
            <!--洗车结束-->


            <!--修车开始-->
            <div class="repair">

            <div class="toUpSec repairDiv" style="margin-top:0.2rem;">
            <div class="row">
            <span class="col-md-2">扣减项目</span>
            <span class="col-md-10">
            <input type="text" value="修车" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">支付类型</span>
            <span class="col-md-10">
            <select name="" id="" class="form-control">
            <option value="">一卡通</option>
            </select>
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">剩余金额</span>
            <span class="col-md-10">
            <input type="number" value="500.00" class="form-control" disabled>
            </span>
            </div>

            </div>

            <div class="toUpSec repairDiv" style="margin-top:0.2rem;">
            <i class="glyphicon glyphicon-remove pull-right"></i>

            <div class="row" style="margin-top: 25px;margin-top: 0.5rem;">
            <span class="col-md-2">配件类型</span>
            <span class="col-md-10">
            <select name="" id="" class="form-control">
            <option value="">轮胎</option>
            <option value="">发动机</option>
            <option value="">风刮</option>
            </select>
            </span>
            </div>

            <div class="row">
            <span class="col-md-2">配件名称</span>
            <span class="col-md-10">
            <select name="" id="" class="form-control">
            <option value="">米其林轮胎A1</option>
            <option value="">米其林轮胎A2</option>
            <option value="">米其林轮胎A3</option>
            </select>
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">供应商</span>
            <span class="col-md-10">
            <select name="" id="" class="form-control sure">
            <option value=""></option>
            <option value="">A</option>
            <option value="">2B</option>
            <option value="">3C</option>
            </select>
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">单价(元)</span>
            <span class="col-md-10">
            <input type="number" value="2999.00" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">出厂日期</span>
            <span class="col-md-10">
            <input type="date" value="2018-09-18" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2" style="width: 30%;margin-right: -17px;">销售单价(元)</span>
            <span class="col-md-10">
            <input type="number" value="3999.00" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">销售数量</span>
            <span class="col-md-10">
            <input type="number" value="1" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">销售日期</span>
            <span class="col-md-10">
            <input type="date" value="2018-09-18" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">质保期</span>
            <span class="col-md-10">
            <input type="date" value="2018-09-18" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2" style="width: 34%;margin-right: -31px;">半年质保价(元)</span>
            <span class="col-md-10">
            <input type="number" value="2018" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">备注</span>
            <span class="col-md-10">
            <input type="text" value="备注" class="form-control">
            </span>
            </div>
            </div>

            <div class="toUpSec repairDiv" style="margin-top:0.2rem;">
            <div class="row">
            <span class="col-md-2">服务费(元)</span>
            <span class="col-md-10">
            <input type="number" value="100" class="form-control">
            </span>

            </div>
            <div class="row">
            <span class="col-md-2">负责人</span>
            <span class="col-md-10">
            <input type="text" value="张三" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2" style="width: 29%;margin-right: -13px;">里程数(公里)</span>
            <span class="col-md-10">
            <input type="number" value="1000.00" class="form-control">
            </span>
            </div>
            <div class="row">
            <span class="col-md-2">总价(元)</span>
            <span class="col-md-10">
            <input type="number" value="100" class="form-control">
            </span>
            </div>

            <div class="row">
            <span class="col-md-2">备注</span>
            <span class="col-md-10">
            <input type="text" value="备注" class="form-control">
            </span>
            </div>

            </div>

            <div class="text-center" style="margin-top: 20px;">
            <button class="btn" style="background-color: #48a3da;">增加扣减</button>
            <button class="btn" style="background-color: #48a3da;">确定</button>
            </div>
            </div>
            <!--修车开始-->
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
            <!--弹窗开始-->
            <div id="mask">
            <div class="simpleAlertBody" style="width: 96%;left: 2%;">
            <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove" style="top: 8px;right: 5px;"></i>
            <div class="simpleAlertBodyContent" style="height: 190px;height:3.8rem;top: 15%; ">
            <form action="">
            <table class="table" style="font-size: 15px;font-size: 0.3rem;">
            <tr>
            <td>进货时间</td>
            <td>单价(元)</td>
            <td>库存</td>
            <td>选择</td>
            </tr>
            <tr>
            <td>2017/09/09</td>
            <td>3000.00</td>
            <td>36</td>
            <td>
            <input type="checkbox">
            </td>
            </tr>
            <tr>
            <td>2017/05/04</td>
            <td>5000.00</td>
            <td>16</td>
            <td>
            <input type="checkbox">
            </td>
            </tr>

            </table>
            </form>
            </div>
            <button class="simpleAlertBtn simpleAlertBtn2" style="right: 41%;">确定</button>

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
            $(".titleDiv span").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            })
            $(".simpleAlertBtn,.simpleAlertBodyClose").click(function () {
            $("#mask").fadeOut();
            })
            $(".sure").change(function () {
            $("#mask").fadeIn();
            })

            $(".washBtn").click(function () {
            $(".wash").fadeIn();
            $(".repair").hide();
            })
            $(".repairBtn").click(function () {
            $(".repair").fadeIn();
            $(".wash").hide();
            })


            </script>
            </body>
            </html>




