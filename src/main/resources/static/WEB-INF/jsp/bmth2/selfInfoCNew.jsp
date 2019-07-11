﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>个人信息</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/selfInfo.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/staReport.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/scrollTable.css" />
<link rel="stylesheet" type="text/css"
	href="/Qiqiang/static/css/iconfont.css">
<style>
.simpleAlertBtn3 {
	left: 15%;
	position: absolute;
	width: 70px;
	height: 34px;
	top: 60%;
	border: 1px solid #bfbfbf;
	cursor: pointer;
	border-radius: 5px;
	color: #fff;
	font-size: 16px;
}

.simpleAlertBtn2 {
	position: absolute;
	width: 70px;
	height: 34px;
	top: 60%;
	border: 1px solid #bfbfbf;
	cursor: pointer;
	border-radius: 5px;
	color: #fff;
	font-size: 16px;
}

.seeClass span{
	display: block;
    padding: 6px 12px;
    margin-left: 20px;
    font-size: 16px;
}

.consumptionTable td{ white-space:nowrap;}
.sec div{width:100%!important;}
.simpleAlertBodyClose{top:0px!important;right:0px!important;}
.table-responsive{border:0px;}
table td{text-align:center;}
.addSec div{border:0px;}
.addSec input{width: 95%;}
 .addSec select  {width: 95%;}
 .shTa td{white-space:nowrap;text-align:center;}
.layui-layer-content{padding:0px!important;}
.shTa{width:100%;overflow:scroll;}
#mask, #mask2{left:0px;}

.list::-webkit-scrollbar {
    width: 5px;
    height: 8px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
}
</style>
</head>
<body>
	<div class="container">
	  <c:choose>
	    <c:when test="${sessionScope.selectInfo == null }">
			<input type="hidden" id="footKey" value="all">
		</c:when>
	  	<c:when test="${sessionScope.selectInfo == 'self' }">
		  <input type="hidden" id="footKey" value="self">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="footKey" value="single">
		</c:otherwise>
	  </c:choose>
		
		<div class="row">
			
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							消费详情 <a data-toggle="collapse" data-parent="true"
								href="#collapseOne" style="float:right"><c:if test="${sessionScope.selectInfo == 'self'  }"><i
								class="	glyphicon glyphicon-minus gly"></i></c:if>
								<c:if test="${sessionScope.selectInfo != 'self' }"><i
								class="	glyphicon glyphicon-plus gly"></i></c:if> </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse  <c:if test="${sessionScope.selectInfo != null and sessionScope.selectInfo == 'self'  }">in</c:if>">
						<div class="panel-body" style="">
							<div class="col-md-12 " style="padding:0px 0px;">

								<div class="titleDiv text-center">
									<span class="active consumption" style="width: 49%;">消费</span><span
										class="Recharge" style="width: 49%;">充值</span>
								</div>
								<div>
									<div class="row" style="padding: 0px 15px;margin-top: 10px;">
										<b>交易记录</b>
									</div>
									<div class="tableDiv">
										<form action="">
										<!-- 消费 -->
										<c:if test="${trans_type==0}">
												<div class="table-responsive list">
													<table class="table  consumptionTable">
														<tr>
															<td>服务项目</td>
															<td>金额</td>
															<td>消费次数</td>
															<td>剩余次数</td>
															<td>车牌号</td>
															<td>余额</td>
															<!-- 
															<td>赠送项目</td>
															 -->
															<td>交易时间</td>
															<td>备注</td>
														</tr>
														<c:forEach items="${dataList}" var="record">
															<tr>
																<td>${record.projectService.svr_item}</td>
																<td>${record.price}元</td>	
																<td><c:if test="${record.number > 0 && record.number != null && record.number != ''}">
																	${record.number}次
																</c:if>
																<c:if test="${record.number <= 0 || record.number == null ||record.number == ''}">
																</c:if></td>
																	
																<td>
																<c:if test="${record.number > 0 && record.number != null && record.number != ''}">
																	${record.realnumber}次
																</c:if>
																<c:if test="${record.number <= 0 || record.number == null ||record.number == ''}">
																</c:if>
																</td>
																<td>${record.car.plateno}</td>
																<td>${record.realbalance}元</td>
																<!-- 
																<td style="text-align:center;">
																
																<c:if test="${record.flag == 0 }"><a>无</a></c:if>
																<c:if test="${record.flag == 1 }"><a onclick="seeIt(${record.id})">查看</a></c:if>
																</td>
																 -->
																<td>${record.date}</td>
																<td><a class= "selectRemark">详情</a>
																<input name = "myRemark" class="myRemark" type="hidden" readonly="readonly" value="${record.remark}"/>
																</td>
															</tr>
														</c:forEach>
													</table>
												</div>
											</c:if>
											<!-- 充值 -->
											<c:if test="${trans_type==1}">
												<div class="table-responsive list">
													<table class="table  consumptionTable">
														<tr>
															<td>服务项目</td>
															<td>充值金额</td>
															<td>赠送金额</td>
															<td>余额</td>
															<td>赠送项目</td>
															<td>交易时间</td>
															<!-- 
															<td>详情</td>
															 -->
														</tr>
														<c:forEach items="${dataList}" var="record">
															<tr>
																<td>${record.projectService.svr_item}</td>
																<td>${record.price}元</td>
																<td>
																<c:if test="${empty record.practical||record.practical == null}">
																0元
																</c:if>
																<c:if test="${not empty record.practical||record.practical != null}">
																${record.practical}元
																</c:if>
																</td>
																<td>${record.realbalance}元</td>
																<td style="text-align:center;">
																	<c:if test="${record.flag == 0 }"><a>无</a></c:if>
																	<c:if test="${record.flag == 1 }"><a onclick="seeIt(${record.id})">查看</a></c:if>
																</td>
																<td>${record.date}</td>
																<!-- 
																<td><a class= "selectRemark">详情</a>
																<input name = "myRemark" class="myRemark" type="hidden" readonly="readonly" value="${record.remark}"/>
																</td>
																 -->
															</tr>
														</c:forEach>
													</table>
												</div>
											</c:if>
										</form>
									</div>
									<div class="text-center">
										<input type="hidden" id="flag" value="0"> 
										<input type="hidden" id="us_id" value="${us.id}">
										<p class="total">共${page.total}条记录&nbsp;&nbsp;第${page.pageNum}页&nbsp;&nbsp;共${page.pages}页</p>
										<button class="btn jump">首页</button>
										<input type="hidden" id="first" class="pagenow" value="1">
										<button class="btn jump">上一页</button>
										<input type="hidden" id="last" class="pagenow"
											value="${page.prePage}">
										<button class="btn jump">下一页</button>
										<input type="hidden" id="nest" class="pagenow"
											value="${page.nextPage}">
										<button class="btn jump">尾页</button>
										<input type="hidden" id="end" class="pagenow"
											value="${page.pages}">
										<input  type="hidden" class="user_id" value="${user_id}">
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							个人信息 <a data-toggle="collapse" data-parent="true"
								href="#collapseTwo" style="float:right"><i
								class="	glyphicon glyphicon-minus gly"></i> </a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body">
							<form action="" method="post">
								<div class="info-con" style="margin-bottom: 0rem;">

									<section class="sec"
										style="background-color: white;padding: 0.1rem 0rem 0.2rem">
										<div class="row">
											<span class="col-md-2" style="width:32%;">会员卡余额</span> <span
												class="col-md-10" style="width:45%;"> <input
												type="number" disabled style="background-color:#fff"
												class="form-control" value="${card.balance }"> </span>
											<c:if test="${role == 'user' }">

												<span class="col-md-4 " id="modifyBtn"
													style="width:17%;font-size: 14px!important;border: 1px solid #48a3da;padding: 0.06rem
        0.1rem;border-radius: 0.15rem;color:#48a3da;margin-left:0.15rem;"><i
													class="glyphicon glyphicon-pencil"></i>修改 </span>

											</c:if>
										</div>
										<div class="row">
											<span class="col-md-2">实际充值金额</span> <span class="col-md-10">
												<input type="number" disabled style="background-color:#fff"
												class="form-control" value="${card.practical }"> </span>
										</div>
										<span style="margin-left: 10px;    line-height: 30px;">剩余赠送次数</span>
											<div class="row zsxmDiv" style="border:1px solid #48a3da;margin-bottom:10px;">
											
										<c:forEach   items="${givelist}" var="car" varStatus="st">
											<c:if test="${car.number > 0}">
												<div class="row" style="border:0px">
													<span class="col-md-2" style="width:30%;    padding-right: 0px;">${car.svr_item }</span> <span class="col-md-10" style="vertical-align:top;width:66%">
														车牌号：${car.plateno }
														次数：${car.number }
													</span>
												</div>
											</c:if>
										</c:forEach>
								
										</div>
										<div class="row" style="border-top:1px dashed #999;">
											<span class="col-md-2">姓&emsp;&nbsp;&nbsp;&nbsp;名</span> <span class="col-md-10">
												<input type="text" class="form-control  emojiTxt"
												value="${customer.name}" name="name" maxlength="10" required> <input
												type="hidden" name="update_flag" value="update_flag" >
												<input type="hidden" name="id" value="${customer.id }">
											<!-- 	<span style="position: absolute; right: 5px; top: 3px; color: red; font-size: 30px;">*</span> -->
											</span>
										</div>
										<div class="row">
											<span class="col-md-2">性&emsp;&nbsp;&nbsp;&nbsp;别</span> <span class="col-md-10">
												<select name="gender" id="" class="form-control">
													<option value="男"
														<c:if test="${customer.gender == '男' }">selected</c:if>>男</option>
													<option value="女"
														<c:if test="${customer.gender == '女' }">selected</c:if>>女</option>
											</select> </span>
										</div>
										<div class="row">
											<span class="col-md-2" >出生日期</span> <span class="col-md-10" style="vertical-align:middle;">
												<input type="date" name="birthday" class="form-control"
												value="${customer.birthday}" style="padding-top:10px;"> </span>
										</div>
										<div class="row">
											<span class="col-md-2">手机号码</span> <span class="col-md-10">
												<input type="number" name="mobile" class="form-control" maxlength="11"
												value="${customer.mobile}" required> </span>
										</div>
										<div class="row">
											<span class="col-md-2">地&emsp;&nbsp;&nbsp;&nbsp;址</span> <span class="col-md-10">
												<input type="text" name="address" class="form-control emojiTxt" maxlength="25"
												value="${customer.address}"> </span>
										</div>

										<div class="row">
											<span class="col-md-2">会员卡号</span> <span class="col-md-10">
												<input type="number" disabled style="background-color:#fff"
												class="form-control" value="${card.cardid }"> </span>
										</div>
										
									</section>
									<!--<div class="text-center" style="margin-top: 20px">-->
									<!--<button class="btn btn-primary" style="background-color: #48a3da">修改</button>-->
									<!--</div>-->
								</div>
								<div class="info-con">
									<p class="titleP" style="padding-left: 0.3rem;">
										<i class="iconfont icon-car"></i> &nbsp;车辆信息
										<%-- <c:if test="${user.id == customer.id }"> --%>
										<span class="pull-right addCar"
											style="font-size: 14px!important;border: 1px solid #48a3da;padding: 0.04rem
        0.1rem;border-radius: 0.15rem;"><i
											class="glyphicon glyphicon-plus"></i> 新增</span>
										<%--  </c:if> --%>
									</p>
									<c:forEach items="${cars }" var="car" varStatus="st">
										<section class="sec"
											style="background-color: white;padding: 0.1rem 0rem 0.2rem">
											<div class="row">
												<span class="col-md-4" style="width:32%;">车&thinsp;&thinsp;牌&thinsp;&thinsp;号</span> <span
													class="col-md-4" style="width:45%;"> <input
													type="hidden" name="car_id" value="${car.id }"> <input
													type="text" class="form-control emojiTxt"  name="plateno" maxlength="10" required 
													value="${car.plateno }" required> </span>
												<c:if test="${ st.index > 0 }">
													<span class="col-md-4 " style="width:17%;"><button
															class="btn btn_delete"
															style="font-size: 12px!important;padding: 0.04rem
        0.1rem;border-radius: 0.15rem;"
															onClick="return false;" car_id="${car.id }"
															del_plateno="${car.plateno}">删除</button> </span>
												</c:if>
											</div>
											<div class="row">
												<span class="col-md-2">车&emsp;&nbsp;&nbsp;&nbsp;型</span> <span class="col-md-10">
													<input type="text" class="form-control emojiTxt" name="vehicle" maxlength="10"
													value="${car.vehicle }"> </span>
											</div>
											<div class="row">
												<span class="col-md-2" >车险日期</span> <span class="col-md-10" style="vertical-align:middle;">
													<input type="date" class="form-control"
													name="insurance_date" value="${car.insurance_date_str }" style="padding-top:10px;">
												</span>
											</div>
											<div class="row">
												<span class="col-md-2" >验车日期</span> <span class="col-md-10" style="vertical-align:middle;">
													<input type="date" class="form-control"
													name="validate_date" value="${car.validate_date_str }" style="padding-top:10px;">
												</span>
											</div>
											<div class="row">
												<span class="col-md-2">车&emsp;&nbsp;&nbsp;&nbsp;龄</span> <span class="col-md-10">
													<select name="coty" id="" class="form-control">
														<option value="0-6年"
															<c:if test="${car.coty == '0-6年' }">selected</c:if>>0-6年</option>
														<option value="7-15年"
															<c:if test="${car.coty == '7-15年' }">selected</c:if>>7-15年</option>
														<option value="15年以上"
															<c:if test="${car.coty == '15年以上' }">selected</c:if>>15年以上</option>
												</select> </span>
											</div>
											<c:if test="${role == 'user' }">
												<div class="row" style="vertical-align:top;">
												<span class="col-md-2" style="vertical-align:top;margin-top:5px;">备&emsp;&nbsp;&nbsp;&nbsp;注</span> <span class="col-md-10">
												
													<textarea class="form-control emojiTxt" name="remark"
													 maxlength="200">${car.remark }</textarea>
													</span>
												</div>
											</c:if>
											<div
												style="border-bottom: 2px solid #999;padding: 2px 0px;padding: 0.15rem 0rem;position: relative;width: 100%;margin: 0 auto;"></div>
										</section>
									</c:forEach>
									<div class="text-center" style="margin-top: 20px">
										<%-- <c:if test="${user.id == customer.id }"> --%>
										<input type="button" id="qd" class="btn sure"
											style="background-color: #48a3da;color:#fff;width:200px" value="确&nbsp;&nbsp;&nbsp;&nbsp;定">
										<%-- </c:if> --%>
									</div>
								</div>
								<!--弹窗开始-->
								<div id="mask">
									<!--确定弹窗开始-->
									<div class="simpleAlertBody">
										<i class="simpleAlertBodyClose glyphicon glyphicon-remove"></i>
										<p class="simpleAlertBodyContent">确定后信息将修改</p>
										<button class="simpleAlertBtn2"
											style="background-color: #aaa!important;"
											onClick="return false;">取消</button>
										<button type="submit" class="simpleAlertBtn simpleAlertBtn1"
											id="formConfirm">确定</button>
									</div>
								</div>
								<div id="mask3" style="display:none">
									<!--确定弹窗开始-->
									<div class="simpleAlertBody">
										<i class="simpleAlertBodyClose glyphicon glyphicon-remove"></i>
										<p class="simpleAlertBodyContent"
											style="text-align:left;left:7%;">
											是否删除车辆？车牌号：<span id="del_plateno"></span>
										</p>
										<button class="simpleAlertBtn2"
											style="background-color: #aaa!important;"
											onClick="return false;">取消</button>
										<input type="hidden" name="del_car_id">
										<button type="submit" class="simpleAlertBtn3" id="delCon"
											onClick="return false;">确定</button>
									</div>
								</div>
								<!--确定弹窗结束-->
							</form>
						</div>
					</div>
				</div>

			</div>


		</div>

	</div>

	<!--新增弹窗开始-->
	<div id="mask2">
		<div class="simpleAlertBody" style="height: 330px;top: 25%;">
			<i class="simpleAlertBodyClose glyphicon glyphicon-remove"></i>
			<p class="simpleAlertBodyContent">
				<section class="sec addSec" style="margin-top: 10%;">
					<div class="row">
						<span class="col-md-2">车牌号</span> <span class="col-md-10">
							<input type="text" class="form-control emojiTxt" name="_plateno" maxlength="10">
							<span style="color:red" class="hidden err" id="plateno_err"></span>
						</span>
					</div>
					<div class="row">
						<span class="col-md-2">车型</span> <span class="col-md-10"> <input
							type="text" class="form-control emojiTxt" name="_vehicle" maxlength="10"> <span
							style="color:red" class="hidden err" id="vehicle_err"></span> </span>
					</div>
					<div class="row">
						<span class="col-md-2">车险日期</span> <span class="col-md-10" style="vertical-align:middle;">
							<input type="date" class="form-control" name="_insurance_date"  style="padding-top:10px;">
							<span style="color:red" class="hidden err"
							id="insurance_date_err"></span> </span>
					</div>
					<div class="row">
						<span class="col-md-2">验车日期</span> <span class="col-md-10" style="vertical-align:middle;">
							<input type="date" class="form-control" name="_validate_date"  style="padding-top:10px;">
							<span style="color:red" class="hidden err" id="validate_date_err"></span>
						</span>
					</div>
					<div class="row">
						<span class="col-md-2">车龄</span> <span class="col-md-10"> <select
							name="_coty" id="" class="form-control">
								<option value="0-6年">0-6年</option>
								<option value="7-15年">7-15年</option>
								<option value="15年以上">15年以上</option>
						</select> <span style="color:red" class="hidden err" id="coty_err"></span>
						</span>
					</div>
				</section>
			</p>
			<div class="hidden" id="adderr">${adderr }</div>
			<input type="hidden" id="_customer_id" value="${customer.id }">
			<button class="simpleAlertBtn2"
				style="background-color: #aaa!important;top: 84%;"
				onClick="return false;">取消</button>
			<button class="simpleAlertBtn simpleAlertBtn3" id="addConfirm"
				style="top: 84%;">确定</button>
		</div>
		<!--新增弹窗结束-->
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
	<script type="text/javascript"
		src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/mask.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/footerKP.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>
	<script>
	
  $(".simpleAlertBtn,.simpleAlertBodyClose").click(function () {
  $("#mask").fadeOut();
  $("#mask3").fadeOut();
  if ($(this).attr("id") == 'addConfirm'){
  	//车辆录入
  	var plateno = $("input[name='_plateno']").val();
  	var vehicle = $("input[name='_vehicle']").val();
  	var insurance_date = $("input[name='_insurance_date']").val();
  	var validate_date = $("input[name='_validate_date']").val();
  	var customer_id = $("#_customer_id").val();
  	var coty = $("input[name='_coty']").val();
  	var $platenoStr = $("input[name='_plateno']").val();
  	if($platenoStr.replace(/\s/g,"") == ""){
  		alert("车牌号格式不正确");
  		return false;
  	}
  	$.post({
  		url:"/Qiqiang/SelfInfoController/addCar",
  		data:{
  			"plateno":plateno,
  			"vehicle":vehicle,
  			"insurance_date":insurance_date,
  			"validate_date":validate_date,
  			"coty":coty,
  			"user_id":customer_id
  		},
  		async:false,
  		success:function(args){
  			var return_message = $.parseJSON(args);
  			var add_flag = return_message.add_flag;
  			switch(add_flag){
  			case "false":
  				//console.log("进入 flase 分枝")
  				alert(return_message.plateno_err);
  				break;
  			case "error":
  				//console.log("进入 error 分枝")
  				alert(return_message.adderr);
  				break;
  			case "true":
  				//console.log("进入 true 分枝")
  				location.href="/Qiqiang/SelfInfoController/selfInfo.action?user_id="+customer_id;
  			}
  		}
  	})
  }
  if ($(this).attr("id") != 'addConfirm'){
  	$("#mask2").fadeOut();
  }
  
  })
  $(".sure").click(function () {
  $("#mask").fadeIn();
  })
  $(".addCar").click(function () {
      $("#mask2").fadeIn();
  })
  
 	$("form").submit(function(){
	var nameStr = $("input[name='name']").val();
      if(nameStr.replace(/\s/g,"") == ""){
      	alert('请输入正确姓名格式');
      	return false; 
      }
      var mobileStr = $("input[name='mobile']").val();
      if(mobileStr.replace(/\s/g,"") == ""){
      	alert("请输入正确手机号格式");
      	return false;
      }
      var m_pattern = /^[1][3,4,5,7,8][0-9]{9}$/;
      if(!m_pattern.test(mobileStr)){
      	alert("请输入正确手机号格式");
      	return false; 
      }
      var $plateno = $("input[name='plateno']");
      var plateno_flag = true;
      $plateno.each(function(){
      	if(($(this).val()).replace(/\s/g,"") == ""){
      		plateno_flag = false;
      		return false;
      	}
      })
      if (!plateno_flag){
      	alert('请输入正确车牌号格式');
      	return false;
      }
      
      var mobile = mobileStr.replace(/\s/g,"");
      var id = $("input[name='id']").val();
      var tj_flag = 1;
      $.post({
    	  url:"/Qiqiang/SelfInfoController/chkMobile.action",
    	  data:{"mobile":mobile,"id":id},
    	  async:false,
    	  success:function(args){
    		  if (args == 'repeat'){
    			  alert("手机号与其他用户重复");
    			  tj_flag = 0;
    		  }
    	  }
      });
      if (tj_flag == 0){
    	  return false;
      }
      
  })
  </script>
	<script>
  	$(".btn_delete").click(function(){
  		var del_plateno = $(this).attr("del_plateno");
  		$("#del_plateno").text(del_plateno);
  		var car_id = $(this).attr("car_id");
  		$("input[name='del_car_id']").val(car_id);
  		$("#mask3").fadeIn();
  		
  	})
  </script>
	<script>
  	$(".simpleAlertBtn2").click(function(){
  		$("#mask").fadeOut();
  		$("#mask2").fadeOut();
  		$("#mask3").fadeOut();
  	})
  </script>
	<script>
  	$("#delCon").click(function(){
  		var car_id = $("input[name='del_car_id']").val();
  		var plateno = $("#del_plateno").text();
  		$.post({
  			url:"/Qiqiang/SelfInfoController/delCar",
  			data:{
  				"id":car_id,
  				"plateno":plateno
  			},
  			async:false,
  			success:function(args){
  				switch(args){
  				case "success":
  					window.location.reload();
  					break;
  				case "forbidden":
  					alert("该车辆已有交易记录,暂不支持删除!");
  					break;
  				case "error":
  					alert("操作失败,请重试!");
  					break;
  				}
  			},
  			error:function(args){
  				alert("操作失败,请重试!");
  			}
  		})
  	})
  </script>
	<script>
  	$("#modifyBtn").click(function(){
  		var user_id = $("input[name='id']").val();
  		location.href="/Qiqiang/SelfInfoController/modifyCard?user_id="+user_id;
  	});
  	
  	    $(".titleDiv span").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    });
    
    $(".gly").click(function(){
    	 if($(this)[0].classList[1]=="glyphicon-minus"){
                     $(this)[0].className  = $(this)[0].classList[0]+" glyphicon-plus gly";
                     //$("i").attr("class","glyphicon glyphicon-plus gly");
                }  else {
                $(this)[0].className  = $(this)[0].classList[0]+" glyphicon-minus gly";
                  //  $("i").attr("class","glyphicon glyphicon-minus gly");
                    }
    });
    
    //充值
    $(".Recharge").click(function(){
    			var user_id  =  $(".user_id").val();
    			if(user_id=="" ||null==user_id){
    				alert("获取用户信息失败");
    				return  false;
    			}
		    	var   flag =1;//充值
		    	$("#flag").val(flag);
		    	  $.ajax({
		            	//几个参数需要注意一下
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "/Qiqiang/ConsumptionController/getMyRecordPage" ,//url
		                data: {"trans_type":flag,"user_id":user_id},
		                success: function (Msg) {
		                	if(Msg.result>0){
		                		var test = "";
		                		var  data =	  Msg.data.list;
			                	$(".consumptionTable").empty()
			               		// $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>服务项目</td> <td>金额</td><td>余额</td><td>赠送项目</td></tr>");

			                	 $(".consumptionTable").append("<tr><td>服务项目</td> <td>充值金额</td><td>赠送金额</td><td>余额</td><td>赠送项目</td><td>交易时间</td></tr>"); 

			                	for(var  i =0;i<data.length;i++){
			                		if(data[i].flag == 0 || data[i].flag == null){
			                			test ="<a>无</a>";
			                		}
			                		if(data[i].flag == 1){
										test="<a onclick=seeIt("+data[i].id+")>查看</a>";
			                		}
			                		var practical = "";
			                		if(data[i].practical == null || data[i].practical=="" || data[i].practical == "null"){
			                			
			                			practical = 0;
			                			
			                		}else{
			                			practical=data[i].practical;
			                		}
			                		//$(".consumptionTable").append("	<tr><td>"+data[i].user.name+"</td> <td>"+data[i].date+"</td> <td>"+data[i].projectService.svr_item+"</td><td>"+data[i].price+"</td><td>"+data[i].realbalance+"</td><td>"+test+"</td></tr>");
			                		$(".consumptionTable").append("	<tr><td>"+data[i].projectService.svr_item+"</td> <td>"+data[i].price+"元</td><td>"+practical+"元</td><td>"+data[i].realbalance+"元</td><td>"+test+"</td><td>"+data[i].date+"</td></tr>");

			                	}
			                	$("#last").val(Msg.data.prePage);
		                        $("#nest").val(Msg.data.nextPage);
		                        $(".total").text("共"+Msg.data.total+"条记录  第"+Msg.data.pageNum+"页"+"  共"+Msg.data.pages+"页");
		                        $("#end").val(Msg.data.pages);
		                	}else{
		                		alert("查询失败");
		                	}
		                },
		                error : function() {
		                    alert("数据异常！");
		                }
		            });
   }); 
  	//消费  
    $(".consumption").click(function(){
		    	var user_id  =  $(".user_id").val();
				if(user_id=="" ||null==user_id){
					alert("获取用户信息失败");
					return  false;
				}
		    	var   flag =0;//消费
		    	$("#flag").val(flag);
		    	  $.ajax({
		            	//几个参数需要注意一下
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "/Qiqiang/ConsumptionController/getMyRecordPage" ,//url
		                data: {"trans_type":flag,"user_id":user_id},
		                success: function (Msg) {
		                	if(Msg.result>0){
		                		var test = "";
		                		var  data =	  Msg.data.list;
			                	$(".consumptionTable").empty()
			               		// $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>服务项目</td> <td>金额</td><td>车牌号</td><td>余额</td><td>赠送项目</td></tr>");
			                	$(".consumptionTable").append("<tr><td>服务项目</td> <td>金额</td><td>消费次数</td><td>剩余次数</td><td>车牌号</td> <td>余额</td><td>交易时间</td><td>备注</td></tr>"); 
			                	for(var  i =0;i<data.length;i++){
			                		if(data[i].flag == 0 || data[i].flag == null){
			                			test ="<a>无</a>";
			                		}
			                		if(data[i].flag == 1){
										test="<a onclick=seeIt("+data[i].id+")>查看</a>";
			                		}	
			                		var number = "";
			                		var realnumber = "";
			                		var price = "";
			                		price = data[i].price+"元";
			                		if( data[i].number == null || data[i].number == "null" || data[i].number == ""||  data[i].number <= 0){
			                		}else{
			                			number = data[i].number+"次";
			                			realnumber = data[i].realnumber+"次";
			                		}
			                		
			                		
			                		
			                		$(".consumptionTable").append("	<tr><td>"+data[i].projectService.svr_item+"</td> <td>"+price+"</td> <td>"+number+"</td> <td>"+realnumber+"</td> <td>"+data[i].car.plateno+"</td><td>"+data[i].realbalance+"</td><td>"+data[i].date+"</td><td><a class='selectRemark'>详情</a><input class='myRecark' name='myRecard' type='hidden' value='"+data[i].remark+"'/></td></tr>");
			                		//$(".consumptionTable").append("	<tr><td>"+data[i].user.name+"</td> <td>"+data[i].date+"</td><td>"+data[i].projectService.svr_item+"</td><td>"+data[i].price+"</td><td>"+data[i].car.plateno+"</td><td>"+data[i].realbalance+"</td><td>"+test+"</td></tr>");
			                	}
			                	$("#last").val(Msg.data.prePage);
		                        $("#nest").val(Msg.data.nextPage);
		                        $(".total").text("共"+Msg.data.total+"条记录  第"+Msg.data.pageNum+"页"+"  共"+Msg.data.pages+"页");
		                        $("#end").val(Msg.data.pages);
		                	}else{
		                		alert("查询失败");
		                	}
		                },
		                error : function() {
		                    alert("数据异常！");
		                }
		            });
   }); 
  //分页方法
	$(".jump").click(function(){
		var user_id  =  $(".user_id").val();
		if(user_id=="" ||null==user_id){
			alert("获取用户信息失败");
			return  false;
		}
		  var  flag = $("#flag").val();
		  var  pageNum =	$(this).next().val();//需要跳转得页码
		  if(pageNum == 0 ){
		    	pageNum=1;
		  }
    	  $.ajax({
            	//几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/Qiqiang/ConsumptionController/getMyRecordPage" ,//url
                data: {"trans_type":flag,"pageNum":pageNum,"user_id":user_id},
                success: function (Msg) {
                	if(Msg.result>0){
                		var test = "";
                		var  data =	  Msg.data.list;
	                	$(".consumptionTable").empty()
	                	if(flag==0){
	                		// $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>服务项目</td> <td>金额</td><td>车牌号</td><td>余额</td><td>赠送项目</td></tr>");
	                		$(".consumptionTable").append("<tr><td>服务项目</td> <td>金额</td><td>消费次数</td><td>剩余次数</td><td>车牌号</td> <td>余额</td><td>交易时间</td><td>备注</td></tr>"); 
	                	}
						if(flag==1){
							// $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>服务项目</td> <td>金额</td><td>余额</td><td>赠送项目</td></tr>");
							 $(".consumptionTable").append("<tr><td>服务项目</td> <td>充值金额</td><td>赠送金额</td><td>余额</td><td>赠送项目</td><td>交易时间</td></tr>"); 
	                	}
	                	for(var  i =0;i<data.length;i++){
	                		if(flag==0){
	                			//消费
	                				if(data[i].flag == 0 || data[i].flag == null){
			                			test ="<a>无</a>";
			                		}
			                		if(data[i].flag == 1){
										test="<a onclick=seeIt("+data[i].id+")>查看</a>";
			                		}
			                		var number = "";
			                		var realnumber = "";
			                		var price = "";
			                		price = data[i].price+"元";
			                		if( data[i].number == null || data[i].number == "null" || data[i].number == ""||  data[i].number <= 0){
			                		}else{
			                			number = data[i].number+"次";
			                			realnumber = data[i].realnumber+"次";
			                		}
			                		
			                		
	                			//$(".consumptionTable").append("	<tr><td>"+data[i].user.name+"</td> <td>"+data[i].date+"</td> <td>"+data[i].projectService.svr_item+"</td><td>"+data[i].price+"</td><td>"+data[i].car.plateno+"</td><td>"+data[i].realbalance+"</td><td>"+test+"</td></tr>");
			                		$(".consumptionTable").append("	<tr><td>"+data[i].projectService.svr_item+"</td> <td>"+price+"</td> <td>"+number+"</td> <td>"+realnumber+"</td> <td>"+data[i].car.plateno+"</td><td>"+data[i].realbalance+"元</td><td>"+data[i].date+"</td><td><a class='selectRemark'>详情</a><input class='myRecark' name='myRecard' type='hidden' value='"+data[i].remark+"'/></td></tr>");
	                		}
	                		if(flag ==1){
	                			//充值
	                			if(data[i].flag == 0 || data[i].flag == null){
		                			test ="<a>无</a>";
		                		}
		                		if(data[i].flag == 1){
									test="<a onclick=seeIt("+data[i].id+")>查看</a>";
		                		}
		                		var practical = "";
		                		if(data[i].practical == null || data[i].practical=="" || data[i].practical == "null"){
		                			
		                			practical = 0;
		                			
		                		}else{
		                			practical=data[i].practical;
		                		}
	                			$(".consumptionTable").append("	<tr><td>"+data[i].projectService.svr_item+"</td> <td>"+data[i].price+"元</td><td>"+practical+"元</td><td>"+data[i].realbalance+"元</td><td>"+test+"</td><td>"+data[i].date+"</td></tr>");
	                		}
	                	}
	                	$("#last").val(Msg.data.prePage);
                        $("#nest").val(Msg.data.nextPage);
                        $(".total").text("共"+Msg.data.total+"条记录  第"+Msg.data.pageNum+"页"+"  共"+Msg.data.pages+"页");
                        $("#end").val(Msg.data.pages);
                	}else{
                		alert("查询失败");
                	}
                },
                error : function() {
                    alert("数据异常！");
                }
            });
	}) 
    
    
    function seeIt(id){
		$.ajax({
			type:"post",
			dataType:"json",
			url:"/Qiqiang/StatisticController/selectGiftInf",
			data:{
				record_id : id 
			},
			success:function(msg){
				/* var text;
				for(var i = 0 ; i < msg.data.list.length ; i++){
						if(text == null){
							text =  "<div class='seeClass'><span>项目名："+msg.data.list[i].svr_item+"</span>"
									+"<span>类型："+msg.data.list[i].type+"</span>"
									+"<span>赠送次数："+msg.data.list[i].number+"</span>"
									+"<span>剩余次数："+msg.data.list[i].balancenumber+"</span>"
									+"<span>用户："+msg.data.list[i].name+"</span>"
									+"<span>车牌号："+msg.data.list[i].plateno+"</span>"
									+"</div></br>"
						}else{
							text = text + "<div class='seeClass'><span>项目名："+msg.data.list[i].svr_item+"</span>"
										+"<span>类型："+msg.data.list[i].type+"</span>"
										+"<span>赠送次数："+msg.data.list[i].number+"</span>"
										+"<span>剩余次数："+msg.data.list[i].balancenumber+"</span>"
										+"<span>用户："+msg.data.list[i].name+"</span>"
										+"<span>车牌号："+msg.data.list[i].plateno+"</span>"
										+"</div></br>"
						}
				} */
				var text;
										text = '<table class="shTa"><thead><tr><td>项目名</td><td>赠送次数</td><td>剩余次数</td><td>车牌号</td></tr></thead><tbody>'
										for(var i = 0 ; i < msg.data.list.length ; i++){
												if(text == null){
/* 													text =  "<div class='seeClass'><span>项目名："+msg.data.list[i].svr_item+"</span>"
															+"<span>赠送次数："+msg.data.list[i].number+"</span>"
															+"<span>剩余次数："+msg.data.list[i].balancenumber+"</span>"
															+"<span>车牌号："+msg.data.list[i].plateno+"</span>"
															+"</div></br>" */
															text+='<tr><td>'
															text+=msg.data.list[i].svr_item;
															text+='</td><td>';
															text+=msg.data.list[i].number;
															text+='</td><td>';
															text+=msg.data.list[i].balancenumber;
															text+='</td><td>';
															text+=msg.data.list[i].plateno;
															text+='</td></tr>';
												}else{
/* 													text = text + "<div class='seeClass'><span>项目名："+msg.data.list[i].svr_item+"</span>"
																+"<span>赠送次数："+msg.data.list[i].number+"</span>"
																+"<span>剩余次数："+msg.data.list[i].balancenumber+"</span>"
																+"<span>车牌号："+msg.data.list[i].plateno+"</span>"
																+"</div></br>" */
																
																text+='<tr><td>'
															text+=msg.data.list[i].svr_item;
															text+='</td><td>';
															text+=msg.data.list[i].number;
															text+='</td><td>';
															text+=msg.data.list[i].balancenumber;
															text+='</td><td>';
															text+=msg.data.list[i].plateno;
															text+='</td></tr>';
												}
										}
										text+='</tbody></table>';
					layer.open(
							{type: 0,
							skin : 'layui-layer-lan', //样式类名
							title:'赠送项目',
							btn:[],
							area: ['320px', '320px'], //宽高
							content:text
							}
					)
					$('.layui-layer-btn').hide();
			},
			error:function(){
				alert(4);
			}
			
			
		})
	}
	
  </script>
  <script type="text/javascript">
  //备注，点击弹出
  $("form").delegate(".selectRemark","click",function(){
	  
	  var remark = $(this).next().val();
	  layer.open(
				{type: 0,
				skin : 'layui-layer-lan', //样式类名
				title:'备注',
				area: ['280px', '280px'], //宽高
				content:remark
				}
		)
		
		$('.layui-layer-btn').hide();
  });
  
  if($(".zsxmDiv .row").length==0){
  	$(".zsxmDiv").hide();
  }
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
	
	 var regStr = /[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF][\u200D|\uFE0F]|[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF]|[0-9|*|#]\uFE0F\u20E3|[0-9|#]\u20E3|[\u203C-\u3299]\uFE0F\u200D|[\u203C-\u3299]\uFE0F|[\u2122-\u2B55]|\u303D|[\A9|\AE]\u3030|\uA9|\uAE|\u3030/ig;
								$(".emojiTxt").keyup(function(){
									
									$(this).val($(this).val().replace(regStr, '').replace(/(\s*$)/g, ""));
							  })
	
	
  </script>
  
</body>
</html>

