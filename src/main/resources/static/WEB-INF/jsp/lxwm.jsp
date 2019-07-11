<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>九融科技</title>
    <style>
        .container{padding:20px 20px}

        h2{
            font-size:18px;}
        h3{
            font-size:14px; font-weight: normal}
        li{    list-style-type: disc;}
        ul, menu, dir {
            display: block;
            list-style-type: disc;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 20px;
            -webkit-padding-start: 20px;
        }

    </style>
</head>
<body>
<div class="container">
    <h1 style="font-size:70px; margin-top: 100px;">
        <center> &lt;/&gt;施工中，欢迎围观&lt;/&gt;</center>
    </h1>
    <h2 style="font-size:50px; margin-top: 80px;">
        <center>
            <p>会员管理</p>
            <p>营销拓客</p>
            <p>微信商城</p>
            <p>......</p>
            <br>
            <p>九融科技助力</p>
            <p>小微企业、商户拥抱微信时代</p>
            <p>010 89295636</p>
            <img src="/Bmth/static/images/jrewCode.jpg">
        </center>
    </h2>
</div>
</body>
</html>
