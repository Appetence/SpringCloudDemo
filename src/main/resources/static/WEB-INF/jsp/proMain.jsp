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
<title>项目维护</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css"/>
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
            width: 60%;
        }
        .toUpSec .row .col-md-10 .form-control{
            width: 100%;
            display: inline-block;
        }
        .tableIpt{
            background-color: transparent;
            height: 0.56rem;
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
            <p class="titleP"><i class="iconfont icon-yonghuxiangmuweihu"></i> 项目维护</p>
            <!--<p style="padding: 0rem 0.2rem" class="sure">-->
                <!--<button class="btn btn-block ">新增项目</button>-->
            <!--</p>-->
            <section class="sec">
                <div>
                    <div class="row" style="margin:0rem;width: 100%;text-align: center;">
                        <form action="/Qiqiang/SelfInfoController/proMain" method="post" style="display:inline">
	                        <span style="width: 50%;">
	                        <input type="text" placeholder="项目名称" class="form-control" name="svr_item" value="${statistic.svr_item }">
	                        </span>
	                        <button type="submit" class="btn">查询</button>
                        </form>
                        <button class="btn sure">新增项目</button>
                        <!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
                    </div>
                    <table class="table xfxq" style="margin-top: 5px;table-layout: fixed;">
                        <thead>
                        <tr>
                            <td>项目名称</td>
                            <td>单次金额</td>
                            <td>项目耗材</td>
                            <td style="text-align:center">操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${p_list }" var="p">
	                        <tr>
	                            <td>
	                                <input type="text" name="svr_item" class="form-control tableIpt" value="${p.svr_item}">
	                                <!--洗车-->
	                            </td>
	                            <td>
	                                <input type="text" name="svr_fee" class="form-control tableIpt" value="${p.svrfee }">
	                            </td>
	                            <td>
	                            	<select class="form-control tableIpt" name="status">
	                            		<option value="2" <c:if test="${p.status == 2 }">selected</c:if> >有</option>
	                            		<option value="1" <c:if test="${p.status == 1 }">selected</c:if>>无</option>
	                            	</select>
	                            </td>
	                            <td style="text-align:center">
	                                <span item_id="${p.id }" style="color:#337ab7" class="edit">修改</span>
	                            </td>
	                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
               	<div class="text-center">
               		<form action="/Qiqiang/SelfInfoController/proMainTrans" method="post">
	                    <input type="hidden" name="start" value="${statistic.start }">
	              	 	<input type="hidden" name="count" value="${statistic.count }">
	              	 	<input type="hidden" name="last" value="${statistic.last }">
	              	 	<input type="hidden" name="svr_item" value="${statistic.svr_item }">
	              	 	<input type="hidden" name="cur_page" value="${statistic.cur_page }">
	               	 	<input type="hidden" name="pages" value="${statistic.pages }">
	               	 	<input type="hidden" name="total" value="${statistic.total }">
	               	 	<p>共<i id="total">${statistic.total }</i>条记录&nbsp;&nbsp;第<i id="cur_page">${statistic.cur_page }</i>页&nbsp;&nbsp;共<i id="pages">${statistic.pages }</i>页</p>
	                  	<button type="submit" class="btn trans_type" id="start">首页</button>
	                  	<button type="submit" class="btn trans_type" id="prev">上一页</button>
	                  	<button type="submit" class="btn trans_type" id="next">下一页</button>
	                  	<button type="submit" class="btn trans_type" id="last">尾页</button>
                   	</form>
                </div>

                </div>
                <!--日报结束-->
            </section>
        </div>
    </div></div>
    <script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>

<!--弹窗开始-->
<div id="mask">
    <div class="simpleAlertBody" style="width: 85%;left: 7%;height: 280px;">
        <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove" style="top: 8px;right: 5px;"></i>
        <form id="addForm" action="addServiceItem" method="post">
	        <div class="simpleAlertBodyContent" style="height: 3.1rem;top: 20%;width: 88%;left: 8%; ">
	            <div class="toUpSec">
	                <div class="row">
	                    <span class="col-md-2">项目名称</span>
	                    <span class="col-md-10">
	                           <input type="text" class="form-control" name="svr_item" value="" placeholder="请输入" required>
	                    </span>
	                </div>
	                <div class="row">
	                    <span class="col-md-2">单次金额</span>
	                    <span class="col-md-10">
	                            <input type="text" class="form-control" name="svr_fee" value="" placeholder="请输入" pattern="^(0|([0-9]+\.[0-9]*)|([0-9]+\.[0-9]*[1-9][0-9]*)|([1-9][0-9]*\.[0-9]+)|([1-9][0-9]*))$" oninvalid="setCustomValidity('请输入正确格式')" oninput="setCustomValidity('')" required>
	                    </span>
	                </div>
	                <div class="row">
	                    <span class="col-md-2">项目耗材</span>
	                    <span class="col-md-10">
	                          <select name="status" class="form-control">
	                          	<option value="1">无耗材</option>
	                          	<option value="2">有耗材</option>
	                          </select>
	                    </span>
	                </div>
	            </div>
	        </div>
	        <button type="submit" class="simpleAlertBtn simpleAlertBtn2" style="right: 38%;">确定</button>
		</form>
    </div>
</div>
<div id="mask2">
    <div class="simpleAlertBody" style="width: 85%;left: 7%;height: 155px;">
        <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove" style="top: 8px;right: 5px;"></i>
        <div class="simpleAlertBodyContent text-center" style="height: 1.4rem;top: 20%;width: 88%;left: 8%;line-height: 1.4rem; ">
            确定后信息修改了哦~
        </div>
        <button class="simpleAlertBtn simpleAlertBtn2" style="right: 53%;">确定</button>
        <button class="simpleAlertBtn simpleAlertBtn2" style="right: 22%;background-color: #bfbfbf !important;">取消</button>
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
        //$("#mask").fadeOut();
        //$("#mask2").fadeOut();
    })
    $(".simpleAlertBodyClose").click(function () {
        $("#mask").fadeOut();
        //$("#mask2").fadeOut();
    })
    $(".sure").click(function () {
        $("#mask").fadeIn();
    })
    /* $(".edit").click(function () {
        $("#mask2").fadeIn();
    }) */

</script>

<script>
$(".trans_type").click(function(){
	var count = parseInt($("input[name='count']").val());
	var start = parseInt($("input[name='start']").val());
	var last = parseInt($("input[name='last']").val());
	var trans_type = $(this).attr("id");
	var pages = parseInt($("input[name='pages']").val());
	var cur_page = parseInt($("input[name='cur_page']").val());
	var cur_page_cli = parseInt($("#cur_page").text());
	var total = $("#total").text();
	switch(trans_type){
	case "start":
		start = 0;
		//oidx = 1;
		$("input[name='cur_page']").val(total == "0" ? 0 : 1);
		break;
	case "prev":
		start -= count;
		if (start < 0){
			start = 0;
			$("input[name='cur_page']").val(cur_page)
		}else{
			//oidx -= count;
			$("input[name='cur_page']").val(cur_page_cli - 1)
		}
		break;
	case "next":
		start += count;
		if (start > last){
			start = last;
			$("input[name='cur_page']").val(pages)
		}else{
			//oidx += count;
			$("input[name='cur_page']").val(cur_page_cli + 1)
		}
		break;
	case "last":
		start = last;
		//oidx = last + 1;
		$("input[name='cur_page']").val(pages)
		break;
	} 
	$("input[name='start']").val(start);
})
</script>

<script>
	$("#addForm").submit(function(){
		var svr_item = $(this).find("input[name='svr_item']").val();
		var item_pattern = /^\s*$/;
		if (svr_item.length == 0 || item_pattern.test(svr_item)){
			alert("项目名称不能为空!");
			return false;
		}
		var flag = true;
		$.post({
			url:"/Qiqiang/SelfInfoController/checkItem",
			data:{
				"svr_item":svr_item,
				"svr_item_id":0
			},
			async:false,
			success:function(args){
				if (args !=null && args == 'repeat'){
					alert("项目名称重复!");
					flag = false;
				} 
				if (args == null) {
					alert("系统异常,请重试!");
					flag = false;
				}
			}
		})
		return flag;
	})
</script>

<script>
	$("table").delegate(".edit","click",function(){
		var svr_item = $(this).parent().siblings("td").find("input[name='svr_item']").val();
		var svr_fee = $(this).parent().siblings("td").find("input[name='svr_fee']").val();
		var status = $(this).parent().siblings("td").find("select[name='status']").val();
		var svr_item_id = $(this).attr("item_id");
		var fee_pattern = /^(0|([0-9]+\.[0-9]*)|([0-9]+\.[0-9]*[1-9][0-9]*)|([1-9][0-9]*\.[0-9]+)|([1-9][0-9]*))$/;
		if (fee_pattern.test(svr_fee) == false){
			alert("金额["+svr_fee+"]格式不正确!");
			return false;
		}
		var item_pattern = /^\s*$/;
		if (svr_item.length == 0 || item_pattern.test(svr_item)){
			alert("项目名称不能为空!");
			return false;
		}
		$.post({
			url:"/Qiqiang/SelfInfoController/updateItem",
			data:{
				"svr_item":svr_item,
				"svr_fee":svr_fee,
				"svr_item_id":svr_item_id,
				"status":status
			},
			async:false,
			success:function(args){
				switch(args){
				case "repeat":
					alert("项目名称重复!");
					break;
				case "error":
					alert("操作失败,请重试!");
					break;
				case "success":
					alert("修改成功");
				}
			}
		});
	})
</script>
<script>
	$("#wdxx").click(function(){
		location.href="/Qiqiang/SelfInfoController/bmthInfo.action";
	})
</script>
</body>
</html>
