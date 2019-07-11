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
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 info-con">
				<form action="/Qiqiang/PayController/topUpMoney" method="post" ID="topup">
					<p class="titleP">
						<i class="iconfont icon-chongzhi"
							style="font-size: 18px!important;"></i> 充值
							<input type="hidden"  name="car_id" id="car_id"   value="${car_id}">
					</p>
					<section class="sec">

						<div>
							<input type="hidden" value="${k}" id="k">
							<input type="hidden" value="${user.pass}" id="userpass">
							<div class="row" style="padding: 0px 15px;margin-top: 10px;">
								<span> <input type="text" id="search_user"
									placeholder="姓名/手机号/车牌号" class="form-control" style="height:40px;"> </span>
								<button type="button" class="btn" id="search"  style="height:38px;margin-bottom:3px;">查询</button>
								<!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
							</div>

							<div class="tableDiv">
								<div class="list table-responsive">
									<table class="table infotable" id="select_user">
										<tr id="sysinfo">
											<th>选择</th>
											<th>姓名</th>
											<th>手机号</th>
											<th>车牌号</th>
											<th>车型</th>
											<th>卡级别</th>
										</tr>
										<tr class='searchinfo'></tr>
									</table>

									<!--
          <div class="text-center">
              <button>首页</button>
              <button>上一页</button>
              <button>下一页</button>
              <button>尾页</button>
          </div>
          -->
								</div>
							</div>
						</div>
						<!--日报结束-->
					</section>
					<div class="toUpSec">
						<div class="row top">
							<span class="col-md-2">账户余额</span> <span class="col-md-10">
								<input type="text" disabled="disabled" class="form-control accountBalance"
								name="accountBalance"> </span>
						</div>
					
						<div class="row">
							<span class="col-md-2">充值方式</span> <span class="col-md-10">
								<select name="type" id="type" class="form-control">
									<option value="1">余额充值</option>
									<option value="3">项目赠送</option>
							</select> </span>

						</div>

						<div class="row top">
							<span class="col-md-2">卡片类型</span> <span class="col-md-10">
								<select name="card" id="card" class="form-control">
									<option value="一卡通">一卡通</option>
							</select> </span>
						</div>
						<div class="row top">
							<span class="col-md-2">充值金额</span> <span class="col-md-10">
								<c:forEach items="${projectlist}" var="project">
									<c:if test="${project.trans_type==1}">
										<input type="number" min="1" name="price"
											placeholder="请输入充值金额(优惠后金额)" required="required"
											pattern="^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$"
											oninvalid="setCustomValidity('金额必须为正数')"
											oninput="setCustomValidity('')" class="form-control"
											value="${project.svr_fee}">
									</c:if>
								</c:forEach> </span>
						</div>
						<div class="row top">
							<span class="col-md-2">实充金额</span> <span class="col-md-10">
								<input type="number" name="pprice" value="${project.svr_fee}"
								placeholder="请输入充值金额(实际金额)" required="required"
											pattern="^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$"
											oninvalid="setCustomValidity('金额必须为正数')"
											oninput="setCustomValidity('')" class="form-control"> </span>
						</div>
						<div class="row give" style="margin-top:0.3rem;">
							<span class="col-md-2">赠送项目</span> <span class="col-md-10">
								<select name="project" id="project" class="form-control">
									<c:forEach items="${projectlist}" var="project">
										<c:if test="${project.trans_type!=1&&project.svr_item!='扣减'}">
											<option value="${project.id}">${project.svr_item}</option>
										</c:if>
									</c:forEach>
							</select> </span>
						</div>
						<div class="row give">
							<span class="col-md-2">赠送次数</span> <span class="col-md-10">
								<input type="text" placeholder="请输入充值次数" class="form-control"
								name="number"> </span>
						</div>
						<input type='hidden' id="cid" name="cid" value="${cid}" >
						<input type='hidden' id="success" value="${success}">
						<input type='hidden' id="uid" value="${uid}">
						<input type='hidden' id="card_type" value="${card_type}">
					</div>
					<div class="text-center" style="margin-top: 20px;">
						<button class="btn form1" style="background-color: #48a3da;"
							type='button'>确定</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>
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
		//操作密码
		var czpass=$("#userpass").val();
		//判断是否是充值成功
		if ($("#success").val() != null && $("#success").val() != '') {
			//如果是充值成功
			if ($("#success").val() == '充值成功') {
				//判断是否是一卡通充值  
					if($("#card_type").val()=="一卡通"){//只有充值一卡通的时候才会跳转
						//查看用户的的当时权限
						 $.ajax({
		                type: "POST",
		                url: "/Qiqiang/PayController/queryPermission",
		                data: {},
		                success:function(Msg){
							var  flag  = Msg.data;
							if(flag){//如果有扣减权限可以跳到扣减页面
								layer.confirm($("#success").val()+'!是否对该用户进行扣减操作？', {
								  btn: ['是','否'] //按钮
								}, function(){
								   var uid =	$("#uid").val();
									 var cid =	$("#cid").val();
									 var card_type =	$("#card_type").val();
									window.location.href="/Qiqiang/PayController/toDeduction?uid="+uid+"&car_id="+cid+"&card_type="+card_type;
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
				}else{
					layer.alert($("#success").val(), {
						skin : 'layui-layer-lan' //样式类名
						,
						closeBtn : 0
					})
				}
			} else {
				layer.alert($("#success").val(), {
					skin : 'layui-layer-lan' //样式类名
					,
					closeBtn : 0
				})
			}
		}
		if ($("#type").val() == 1) {
			$(".give").hide();
			$(".top").show();
		}
		if ($("#type").val() == 3) {
			$(".give").show();
			$(".top").hide();
		}
		$("#type").change(function() {
			if ($(this).val() == 3) {
				$(".give").show();
				$(".top").hide();
			}
			if ($(this).val() == 1) {
				$(".give").hide();
				$(".top").show();
			}

		})
		$(".titleDiv span").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
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
										async:false,
										data : {
											"value" : value
										},
										success : function(data) {
											$(".searchinfo").remove();
											if (data != 0) {
												for ( var i = 0; i < data.length; i++) {
													$(".infotable")
															.append(
																	"<tr class='searchinfo'> <td align='center'>"
																				+ "<input type='radio' name='user_id'  onchange='changeCarid("+data[i].car.id+","+data[i].car.user_id+",\""+data[i].name+"\",\""+data[i].mobile+"\",\""+data[i].car.plateno+"\",\""+data[i].car.vehicle+"\",\""+data[i].viplevel1.level+"\",this);' value='"+data[i].car.user_id+"'></td><td>"
																			+ data[i].name
																			+ "</td><td>"
																			+ data[i].mobile
																			+ "</td><td>"
																			+ data[i].car.plateno
																			+ "</td><td>"
																			+ ((data[i].car.vehicle==null||data[i].car.vehicle=="")?"未录入车型":data[i].car.vehicle)
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
		$(".form1")
				.click(
						function() {
							if ($("input[name='user_id']").length > 0) {
								if ($("input[type='radio']:checked").length == 0) {
									alert("请选择充值用户");
									return false;
								} else {
									if ($("#type").val() == 1) {
										if ($.trim($("input[name='price']")
												.val()) == ''
												|| $.trim($(
														"input[name='pprice']")
														.val()) == '') {
											alert("请检查表单必填项");
											return false;
										} else {
											var price = $("input[name='price']")
													.val();
											var pprice = $(
													"input[name='pprice']")
													.val();
											layer
													.confirm(
															"充值金额:"
																	+ Number(
																			price)
																			.toFixed(
																					2)
																	+ "元,实际支付金额:"
																	+ Number(
																			pprice)
																			.toFixed(
																					2)
																	+ "元,是否确认充值？",
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
																					title : '输入充值口令，并确认',
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
																						$("#topup")
																								.submit();
																					} else {
																						layer
																								.msg('密码错误');
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
									if ($("#type").val() == 3) {
										if ($.trim($("input[name='number']")
												.val()) == '') {
											alert("请检查表单必填项");
										} else {
											var project = $(
													"#project option:selected")
													.text();
											var number = $(
													"input[name='number']")
													.val();
											layer.confirm(
															"赠送项目:"
																	+ project
																	+ ",赠送次数:"
																	+ number
																	+ "次,是否确认赠送？",
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
															title : '输入充值口令，并确认',
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
																$("#topup").submit();
															} else {
																layer
																		.msg('密码错误');
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
							} else {
								alert("请点击搜索 选择要充值的用户");
								return false;
							}
						})
	  var   user_id="";			
	  function	changeCarid(car_id,user_id,ccar_name,ccar_mobile,ccar_plateno,ccar_vehicle,ccar_viplevel1,obj){
			var   that = $(this);
			//当选择选项改变时改变当前用户的carid.
			 var  car_id  =car_id;
			//赋值
			 $("#cid").val(car_id);
			
			//当用户改变时 用户的金额也相应改变
			if(user_id !=null && user_id !=''){
				var userDate  = getRechangeByUser_idAndCardType(user_id);
				if(userDate !=null && userDate!='' ){
					$(".accountBalance").val(userDate.balance);
					
						/*  开始  点击选中某一行，将改行移动到该table 的最后一行。 */
						//①先删除改行！~
			obj.parentElement.parentElement.remove();
//②将删除行，插入到table的最后一行！~

																			 $(".infotable tbody")
											.append(
													"<tr class='searchinfo'> <td align='center'>"
															+ "<input type='radio' name='user_id'   onchange='changeCarid("+car_id+","+user_id+",\""+ccar_name+"\",\""+ccar_mobile+"\",\""+ccar_plateno+"\",\""+ccar_vehicle+"\",\""+ccar_viplevel1+"\",this);' value='"+user_id+"' checked='checked' id='"+car_id+"'></td><td>"
															+ ccar_name
															+ "</td><td>"
															+ ccar_mobile
															+ "</td><td>"
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
			
				}else{
					alert("账户余额获取失败");
				}
			
			}else{
				alert("获取账户余额失败！请重试");
			}
			
		
	  }
		//根据用户的 user_id  查询用户的总金额
		function getRechangeByUser_idAndCardType(user_id){
			var   user_id   =user_id;
			var   datas;
			$.ajax({
				type :"POST",
				async:false,
				data:{'user_id': user_id},
				url:'/Qiqiang/PayController/getCardbyUser_id',
				success:function(Msg){
					var  result   = Msg.result;
					var  data = Msg.data; 
					if(result>0){//获取金额成功
						datas = data;
					}else{//获取金额失败
						alert("获取用户账户信息失败");
						datas  = null;
					}
				}
			})
			return datas;
		}
		//扣减页面金额不足跳到充值页面 初始化数据
		var car_id = $("#car_id").val();
		if (car_id != null && car_id != '') {
			$("#select_user").show();
			$
					.ajax({
						url : "/Qiqiang/PayController/getUserbyCar_id",
						type : "post",
						timeout : "1000",
						async:false,
						data : {
							"car_id" : car_id
						},
						success : function(data) {
							$(".searchinfo").remove();
							if (data != 0) {
								for ( var i = 0; i < data.length; i++) {
									$(".infotable")
											.append(
													"<tr class='searchinfo'> <td align='center'>"
															+ "<input type='radio' name='user_id'  onchange='changeCarid("+data[i].car.id+","+data[i].car.user_id+",\""+data[i].name+"\",\""+data[i].mobile+"\",\""+data[i].car.plateno+"\",\""+data[i].car.vehicle+"\",\""+data[i].viplevel1.level+"\",this);' value='"+data[i].car.user_id+"'></td><td>"
															+ data[i].name
															+ "</td><td>"
															+ data[i].mobile
															+ "</td><td>"
															+ data[i].car.plateno
															+ "</td><td>"
															+ ((data[i].car.vehicle==null||data[i].car.vehicle=="")?"未录入车型":data[i].car.vehicle)
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
		}
	</script>
</body>
</html>
