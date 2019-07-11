<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>卡片类型设置</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/scrollTable.css" />
<link rel="stylesheet" type="text/css"
	href="/Qiqiang/static/css/iconfont.css">
<style>
.sec .row span {
	display: inline-block;
}

.toUpSec .row {
	width: 100%;
	margin: 0.2rem 0rem 0rem;
}

.toUpSec .row .col-md-2 {
	padding-left: 0rem !important;
}

.toUpSec .row .col-md-10 {
	display: inline-block;
	width: 70%;
}

.toUpSec .row .col-md-10 .form-control {
	width: 100%;
	display: inline-block;
}

.tableDiv {
	width: 100%;
	height: auto;
	overflow-x: scroll;
	overflow-y: scroll;
}

.table {
	margin-top: 10px;
	margin-top: 0.2rem;
	margin-bottom: 0px;
}

.dc {
	background-color: #dcdcdc;
}

th,td {
	white-space: nowrap;
}

i {
	font-style: normal;
}

#GYS-div{
    position:relative;
    height:34px;
    height: 0.68rem;
}
#GYS-div>span:nth-child(1){
    position:absolute;
    overflow:hidden;
    width:100%;
    height:34px;
    height: 0.68rem;
}
#GYS-div>span:nth-child(2){
    position:absolute;
    margin-top:1px;
    margin-left:1px;
    width:95%;
    height:32px;
    height: 0.66rem;
    border-radius:5px;
}
.qlc_zdz1{
    height:34px;
    height: 0.68rem;
    outline:0;
}
.qlc_zdz{
    width:94%;
    height:32px;
    height: 0.64rem;
    border:0pt;
    border-radius:5px;
    outline:0
}
</style>
</head>
<body>
<form   id="setVipCardTypePrice" onsubmit="return false" action="##" method="post">
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

				<section class="sec" style="margin-top:15px;">
					<div>
						<div class="row" style="margin:0rem;width: 100%;">
							<button type="button" class="btn pkwh">卡片维护</button>
						</div>
						<div class="tableDiv">
							<div style="width:100%" class="list">
								<table class="table xfxq"
									style="margin-top: 5px;    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;">
									<thead>
										<tr>
											<td>姓名</td>
											<td>手机号</td>
											<td>车牌号</td>
											<td>卡类型</td>
										</tr>
									</thead>
									<tbody>
										<%-- <c:forEach items="${u_list }" var="u" varStatus="st">
		                        <tr>
		                            <td>${u.name}</td>
		                            <td>${u.mobile}</td>
		                            <td>${u.plateno}</td>
		                            <td id="level_${st.index }" class="level">${u.level}</td>
		                         
		                        </tr>
		                     </c:forEach> --%>
										<tr>
											<td>${selectInfo.name}</td>
											<td>${selectInfo.mobile}</td>
											<td>${selectInfo.plateno}</td>
											<td>${selectInfo.level}</td>

										</tr>
									</tbody>

								</table>
							</div>
						</div>


						<div class="toUpSec" style="margin-top: 1rem;">
						   <div class="row" style="display:flex">
								<span class="col-md-2"
									style="vertical-align: middle;    margin-top: 3px;">车牌号：</span>
								<span class="col-md-10" style="width:120%;"> <%--                          --%>
									<div id="GYS-div" style="margin-top:0rem;">
										<span> <!--这个是个多选框，用onchange事件的时候 ，将这个select的id传进去-->
											<select name="car_id"  required="required" id="platenoSel" class="form-control">
													<!-- <option value="">请选择车牌号</option> -->
												<c:forEach items="${carList}" var="c">
													<option value="${c.id}">${c.plateno}</option>
												</c:forEach>
										</select> </span> 
									</div> </span>
							</div>
							<div class="row" style="display:flex">
								<span class="col-md-2"
									style="vertical-align: middle;    margin-top: 3px;">设置卡片类型：</span>
								<span class="col-md-10" style="width:120%;"> <%--                          --%>
									<div id="GYS-div" style="margin-top:0rem;">
										<span> <!--这个是个多选框，用onchange事件的时候 ，将这个select的id传进去-->
											<select name="" id="viplevel" class="form-control  viplevel">
												<c:forEach items="${vipLevelList}" var="v">
													<option value="${v.id}">${v.level}</option>
												</c:forEach>
										</select> </span> <span style="width:88%"> 
											<input type="text"  name="level"
											required="required" value=""  maxlength="20"
											id="viplevel" class="ccdd qlc_zdz  thisViplevel"
											placeholder="请选择或者输入卡片类型"
											style="width:100%;padding:0px;padding-left:0.1rem;">
										</span>
									</div> </span>
							</div>
							<div class="row" style="display:flex">
								<span class="col-md-2"
									style="vertical-align: middle;    margin-top: 3px;">洗车扣减金额：</span>
								<span class="col-md-10" style="width:120%;"> <input name="price" minlength="0" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"
								 required="required"  type="number" class="form-control"> </span>
							</div>
							<div class="row text-center" style="margin-top: 100px;">
								<button  type="submit" class="simpleAlertBtn simpleAlertBtn2" style="background-color: #48a3da;color:#fff;width:200px;    left: 23%;">确&nbsp;&nbsp;&nbsp;&nbsp;定</button>
							</div>

						</div>
				</section>

			</div>
		</div>
	</div>
	</form>
	<!--弹窗开始-->
	<div id="mask">
		<div class="simpleAlertBody"
			style="width: 85%;left: 7%;height: 190px;">
			<i class="simpleAlertBodyClose 	glyphicon glyphicon-remove"
				style="top: 8px;right: 5px;"></i>
			<div class="simpleAlertBodyContent"
				style="height: 2.7rem;top: 20%;width: 88%;left: 8%; "></div>
			<input type="hidden" name="target_id"> <input type="hidden"
				name="level_id">


		</div>
	</div>
	<!--弹窗结束-->
	<script>
		(function(doc, win) {
			var docEl = doc.documentElement, resizeEvt = 'orientationchange' in window ? 'orientationchange'
					: 'resize', recalc = function() {
				var clientWidth = docEl.clientWidth;
				if (!clientWidth)
					return;
				docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
			};

			if (!doc.addEventListener)
				return;
			win.addEventListener(resizeEvt, recalc, false);
			doc.addEventListener('DOMContentLoaded', recalc, false);
		})(document, window);
	</script>

	<script type="text/javascript" src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/mask.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/footerKP.js"></script>
	<script>
		$(".simpleAlertBtn,.simpleAlertBodyClose").click(function() {
			$("#mask").fadeOut();
		})

		$("table").delegate(".sure", "click", function() {
			var user_id = $(this).attr("user_id");
			$("input[name='target_id']").val(user_id);
			var level_id = $(this).parent().siblings(".level").attr("id");
			$("input[name='level_id']").val(level_id);
			$("#mask").fadeIn();
		})
	</script>
	<script>
		$(".trans_type")
				.click(
						function() {
							var trans_type = $(this).attr("id");
							console.log("trans_type " + trans_type);
							var count = parseInt($("input[name='count']").val());
							var start = parseInt($("input[name='start']").val());
							var last = parseInt($("input[name='last']").val());
							var param = $("input[name='param']").val();
							var pages = parseInt($("input[name='pages']").val());
							var cur_page = parseInt($("input[name='cur_page']")
									.val());
							var cur_page_cli = parseInt($("#cur_page").text());
							//var oidx = parseInt($(".xfxq").find("tbody").find("tr").first().find("td").first().text());
							switch (trans_type) {
							case "start":
								start = 0;
								//oidx = 1;
								$("#cur_page").text(cur_page);
								break;
							case "prev":
								start -= count;
								if (start < 0) {
									start = 0;
									$("#cur_page").text(cur_page);
								} else {
									//oidx -= count;
									$("#cur_page").text(cur_page_cli - 1);
								}
								break;
							case "next":
								start += count;
								if (start > last) {
									start = last;
									$("#cur_page").text(pages);
								} else {
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
							$
									.post({
										url : "/Qiqiang/SelfInfoController/cardTypeTrans",
										data : {
											"start" : start,
											"count" : count,
											"param" : param,
											"vip" : "vip"
										},
										async : false,
										success : function(args) {
											var pList = $.parseJSON(args).u_list;
											$(".xfxq").find("tbody").empty();
											$
													.each(
															pList,
															function(idx, val) {
																var url = "/Qiqiang/SelfInfoController/selfInfo.action?user_id="
																		+ val.id
																$(".xfxq")
																		.find(
																				"tbody")
																		.append(
																				"<tr><td>"
																						+ val.name
																						+ "</td><td>"
																						+ val.mobile
																						+ "</td><td>"
																						+ val.plateno
																						+ "</td><td class='level' id='level_"+oidx+"'>"
																						+ val.level
																						+ "</td><td><span class='setting sure' user_id="+val.id+" style='color:#48a3da'>设置</span></td></tr>")
																oidx += 1;
															});
										}
									})
						})
	</script>
	<script>
		$("table tbody").delegate("tr", "click", function() {
			$(this).addClass("dc").siblings("tr").removeClass("dc");
		})
	</script>
	<script>
		$(".pkwh").click(function() {
			location.href = "/Qiqiang/SelfInfoController/cardTypeEdit"
		})
		//根据卡片类型带出金额
		$(".viplevel").change(function() {
			var   $this   =$(this);
			var  selected  = $(".viplevel").find("option:selected");
			 $(".thisViplevel").val(selected.text());
			$(".formViplevel").val($this.val());


			//刘颢修改
			var id = $(this).val();
			$.ajax({
				
				type:"post",
				dataType:"json",
				url:"/Qiqiang/SelfInfoController/selectCardPrice",
				data:{
					id:id
				},
				success:function(msg){
					
					$("input[name='price']").val(msg.data.price);
					
				},
				error:function(){
					alert("数据异常");
				}
				
				
			})			
			
		})
			//新增
    $("#setVipCardTypePrice").submit(function(){
    	var pri = $(this).parent().parent().find("input[name='price']").val();
    	if(pri < 0){
    		layer.msg("金额不能为负数");
    		return false;
    	}
    	$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/Qiqiang/SelfInfoController/setVipCardTypePrice" ,//url
                data: $('#setVipCardTypePrice').serialize(),
                async:false,
                success: function (Msg) {
                   var  result   = Msg.result;
                   if(result>0){
                	  layer.msg("更改成功!");
                	  // alert("更改成功!");
                	 window.location.href="/Qiqiang/SelfInfoController/userCardTypeEdit";
                   }else{
                	   //  alert("更改失败");
                	  layer.msg("更改失败!");
                   }
                },
                error : function() {
                    alert("异常！");
                }
            });
    });
		
		var car_id = $("#platenoSel").val();
		$.ajax({
			type:"post",
			url:"/Qiqiang/SelfInfoController/selectCarInfotmation",
			dataType:"json",
			data:{
				id:car_id
			},
			success:function(msg){
				if(msg != null){
				$("input[name='price']").val(msg.data.price);
				//$("input[name='level']").val(msg.data.level);
				var  select  =  $(".viplevel");
				
				$(".viplevel").val(msg.data.id);
				
				$(".viplevel").change();
				}
			},
			error:function(){
				alert(404);
			}
		})	
    
	//根据车牌号去查找卡的类型带出金额
	$("select[name='car_id']").change(function(){
		var car_id = $(this).val();
		$.ajax({
			type:"post",
			url:"/Qiqiang/SelfInfoController/selectCarInfotmation",
			dataType:"json",
			data:{
				id:car_id
			},
			success:function(msg){
				if(msg != null){
				$("input[name='price']").val(msg.data.price);
				//$("input[name='level']").val(msg.data.level);
				var  select  =  $(".viplevel");
				
				$(".viplevel").val(msg.data.id);
				
				$(".viplevel").change();
				}
			},
			error:function(){
				alert(404);
			}
		})		
		
	})
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
