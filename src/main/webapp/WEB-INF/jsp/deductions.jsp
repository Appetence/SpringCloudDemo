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
<link rel="stylesheet" href="static/css/bootstrap.css" />
<link rel="stylesheet" href="static/css/commom.css" />
<link rel="stylesheet" href="static/css/deductions.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/scrollTable.css" />
<link rel="stylesheet" href="static/css/inde.css" />
<link rel="stylesheet" type="text/css" href="static/css/iconfont.css">
<style type="text/css">
.table-responsive {
	border: 0px;
}

.col-md-2 {
	width: 71px;
}

.list {
	overflow: auto;
	overflow-y: auto;
	overflow-x: auto;
}

.list::-webkit-scrollbar-track-piece {
	background-color: rgba(0, 0, 0, 0);
	border-left: 1px solid rgba(0, 0, 0, 0);
	margin-top: 10px;
	margin-top: 0.2rem;
}

.list::-webkit-scrollbar {
	width: 5px;
	height: 0px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.list::-webkit-scrollbar-thumb {
	background-color: rgba(0, 0, 0, 0.1);
	background-clip: padding-box;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	min-height: 28px;
}

.list::-webkit-scrollbar-thumb:hover {
	background-color: rgba(0, 0, 0, 0.5);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.list1::-webkit-scrollbar {
	width: 0px;
	height: 8px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.toUpSec div {
	margin-top: 0px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">

			<div class="col-md-12 info-con">
				<p class="titleP">
					<i class="iconfont icon-jiesuankoujianjine"></i> 扣减
				</p>
				<!--搜索开始-->
				<section class="sec">
					<div>
						<div class="row"
							style="margin:0rem;width: 100%;text-align: center;">
							<span> <input type="text" id="search_user"
								placeholder="姓名/手机号/车牌号" class="form-control" value="${us.name}" style="height:40px;">
							</span>
							<button type="button" class="btn" id="search"  style="height:38px; margin-bottom:3px">查询</button>
						</div>
						<input type="hidden" value="${user.pass}" id="userpass">
						<div class="tableDiv">
							<div class="list table-responsive">
								<table class="table infotable"
									style="margin-top: 10px;margin-top: 0.2rem;" id="select_user">
									<tr id="sysinfo">
										<th>选择</th>
										<th>姓名</th>
										<th>手机号</th>
										<th>车牌号</th>
										<th>车型</th>
										<th>卡级别</th>

									</tr>
									<tr class='searchinfo'>
								</table>
							</div>
						</div>
						<!--
            <div class="text-center">
            <button>首页</button>
            <button>上一页</button>
            <button>下一页</button>
            <button>尾页</button>
            </div>
            -->
					</div>
				</section>
				<!--搜索结束-->
				<div class="titleDiv" style="margin-top: 10px;margin-top: 0.2rem;">
					<span class="active One washBtn">洗车</span><span
						class="Two repairBtn">修车</span>
				</div>
				<!--金额开始-->
				<div class="toUpSec">
					<input type='hidden' id="success" value="${success}">
					<div class="row">
						<span class="col-md-2">支付类型</span> <span class="col-md-10">
							<select name="cardtype" id="cardtype" class="form-control"
							name="cardtype">
						</select> </span>
					</div>
					<div class="row">
						<span class="col-md-2">剩余金额</span> <span class="col-md-10">
							<input type="number" class="form-control" disabled name="balance"
							id="balance" name="balance" value="${balance}"> </span>
					</div>

				</div>
				<!--金额开始-->
				<!--洗车开始-->
				<div class="wash">
					<form id='other' action="/Qiqiang/PayController/deductionother"
						method="post">
						<input type="hidden" name='car_id' class="user_chose_id">
						<input type="hidden" name='card_type' class="cardtype_chose_id">
						<div class="wCar toUpSec" style="margin-top:0.2rem;">
							<div class="row" style="    margin-top: 0px;">
								<span class="col-md-2" style="width:71px;">剩余次数</span> <span
									class="col-md-10"> <input type="text"
									class="form-control" placeholder="" id="xcnumber" value="0"
									disabled="disabled"> </span>
							</div>
							<div class="row" style="    margin-top: 0px;">
								<span class="col-md-2" style="width:71px;white-space: nowrap;">剩余赠送次数</span> <span
									class="col-md-10"> <input type="text"
									class="form-control" placeholder="" id="number" value="0"
									disabled> </span>
							</div>
							<div class="row" style="    margin-top: 0px;">
								<span class="col-md-2" style="width:71px;">扣减项目</span> <span
									class="col-md-10"> <select name="project" id="project"
									class="form-control selector">
										<c:forEach items="${projectlist}" var="project">
											<c:if test="${project.status==1}">
												<option value="${project.id}">${project.svr_item}</option>
											</c:if>
										</c:forEach>
								</select> </span>
							</div>

							<div class="row"  style="    margin-top: 0px;">
								<span class="col-md-2" style="width:71px;">扣减金额</span> <span
									class="col-md-10"> <input type="number"
									class="form-control" placeholder="" name="price" value="0"
									id="noprice" pattern="^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$"
									oninvalid="setCustomValidity('金额必须为正数')"
									oninput="setCustomValidity('')"> </span>
							</div>
							<div class="row"  style="    margin-top: 0px;">
								<span class="col-md-2" style="width:71px;">扣减次数</span> <span
									class="col-md-10"> <input type="number"
									class="form-control" placeholder="" name="number" value="0"
									id="nonumber" pattern="^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$"
									oninvalid="setCustomValidity('次数必须为正数')"
									oninput="setCustomValidity('')"> </span>
							</div>

						</div>
						<div class="text-center" style="margin-top: 10px;">
							<button class="btn" style="background-color: #48a3da;"
								id="othersub" type='button'>确定</button>
						</div>
					</form>
				</div>
				<!--洗车结束-->


				<!--修车开始-->
				<div class="repair">
					<form id='repair' action="/Qiqiang/StoreController/deductionrepair"
						method="post">
						<div class="toUpSec repairDiv repairclass"
							style="margin-top:0.2rem;">
							<i class="glyphicon glyphicon-remove pull-right delete"></i>
							<div class="row" style="margin-top: 25px;margin-top: 0.5rem;">
								<span class="col-md-2">扣减项目</span> <span class="col-md-10">
									<select name="project" id="project1"
									class="form-control selector">
										<c:forEach items="${projectlist}" var="project">
											<c:if test="${project.status==2&&project.svr_item!='充值'}">
												<option value="${project.id}">${project.svr_item}</option>
											</c:if>
										</c:forEach>
								</select>
							</div>
							<div class="row ">
								<span class="col-md-2">剩余赠送次数</span> <span class="col-md-10"
									style="vertical-align:top;margin-top:0.1rem;"> <input
									type="number" class="form-control" placeholder="" id="number"
									value="0" disabled> </span>
							</div>
							<div class="row">
								<span class="col-md-2">配件类型</span> <span class="col-md-10">
									<select name="partstype" id="selectIDThree"
									class="form-control par">
										<option value="0">请选择配件类型</option>
										<c:forEach items="${pList}" var="t">
											<option id="" value="${t.parts_type}">${t.parts_type}</option>
										</c:forEach>
								</select> </span>
							</div>

							<div class="row">
								<span class="col-md-2">配件名称</span> <span class="col-md-10">
									<select name="partsName" id="partsName"
									class="form-control ppar">
										<option value="0">请选择配件名称</option>
								</select> </span>
							</div>
							<div class="row">
								<span class="col-md-2">供应商</span> <span class="col-md-10">

									<select name="supplier" id="supplier" class="form-control sure">
										<option value="0">请选择供应商</option>
										<c:forEach items="${supplierList}" var="t">
											<option class="new" value="${t.id}">${t.supplier}</option>
										</c:forEach>
								</select> </span>
							</div>
							<div class="row">
								<button class="btn ck" style="right: 41%;" type='button'>查看已选</button>
							</div>

							<div class="row">
								<span class="col-md-2">销售单价(元)</span> <span class="col-md-10"
									style="vertical-align:top;margin-top:0.1rem;"> <input
									type="number" name='xprice' class="form-control r1price"
									value="0"> </span>
							</div>
							<div class="row">
								<span class="col-md-2">销售数量</span> <span class="col-md-10">
									<input type="number" name='xnumber' value="0"
									class="form-control r1number" pattern="^\d+$"
									oninvalid="setCustomValidity('请输入正确的销售数量')"
									oninput="setCustomValidity('')"> </span>
							</div>
							<div class="row">
								<span class="col-md-2">销售日期</span> <span class="col-md-10">
									<input type="date" name='xdate' class="form-control today"
									value="" style="vertical-align:middle;padding-top:0.2rem; "
									required="required"> </span>
							</div>
							<div class="row">
								<span class="col-md-2">质保期</span> <span class="col-md-10">
									<input type="date" name='xzbdate'
									class="form-control yeartoday" value=""
									style="vertical-align:middle; padding-top:0.2rem; "
									required="required"> </span>
							</div>
							<div class="row">
								<span class="col-md-2">质保价(元)</span> <span class="col-md-10"
									style="vertical-align:top;margin-top:0.1rem;"> <input
									type="number" name='xzbprice' class="form-control" value='0'>
								</span>
							</div>
							<div class="row rprice">
								<span class="col-md-2">服务费(元)</span> <span class="col-md-10"
									style="vertical-align:top;margin-top:0.1rem;"> <input
									type="number" name='p_fee' value="0" class="form-control"
									required="required" min='0' step='0.1'> </span>

							</div>
							<div class="row">
								<span class="col-md-2">备注</span> <span class="col-md-10">
									<input type="text" value="备注" class="form-control"
									name='content'> </span>
							</div>
							<!--弹窗开始-->
							<div id="mask">
								<div class="simpleAlertBody" style="width: 88%;left: 6%;">
									<i class="simpleAlertBodyClose 	glyphicon glyphicon-remove"
										style="top: 8px;right: 5px;"></i>
									<div class="simpleAlertBodyContent"
										style="height: 190px;height:3.8rem;top: 15%; ">
										<table class="table" id='chose'
											style="font-size: 15px;font-size: 0.3rem;">
											<tr class='title'>
												<td>进货时间</td>
												<td>单价(元)</td>
												<td>库存</td>
												<td>选择</td>
											</tr>
										</table>
									</div>
									<button class="simpleAlertBtn simpleAlertBtn2" type='button'
										style="right: 41%;">确定</button>
								</div>
							</div>
							<!--弹窗结束-->

						</div>

						<!-- 						<div class="text-center" style="margin-top: 20px;">
							<button class="btn add" type="button"
								style="background-color: #48a3da;">增加项目或配件</button>
						</div> -->
						<div class="toUpSec repairDiv" style="margin-top:0.2rem;">
							<input type="hidden" name='car_id' class="user_chose_id">
							<input type="hidden" name='uid' id="uid" value="${us.id}">
							<input type="hidden" name='cid' id="cid" value="${car_id}">
							<input type="hidden" name='c_type' id="c_type"
								value="${card_type}">
							<input type="hidden" name='card_type' class="cardtype_chose_id">
							
							<div class="row rprice">
								<span class="col-md-2">总服务费(元)</span> <span class="col-md-10"
									style="vertical-align:top;margin-top:0.1rem;"> <input
									type="text" name='ser_fee' value="0" class="form-control"
									required="required" readonly="readonly"> </span>
							</div>
							<div class="row">
								<span class="col-md-2">负责人</span> <span class="col-md-10">
									<input type="text" name='principal' value="张三"
									class="form-control" required="required"
									pattern="[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*"
									oninvalid="setCustomValidity('姓名必须是中文')"
									oninput="setCustomValidity('')"> </span>
							</div>
							<div class="row">
								<span class="col-md-2">里程数(公里)</span> <span class="col-md-10"
									style="vertical-align:top;margin-top:0.1rem;"> <input
									type="text" name='mileage' class="form-control"
									required="required" value="0"> </span>
							</div>
							<div class="row">
								<span class="col-md-2">备注</span> <span class="col-md-10">
									<input type="text" name='remark' class="form-control">
								</span>
							</div>
							<div class="row rnumber">
								<span class="col-md-2">扣减次数</span> <span class="col-md-10">
									<input type="text" class="form-control" placeholder=""
									name="repairnumber" value="0" pattern=" ^\d+$"
									oninvalid="setCustomValidity('请填写正确的扣减次数')"
									oninput="setCustomValidity('')"> </span>
							</div>
							<div class="row rprice">
								<span class="col-md-2">总价(元)</span> <span class="col-md-10">
									<input type="text" value="0" name='sumprice'
									class="form-control" required="required" readonly> </span>
							</div>
						</div>

						<div class="text-center" style="margin-top: 20px;">
							<button class="btn add" type="button"
								style="background-color: #48a3da;">增加配件</button>
							&nbsp;
							<button class="btn insertBtn" style="background-color: #48a3da;"
								id="repairsub" type='button'>确定</button>
						</div>
					</form>
				</div>
				<!--修车开始-->
			</div>
		</div>
	</div>
	<div id="cover"
		style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%;  filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 "></div>
	<script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>

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
	<script type="text/javascript" src="static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>

	<script type="text/javascript" src="static/js/mask.js"></script>
	<script type="text/javascript" src="static/js/datefmt.js"></script>
	<script>
		var czpass = $("#userpass").val();
		$(".wash").show();
		if ($("#success").val() != null && $("#success").val() != '') {
			if ($("#success").val() == '扣减成功') {
				layer.alert($("#success").val(), {
					skin : 'layui-layer-lan' //样式类名
					,
					closeBtn : 0
				})
			} else {
				if($("#success").val()!="充值跳转到扣减页面"){
					layer.alert($("#success").val(), {
						skin : 'layui-layer-lan' //样式类名
						,
						closeBtn : 0
					})
				}
				
			}
		}

		$(".par option:first").prop("selected", 'selected');
		$(".sure option:first").prop("selected", 'selected');
		$(".titleDiv span").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
		})
		$(".simpleAlertBtn,.simpleAlertBodyClose").click(function() {
			$(this).parents().find("#mask").fadeOut();
			document.body.style.overflow = "";
			document.body.style.position = 'static';
		})
		$(".ck").click(function() {
			$(this).parent().parent().find("#mask").fadeIn();
			$("#mask").height($(".container").height());
			$("#mask").css("margin-left", -26);
			document.body.style.overflow = "hidden";
			//document.body.style.position='fixed'; 
		})
		$(".sure")
				.change(
						function() {
							var supplier = $(this).val();
							var partsid = $(this).parent().parent().prev()
									.children().children().val();
							var $this = $(this);
							$this.parent().parent().parent().find(".xzkc")
									.remove();
							$
									.ajax({
										url : "/Qiqiang/StoreController/getStockInfo",
										type : "post",
										timeout : "1000",
										data : {
											"parts_id" : partsid,
											"supplier_id" : supplier
										},
										success : function(data) {
											if (data != 0) {
												for ( var i = 0; i < data.length; i++) {
													var date = data[i].ps_date;
													$this
															.parent()
															.parent()
															.parent()
															.find("#chose")
															.append(
																	"<tr class='xzkc'><td>"
																			+ new Date(
																					date)
																					.toLocaleDateString()
																			+ "</td><td>"
																			+ data[i].ps_price
																			+ "</td><td>"
																			+ data[i].partStock.stock
																			+ "</td><td><input type='checkbox' name='partsids' value='"+data[i].id+"'></td></tr>")
												}
											} else {
												$this
														.parent()
														.parent()
														.parent()
														.find("#chose")
														.append(
																"<tr class='xzkc'><td cospan='5'>记录为空。。。</td>")
											}
										},
										error : function(XMLResponse) {
											alert(XMLResponse.responseText);
										}
									});
							$this.parent().parent().parent().find("#mask")
									.fadeIn();
							$("#mask").height($(".container").height());
							$("#mask").css("margin-left", -26);
							document.body.style.overflow = "hidden";
							//document.body.style.position='fixed'; 
						});
		$("#cardtype").change(function() {
			var ye = 0;
			var jg = 0;
			var cardtype = $(this).val();
			$(".cardtype_chose_id").val(cardtype);
			var project_id = $("#project").val();
			var car_id = $("input[type='hidden'][name='car_id']").val();
			if (cardtype == '剩余次数') {
				$("#noprice").parent().parent().hide();
				$("#nonumber").parent().parent().show();
				$(".rnumber").show();
				$(".rprice").hide();
				$("#xcnumber").parent().parent().hide();
			}
			if (cardtype == '一卡通') {
				$.ajax({
					url : "/Qiqiang/PayController/gettypebalance",
					type : "post",
					timeout : "1000",
					async : false,
					data : {
						"car_id" : car_id,
						"cardtype" : cardtype
					},
					success : function(balance) {

						if (balance != 0) {
							$("#balance").val(balance);
							ye = balance;
						} else {
							$("#balance").val(0);
						}
					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}

				});
				$.ajax({
					url : "/Qiqiang/PayController/gettypePrice",
					type : "post",
					timeout : "1000",
					async : false,
					data : {
						"project_id" : project_id,
						"cardtype":cardtype,
						"car_id" : car_id
						
					},
					success : function(price) {
						if (price != 0) {
							$("#noprice").val(price);
							jg = price;
						} else {
							$("#noprice").val(35);
							jg = 35;
						}

					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});

				$("#noprice").parent().parent().show();
				$("#nonumber").parent().parent().hide();
				$(".rnumber").hide();
				$(".rprice").show();

				if (project_id == 1) {
					$("#xcnumber").val(Math.floor(ye / jg));
					$("#xcnumber").parent().parent().show();
				} else {
					$("#xcnumber").parent().parent().hide();
				}
			}
			if (cardtype == '洗车25卡') {

				$.ajax({
					url : "/Qiqiang/PayController/gettypebalance",
					type : "post",
					timeout : "1000",
					async : false,
					data : {
						"car_id" : car_id,
						"cardtype" : cardtype
					},
					success : function(price) {
						if (price != 0) {
							$("#balance").val(price);
							ye = price;
						} else {
							$("#balance").val(0);
						}
					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});
				$("#noprice").parent().parent().show();
				$("#nonumber").parent().parent().hide();
				$("#noprice").val(25);
				jg = 25;
				$(".rprice").show();
				if (project_id == 1) {
					$("#xcnumber").val(Math.floor(ye / jg));
					$("#xcnumber").parent().parent().show();
				} else {
					$("#xcnumber").parent().parent().hide();
				}
			}

		})
		$(".washBtn").click(function() {
			var ye = 0;
			var jg = 0;
			$("#cardtype option[value='洗车25卡']").show();
			var cardtype = $("#cardtype").val();
			$(".cardtype_chose_id").val(cardtype);
			var project_id = $("#project").val();
			var car_id = $("input[type='hidden'][name='car_id']").val();
			if (cardtype == '剩余次数') {
				$("#noprice").parent().parent().hide();
				$("#xcnumber").parent().parent().hide();
			}
			if (cardtype == '一卡通') {
				$.ajax({
					url : "/Qiqiang/PayController/gettypebalance",
					type : "post",
					timeout : "1000",
					async : false,
					data : {
						"car_id" : car_id,
						"cardtype" : cardtype
					},
					success : function(balance) {
						if (balance != 0) {
							$("#balance").val(balance);
							ye = balance;
						} else {
							$("#balance").val(0);
						}
					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});
				$.ajax({
					url : "/Qiqiang/PayController/gettypePrice",
					type : "post",
					timeout : "1000",
					async : false,
					data : {
						"project_id" : project_id,
						"car_id" : car_id
					},
					success : function(price) {
						if (price != 0) {
							$("#noprice").val(price);
							jg = price;
						} else {
							$("#noprice").val(35);
							jg = 35;
						}
					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});
				$("#noprice").parent().parent().show();
				$("#nonumber").parent().parent().hide();
				$(".rprice").show();
				if (project_id == 1) {
					$("#xcnumber").val(Math.floor(ye / jg));
					$("#xcnumber").parent().parent().show();
				} else {
					$("#xcnumber").parent().parent().hide();
				}
			}
			if (cardtype == '洗车25卡') {
				$.ajax({
					url : "/Qiqiang/PayController/gettypebalance",
					type : "post",
					timeout : "1000",
					async : false,
					data : {
						"car_id" : car_id,
						"cardtype" : cardtype
					},
					success : function(price) {
						if (price != 0) {
							$("#balance").val(price);
							ye = price;
						} else {
							$("#balance").val(0);
						}
					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});
				$("#noprice").parent().parent().show();
				$("#nonumber").parent().parent().hide();
				$("#noprice").val(25);
				jg = 25;
				$(".rprice").show();
				if (project_id == 1) {
					$("#xcnumber").val(Math.floor(ye / jg));
					$("#xcnumber").parent().parent().show();
				} else {
					$("#xcnumber").parent().parent().hide();
				}
			}
			$(".wash").fadeIn();
			$(".repair").hide();

		})
		$(".repairBtn").click(
				function() {
					$this = $(this);
					$("#cardtype option[value='洗车25卡']").hide();
					$("#cardtype option[value='一卡通']").prop("selected", 'selected'); 
					$("#cardtype").change();
					//将支付类型默认为一卡通
					$(".repair").fadeIn();
					$(".wash").hide();
					var zftype = $("#cardtype").val();
					$(".cardtype_chose_id").val(zftype);
					if (zftype == '剩余次数') {
						$(".rprice").hide();
					} else {
						$(".rnumber").hide();
					}
					project1 = $("#project1").val();
					id = $("input[name='car_id']:checked").next().val()
					$.ajax({
						url : "/Qiqiang/PayController/getGiveCard",
						type : "post",
						timeout : "1000",
						async : false,
						data : {
							"id" : id,
							"project" : project1
						},
						success : function(data) {
							if (data.number > 0) {
								$(".repairclass").children().find("#number")
										.val(data.number);
							} else {
								$this.parent().parent().next().find("#number")
										.val(0);
							}
						},
						error : function(XMLResponse) {
							alert(XMLResponse.responseText);
						}
					});

				})
		$("#select_user").hide();
		$("#search")
				.click(
						function() {
							var value = $("#search_user").val();
							$("#select_user").show();
							$
									.ajax({
										url : "/Qiqiang/PayController/getUserbyValue",
										type : "post",
										timeout : "1000",
										async : false,
										data : {
											"value" : value
										},
										success : function(data) {
											$(".searchinfo").remove();
											if (data != 0) {

												for ( var i = 0; i < data.length; i++) {
													$(".infotable")
															.append(
																	"<tr class='searchinfo'><td  align='center'><input type='radio' name='car_id' value='"
																			+ data[i].car.id
																			+ "' onclick='clicku("
																			+ data[i].id
																			+ ","
																			+ data[i].car.id
																			+ ","
																			+data[i].car.user_id
																			+",\""
																			+data[i].name
																			+"\",\""
																			+data[i].mobile
																			+"\",\""
																			+data[i].car.plateno
																			+"\",\""
																			+data[i].car.vehicle
																			+"\",\""
																			+data[i].viplevel1.level
																			+"\",this"
																			+");'><input type='hidden' name='user_id' value='"
																			+ data[i].car.user_id
																			+ "'></td><td>"
																			+ data[i].name
																			+ "</td><td><a href='tel:"+
																			+data[i].mobile+"'>"
																			+ data[i].mobile
																			+ "</a></td><td>"
																			+ data[i].car.plateno
																			+ "</td><td>"
																			+((data[i].car.vehicle==null||data[i].car.vehicle=="")?"未录入车型":data[i].car.vehicle)
																			+ "</td><td>"
																			+ data[i].viplevel1.level
																			+ "</td></tr>");
												}

												if ($(".infotable").height() > 350) {
													$(".table-responsive")
															.height(350);
													$(".table-responsive")
															.removeClass(
																	"list1");
													$(".table-responsive")
															.addClass("list");
												} else {
													$(".table-responsive")
															.height(
																	$(
																			".infotable")
																			.height() + 10);
													$(".table-responsive")
															.addClass("list1");
												}
											} else {
												$(".infotable")
														.append(
																"<tr class='searchinfo' > <td rowspan='5' align='center'>没有找到相关用户。。。</td></tr>");
											}
										},
										error : function(XMLResponse) {
											alert(XMLResponse.responseText);
										}
									});
						});
		function clicku(id, car_id,ccar_user_id,ccar_name,ccar_mobile,ccar_plateno,ccar_vehicle,ccar_viplevel1,obj) {
			var ye = 0;
			var jg = 0;
			var  flag = false;
			if ($(this).attr("checked", true)) {
				$(".user_chose_id").val(car_id);
				$(".cardtype_chose_id").val("一卡通");
				$
						.ajax({
							url : "/Qiqiang/PayController/getUserCard",
							type : "post",
							timeout : "1000",
							async : false,
							data : {
								"id" : id
							},
							success : function(data) {
								if (data != 0) {
									$(".cardt").remove();
									for ( var i = 0; i < data.length; i++) {
										if(data[i].cardtype == "洗车25卡"){//如果为25洗车卡
											if(data[1].balance>0){
												flag=true;
												$("#balance").val(data[i].balance);//将25洗车卡的值复制给balance
												$(".cardtype_chose_id").val("洗车25卡");
												$("#cardtype").append(
														"<option class='cardt' value='"+data[i].cardtype+"' selected = 'selected'>"
																+ data[i].cardtype
																+ "</option>");
											}
										}else{
											$("#cardtype").append(
													"<option class='cardt' value='"+data[i].cardtype+"'>"
															+ data[i].cardtype
															+ "</option>");
											$("#balance").val(data[i].balance);
										}
									}
									if(flag){
										ye = data[1].balance;
									}else{
										ye = data[0].balance;
									}
									//查询剩余赠送次数
									$
											.ajax({
												url : "/Qiqiang/PayController/getGiveCard",
												type : "post",
												timeout : "1000",
												async : false,
												data : {
													"id" : id
												},
												success : function(data) {
													if (data.number > 0) {
														$("#number").val(
																data.number);
													} else {
														$("#number").val(0);
													}
												},
												error : function(XMLResponse) {
													alert(XMLResponse.responseText);
												}
											});
									project1 = $("#project1").val()
									$
											.ajax({
												url : "/Qiqiang/PayController/getGiveCard",
												type : "post",
												timeout : "1000",
												async : false,
												data : {
													"id" : id,
													"project" : project1
												},
												success : function(data) {
													if (data.number > 0) {
														$(".repairclass")
																.children()
																.find("#number")
																.val(
																		data.number);
													} else {
														$(".repairclass")
																.children()
																.find("#number")
																.val(0);
													}
												},
												error : function(XMLResponse) {
													alert(XMLResponse.responseText);
												}
											});
									//查询数据    查询上次洗车消费的价格
									$("#cardtype")
											.append(
													"<option class='cardt' value='剩余次数'>剩余次数 </option>");
									var project_id = $("#project").val();
									$
											.ajax({
												url : "/Qiqiang/PayController/gettypePrice",
												type : "post",
												timeout : "1000",
												async : false,
												data : {
													"project_id" : project_id,
													"car_id" : car_id
												},
												success : function(price) {
													if(flag){//判断如果是25洗车卡   jg =25
														$("#noprice").val(25);
														jg = 25;
													}else{
														if (price != 0) {
															$("#noprice")
																	.val(price);
															jg = price;
														} else {
															$("#noprice").val(35);
															jg = 35;
														}
													}
												},
												error : function(XMLResponse) {
													alert(XMLResponse.responseText);
												}
											});
									$(".rprice").show();

								}

							},
							error : function(XMLResponse) {
								alert(XMLResponse.responseText);
							}
						});
						
						/*  开始  点击选中某一行，将改行移动到该table 的最后一行。 */
						//①先删除改行！~
			obj.parentElement.parentElement.remove();
//②将删除行，插入到table的最后一行！~
$(".infotable tbody").append("<tr class='searchinfo'><td  align='center'><input type='radio' checked='checked' id='"+car_id+"' name='car_id' value='"+car_id
	+ "' onclick='clicku("
+ id
																			+ ","
																			+ car_id
																			+ ","
																			+ccar_user_id
																			+",\""
																			+ccar_name
																			+"\",\""
																			+ccar_mobile
																			+"\",\""
																			+ccar_plateno
																			+"\",\""
																			+ccar_vehicle
																			+"\",\""
																			+ccar_viplevel1
																			+"\",this"
																			+");'><input type='hidden' name='user_id' value='"
																			+ ccar_user_id
																			+ "'></td><td>"
																			+ ccar_name
																			+ "</td><td><a href='tel:"+
																			+ccar_mobile+"'>"
																			+ ccar_mobile
																			+ "</a></td><td>"
																			+ ccar_plateno
																			+ "</td><td>"
																			+ ((ccar_vehicle==null||ccar_vehicle=="")?"未录入车型":ccar_vehicle)
																			+ "</td><td>"
																			+ ccar_viplevel1
																			+ "</td></tr>");
																		//③定位到该行！~
																		var $objTr = $("#"+car_id);
																		var objTr = $objTr[0];
																		$(".list").animate({scrollTop:objTr.parentElement.parentElement.offsetTop},'fast');
																		//④定位到洗车修车Div
																			window.scrollBy(0,$(".list").height()+38);
			/*  结束  点击选中某一行，将改行移动到该table 的最后一行。 */
						
			}
			;

			$("#nonumber").parent().parent().hide();
			$("#noprice").parent().parent().show();
			var project_id = $("#project").val();
			if (project_id == 1) {
				$("#xcnumber").parent().parent().show();
				$("#xcnumber").val(Math.floor(ye / jg));
			} else {
				$("#xcnumber").parent().parent().hide();
			}
		}

		$("#project").change(function() {
			var ye;
			var jg;
			ye = $("#balance").val();
			jg = $("#noprice").val();
			var project = $(this).val();
			var id = $("input[name='car_id']:checked").next().val();
			$.ajax({
				url : "/Qiqiang/PayController/getGiveCard",
				type : "post",
				timeout : "1000",
				async : false,
				data : {
					"id" : id,
					"project" : project
				},

				success : function(data) {
					if (data.number > 0) {
						$("#number").val(data.number);
					} else {
						$("#number").val(0);
					}
				},
				error : function(XMLResponse) {
					alert(XMLResponse.responseText);
				}
			});
			if (project == 1) {
				$("#xcnumber").val(Math.floor(ye / jg));
				$("#xcnumber").parent().parent().show();
			} else {
				$("#xcnumber").parent().parent().hide();
			}
		})
		$("#project1").change(
				function() {
					var $this = $(this);
					var project = $(this).val();
					var id = $("input[name='car_id']:checked").next().val();
					$.ajax({
						url : "/Qiqiang/PayController/getGiveCard",
						type : "post",
						timeout : "1000",
						data : {
							"id" : id,
							"project" : project
						},
						success : function(data) {
							if (data.number > 0) {
								$this.parent().parent().next().find(
										"input[id='number']").val(data.number);
							} else {
								$this.parent().parent().next().find(
										"input[id='number']").val("0");
							}
						},
						error : function(XMLResponse) {
							alert(XMLResponse.responseText);
						}
					});
				})
		$(".par")
				.change(
						function() {
							var $this = $(this);
							$this.parent().parent().next().find(".whc")
									.remove();
							var parts_type = $this.find("option:selected")
									.val();//配件类型名称
							var selected = $this.parent().parent().parent()
									.find("#partsName");
							$this.parent().parent().parent().find(".xzkc")
									.remove();
							if (parts_type == '无耗材') {
								$this.parent().parent().next().hide();
								$this.parent().parent().next().next().hide();
								$this.parent().parent().next().next().next()
										.hide();
								$this.parent().parent().next().next().next()
										.next().hide();
								$this.parent().parent().next().next().next()
										.next().next().hide();
								$this.parent().parent().next().next().next()
										.next().next().next().hide();
								$this.parent().parent().next().next().next()
										.next().next().next().next().hide();
								$this.parent().parent().next().next().next()
										.next().next().next().next().next()
										.hide();
								$this
										.parent()
										.parent()
										.next()
										.append(
												"<input type='checkbox' value='279' name='partsids' checked class='whc'>");
							}
							//根据配件类型查询配件名称
							else {

								$this.parent().parent().next().show();
								$this.parent().parent().next().next().show();
								$this.parent().parent().next().next().next()
										.show();
								$this.parent().parent().next().next().next()
										.next().show();
								$this.parent().parent().next().next().next()
										.next().next().show();
								$this.parent().parent().next().next().next()
										.next().next().next().show();
								$this.parent().parent().next().next().next()
										.next().next().next().next().show();
								$this.parent().parent().next().next().next()
										.next().next().next().next().next()
										.show();
								selected.empty();
								$
										.ajax({
											type : "POST",
											url : "/Qiqiang/StoreController/getPartsByConditions",
											async : false,
											data : {
												parts_type : parts_type
											},
											success : function(args) {

												var proList = $.parseJSON(args).pList;
												//$this.empty();
												if (proList != null
														&& proList.length > 0) {
													selected
															.append("<option value='0'>请选择配件名称</option>")
													$
															.each(
																	proList,
																	function(
																			idx,
																			val) {
																		selected
																				.append("<option value="+val.id+">"
																						+ val.parts
																						+ "</option>"); //为Select追加一个Option(下拉项)
																	});
												} else {
													selected
															.append("<option value='0'>无相关配件</option>");
												}
											}
										});
							}
						});
		$(".ppar")
				.change(
						function() {
							var $this = $(this);
							var partsid = $(this).val();
							var supplier = $(this).parent().parent().next()
									.children().children().val();
							if (supplier > 0) {
								$this.parent().parent().parent().find(".xzkc")
										.remove();
								$
										.ajax({
											url : "/Qiqiang/StoreController/getStockInfo",
											type : "post",
											timeout : "1000",
											data : {
												"parts_id" : partsid,
												"supplier_id" : supplier
											},
											success : function(data) {
												if (data != 0) {

													for ( var i = 0; i < data.length; i++) {
														var date = data[i].ps_date;
														$this
																.parent()
																.parent()
																.parent()
																.find("#chose")
																.append(
																		"<tr class='xzkc'><td>"
																				+ new Date(
																						date)
																						.toLocaleDateString()
																				+ "</td><td>"
																				+ data[i].ps_price
																				+ "</td><td>"
																				+ data[i].partStock.stock
																				+ "</td><td><input type='checkbox' name='partsids' value='"
																				+ data[i].id
																				+ "' onclick='clickpid()'></td></tr>")
													}
												} else {
													$this
															.parent()
															.parent()
															.parent()
															.find("#chose")
															.append(
																	"<tr class='xzkc'><td cospan='5'>记录为空。。。</td>")
												}
												if (data.number == null) {
												}
											},
											error : function(XMLResponse) {
												alert(XMLResponse.responseText);
											}
										});
								$this.parent().parent().parent().find("#mask")
										.fadeIn();
							}
						});

		$(".add")
				.click(
						function() {
							var $this = $(this);
							$(this).parent().prev().before(
									$(".repairDiv:first").clone(true));
							$(".repairclass:last").find(".r1number").val(0);
							$(".repairclass:last").find(".r1price").val(0);
							$(".repairclass:last").find("input[name='p_fee']")
									.val(0);
							$(".repairclass:last").find(
									"input[name='xzbprice']").val(0);
							$(".repairclass:last")
									.find("input[name='content']").val('');
							var sum = 0;
							var svrfee = 0;
							var k = 0;
							var leng = $('.r1price').length;
							for ( var i = 0; i < leng; i++) {
								sum = sum
										+ (parseFloat($('.r1number').eq(i)
												.val()) * parseFloat($(
												'.r1price').eq(i).val()));
							}
							for ( var i = 0; i < leng; i++) {
								svrfee = svrfee
										+ (parseFloat($("input[name='p_fee']")
												.eq(i).val()));
								k = k
										+ (parseFloat($(
												"input[name='xzbprice']").eq(i)
												.val()));
							}
							$("input[name='sumprice']").val(sum + svrfee + k);
							$("input[name='ser_fee']").val(svrfee);
							var nowTime = new Date().Format("yyyy-MM-dd");
							var daylength = $(".today").length;
							$(".today").eq(daylength - 1).val(nowTime);
							$(".yeartoday").eq(daylength - 1).val(nowTime);
						});
		//删除
		$(".delete")
				.click(
						function() {
							var $this = $(this);
							if ($(".repairDiv").length > 2) {
								$this.parent().remove();
								var sum = 0;
								var svrfee = 0;
								var k = 0;
								var leng = $('.r1price').length;
								for ( var i = 0; i < leng; i++) {
									sum = sum
											+ (parseFloat($('.r1number').eq(i)
													.val()) * parseFloat($(
													'.r1price').eq(i).val()));
								}
								for ( var i = 0; i < leng; i++) {
									svrfee = svrfee
											+ (parseFloat($(
													"input[name='p_fee']")
													.eq(i).val()));
									k = k
											+ (parseFloat($(
													"input[name='xzbprice']")
													.eq(i).val()));
								}
								$("input[name='sumprice']").val(
										sum + svrfee + k);
								$("input[name='ser_fee']").val(svrfee);
							} else {
								alert("最后一条不能删除");
							}
						});

		var nowTime = new Date().Format("yyyy-MM-dd");
		$(".today").val(nowTime);
		var now = new Date();
		//格式化日，如果小于9，前面补0
		var day = ("0" + now.getDate()).slice(-2);
		//格式化月，如果小于9，前面补0
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
		//拼装完整日期格式
		var today = now.getFullYear() + 1 + "-" + (month) + "-" + (day);
		//完成赋值
		$('.yeartoday').val(today);

		$("#othersub").click(
				function() {
					var cardtype = $("#cardtype option:selected").val();
					var user = $('input:radio[name="car_id"]:checked').length;
					if (user < 1) {
						alert("请选择扣减的用户");
						return false;
					}

					var money = $('input[name="price"]').val();
					if (money < 0) {
						alert("消费金额不能为负数");
						return false;
					}
					var balance = $("input[name='balance']").val();
					
					var number = $('input[name="number"]').val();
					var synumber = $('input[id="number"]').val();
					if (parseInt(synumber) < parseInt(number)) {
						alert("剩余次数不足,请选择其他支付");
						return false;
					}
					if (cardtype == '一卡通') {
						if (money == 0) {
							alert("金额不能为空");
							return false;
						}
						if (parseFloat(balance) < parseFloat(money)) {
						//alert("余额不足,请先充值。。。");
						layerJump();
						return false;
					}
					}
					if (cardtype == '剩余次数') {
						if (number == 0) {
							alert("次数不能为空");
							return false;
						}
					}
					var project = $("#project option:selected").text();
					var noprice = $("#noprice").val();
					var nonumber = $("#nonumber").val();
					if (cardtype == '一卡通' || cardtype == '洗车25卡') {
						layer.confirm("扣减项目:" + project + ",扣减金额:"
								+ Number(noprice).toFixed(2) + "元,是否确认扣减？", {
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
									$("#other").submit();
									return true;
								} else {
									layer.msg('密码错误');
									return false;
								}
							});
						}, function() {
							var index = layer.msg('已取消',{
								time:1000
							});
							/* layer.close(index); */
							return false;
						});
					}
					if (cardtype == '剩余次数') {
						layer.confirm("扣减项目:" + project + ",扣减次数:"
								+ Number(nonumber) + "次,是否确认扣减？", {
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
									$("#other").submit();
									return true;
								} else {
									layer.msg('密码错误');
									return false;
								}
							});
						}, function() {
							layer.msg('已取消',{time:1000});
							//layer.close(index);
							return false;
						});
					}
				})
		var sum = 0;
		var leng = $('.r1price').length;
		for ( var i = 0; i < leng; i++) {
			sum = sum
					+ (parseFloat($('.r1number').eq(i).val()) * parseFloat($(
							'.r1price').eq(i).val()));
		}
		var length = $("input[name='p_fee']").length;
		for ( var i = 0; i < leng; i++) {
			sum = sum + (parseFloat($("input[name='p_fee']").eq(i).val()));
		}
		var fuf = $("input[name='ser_fee']").val();
		$("input[name='sumprice']").val(parseFloat(fuf) + sum);

		$("input[name='xprice']")
				.keyup(
						function() {
							var sum = 0;
							var svrfee = 0;
							var k = 0;
							var leng = $('.r1price').length;
							for ( var i = 0; i < leng; i++) {
								sum = sum
										+ (parseFloat($('.r1number').eq(i)
												.val()) * parseFloat($(
												'.r1price').eq(i).val()));
							}
							for ( var i = 0; i < leng; i++) {
								svrfee = svrfee
										+ (parseFloat($("input[name='p_fee']")
												.eq(i).val()));
								k = k
										+ (parseFloat($(
												"input[name='xzbprice']").eq(i)
												.val()));
							}
							$("input[name='sumprice']").val(sum + svrfee + k);
						});
		$("input[name='xnumber']")
				.keyup(
						function() {
							var sum = 0;
							var svrfee = 0;
							var k = 0;
							var leng = $('.r1price').length;
							for ( var i = 0; i < leng; i++) {
								sum = sum
										+ (parseFloat($('.r1number').eq(i)
												.val()) * parseFloat($(
												'.r1price').eq(i).val()));
							}
							for ( var i = 0; i < leng; i++) {
								svrfee = svrfee
										+ (parseFloat($("input[name='p_fee']")
												.eq(i).val()));
								k = k
										+ (parseFloat($(
												"input[name='xzbprice']").eq(i)
												.val()));
							}
							$("input[name='sumprice']").val(sum + svrfee + k);
						});
		$("input[name='ser_fee']")
				.keyup(
						function() {
							var sum = 0;
							var svrfee = 0;
							var k = 0;
							var leng = $('.r1price').length;
							for ( var i = 0; i < leng; i++) {
								sum = sum
										+ (parseFloat($('.r1number').eq(i)
												.val()) * parseFloat($(
												'.r1price').eq(i).val()));
							}
							for ( var i = 0; i < leng; i++) {
								svrfee = svrfee
										+ (parseFloat($("input[name='p_fee']")
												.eq(i).val()));
								k = k
										+ (parseFloat($(
												"input[name='xzbprice']").eq(i)
												.val()));
							}
							$("input[name='sumprice']").val(sum + svrfee + k);
						});

		$("input[name='p_fee']")
				.keyup(
						function() {
							var sum = 0;
							var svrfee = 0;
							var k = 0;
							var leng = $('.r1price').length;
							for ( var i = 0; i < leng; i++) {
								sum = sum
										+ (parseFloat($('.r1number').eq(i)
												.val()) * parseFloat($(
												'.r1price').eq(i).val()));
							}
							for ( var i = 0; i < leng; i++) {
								svrfee = svrfee
										+ (parseFloat($("input[name='p_fee']")
												.eq(i).val()));
								k = k
										+ (parseFloat($(
												"input[name='xzbprice']").eq(i)
												.val()));
							}
							$("input[name='sumprice']").val(sum + svrfee + k);
							$("input[name='ser_fee']").val(svrfee);
						});

		$("input[name='xzbprice']")
				.keyup(
						function() {
							var sum = 0;
							var svrfee = 0;
							var k = 0;
							var leng = $('.r1price').length;
							for ( var i = 0; i < leng; i++) {
								sum = sum
										+ (parseFloat($('.r1number').eq(i)
												.val()) * parseFloat($(
												'.r1price').eq(i).val()));
							}
							for ( var i = 0; i < leng; i++) {
								svrfee = svrfee
										+ (parseFloat($("input[name='p_fee']")
												.eq(i).val()));
								k = k
										+ (parseFloat($(
												"input[name='xzbprice']").eq(i)
												.val()));
							}
							$("input[name='sumprice']").val(sum + svrfee + k);

						});
		$('.simpleAlertBodyContent').delegate(
				"input[name='partsids']",
				'click',
				function() {
					if ($(this).is(':checked')) {
						$(this).parent().parent().parent().find(
								"input[name='partsids']").not(this).attr(
								"checked", false);
					}
				})
		$("#repairsub")
				.click(
						function() {
							var divlength = $(".repairclass").length;
							var pidlength = $("input[name='partsids']:checked").length;
							if (divlength != pidlength) {
								alert("请检查表单,配件批次是否都已选择，如无需耗材，请在配件类型中选择无耗材")
							} else {
								if ($("input[name='sumprice']").val() < 0
										|| $("input[name='ser_fee']").val() < 0) {
									alert("表单填写错误,请检查");
								} else {
									var cardtype = $(
											"#cardtype option:selected").val();
									var user = $('input:radio[name="car_id"]:checked').length;
									if (user < 1) {
										alert("请选择扣减的用户");
										return false;
									}
									var checkedpid = [];
									$('input:checkbox:checked').each(
											function() {
												checkedpid.push($(this).val());
											});

									for (i = 0; i < checkedpid.length; i++) {
										for (j = i + 1; j < checkedpid.length; j++) {
											if (checkedpid[i] === checkedpid[j]
													&& checkedpid[i] != '279') {
												alert("有重复的配件信息,请检查后重新输入");
												return false;
											}
										}
									}
									var balance = $("#balance").val();
									var sumprice = $("input[name='sumprice']")
											.val();
									
									var viplevel = $(
											"input[name='car_id']:checked")
											.parent().next().next().next()
											.next().next().text();
									var sumprice = $("input[name='sumprice']")
											.val();
									if (cardtype == '一卡通') {
									if (parseFloat(balance) < parseFloat(sumprice)) {
										//alert("余额不足,请及时充值");
										layerJump();
										return false;
									}
										if (viplevel != 'A(通用卡)') {
											layer
													.confirm(
															'会员卡等级不够,是否继续扣减？',
															{
																btn : [ '是',
																		'否' ]
															//按钮
															},
															function(indexvip) {
																layer
																		.close(indexvip);
																layer
																		.confirm(
																				"扣减项目:修车类扣减,实际扣减金额:"
																						+ Number(
																								sumprice)
																								.toFixed(
																										2)
																						+ "元,是否确认扣减？",
																				{
																					btn : [
																							'确认',
																							'取消' ]
																				//按钮
																				},
																				function(
																						index1) {
																					layer
																							.close(index1);
																					layer
																							.prompt(
																									{
																										title : '输入扣减口令，并确认',
																										formType : 1
																									},
																									function(
																											pass,
																											index) {
																										layer
																												.close(index);
																										if (pass == czpass) {
																											var index = layer
																													.load(
																															1,
																															{
																																shade : [
																																		0.1,
																																		'#fff' ],//0.1透明度的白色背景
																																time : 1000
																															});
																											$(
																													"#repair")
																													.submit();
																											return true;
																										} else {
																											layer
																													.msg('密码错误');
																											return false;
																										}
																									});
																				},
																				function() {
																					layer
																							.msg('已取消');
																					layer
																							.close(index);
																					return false;
																				});
															},
															function() {
																layer
																		.msg('已取消');
															});
										} else {
											layer
													.confirm(
															"扣减项目:修车类扣减,实际扣减金额:"
																	+ Number(
																			sumprice)
																			.toFixed(
																					2)
																	+ "元,是否确认扣减？",
															{
																btn : [ '确认',
																		'取消' ]
															//按钮
															},
															function(index1) {
																layer
																		.close(index1);
																layer
																		.prompt(
																				{
																					title : '输入扣减口令，并确认',
																					formType : 1
																				},
																				function(
																						pass,
																						index) {
																					layer
																							.close(index);
																					if (pass == czpass) {
																						var index = layer
																								.load(
																										1,
																										{
																											shade : [
																													0.1,
																													'#fff' ],//0.1透明度的白色背景
																											time : 1000
																										});
																						$(
																								"#repair")
																								.submit();
																						return true;
																					} else {
																						layer
																								.msg('密码错误');
																						return false;
																					}
																				});
															},
															function() {
																layer
																		.msg('已取消');
																layer
																		.close(index);
																return false;
															});
										}
									}
									if (cardtype == '剩余次数') {
										var repairnumber = $(
												"input[name='repairnumber']")
												.val();
										if (viplevel != 'A(通用卡)') {
											layer
													.confirm(
															'会员卡等级不够,是否继续扣减？',
															{
																btn : [ '是',
																		'否' ]
															//按钮
															},
															function(indexvip) {
																layer
																		.close(indexvip);
																layer
																		.confirm(
																				"扣减项目:修车类扣减,按次数扣减,扣减次数:"
																						+ Number(repairnumber)

																						+ "次,是否确认扣减？",
																				{
																					btn : [
																							'确认',
																							'取消' ]
																				//按钮
																				},
																				function(
																						index1) {
																					layer
																							.close(index1);
																					layer
																							.prompt(
																									{
																										title : '输入扣减口令，并确认',
																										formType : 1
																									},
																									function(
																											pass,
																											index) {
																										layer
																												.close(index);
																										if (pass == czpass) {
																											var index = layer
																													.load(
																															1,
																															{
																																shade : [
																																		0.1,
																																		'#fff' ],//0.1透明度的白色背景
																																time : 1000
																															});
																											$(
																													"#repair")
																													.submit();
																											return true;
																										} else {
																											layer
																													.msg('密码错误');
																											return false;
																										}
																									});
																				},
																				function() {
																					layer
																							.msg('已取消');
																					layer
																							.close(index);
																					return false;
																				});
															},
															function() {
																layer
																		.msg('已取消');
															});
										} else {
											layer
													.confirm(
															"扣减项目:修车类扣减,按次数扣减,扣减次数:"
																	+ Number(repairnumber)
																	+ "次,是否确认扣减？",
															{
																btn : [ '确认',
																		'取消' ]
															//按钮
															},
															function(index1) {
																layer
																		.close(index1);
																layer
																		.prompt(
																				{
																					title : '输入扣减口令，并确认',
																					formType : 1
																				},
																				function(
																						pass,
																						index) {
																					layer
																							.close(index);
																					if (pass == czpass) {
																						var index = layer
																								.load(
																										1,
																										{
																											shade : [
																													0.1,
																													'#fff' ],//0.1透明度的白色背景
																											time : 1000
																										});
																						$(
																								"#repair")
																								.submit();
																						return true;
																					} else {
																						layer
																								.msg('密码错误');
																						return false;
																					}
																				});
															},
															function() {
																layer
																		.msg('已取消');
																layer
																		.close(index);
																return false;
															});
										}
									}
								}
							}
						})

		/***/
			var ye = 0;
			var jg = 0;
			var uid = $("#uid").val();
			var cid = $("#cid").val();
			var flag= false;
		if (uid != null && uid != '') {
		document.getElementById('search').click();
			$("input[name='car_id'][value='" + cid + "']").trigger('click');
			
			$(".list1").height($(".list1").height()+12) ;
			$(".cardtype_chose_id").val($("#c_type").val());
			var cardtype = $(".cardtype_chose_id").val();
			$
					.ajax({
						url : "/Qiqiang/PayController/getUserCard",
						type : "post",
						timeout : "1000",
						async : false,
						data : {
							"id" : uid
						},
						success : function(data) {
							if (data != 0) {
								$(".cardt").remove();
								for ( var i = 0; i < data.length; i++) {
									$("#cardtype").append(
											"<option class='cardt' value='"+data[i].cardtype+"'>"
													+ data[i].cardtype
													+ "</option>");
								}
								$("#cardtype").find("option:contains('"+cardtype+"')")
										.attr("selected", true);
								if ($("#c_type").val() == '一卡通') {
									$("#balance").val(data[0].balance);
								}else {
									$("#balance").val(data[1].balance);
								}
								ye = data[0].balance;
								$.ajax({
									url : "/Qiqiang/PayController/getGiveCard",
									type : "post",
									timeout : "1000",
									async : false,
									data : {
										"id" : uid
									},
									success : function(data) {
										if (data.number > 0) {
											$("#number").val(data.number);
										} else {
											$("#number").val(0);
										}
									},
									error : function(XMLResponse) {
										alert(XMLResponse.responseText);
									}
								});
								project1 = $("#project1").val()
								$
										.ajax({
											url : "/Qiqiang/PayController/getGiveCard",
											type : "post",
											timeout : "1000",
											async : false,
											data : {
												"id" : uid,
												"project" : project1
											},
											success : function(data) {
												if (data.number > 0) {
													$(".repairclass")
															.children().find(
																	"#number")
															.val(data.number);
												} else {
													$(".repairclass")
															.children().find(
																	"#number")
															.val(0);
												}
											},
											error : function(XMLResponse) {
												alert(XMLResponse.responseText);
											}
										});
								$("#cardtype")
										.append(
												"<option class='cardt' value='剩余次数'>剩余次数 </option>");
								var project_id = $("#project").val();
								$.ajax({
									url : "/Qiqiang/PayController/gettypePrice",
									type : "post",
									timeout : "1000",
									async : false,
									data : {
										"project_id" : project_id,
										"car_id" : cid
									},
									success : function(price) {
										if (price != 0) {
											$("#noprice").val(price);
											jg = price;
										} else {
											$("#noprice").val(35);
											jg = 35;
										}
									},
									error : function(XMLResponse) {
										alert(XMLResponse.responseText);
									}
								});
								$(".rprice").show();

							}
							if($("#c_type").val() == '洗车25卡'){
								$("#cardtype").change();
								flag=true;
							}
							//获取选中人的支付类型的金额   如果为空则提示是否跳转到充值页面
							var    afterBalance   =    $("#balance").val();
							if(afterBalance<=0){
								layerJump1();
							}
						},
						error : function(XMLResponse) {
							alert(XMLResponse.responseText);
						}
					});
		};

		$("#nonumber").parent().parent().hide();
		$("#noprice").parent().parent().show();
		var project_id = $("#project").val();
		if (project_id == 1) {
			$("#xcnumber").parent().parent().show();
			if(flag){
				
			}else{
				$("#xcnumber").val(((ye==0&&jg==0)||jg==0)?"":Math.floor(ye / jg));
			}
		} else {
			$("#xcnumber").parent().parent().hide();

		}
		/******* */
		/* 弹出充值提示 */
		function layerJump(){
			//查看用户的的当时权限
			 $.ajax({
	          type: "POST",
	          url: "/Qiqiang/PayController/queryPermissionTopUp",
	          data: {},
	          success:function(Msg){
					var  flag  = Msg.data;
					if(flag){//如果有扣减权限可以跳到扣减页面
						layer.confirm('扣减金额不足，是否给该用户充值？', {
						  btn: ['是','否'] //按钮
						}, function(){
							  window.location.href="/Qiqiang/toTopUp?car_id="+$(".user_chose_id").val();
						}, function(){
						  layer.close();
						});
					}else{//如果没有就不跳
						layer.alert($("#success").val(), {
							skin : 'layui-layer-lan' //样式类名
							,
							closeBtn : 0
						})
					}
				}
	      });
		}
		
		/* 弹出充值提示 */
		function layerJump1(){
			//查看用户的的当时权限
			 $.ajax({
	          type: "POST",
	          url: "/Qiqiang/PayController/queryPermissionTopUp",
	          data: {},
	          success:function(Msg){
					var  flag  = Msg.data;
					if(flag){//如果有扣减权限可以跳到扣减页面
						layer.confirm('扣减成功，该账户的余额为0，是否充值？', {
						  btn: ['是','否'] //按钮
						}, function(){
							  window.location.href="/Qiqiang/toTopUp?car_id="+$(".user_chose_id").val();
						}, function(){
						  layer.close();
						});
					}else{//如果没有就不跳
						layer.alert($("#success").val(), {
							skin : 'layui-layer-lan' //样式类名
							,
							closeBtn : 0
						})
					}
				}
	      });
		}
	</script>
</body>
</html>




