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
<title>卡片类型设置</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/scrollTable.css" />
<link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
    <style>
        .sec .row span{
            display: inline-block;
        }
        .toUpSec .row{
            width: 100%;
            margin: 0.2rem 0rem 0rem;
        }
        .toUpSec .row .col-md-2{
            padding-left: 0rem !important;
        }
        .toUpSec .row .col-md-10{
            display: inline-block;
            width: 70%;
        }
        .toUpSec .row .col-md-10 .form-control{
            width: 100%;
            display: inline-block;
        }
		.tableDiv {
		width: 100%;
		height: auto;
		overflow-x: scroll;
		overflow-y: scroll;
		}
		.table{
		margin-top:10px;
		margin-top:0.2rem;
		margin-bottom:0px;
		}
		.dc{
			background-color:#dcdcdc;
		}
		th,td{
	    	white-space:nowrap;
	    }
	    i{
	    	font-style:normal;
	    }
    </style>
</head>
<body>
<div class="container">
	<c:choose>
	  	<c:when test="${sessionScope.selectInfo != null }">
		  <input type="hidden" id="footKey" value="single">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="footKey" value="all">
		</c:otherwise>
	  </c:choose>
    <div class="row">
        <div class="col-md-12 info-con">
            <p class="titleP"><i class="iconfont icon-leixingshezhi"></i> 卡片类型设置</p>
            <section class="sec">
                <div>
                    <div class="row" style="margin:0rem;width: 100%;text-align: center;">
                        <form action="cardType" method="post" style="display:inline">
	                        <span  style="width: 80%;">
	                        <input  type="text" name="param" placeholder="姓名/手机号/车牌号" class="form-control" value="${statistic.param }">
	                        </span>
	                        <input type="hidden" name="vip" value="vip">
	                        <button type="submit" class="btn" type="submit">查询</button>
                        </form>
                        <!-- <button class="btn pkwh">卡片维护</button> -->
                        <!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
                    </div>
                    <div class="tableDiv">
                    	<div style="width:100%" class="list">
                    		<table class="table xfxq" style="margin-top: 5px;">
                    	<thead>
	                        <tr>
	                        	<td>操作</td>
	                            <td>姓名</td>
	                            <td>手机号</td>
	                            <td>车牌号</td>
	                            <td>卡类型</td>
	                        </tr>
                        </thead>
                        <tbody>
	                        <c:forEach items="${u_list }" var="u" varStatus="st">
		                        <tr>
		                        	<td>
		                                <span class="setting sure" user_id="${u.id }" bid="${u.bid }" style="color:#48a3da">设置</span>
		                            </td>
		                            <td>${u.name}</td>
		                            <td>${u.mobile}</td>
		                            <td>${u.plateno}</td>
		                            <td id="level_${st.index }" class="level">${u.level}</td>
		                        </tr>
		                     </c:forEach>
                        </tbody>
                        
                    </table>
                    	</div>
                    </div>
                    
                    
               	 <div class="text-center">
	                    <input type="hidden" name="start" value="${statistic.start }">
	               	 	<input type="hidden" name="count" value="${statistic.count }">
	               	 	<input type="hidden" name="last" value="${statistic.last }">
	               	 	<input type="hidden" name="param" value="${statistic.param }">
	               	 	<input type="hidden" name="cur_page" value="${statistic.cur_page }">
	               	 	<input type="hidden" name="pages" value="${statistic.pages }">
	               	 	<p>共<i id="total">${statistic.total }</i>条记录&nbsp;&nbsp;第<i id="cur_page">${statistic.cur_page }</i>页&nbsp;&nbsp;共<i id="pages">${statistic.pages }</i>页</p>
	               	 	
	                   	<button class="btn trans_type" id="start">首页</button>
	                   	<button class="btn trans_type" id="prev">上一页</button>
	                   	<button class="btn trans_type" id="next">下一页</button>
	                   	<button class="btn trans_type" id="last">尾页</button>
	                </div>
               
                </div>
            </section>

            <!-- <div class="text-center" style="margin-top: 20px;">
                <button class="btn sure">设置等级</button>
                <button class="btn">确定</button>
            </div> -->
        </div>
    </div></div>
    <script type="text/javascript" src="/Qiqiang/static/js/footerKP.js"></script>
<!--弹窗开始-->
<div id="mask">
    <div class="simpleAlertBody" style="width: 85%;left: 7%;height: 190px;">
        <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove" style="top: 8px;right: 5px;"></i>
        <div class="simpleAlertBodyContent" style="height: 2.7rem;top: 20%;width: 88%;left: 8%; ">
            <div class="toUpSec text-center">
                <div class="row">
                    <span class="col-md-2">设置卡片类型</span>
                    <span class="col-md-10" style="margin-top: 0.2rem;">
                        <select name="" id="viplevel" class="form-control">
                            <c:forEach items="${vip_list}" var="v">
                            	<option value="${v.id}">${v.level}</option>
                            </c:forEach>
                        </select>
                    </span>
                </div>
            </div>
        </div>
        <input type="hidden" name="target_id" >
        <input type="hidden" name="level_id">
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
<script type="text/javascript" src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="/Qiqiang/static/js/mask.js"></script>
<script>
    $(".simpleAlertBtn,.simpleAlertBodyClose").click(function () {
        $("#mask").fadeOut();
    })
    
    $(".simpleAlertBtn").click(function(){
    	var user_id = $("input[name='target_id']").val();
    	var viplevel = $("#viplevel").val();
    	var level_id = $("input[name='level_id']").val();
    	$.post({
    		url:"/Qiqiang/SelfInfoController/setCardType",
    		data:{
    			"id":user_id,
    			"viplevel":viplevel
    		},
    		async:false,
    		success:function(args){
    			if (args != null && args != ''){
    				$("#"+level_id).text(args);
    			}
    		}
    	})
    })
    
    /* $("table").delegate(".sure","click",function () {
    	var user_id = $(this).attr("user_id");
    	$("input[name='target_id']").val(user_id);
        var level_id = $(this).parent().siblings(".level").attr("id");
        $("input[name='level_id']").val(level_id);
    	$("#mask").fadeIn();
    }) */
    $("table").delegate(".sure","click",function () {
    	var bid = $(this).attr("bid");
    	location.href="cardTypeS?bid="+bid;
    })
</script>
<script>
$(".trans_type").click(function(){
	var trans_type = $(this).attr("id");
	console.log("trans_type "+trans_type);
	var count = parseInt($("input[name='count']").val());
	var start = parseInt($("input[name='start']").val());
	var last = parseInt($("input[name='last']").val());
	var param = $("input[name='param']").val();
	var pages = parseInt($("input[name='pages']").val());
	var cur_page = parseInt($("input[name='cur_page']").val());
	var cur_page_cli = parseInt($("#cur_page").text());
	//var oidx = parseInt($(".xfxq").find("tbody").find("tr").first().find("td").first().text());
	switch(trans_type){
	case "start":
		start = 0;
		//oidx = 1;
		$("#cur_page").text(cur_page);
		break;
	case "prev":
		start -= count;
		if (start < 0){
			start = 0;
			$("#cur_page").text(cur_page);
		}else{
			//oidx -= count;
			$("#cur_page").text(cur_page_cli - 1);
		}
		break;
	case "next":
		start += count;
		if (start > last){
			start = last;
			$("#cur_page").text(pages);
		}else{
			//oidx += count;
			$("#cur_page").text(cur_page_cli + 1);
		}
		break;
	case "last":
		start = last;
		//oidx = last + 1;
		$("#cur_page").text(pages);
		break;
	} 
	$("input[name='start']").val(start);
	var oidx = 0;
	$.post({
		url:"/Qiqiang/SelfInfoController/cardTypeTrans",
		data:{
			"start":start,
			"count":count,
			"param":param,
			"vip":"vip"
		},
		async:false,
		success:function(args){
			var pList = $.parseJSON(args).u_list;
			$(".xfxq").find("tbody").empty();
			$.each(pList,function(idx,val){
				var url = "/Qiqiang/SelfInfoController/selfInfo.action?user_id="+val.id
				$(".xfxq").find("tbody").append(
					"<tr><td><span class='setting sure' user_id="+val.id+" bid="+val.bid+" style='color:#48a3da'>设置</span><td>"+val.name+"</td><td>"+val.mobile+"</td><td>"+val.plateno+"</td><td class='level' id='level_"+oidx+"'>"+val.level+"</td></tr>"
				)
				oidx += 1;
			});
		}
	})
})
</script>
<script>
	$("table tbody").delegate("tr","click",function(){
		$(this).addClass("dc").siblings("tr").removeClass("dc");
	})
</script>
<script>
	$(".pkwh").click(function(){
		location.href="/Qiqiang/SelfInfoController/cardTypeEdit"
	})
</script>
<script>
	$.post({
		url:"/Qiqiang/getPermission.action",
		async:false,
		data:{},
		success:function(args){
			var recharge = args.recharge;
			var consume = args.consume;
			if (recharge ==null || recharge == ""){
				$("#xfxq").empty();
			}
			if (consume ==null || consume == ""){
				$("#zq").empty();
			}
		}
	});
  </script>
</body>
</html>
