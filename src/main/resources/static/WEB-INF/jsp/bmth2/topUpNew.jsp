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
<title>充值</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/inde.css" />
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
	margin-left: 1px;
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
	height: 0.64rem;
	border: 0pt;
	border-radius: 5px;
	outline: 0
}

.form2 {
	padding: 3px 12px;
	font-size: 14px;
}

.form1 {
	padding: 6px 14px;
}

.seeClass span {
	display: block;
	padding: 12px 12px;
	margin-left: 20px;
	font-size: 16px;
}

.seeClass {
	margin-top: 20px;
}

.quDBtn {
	background-color: #4476A7 !important;
	width: 200px;
}

table td{text-align:center;}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 info-con">
				<form action="/Qiqiang/PayController/topUpMoney1" method="post"
					ID="topup">
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
										<tr class='searchinfo' style='border-bottom:1px solid #ccc'
											car_id='${selectInfo.aid }'>
											<td><a>${selectInfo.name}</a></td>
											<td><a>${selectInfo.mobile}</a></td>
											<td><a>${selectInfo.plateno}</a></td>
											<td><a>${selectInfo.level}</a></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<!--日报结束-->
					</section>
					<div class="addQY">

						<div class="toUpSec">
							<i class="glyphicon glyphicon-remove pull-right delete"
								style="display:none;"></i><br>
							<div class="row top">
								<span class="col-md-2">账户余额</span> <span class="col-md-10">
									<input type="text" disabled="disabled"
									class="form-control accountBalance" name="accountBalance"
									value="<fmt:formatNumber type="number" value=" ${card.balance}" pattern="0.00" maxFractionDigits="2"/>">
								</span>
							</div>

							<div class="row">
								<span class="col-md-2">充值方式</span> <span class="col-md-10">
									<select name="type" id="type" class="form-control czfs type">
										<option value="1">余额充值</option>
										<option value="3">项目赠送</option>
								</select> </span>

								<div class="row">
									<span class="col-md-2" style="padding-right:29px;">车牌号</span> <span
										class="col-md-10"> <select name="car_id"
										class="form-control cph">
											<c:forEach items="${carlist}" var="car">
												<option value="${car.id}"
													<c:if test="${selectInfo.bid==car.id}">selected</c:if>>${car.plateno}</option>
											</c:forEach>

									</select> </span>

								</div>

								<div class="row top">
									<span class="col-md-2">卡片类型</span> <span class="col-md-10"
										style="vertical-align:middle;"> <select name="card"
										id="card" class="form-control">
											<c:forEach items="${viplevels}" var="level">
												<option value="${level.id}"
													<c:if test="${level.id==car.vipid}">selected</c:if>>${level.level}（洗车${level.price}/次）</option>
											</c:forEach>
									</select> </span>
								</div>


								<div class="row top">
									<span class="col-md-2">充值金额</span> <span class="col-md-10">
										
												<input type="number" min="1" name="price"
													placeholder="请输入充值金额(优惠后金额)" required="required"
													pattern="^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$"
													oninvalid="setCustomValidity('金额必须为正数')"
													oninput="setCustomValidity('')" class="form-control"
													value="${project.svr_fee}">
										</span>
								</div>
								<div class="row top">
									<span class="col-md-2">赠送金额</span> <span class="col-md-10">
										<input type="number" name="pprice" value="0" placeholder=""
										required="required"
										pattern="^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$"
										oninvalid="setCustomValidity('金额必须为正数')"
										oninput="setCustomValidity('')" class="form-control">
									</span>
								</div>
<input type="hidden" value="${user.pass}" id="userpass">
								<div class="row give" style="">
									<span class="col-md-2">赠送项目</span> <span class="col-md-10"
										style="vertical-align:middle;">
										<div id="GYS-div"
											style="margin-top:0rem;vertical-align:middle;">
											<span> <!--这个是个多选框，用onchange事件的时候 ，将这个select的id传进去-->
												<select name="project" id="project"
												class="form-control project1">
													<c:forEach items="${projectlist}" var="project">
															<option value="${project.id}">${project.svr_item}</option>
													</c:forEach>
											</select> </span> <span style="width:88%"> <input type="text"
												value="" name="parts_type" id="parts_type"
												class="ccdd qlc_zdz" placeholder=""
												style="width:100%;padding:0px;padding-left:0.1rem;" maxlength="20">
											</span>
										</div> </span>
								</div>
								<div class="row give">
									<span class="col-md-2">赠送次数</span> <span class="col-md-10">
										<input type="text" placeholder="请输入赠送次数" class="form-control zscs"
										name="number"  onKeyUp="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"> </span>
								</div>
								<input type='hidden' id="success" value="${success}"> <input
									type='hidden' id="card_type" value="${card_type}">
							</div>

						</div>
					</div>
					<div class="text-right" style="margin-top: 5px;">
						<button class="btn form2 zjxm"
							style="background-color: #48a3da;width:110px" type='button'>项&nbsp;目&nbsp;赠&nbsp;送</button>
					</div>
					<div class="text-right" style="margin-top: 5px;">
						<button class="btn form2 addCard"
							style="background-color: #48a3da;" type='button'>新增卡片类型</button>
					</div>
					<div class="text-center" style="margin-top: 30px;">
						<button class="btn form1"
							style="background-color: #48a3da;width:200px;height:38px;color:white;font-size:18px;" type='button'>确&nbsp;&nbsp;&nbsp;&nbsp;定</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/footerCZ.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>

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
	
		var czpass = $("#userpass").val();
		$("#parts_type").val($("#project option")[0].innerText);
		if ($("#success").val() != '') {
			layer.msg($("#success").val());
		}
		$('form').delegate('.project1', 'change', function() {
			var project = $(this).find("option:selected").text();
			$(this).parent().next().find("#parts_type").val(project);
		})
		if ($(".type").val() == 1) {
			$(".give").hide();
			$(".top").show();
		}
		if ($(".type").val() == 3) {
			$(".give").show();
			$(".top").hide();
		}
		$(".type").change(function() {
			if ($(this).val() == 3) {
				$($(this).parents()[2]).find(".give").show();
				$($(this).parents()[2]).find(".top").hide();
			}
			if ($(this).val() == 1) {
				$($(this).parents()[2]).find(".give").hide();
				$($(this).parents()[2]).find(".top").show();
			}

		})
		$(".titleDiv span").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
		})

		$(".zjxm").click(function() {
			$(".addQY").append($(".toUpSec:first").clone());

			$(".toUpSec:last .give").show();
			$(".toUpSec:last .top").hide();
			//$($(this).parents()[2]).find(".give").show();
			$($(".toUpSec:last .czfs")[0]).val("3");
			$($(".toUpSec:last .czfs")[0]).find("option:first").remove();
			$("input[name='parts_type']:last").val($("#project:last option")[0].innerText);
			$($(".toUpSec:last .zscs")[0]).val("");
			$(".toUpSec:last .delete").show();
		});

		$(".addCard")
				.click(
						function() {
							layer.close(layer.index);
							var tableStr = '';
							tableStr += '<div class="row seeClass"><span>';
							tableStr += '卡片类型名称 <input type="text" id="levelname" class="emojiTxt" style="width: 130px;" maxlength="50"/>';
							tableStr += '</span><span>';
							tableStr += '洗车扣减金额 <input type="number"  id="levelprice" style="width: 130px;" />';
							tableStr += '</span>';
							tableStr += '<span style="text-align:center;margin-top:20px; padding-left: 0px;"><button class="btn quDBtn addlevel" type="button">确&nbsp;&nbsp;&nbsp;&nbsp;定</button></span>'
							tableStr += '</div>';
							//页面层
							layer.open({
								type : 1,
								shade : false,
								skin : 'layui-layer-lan', //样式类名
								title : '新增卡片类型',
								area : [ '280px', '280px' ], //宽高
								content : tableStr
							});
							
							 var regStr = /[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF][\u200D|\uFE0F]|[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF]|[0-9|*|#]\uFE0F\u20E3|[0-9|#]\u20E3|[\u203C-\u3299]\uFE0F\u200D|[\u203C-\u3299]\uFE0F|[\u2122-\u2B55]|\u303D|[\A9|\AE]\u3030|\uA9|\uAE|\u3030/ig;
								$(".emojiTxt").keyup(function(){
									
									$(this).val($(this).val().replace(regStr, '').replace(/(\s*$)/g, ""));
							  });
	  
						});

		$("body").delegate(".delete", "click", function() {
			$($(this).parents()[0]).remove();
		});

		$("select[name='car_id']").change(function() {
			var car_id = $(this).val();
			$.ajax({
				type : "POST",
				async : false,
				data : {
					'car_id' : car_id
				},
				url : '/Qiqiang/PayController/getCardbycar_id',
				success : function(data) {
					$("select[name='card']").val(data);
				}
			})
		})

		$("body").delegate(
				".addlevel",
				"click",
				function() {
					var levelname = $("#levelname").val();
					var levelprice = $("#levelprice").val();
					layer.close(layer.index);
					if (levelname != null && levelname != ''&&levelprice != null && levelprice != ''&&levelprice>0) {
						$.ajax({
							type : "POST",
							async : false,
							data : {
								'levelname' : levelname,
								'levelprice' : levelprice
							},
							url : '/Qiqiang/PayController/addLevel.action',
							success : function(data) {
								if (data.level == '卡片类型名称已存在，新增失败') {
									layer.alert("卡片类型名称已存在，新增失败");
								} else {
									$("#card").append(
											"<option value='"+data.id+"'>"
													+ data.level + "（洗车"
													+ data.price.toFixed(1) 
													+ "/次）</option>");
								}

							}
						});
					} else {
						layer.alert("卡片类型名称或者洗车扣减金额未正确填写！")
					}

				});

		$(".form1")
				.click(
						function() {
							var flag = true;
							$(".toUpSec")
									.each(
											function() {
												if ($(this).find(
														"select[name='type']")
														.val() == 1) {
													if ($(this)
															.find(
																	"input[name='price']")
															.val() == '') {
														layer.msg("充值金额不能为空");
														flag = false;
														return false;
													} else {
														if ($(this)
																.find(
																		"input[name='price']")
																.val() < 0) {
															layer
																	.msg("充值金额不能为负数");
															flag = false;
															return false;
														}
														if ($(this)
																.find(
																		"input[name='pprice']")
																.val() == '') {
															layer
																	.msg("赠送金额不能为空");
															flag = false;
															return false;
														} else {
															if ($(this)
																	.find(
																			"input[name='pprice']")
																	.val() < 0) {
																layer
																		.msg("赠送金额不能为负数");
																			flag = false;
															return false;
															}
														}
													}
												} else {
													if ($(this)
															.find(
																	"input[name='parts_type']")
															.val() == '') {
														layer.msg("赠送项目不能为空");
														flag = false;
														return false;
													}
													if ($(this)
															.find(
																	"input[name='number']")
															.val() == '') {
														layer.msg("赠送次数不能为空");
														flag = false;
														return false;
													} else {
														if ($(this)
																.find(
																		"input[name='number']")
																.val() < 0) {
															layer
																	.msg("赠送次数不能为负数");
															flag = false;
															return false;
														}
													}

												}
											});
							if (flag == false) {
								return false;
							} else {
								if ($("select[name='type']").eq(0).val() == 1) {
								var ms="充值总金额:"
											+ $("input[name='price']").eq(0)
													.val()
											+ ",赠送金额:"
											+ $("input[name='pprice']").eq(0)
													.val();
									$("select[name='car_id']:gt(0)").each(function(){
									ms=ms+"<br />"+"赠送项目："+$(this).parent().parent().parent().find("input[name='parts_type']").val()+"(赠送车牌号："+$(this).find("option:selected").text()+"+"+$(this).parent().parent().parent().find("input[name='number']").val()+"次)";
								});				
									layer.confirm( ms+ " <br />是否确认充值？", {
										btn : [ '确认', '取消' ],
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
											title : '输入充值口令，并确认',
											formType : 1
										}, function(pass, index) {
											layer.close(index);
											if (pass == czpass) {
												var index = layer.load(1, {
													shade : [ 0.1, '#fff' ],//0.1透明度的白色背景
													time : 1000
												});
												$("form").submit();
												return true;
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
								}else{
								var projects=$("input[name='parts_type']").eq(0).val()+"(赠送车牌号："+$("select[name='car_id']").eq(0).find("option:selected").text()+"+"+$("input[name='number']").eq(0).val()+"次)"+"<br>";
								$("select[name='car_id']:gt(0)").each(function(){
									projects=projects+""+$(this).parent().parent().parent().find("input[name='parts_type']").val()+"(赠送车牌号："+$(this).find("option:selected").text()+"+"+$(this).parent().parent().parent().find("input[name='number']").val()+"次)"+"<br>";
								})
								
								layer.confirm("赠送项目:"
											+ projects
										  + "<br>是否确认充值？", {
										btn : [ '确认', '取消' ]
									//按钮
									}, function(index1) {
										layer.close(index1);
										layer.prompt({
											title : '输入充值口令，并确认',
											formType : 1
										}, function(pass, index) {
											layer.close(index);
											if (pass == czpass) {
												var index = layer.load(1, {
													shade : [ 0.1, '#fff' ],//0.1透明度的白色背景
													time : 1000
												});
												$("form").submit();
												return true;
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
							}
						});

		$(".searchinfo")
				.click(
						function() {
							location.href = "/Qiqiang/SelfInfoController/selfInfo.action?user_id="
									+ $(this).attr("car_id");
						})
		$.post({
		url:"/Qiqiang/getPermission.action",
		async:false,
		data:{},
		success:function(args){
			var consume = args.consume;
			if (consume ==null || consume == ""){
				$("#xfxq").empty();
			}
		}
	});
	
	
	</script>
	
		 <!-- 不允许输入表情 -->
  <script>
	  
	 
  </script>
</body>
</html>
