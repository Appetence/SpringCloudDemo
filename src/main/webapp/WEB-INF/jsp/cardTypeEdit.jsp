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
<title>卡片类型维护</title>
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
            <p class="titleP"><i class="iconfont icon-yonghuxiangmuweihu"></i> 卡片类型维护</p>
            <!--<p style="padding: 0rem 0.2rem" class="sure">-->
                <!--<button class="btn btn-block ">新增项目</button>-->
            <!--</p>-->
            <section class="sec">
                <div>
                    <div class="row" style="margin:0rem;width: 100%;text-align: center;">
                        <%-- <form action="/Qiqiang/SelfInfoController/proMain" method="post" style="display:inline">
	                        <span style="width: 50%;">
	                        <input type="text" placeholder="项目名称" class="form-control" name="svr_item" value="${statistic.svr_item }">
	                        </span>
	                        <button type="submit" class="btn">查询</button>
                        </form> --%>
                        <button class="btn sure">新增卡片类型</button>
                         <button class="btn pzCl">关联客户</button>
                        <!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
                    </div>
                    <table class="table xfxq" style="margin-top: 5px;table-layout: fixed;">
                        <thead>
                        <tr>
                            <td>卡片类型名称</td>
                            <td>洗车扣减金额</td>
                            <td style="text-align:center">操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${v_list }" var="v">
	                        <tr>
	                            <td>
	                                <input type="text" name="level" class="form-control tableIpt" value="${v.level}" maxlength="20"/>
	                                <!--洗车-->
	                            </td>
	                            <td>
	                                <input type="number" name="price" class="form-control tableIpt" value="${v.price }" />
	                                <!--洗车-->
	                            </td>
	                            <td style="text-align:center;display:flex">
	                                <span item_id="${v.id }" style="color:#337ab7" class="edit">保存</span>
	                                 <span item_id="${v.id }" style="color:#337ab7" class="delete">删除</span>
	                            </td>
	                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
                <!--日报结束-->
            </section>
        </div>
    </div></div>
    <script type="text/javascript" src="/Qiqiang/static/js/footerKP.js"></script>

<!--弹窗开始-->
<div id="mask">
    <div class="simpleAlertBody" style="width: 85%;left: 7%;height: 240px;">
        <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove" style="top: 8px;right: 5px;"></i>
        <form id="addForm" action="#" onsubmit="return false" method="post">
	        <div class="simpleAlertBodyContent" style="height: 3.1rem;top: 20%;width: 88%;left: 8%; ">
	            <div class="toUpSec">
	                <div class="row">
	                    <span class="col-md-2"  style="padding-right:0px;">卡片类型名称</span>
	                    <span class="col-md-10">
	                    	<input type="text" maxlength="20" class="form-control emojiTxt" name="viplevel" value="" placeholder="请输入" required>
	                    	<input type="hidden" name="send_flag" value="add">	
	                    </span>
	                </div>
	                <div class="row">
	                    <span class="col-md-2" style="padding-right:0px;">洗车扣减金额</span>
	                    <span class="col-md-10">
	                    	<input type="number" class="form-control price" name="price" value="" placeholder="请输入"  required>
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
<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>
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

<script>/*
	$("#addForm").submit(function(){
		var level = $(this).find("input[name='viplevel']").val();
		var send_flag = $(this).attr("send_flag");
		var item_pattern = /^\s*$/;
		if (level.length == 0 || item_pattern.test(level)){
			alert("卡片名称不能为空!");
			return false;
		}
		//alert ("level == = "+level);
		var flag = true;
		$.post({
			url:"/Qiqiang/SelfInfoController/checkCardType",
			data:{
				"level":level,
				"send_flag":send_flag
			},
			async:false,
			success:function(args){
				if (args !=null && args == 'repeat'){
					alert("卡片名称重复!");
					flag = false;
				} 
				if (args == null) {
					alert("系统异常,请重试!");
					flag = false;
				}
			}
		})
		return flag;
	})*/
</script>

<script>
	$("table").delegate(".delete","click",function(){
		var deleFlag  = $(this).attr("item_id");
		layer.confirm("是否确认删除？", {
										btn : [ '确认', '取消' ]
									//按钮
									}, function(index1) {
										var level_id = deleFlag;
										$.post({
											url:"/Qiqiang/SelfInfoController/cardTypeDeleate",
											data:{
												"level_id":level_id
											},
											async:false,
											success:function(args){
												if(args == -1){
								
													layer.msg("该类型卡片有关联用户，请取消关联后再重试");
												}
												if(args == 0){
								
													layer.msg("该类型卡片删除失败，请稍后重试");
												}
												if(args != -1 && args != 0){
								
													layer.msg("删除成功");
													setTimeout('delayer()', 750);
												}
												
											}
										}, function() {
										var index = layer.msg('已取消', {
											time : 1000
										});
										/* layer.close(index); */
										return false;
									});															

									
									});
	})

	$("table").delegate(".edit","click",function(){
		var level = $(this).parent().siblings("td").find("input[name='level']").val();
		//alert("level  "+level)
		var level_id = $(this).attr("item_id");
		//alert("level_id "+level_id);
		//var price = $("input[name='price']").val();
		var price = $(this).parent().parent().find("td").find("input[name='price']").val();
		if(price < 0){
			layer.msg("金额不能为负数");
			return false;
		}
		var item_pattern = /^\s*$/;
		if (level.length == 0 || item_pattern.test(level)){

			layer.msg("卡片类型不能为空!");
			return false;
		}
		$.post({
			url:"/Qiqiang/SelfInfoController/cardTypeUpdate",
			data:{
				"level":level,
				"level_id":level_id,
				"price" : price
			},
			async:false,
			success:function(args){
				switch(args){
				case "repeat":
					layer.msg("卡片类型重复!");
					break;
				case "error":
					layer.msg("操作失败,请重试!");
					break;
				case "success":
					layer.msg("修改成功");
					setTimeout('delayer()', 750);
					
				}
			}
		});
	})
	

	$(".pzCl").click(function(){
		var footKey = $("#footKey").val();
		if (footKey == 'all'){
			location.href="/Qiqiang/SelfInfoController/cardType?cx_flag=0";
		}
		if (footKey == 'single'){
			location.href="/Qiqiang/SelfInfoController/userCardTypeEdit";
		}
	})

	$("#addForm").submit(function(){
		var pri = $(this).parent().parent().find(".price").val();
		if(pri < 0){
			layer.msg("金额不能为负数");
			return false;
		}
		
		$.ajax({
			type:"post",
			url:"/Qiqiang/SelfInfoController/cardTypeEditAjax",
			dataType:"json",
			data: $('#addForm').serialize(),
			  success: function (msg) {
                  var  result   = msg.result;
                  if(result==1){
               	   	layer.msg(msg.message);
               		setTimeout('delayer()', 750);
                  }else{
               	  	layer.msg(msg.message);
                  }
               },
               error : function() {
            	   layer.msg("异常！");
               }
			
			
		})
		
		
	})
	
	function delayer(){
      window.location = "/Qiqiang/SelfInfoController/cardTypeEdit";
    }
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
<script>

var regStr = /[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF][\u200D|\uFE0F]|[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF]|[0-9|*|#]\uFE0F\u20E3|[0-9|#]\u20E3|[\u203C-\u3299]\uFE0F\u200D|[\u203C-\u3299]\uFE0F|[\u2122-\u2B55]|\u303D|[\A9|\AE]\u3030|\uA9|\uAE|\u3030/ig;
								$(".emojiTxt").keyup(function(){
									
									$(this).val($(this).val().replace(regStr, '').replace(/(\s*$)/g, ""));
							  });
</script>

</body>
</html>
