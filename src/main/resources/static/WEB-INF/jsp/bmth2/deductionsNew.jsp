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
<title>扣减</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/inde.css" />
<link rel="stylesheet"
	href="/Qiqiang/static/layer/mobile/need/layer.css">
<link rel="stylesheet" type="text/css"
	href="/Qiqiang/static/css/iconfont.css">

<style>
.toUpSec .row {
	width: 100%;
	margin: 0.2rem 0rem 0rem;
}

.toUpSec {
	margin-top: 0rem;
	margin-bottom: 0.2rem;
}

.toUpSec .row .col-md-2 {
	padding-left: 0rem !important;
}

.toUpSec .row .col-md-10 {
	display: inline-block;
	width: 72%;
}

.table {
	margin-top: 10px;
	margin-top: 0.2rem;
}

.tableDiv {
	width: 100%;
	height: auto;
	overflow-x: scroll;
	overflow-y: scroll;
}

.tableDiv>div {
	overflow-x: scroll;
}

.table-responsive {
	border: 0px;
}

.kplx {
	padding: 0px 6px;
	margin-top: 11px;
}

#GYS-div {
	position: relative;
	height: 34px;
	height: 0.68rem;
}

#GYS-div>span:nth-child(1) {
	position: absolute;
	overflow: hidden;
	width: 100%;
	height: 34px;
	height: 0.68rem;
}

#GYS-div>span:nth-child(2) {
	position: absolute;
	margin-top: 1px;
	margin-left: 4px;
	width: 95%;
	height: 32px;
	height: 0.66rem;
	border-radius: 5px;
}

.qlc_zdz1 {
	height: 34px;
	height: 0.68rem;
	outline: 0;
}

.qlc_zdz {
	width: 94%;
	height: 32px;
	height: 0.58rem;
	border: 0pt;
	border-radius: 5px;
	outline: 0;
	margin-top: 2px;
}

.form2 {
	padding: 3px 12px;
	font-size: 14px;
}

.form1 {
	padding: 4px 14px;
}

.simpleAlertBodyClose {
	position: relative;
	float: right;
}

.seeClass span {
	display: block;
	padding: 6px 12px;
	margin-left: 20px;
	font-size: 16px;
}

.layui-layer {
	box-shadow: 0px 0px 0px rgba(0, 0, 0, 0) !important;
}

.shTa{
	width:100%;
}

.toUpSec .row{margin:0.2rem 0.5rem 0rem!important;}
.shTa td{white-space:nowrap;text-align:center;}
table td,th{text-align:center;}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 info-con">
			<form action="/Qiqiang/PayController/DeductionsNew"  method="post"
					ID="topup">
					<input type="hidden" value="" name="dduuid">
					<section class="sec" style="margin-top:15px;">

						<div>
							<input type="hidden" value="${k}" id="k"> <input
								type="hidden" value="${user.pass}" id="userpass">

							<div class="tableDiv">
								<div class="list table-responsive">
									<table class="table infotable" id="select_user">
										<tr id="sysinfo">
											<th>姓名</th>
											<th>手机号</th>
											<th>车牌号</th>
											<th>卡片类型</th>
										</tr>
										<tr class='searchinfo' style='border-bottom:1px solid #ccc' car_id='${selectInfo.aid }'>
											<!-- 跳转到消费详情 -->
											<td><a>${selectInfo.name}</a></td>
											<td><a>${selectInfo.mobile}</a></td>
											<td><a>${selectInfo.plateno}</a></td>
											<td><a>${selectInfo.level}</a></td>
										</tr>
										<c:forEach items="${carlist}" var="car">
											<tr>
												<td colspan=1>${car.plateno}</td>
												<td class="cishu" colspan="3" style="text-align:left"><c:forEach
														items="${givelist}" var="give">
														<c:if test="${give.plateno==car.plateno&&give.number!=0}">${give.svr_item}(余${give.number}次)&nbsp;&nbsp;&nbsp;</c:if>
													</c:forEach></td>
											</tr>
										</c:forEach>
									
									</table>
									
								</div>
								<div style="float: right;"><a
												id="showMonList">显示最近5条消费记录</a></div>
							</div>
						</div>
						<!--日报结束-->
					</section>
					<div class="addQY">
						<div class="toUpSec">
							<i class="glyphicon glyphicon-remove pull-right delete"
								style="display:none;cursor: pointer;"></i><br>
							<div class="row top">
								<span class="col-md-2" style="padding-left:20px;">余&nbsp;&nbsp;额</span> <span
									class="col-md-10"> 
									<c:choose>
										<c:when test="${!empty card25 && card25.balance > 0}">
											<input type="text" disabled="disabled" class="form-control accountBalance" name=""
											value="<fmt:formatNumber type="number" value="${card25.balance}" pattern="0.00" maxFractionDigits="2"/>">
										</c:when>
										<c:otherwise>
											<input type="text" disabled="disabled" class="form-control accountBalance" name=""
											value="<fmt:formatNumber type="number" value="${card.balance}" pattern="0.00" maxFractionDigits="2"/>">
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="cardbalance" value="${card.balance }">
									<input type="hidden" id="card25balance" value="${card25.balance }">
								</span>

							</div>
							<div class="row">
								<span class="col-md-2" style="">车&nbsp;&nbsp;牌</span> <span
									class="col-md-10"> <select name="car_id"
									class="form-control cph">
										<c:forEach items="${carlist}" var="car">
											<option value="${car.id}"
												<c:if test="${selectInfo.bid==car.id}">selected</c:if>>${car.plateno}</option>
										</c:forEach>
								</select> </span>

							</div>

							<div class="row">
								<span class="col-md-2" style=" ">类&nbsp;&nbsp;型</span>
								<span class="col-md-10" style="vertical-align:middle;"> <select
									name="type1" id="type" class="form-control">
									<c:if test="${!empty card25 && card25.balance > 0}"><option value="2">洗车25元卡</option></c:if>
									<option value="1">一卡通[${selectInfo.level}]</option>
									
										<option value="3">剩余次数</option>
								</select> </span>
							</div>
							

							<div class="row" style="display:flex">
								<span class="col-md-2"
									style=" margin-top:2px;padding-left:20px;">项&nbsp;&nbsp;目</span>
								<span class="col-md-10"
									style="vertical-align:middle;    margin-left: 3px;">
									<div id="GYS-div"
										style="margin-top:0rem;vertical-align:middle;">
										<span> <!--这个是个多选框，用onchange事件的时候 ，将这个select的id传进去--> <select
											name="project" id="project" class="form-control project1">
												<c:forEach items="${projectlist}" var="project">
													<c:if
														test="${project.trans_type!=1}">
														<option value="${project.id}">${project.svr_item}</option>
													</c:if>
												</c:forEach>
										</select> </span> <span style="width:88%"> <input type="text" maxlength="50"
											required="required" value="" name="parts_type"
											id="parts_type" class="ccdd qlc_zdz" placeholder=""
											style="width:100%;padding:0px;padding-left:0.1rem;">
										</span>
									</div>
									<div
										style="font-size: 12px;color:red;margin-top:0px!important;">
										<span>&nbsp;项目可选择，可录入！</span>
									</div> </span>
							</div>

							<div class="row top">
								<span class="col-md-2" style="padding-left:20px;">金&nbsp;&nbsp;额</span>
								<span class="col-md-10"> 
								<c:choose>
										<c:when test="${!empty card25 && card25.balance > 0}">
										<%-- 	<input type="text" disabled="disabled" class="form-control accountBalance" name=""
											value="<fmt:formatNumber type="number" value="${card25.balance}" pattern="0.00" maxFractionDigits="2"/>"> --%>
											<input type="number" min="1" name="price"
												placeholder="请输入扣减金额" required="required"
												pattern="^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$"
												oninvalid="setCustomValidity('金额必须为正数')"
												oninput="setCustomValidity('')" class="form-control"
												value="25">
										</c:when>
										<c:otherwise>
											<input type="number" min="1" name="price"
												placeholder="请输入扣减金额" required="required"
												pattern="^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$"
												oninvalid="setCustomValidity('金额必须为正数')"
												oninput="setCustomValidity('')" class="form-control"
												value="${project.svr_fee}">
										</c:otherwise>
									</c:choose>
											
										 </span>
							</div>
							<div class="row give"><!--  -->
								<span class="col-md-2" style="    margin-left: -20px;">剩余次数</span>
								<span class="col-md-10"> <input type="text" value=""
									disabled="disabled" placeholder="剩余次数" class="form-control sycs"
									name="balancenumber"> </span>
							</div>
							<div class="row give">
								<span class="col-md-2" style="">次&nbsp;&nbsp;数</span>
								<span class="col-md-10"> <input type="number"
									placeholder="请输入扣减次数" class="form-control ciShu" name="number" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" >
								</span>
							</div>

							<div class="row">
								<span class="col-md-2" style="width:71px;">备&nbsp;&nbsp;注</span>
								<span class="col-md-10" style="    vertical-align: top;">
									<textarea placeholder="请输入备注信息" class="form-control content emojiTxt" maxlength="300"
										style="height:50px;" name="content"></textarea> </span>
							</div>
							<input type='hidden' id="cid" name="cid" value="${cid}">
							<input type='hidden' id="success" value="${success}"> <input
								type='hidden' id="uid" value="${uid}"> <input
								type='hidden' id="card_type" value="${card_type}">
						</div>
					</div>
					<div class="text-right" style="margin-top: 5px;">
						<button class="btn form2 zjxm" style="background-color: #48a3da;"
							type='button'>增加扣减</button>
					</div>
					<input type="hidden" name='sumprice' value="0" id="sumprice">
					<div class="text-center" style="margin-top: 20px;">
						<button class="btn form1"
							style="background-color: #48a3da;width:200px;height:38px;color:white;font-size:18px" type='button'>确&nbsp;&nbsp;&nbsp;&nbsp;定</button>
					</div>
				</form>
				<input
								type="hidden" value="${user.pass}" id="userpass">
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/footerKJ.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>
	<script>
    function S4() {
        return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
    }
    function guid() {
        return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
    }
    $("input[name='dduuid']").val(guid());
</script>
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
	<script>
		if ($("#success").val() != '') {
			layer.msg($("#success").val());
		}
		var czpass = $("#userpass").val();
		$("#parts_type").val($("#project option")[0].innerText);
		$(".cishu").each(function() {
			if ($.trim($(this).text()) == '') {
				$(this).parent().hide();
			}
		})

		$('form').delegate('.project1', 'change', function() {
			var project = $(this).find("option:selected").text();
			$(this).parent().next().find("#parts_type").val(project);
			$(this).parent().next().find("#parts_type").change()
		})
		if ($("#type").val() == 1 || $("#type").val() == 2) {
			$(".give").hide();
			$(".top").show();
		}
		if ($("#type").val() == 3) {
			$(".give").show();
			$(".top").hide();
		}
		$("body").delegate("#type", "change", function() {

			if ($(this).val() == 3) {
				//$(".give").show();
				$($(this).parents()[2]).find(".give").show();
				$($(this).parents()[2]).find(".top").hide();
				//$(".top").hide();
			}
			if ($(this).val() == 1) {
				$($(this).parents()[2]).find(".give").hide();
				$($(this).parents()[2]).find(".top").show();
				$(this).parent().parent().parent().find(".accountBalance").val(parseFloat($("#cardbalance").val()).toFixed(2));
			}
			if ($(this).val() == 2) {
				$($(this).parents()[2]).find(".give").hide();
				$($(this).parents()[2]).find(".top").show();
				$(this).parent().parent().parent().find(".accountBalance").val(parseFloat($("#card25balance").val()).toFixed(2));
			}
		})
		$(".titleDiv span").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
		})

		$(".zjxm").click(function() {
			$(".addQY").append($(".toUpSec:first").clone());
				
			$(".toUpSec:last .give").hide();
			$(".toUpSec:last .top").show();
			$("textarea[name='content']:last").val("");
			$("input[name='parts_type']:last").val($("#project:last option")[0].innerText);
			$("input[name='number']:last").val("");
			var car_id = $("select[name='car_id']:last").val();
			var vip = getprice(car_id);
			//--$("select[name='type1']:last").find("option").eq(0)
			//--					.text("一卡通[" + vip.level + "]")
			$(".toUpSec:last .delete").show();
			$(".toUpSec").last().find("select[name='type1'] option:first").prop("selected","selected").trigger("change");
		});

		$("body").delegate(".delete", "click", function() {
			$($(this).parents()[0]).remove();
		});

		$("#showMonList")
				.click(
						function() {
							layer.close(layer.index);
							var tableStr = '';
							tableStr += '<table class="shTa"><thead><tr><td>服务项目</td><td>金额</td><td>消费次数</td><td>车牌号</td><td>余额</td><td>交易时间</td>';
							tableStr += '</tr></thead><tbody>';
							$
									.ajax({
										type : "post",
										url : "/Qiqiang/ConsumptionController/getUserConsumeInformation",
										dataType : "json",
										data : {
											trans_type : "0"
										},
										success : function(msg) {
											if (msg != null) {
												for ( var i = 0; i < msg.data.dataList.length; i++) {
													var number = msg.data.dataList[i].number;
													var price = "";
													if(number != null && number != "null" && number != "" && number > 0){
													}else{
														price = msg.data.dataList[i].price;
														number = "";
														
													}
													tableStr += "<tr><td><div class='seeClass'>"
															+ msg.data.dataList[i].projectService.svr_item
															+ "</div></td>"
															+ "<td><div class='seeClass'>"
															+ price
															+ "</div></td>"
															+ "<td><div class='seeClass'>"
															+ number
															+ "</div></td>"
															+ "<td><div class='seeClass'>"
															+ msg.data.dataList[i].car.plateno
															+ "</div></td>"
															+ "<td><div class='seeClass'>"
															+ msg.data.dataList[i].realbalance
															+ "</div></td>"
															+ "<td><div class='seeClass'>"
															+ msg.data.dataList[i].date
															+ "</div></td></tr>"
												}
												tableStr += '</tbody></table>';
												//页面层
												layer
														.open({
															type : 1,
															shade : false,
															skin : 'layui-layer-lan', //样式类名
															title : '近5条消费记录',
															btn:[],
															area : [ '320px',
																	'280px' ], //宽高
															content : tableStr
														});
														$('.layui-layer-btn').hide();
											}
										},
										error : function() {
											alert(404);
										}
									})
						});

		$(".form1")
				.click(
						function() {
							var ddw = '';
							if ($("select[name='type1']").eq(0).val() == 1) {
								ddw = '元';
								var projects = "扣减项目："+$("input[name='parts_type']").eq(0)
									.val()
									+ ", 扣减金额："
									+ $("input[name='price']").eq(0).val()
									+ ddw;
							} else {
								ddw = '次';
								var projects = "扣减项目："+$("input[name='parts_type']").eq(0)
									.val()
									+ ", 扣减次数："
									+ $("input[name='number']").eq(0).val()
									+ ddw;
							}
							
							var flag;
							var sumprice = 0;
							$("select[name='type1']")
									.each(
											function() {
												if ($(this).val() == 1||$(this).val() == 2) {
													if ($(this).parent()
																	.parent()
																	.parent()
															.find(
																	"input[name='price']")
															.val() == '') {
														layer.msg("扣减金额金额不能为空");
														flag = false;
														return false;
													}else{
													if ($(this).parent()
																	.parent()
																	.parent()
															.find(
																	"input[name='price']")
															.val() <0) {
														layer.msg("扣减金额金额不能为负数");
														flag = false;
														return false;
													}
													
													}
													sumprice = sumprice
															+ Number($(this)
																	.parent()
																	.parent()
																	.parent()
																	.find(
																			"input[name='price']")
																	.val());
												} else {
													if ($(this)
															.parent()
															.parent()
															.parent()
															.find(
																	"input[name='balancenumber']")
															.val() == ''||$(this)
															.parent()
															.parent()
															.parent()
															.find(
																	"input[name='balancenumber']")
															.val() == 0||$(this).parent()
																	.parent()
																	.parent()
															.find(
																	"input[name='number']")
															.val()*1 >$(this).parent()
																	.parent()
																	.parent()
															.find(
																	"input[name='balancenumber']")
															.val()*1) {
														layer.msg("该项目剩余次数不足");
														flag = false;
														return false;
													} else {
														if ($(this)
																.parent()
																.parent()
																.parent()
																.find(
																		"input[name='number']")
																.val() == '') {
															layer.msg("次数不能为空");
															flag = false;
															return false;
														}
													}
												}
												$("#sumprice").val(sumprice);
											});
							$(".content").each(function() {
								if ($(this).val() == '') {
									$(this).val('无');
								}
							})
							$("input[name='parts_type']").each(function() {
								if ($(this).val() == '') {
									layer.msg("请选择扣减项目")
									flag = false;
									return false;
								}
							})

							if (sumprice > $(".accountBalance").val()) {
								layer.confirm('余额不足，是否立即充值？', {
									btn : [ '充值', '取消' ]
								//按钮
								}, function() {
									location = "/Qiqiang/topUp"
								}, function() {
									layer.msg('已取消', {
										time : 2000, //20s后自动关闭

									});
								});
								return false;
							}
							if (flag == false) {
								return false;
							} else {
								$("input[name='parts_type']:gt(0)")
										.each(
												function() {
													projects = projects + "<br>扣减项目："
															+ $(this).val();
													var type = $(this)
															.parent()
															.parent()
															.parent()
															.parent()
															.parent()
															.find(
																	"select[name='type1']")
															.val();
													var price = '';

													var dw = '';
													if (type == 1) {
														price = $(this)
																.parent()
																.parent()
																.parent()
																.parent()
																.parent()
																.find(
																		"input[name='price']")
																.val();
														dw = '元';
														projects = projects
															+ ", 扣减金额："
															 + price + dw;
													} else {
														dw = '次';
														price = $(this)
																.parent()
																.parent()
																.parent()
																.parent()
																.parent()
																.find(
																		"input[name='number']")
																.val();
																projects = projects
															+ ", 扣减次数："
															 + price + dw;
													}
													

												});
								layer.confirm("扣减总金额:" + sumprice + "<br>"
										+ projects + "<br>是否确认扣减？", {
									btn : [ '确认', '取消' ], //单击按钮
					                btn1:function (index,layero){
					                    layer.close(index);
					                },
					                success:function(layero){
					                    var btn = layero[0].getElementsByClassName('layui-layer-btn')[0].getElementsByTagName('A')[0];    
					                    btn.href = 'javascript:void(0)';
					                    btn.focus();
					                }	
								//按钮
								}, function(index1) {
									layer.close(index1);
									layer.prompt({
										title : '输入扣减口令，并确认',
										formType : 1
									}, function(pass, index) {
											layer.close(index);
										if (pass == czpass) {
											var index = layer.load(1, {
												shade : [ 0.1, '#fff' ],//0.1透明度的白色背景
												time : 100
											});
											$("form").submit();
										} else {
											layer.msg('密码错误');
											return false;
										}
									});
								}, function() {
									var index = layer.msg('已取消', {
										time : 1000
									});
									/* layer.close(index); */
									return false;
								});
							}
						})

		function getprice(car_id) {
			var vip;
			$.ajax({
				type : "post",
				url : "/Qiqiang/PayController/getprice",
				dataType : "json",
				async : false,
				data : {
					'car_id' : car_id
				},
				success : function(data) {
					vip = data;
				},
				error : function() {
					alert(404);
				}

			})
			return vip
		}
		function getgive(car_id, project) {
			var give = '';
			$.ajax({
				type : "post",
				url : "/Qiqiang/PayController/getgive",
				dataType : "json",
				async : false,
				data : {
					'car_id' : car_id,
					'project' : project
				},
				success : function(data) {
					give = data;
				},
				error : function() {
					layer.msg("未找到相关项目，如需继续，请选择金额扣减");

				}
			})
			return give;
		}
		$("body").delegate(
				"select[name='type1']",
				"change",
				function() {
					var project = $(this).parent().parent().parent().find(
							"input[name='parts_type']").val()
					var car_id = $(this).parent().parent().parent().find(
							"select[name='car_id']").val()
					if ($(this).val() == 1 && project == '洗车') {
						var vip = getprice(car_id);
						$(this).parent().parent().parent().find(
								"input[name='price']").val(vip.price)
						//--$(this).parent().parent().parent().find(
						//--		"select[name='type1']").find("option").eq(0)
						//--		.text("一卡通[" + vip.level + "]")
						
						//$(this).parent().parent().parent().find(".accountBalance").val($("#cardbalance").val());
					}
					
					if ($(this).val() == 3) {
						var give = getgive(car_id, project);
						$(this).parent().parent().parent().find(
								"input[name='balancenumber']").val(give)
					}
					if ($(this).val() == 2){
						$(this).parent().parent().next().next(".top").find("input[name='price']").val(25);
						var a = $(this).parent().parent().next(".row").find("select[name='project']").val(1).trigger("change");
						//console.log("111=============== "+a)
						//$(this).parent().parent().parent().find(".accountBalance").val($("#card25balance").val());
					}
				});
		$("body").delegate(
				"select[name='car_id']",
				"change",
				function() {
					var project = $(this).parent().parent().parent().find(
							"input[name='parts_type']").val()
					var car_id = $(this).val();
					if ($(this).parent().parent().parent().find(
							"select[name='type1']").val() == 1
							&& project == '洗车') {
						var vip = getprice(car_id);
						$(this).parent().parent().parent().find(
								"input[name='price']").val(vip.price)
						$(this).parent().parent().parent().find(
								"select[name='type1']").find("option").eq(0)
								.text("一卡通[" + vip.level + "]")
					}
					if ($(this).parent().parent().parent().find(
							"select[name='type1']").val() == 3) {
						if (project == '洗车') {
							var vip = getprice(car_id);
							$(this).parent().parent().parent().find(
									"input[name='price']").val(vip.price)
							$(this).parent().parent().parent().find(
									"select[name='type1']").find("option")
									.eq(0).text("一卡通[" + vip.level + "]")
						}
						var give = getgive(car_id, project);
						$(this).parent().parent().parent().find(
								"input[name='balancenumber']").val(give)
					}
				});
		$("body").delegate(
				"input[name='parts_type']",
				"change",
				function() {
					var project = $(this).val()
					var car_id = $(this).parent().parent().parent().parent()
							.parent().find("select[name='car_id']").val();
					if ($(this).parent().parent().parent().parent().parent()
							.find("select[name='type1']").val() == 3) {
						var give = getgive(car_id, project);
						$(this).parent().parent().parent().parent().parent()
								.find("input[name='balancenumber']").val(give)
					}
				});
		$("body").delegate(
				"input[name='parts_type']",
				"keyup",
				function() {
					var project = $(this).val()
					var car_id = $(this).parent().parent().parent().parent()
							.parent().find("select[name='car_id']").val();
					if ($(this).parent().parent().parent().parent().parent()
							.find("select[name='type1']").val() == 3) {
						var give = getgive(car_id, project);
						$(this).parent().parent().parent().parent().parent()
								.find("input[name='balancenumber']").val(give)
					}
				});
		var car_id = $("select[name='car_id']").eq(0).val();
		var vip = getprice(car_id);
		if($("select[name='type1']").val()!=2){$("input[name='price']").eq(0).val(vip.price);}
	//	$("input[name='price']").eq(0).val(vip.price);
		//--$("select[name='type1']").eq(0).find("option").eq(0).text(
		//--		"一卡通[" + vip.level + "]")
		$.post({
		url:"/Qiqiang/getPermission.action",
		async:false,
		data:{},
		success:function(args){
			var recharge = args.recharge;
			if (recharge ==null || recharge == ""){
				$("#xfxq").empty();
			}
		}
	});
	
		$(".searchinfo")
				.click(
						function() {
							location.href = "/Qiqiang/SelfInfoController/selfInfo.action?user_id="
									+ $(this).attr("car_id");
						})
	</script>
	
	<script>
	
	
	var regStr = /[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF][\u200D|\uFE0F]|[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF]|[0-9|*|#]\uFE0F\u20E3|[0-9|#]\u20E3|[\u203C-\u3299]\uFE0F\u200D|[\u203C-\u3299]\uFE0F|[\u2122-\u2B55]|\u303D|[\A9|\AE]\u3030|\uA9|\uAE|\u3030/ig;
								
								$("body").delegate(".emojiTxt","keyup",function(){
									$(this).val($(this).val().replace(regStr, '').replace(/(\s*$)/g, ""));
									
								});
								
	  
	</script>
	
		<!-- 次数校验 -->
	<script>
	$("body").delegate("input[name='number']","blur",function(){
		
			if($("input[name='number']").length>1){
				var linshipro = $(this).parent().parent().parent().find(".ccdd").val();
				var shengyCishu = $(this).parent().parent().parent().find(".sycs").val();
				var linshiCph = $(this).parent().parent().parent().find(".cph").val();
				var linshiCishu = 0;
				$("input[name='number']").each(function(){
					if($(this).parent().parent().parent().find(".ccdd").val()==linshipro&&$(this).parent().parent().parent().find(".cph").val()==linshiCph){
						linshiCishu +=$(this).val()*1;
					}
				})
				if(linshiCishu>shengyCishu){
					layer.alert("超过"+$(this).parent().parent().parent().find(".ccdd").val()+"的剩余次数,请重新输入次数!");
					$(this).val("0");
				}
			}
		})
	</script>
	<script>
	</script>
</body>
</html>
