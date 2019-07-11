﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>扣减记录详情</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../static/css/commom.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/iconfont.css">
    <style>
        .sec div{
            background-color: white;
            padding: 0.2rem 0.2rem 0.4rem;
            border-radius: 0.1rem;
            margin-top: 0.2rem;
            height:auto;
        }
        .secCon{
            color: #999;
        }
        .sec div p{
            clear: both;
            padding-top: 0.2rem;
        }
        .sec div p:nth-child(1){
            padding-top: 0rem;
        }
        .sec div p>span{
            display: inline-block;
            width: 50%;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 bcg-head text-center" style="">
            <div>
                <img src="../../static/images/d4.jpg" alt="" style="margin-top: 16%;">
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
            <p class="titleP"><i class="iconfont  icon-icon-test"></i> 扣减记录详情</p>
            <section class="sec">
                <div>
                    <p>
                        <span class="pull-left">
                            <span>扣减项目</span> : <span class="secCon">洗车</span>
                        </span>
                        <span class="pull-right">
                            <span>支付类型</span> : <span class="secCon">一卡通</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>扣减金额</span> : <span class="secCon">300元</span>
                        </span>
                        <span class="pull-right">
                            <span>剩余金额</span> : <span class="secCon">298元</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>扣减次数</span> : <span class="secCon">2次</span>
                        </span>
                        <span class="pull-right">
                            <span>剩余次数</span> : <span class="secCon">32次</span>
                        </span>
                    </p>
                </div>
                <div>
                    <p>
                        <span class="pull-left">
                            <span>扣减项目</span> : <span class="secCon">修车</span>
                        </span>
                        <span class="pull-right">
                            <span>支付类型</span> : <span class="secCon">一卡通</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>配件类型</span> : <span class="secCon">轮胎</span>
                        </span>
                        <span class="pull-right">
                            <span>配件名称</span> : <span class="secCon">米其林轮胎</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>供应商</span> : <span class="secCon" style="vertical-align: top;">山西长治啦啦啦啦有限责任公司</span>
                        </span>
                        <span class="pull-right">
                            <span>单价(元)</span> : <span class="secCon">32</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>销售单价(元)</span> : <span class="secCon">40</span>
                        </span>
                        <span class="pull-right">
                            <span>销售数量</span> : <span class="secCon">32</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>半年质保价(元)</span> : <span class="secCon">33</span>
                        </span>
                        <span class="pull-right">
                            <span>出厂日期</span> : <span class="secCon">2018-09-18</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>销售日期</span> : <span class="secCon">2018-09-18</span>
                        </span>
                        <span class="pull-right">
                            <span>质保期</span> : <span class="secCon">2018-09-18</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left" style="width:100%;">
                            <span>备注</span> :
                            <span class="secCon">
                                无
                            </span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>服务费(元)</span> : <span class="secCon">100</span>
                        </span>
                        <span class="pull-right">
                            <span>负责人</span> : <span class="secCon">张三</span>
                        </span>
                    </p>
                    <p>
                        <span class="pull-left">
                            <span>里程数(公里)</span> : <span class="secCon">18</span>
                        </span>
                        <span class="pull-right">
                            <span>总价(元)</span> : <span class="secCon">2018</span>
                        </span>
                    </p>
                    <p style="margin-bottom:-10px;margin-bottom:-0.2rem;">
                         <span style="width:100%;">
                            <span>备注</span> :
                            <span class="secCon">
                                啦啦啦啦啦放假我放假就覅年你发i发飞鸟忘记哦掉完痂哦怕我去
                            </span>
                        </span>
                    </p>

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
</body>
</html>
