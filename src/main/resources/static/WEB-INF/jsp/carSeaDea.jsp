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
    <title>修车记录详情</title>
    <link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
    <link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
    <link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
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
            padding-left: 0.2rem;
        }
        .sec div p:nth-child(1){
            padding-top: 0rem;
        }
        .sec div p>span{
            display: inline-block;
            width: 80%;
            text-align: left;
            
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">

        <div class="col-md-12 info-con">
            <p class="titleP"><i class="iconfont  icon-icon-test"></i> 修车记录详情</p>
	            <section class="sec">
	             <c:forEach items="${datailDateList}" var="datailDate">
	                <div>
	                    <p>
	                        <span class="pull-left">
	                            <span>扣减项目</span> : <span class="secCon">${datailDate.svr_item}</span>
	                        </span>
	                       
	                    </p>
	                    <p>
	                     <span class="pull-left">
	                            <span>支付类型</span> : <span class="secCon">${datailDate.Paytype}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>配件类型</span> : <span class="secCon">${datailDate.parts_type}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>配件名称</span> : <span class="secCon">${datailDate.parts}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>供应商</span> : <span class="secCon" style="vertical-align: top;">${datailDate.supplier}</span>
	                        </span>
	                    </p>
	                    <p>
	                        
	                        <span class="pull-left">
	                            <span>进货单价(元)</span> : <span class="secCon">${datailDate.ps_price}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>销售单价(元)</span> : <span class="secCon">${datailDate.parts_price}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>销售数量</span> : <span class="secCon">${datailDate.parts_sum}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>质保价(元)</span> : <span class="secCon">${datailDate.qualityassurance_price}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>出厂日期</span> : <span class="secCon">${datailDate.sc_date}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>销售日期</span> : <span class="secCon">${datailDate.date}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>质保期</span> : <span class="secCon">${datailDate.qualityassurance_date}</span>
	                        </span>
	                    </p>
	                    <!--<p>
	                        <span class="pull-left" style="width:100%;">
	                            <span>备注</span> :
	                            <span class="secCon">
	                                无
	                            </span>
	                        </span>
	                    </p>-->
	                    <p>
	                        <span class="pull-left">
	                            <span>服务费(元)</span> : <span class="secCon">${datailDate.repair_price}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>负责人</span> : <span class="secCon">${datailDate.customername}</span>
	                        </span>
	                    </p>
	                    
	                    <p>
	                        <span class="pull-left">
	                            <span>里程数(公里)</span> : <span class="secCon">${datailDate.mileage}</span>
	                        </span>
	                    </p>
	                    <p>
	                        <span class="pull-left">
	                            <span>总价(元)</span> : <span class="secCon">${datailDate.thisProjectPrice+datailDate.qualityassurance_price}</span>
	                        </span>
	                    </p>
	                    <p style="margin-bottom:-10px;margin-bottom:-0.2rem;">
	                         <span style="width:100%;">
	                            <span>备注</span> :
	                            <span class="secCon">
	      							${datailDate.repairRemark}
	                            </span>
	                        </span>
	                    </p>
	
	                </div>
	                </c:forEach>
            </section>
        </div>
    </div>
   
</div>
 <script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>
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
