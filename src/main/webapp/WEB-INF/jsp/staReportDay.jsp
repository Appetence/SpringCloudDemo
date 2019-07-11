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
    <title>统计报表</title>
    <link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
    <link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
    <link rel="stylesheet" href="/Qiqiang/static/css/staReport.css"/>
    <link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
    <style>
        select {
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            background-color:#48a3da!important;
            color:#fff!important;
            padding-left:0.5rem!important;
        }
        i{
        	font-style:normal;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">

        <div class="col-md-12 info-con">
            <p class="titleP"><i class="iconfont icon-tongjibaobiao"></i> 统计报表</p>
            <section class="sec">
                <div class="titleDiv">
                    <span class="active">日报</span><span id="huizong">汇总</span><span id="cxtj">查询统计</span>
                </div>

                <!--日报开始-->
                <div id="One" class="daily">

                    <div class="row" style="padding: 0px 15px;margin-top: 10px;">
                        <b>今日概况</b>
                    </div>
                    <form action="">
                        <table class="table table-bordered" style="margin-top: 5px;table-layout:fixed;">
                            <tr>
                                <td>时间</td>
                                <td>充值金额</td>
                                <td>消费金额</td>
                                <td>活跃会员</td>
                            </tr>
                            <tr>
                                <td>今天</td>
                                <td>${recharge_today }</td>
                                <td>${consume_today }</td>
                                <td>${active_user_today}</td>
                            </tr>
                            <tr>
                                <td>昨天</td>
                                <td>${recharge_yesterday }</td>
                                <td>${consume_yesterday }</td>
                                <td>${active_user_yesterday}</td>
                            </tr>
                            <tr>
                                <td>本月</td>
                                <td>${recharge_tmonth }</td>
                                <td>${consume_tmonth }</td>
                                <td>${active_user_tmonth}</td>
                            </tr>
                            <tr>
                                <td>上月</td>
                                <td>${recharge_ymonth }</td>
                                <td>${consume_ymonth }</td>
                                <td>${active_user_ymonth}</td>
                            </tr>

                        </table>
                    </form>

                    <div class="row" style="padding: 0px 15px">
                        <b>今日消费情况</b>
                    </div>
                    <form action="">
                        <table class="table table-bordered xfxq" style="margin-top: 5px;table-layout:fixed;">
                            <thead>
                            <tr>
                                <td>序号</td>
                                <td>消费项目</td>
                                <td>消费金额</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pList}" var="p" varStatus="st">
                            <tr>
                                <td>${st.index + 1 }</td>
                                <td>${p.svr_item }</td>
                                <td>${p.price }</td>
                            </tr>
                            </c:forEach>
							</tbody>
                        </table>
                    </form>
                    <div class="text-center">
                        <input type="hidden" name="start" value="${statistic.start }">
                	 	<input type="hidden" name="count" value="${statistic.count }">
                	 	<input type="hidden" name="last" value="${statistic.last }">
                	 	<input type="hidden" name="project_id" value="${statistic.project_id }">
                	 	<input type="hidden" name="cur_page" value="${statistic.cur_page }">
	               	 	<input type="hidden" name="pages" value="${statistic.pages }">
	               	 	<p>共<i id="total">${statistic.total }</i>条记录&nbsp;&nbsp;第<i id="cur_page">${statistic.cur_page }</i>页&nbsp;&nbsp;共<i id="pages">${statistic.pages }</i>页</p>
                     	<button class="btn trans_type" id="start">首页</button>
                     	<button class="btn trans_type" id="prev">上一页</button>
                     	<button class="btn trans_type" id="next">下一页</button>
                     	<button class="btn trans_type" id="last">尾页</button>
                    </div>

                </div>
                <!--日报结束-->

            </section>
        </div>
    </div></div>
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
<script>
$(".trans_type").click(function(){
	var trans_type = $(this).attr("id");
	console.log("trans_type "+trans_type);
	var count = parseInt($("input[name='count']").val());
	var start = parseInt($("input[name='start']").val());
	var last = parseInt($("input[name='last']").val());
	var project_id = $("input[name='project_id']").val();
	var oidx = parseInt($(".xfxq").find("tbody").find("tr").first().find("td").first().text());
	var pages = parseInt($("input[name='pages']").val());
	var cur_page = parseInt($("input[name='cur_page']").val());
	var cur_page_cli = parseInt($("#cur_page").text());
	switch(trans_type){
	case "start":
		start = 0;
		oidx = 1;
		$("#cur_page").text(cur_page);
		break;
	case "prev":
		start -= count;
		if (start < 0){
			start = 0;
			$("#cur_page").text(cur_page);
		}else{
			oidx -= count;
			$("#cur_page").text(cur_page_cli - 1);
		}
		break;
	case "next":
		start += count;
		if (start > last){
			start = last;
			$("#cur_page").text(pages);
		}else{
			oidx += count;
			$("#cur_page").text(cur_page_cli + 1);
		}
		break;
	case "last":
		start = last;
		oidx = last + 1;
		$("#cur_page").text(pages);
		break;
	} 
	$("input[name='start']").val(start);
	$.post({
		url:"/Qiqiang/StatisticController/pagetrans",
		data:{
			"start":start,
			"count":count,
			"project_id":project_id,
			"date_type":"today"
		},
		async:false,
		success:function(args){
			var pList = $.parseJSON(args).pList;
			$(".xfxq").find("tbody").empty();
			$.each(pList,function(idx,val){
				$(".xfxq").find("tbody").append(
					"<tr><td>"+oidx+"</td><td>"+val.svr_item+"</td><td>"+val.price+"</td></tr>"
				)
				oidx += 1;
			});
		}
	})
})
</script>
<script>
	$("#huizong").click(function(){
		location.href="/Qiqiang/StatisticController/statisticHz"
	})
	$("#cxtj").click(function(){
		location.href="/Qiqiang/StatisticController/staReport"
	})
</script>
</body>
</html>
