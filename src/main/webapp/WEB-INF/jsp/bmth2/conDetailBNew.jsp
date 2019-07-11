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
<title>消费详情</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/staReport.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/scrollTable.css" />
<style>
.sec div span {
	display: inline-block;
	padding-left: 0px;
	padding-right: 0px;
	width: 80%;
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
}

.table-responsive {
	border: 0px;
}

table td {
	white-space: nowrap;
	border-top: 1px solid #ddd;
	text-align:center;
}

.form-control {
	height: 34px;
	/*padding: 0px 6px;*/
	padding-left: 6px;
	padding-right: 6px;
	height: 0.68rem;
	padding: 0rem 0.12rem;
}

.checkDix { position: relative; height: 30px;     margin-left: 10px; }

/*checkbox选择框设置opacity为0，及用户不能直接感受到它的存在*/

.checkDix input[type='checkbox'] { position: absolute; left: 0; top: 0; width: 20px; height: 20px; opacity: 0; }
.checkDix label { position: absolute; left: 30px; top: 0; height: 20px; line-height: 20px; }

/*通过label的before与after实现圆点未选中效果，设置before为圆圈，after实现选中后对勾的效果，设置after为长方形，顺时针旋转45deg，设置右边框与下边框，色值为白色。*/

.checkDix label:before { content: ''; position: absolute; left: -30px; top: 0; width: 20px; height: 20px; border: 1px solid black; border-radius: 50%; transition: all 0.3s ease;  -webkit-transition: all 0.3s ease;  -moz-transition: all 0.3s ease; }
.checkDix label:after { content: ''; position: absolute; left: -22px; top: 3px; width: 6px; height: 12px; border: 0; border-right: 1px solid #f0f0f0; border-bottom: 1px solid #f0f0f0; background: #f0f0f0; transform: rotate(45deg);  -webkit-transform: rotate(45deg);  -moz-transform: rotate(45deg);  -ms-transform: rotate(45deg);  transition: all 0.3s ease;  -webkit-transition: all 0.3s ease;  -moz-transition: all 0.3s ease; }


/*添加input选中时的效果，设置before与after的背景色相同，由于after元素有背景色为白色的边框，即可实现相关效果*/
.checkDix input[type='checkbox']:checked + label:before { background: #48a3da;; border-color: #48a3da; }
.checkDix input[type='checkbox']:checked + label:after { background: #48a3da;}

.timeBtn{padding:3px 15px;}

.seeClass span{
	display: block;
    padding: 6px 12px;
    margin-left: 20px;
    font-size: 16px;
}
.timeBtns .btn{
	padding:3px 12px!important;
}
.shTa td{white-space:nowrap;text-align:center;}
.layui-layer-content{padding:0px!important;}
.shTa{width:100%;overflow:scroll;}

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
	  	<c:when test="${sessionScope.selectInfo != null }">
		  <input type="hidden" id="footKey" value="single">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="footKey" value="all">
		</c:otherwise>
	  </c:choose>
		<div class="row">
			<c:choose>
			  	<c:when test="${sessionScope.selectInfo == null }">
				  	<div class="row"
						style="margin:0rem 0rem 0rem 0rem;width: 100%;text-align:center;height:180px;vertical-align:middle;padding-top: 55px;background-color: #48a3da;color:white;">
						<span id="ShouYi">今日收益（元）</span><br>
						<span style="font-size:40px"><c:if test="${profit==null or profit=='' }">0.00</c:if>
						<c:if test="${profit!=null and profit!='' }"><fmt:formatNumber value="${profit}" pattern="#,#00.00#"/></c:if></span>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			  </c:choose>

			<div class="col-md-12 info-con">
				<div class="row"
					style="margin:0.2rem 0rem 0rem 0rem ;display:none;width: 100%;text-align:left;">
					<span style="width: 100% " class="checkDix"> <input type="checkbox" id="all" value="0"
					<c:if test="${userFlag == 0}">checked="checked"</c:if>
					><label class="all" for='all' style="white-space:nowrap;">所有客户</label> </span>
				</div>
				<div class="row timeBtns"
					style="margin:0.2rem 0rem 0rem 0.1rem;width: 100%;text-align:center;">
					<button class="btn timeYearBtn" style="width:1.5rem;">当年</button>&nbsp;
					<button class="btn timeMonthBtn" style="width:1.5rem;">当月</button>&nbsp;
					<button class="btn timeDayBtn" style="width:1.5rem;">当天</button>&nbsp;
					<button class="btn timeAllBtn" style="width:1.5rem;">全部</button>&nbsp;
					 <input type="hidden" class="dateFlag" value="${dateFlag}"/>
					</div>
				<div class="row"
					style="margin:0.2rem 0rem 0rem;width: 100%;text-align: center;">
					<span
						style="display: inline-block;padding-left: 0px;padding-right: 0px;width: 80%;">
						<input type="text" id="param" placeholder="姓名/手机号/车牌号"
						<c:if test="${userFlag == 1}">
						 	value="${paramValue}"
						</c:if>
						<c:if test="${userFlag == 2}">
						 	value="${selectInfo.plateno}"
						</c:if>
						class="form-control" style="height:40px;"> </span>
					<button class="btn thisButton"
						style="height:40px;margin-bottom:3px;">查询</button>
						<input class="userFlag" type="hidden" value="${userFlag}">
				</div>
				<section class="sec" style="margin-top: 10px;margin-top: 0.2rem;">
					<div class="titleDiv text-center thisSearch">
					
						<span  <c:if test='${trans_type == 0}'> class="active consumption" </c:if> <c:if test='${trans_type != 0}'> class=" consumption" </c:if>  style="width: 48%;">消费</span>
				
						<span  <c:if test='${trans_type == 1}'> class="active Recharge" </c:if> <c:if test='${trans_type != 1}'> class="Recharge" </c:if>  style="width: 48%;">充值</span>
						<input  type="hidden"  class="trans_type"  value="${trans_type}">
					</div>
					<div>

						<div class="tableDiv " style="margin-top:10px;">

							<form action="">
								<c:if test="${trans_type==0}">
									<div class="table-responsive list">
										<table class="table  consumptionTable">
											<tr>
												<td>姓名</td>
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
													<td>${record.user.name}</td>
													<td>${record.projectService.svr_item}</td>
													<td>${record.price}元</td>	
													<td>
													<c:if test="${record.number > 0 && record.number != null && record.number != ''}">
														${record.number}次
													</c:if>
													<c:if test="${record.number <= 0 || record.number == null ||record.number == ''}">
														
													</c:if>
													</td>
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
													<c:if test='${record.flag == 1}'><a onclick="seeIt(${record.id})">查看</a></c:if>
													<c:if test='${record.flag == 0 || record.flag==null}'><a>无</a></c:if>
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
								<c:if test="${trans_type==1}">
									<div class="table-responsive list">
										<table class="table  consumptionTable">
											<tr>
												<td>姓名</td>
												<td>服务项目</td>
												<td>充值金额</td>
												<td>赠送金额</td>
												<td>余额</td>
												<td>赠送项目</td>
												<td>交易时间</td>	
												<!-- 
												<td>备注</td>
												 -->
											</tr>
											<c:forEach items="${dataList}" var="record">
												<tr>
													<td>${record.user.name}</td>
													<td>${record.projectService.svr_item}</td>
													<td>${record.price}元</td>
													<td>
													<c:if test="${empty record.practical || record.practical == null}">
													0元
													</c:if>
													<c:if test="${not empty record.practical || record.practical != null}">
													${record.practical  }元
													</c:if>
													</td>
													<td>${record.realbalance}元</td>
													<td style="text-align:center;">
													<c:if test='${record.flag == 1}'><a onclick="seeIt(${record.id})">查看</a></c:if>
													<c:if test='${record.flag == 0 || record.flag==null}'><a>无</a></c:if>
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
								
						 <input type="hidden" id="tj1" value="${userFlag}"/>
                         <input type="hidden" id="tj2" value="${paramValue}"/>
                         <input type="hidden" id="tj3" value="${trans_type}"/>
						</div>

					</div>
					<!--日报结束-->

				</section>
			</div>
		</div>

	</div>
		<script type="text/javascript"
		src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/footerKP.js"></script>
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
	if($(".dateFlag").val()=='0'){$("#ShouYi").html("全部收益（元）");}
	if($(".dateFlag").val()=='1'){$("#ShouYi").html("今日收益（元）");}
	if($(".dateFlag").val()=='2'){$("#ShouYi").html("当月收益（元）");}
	if($(".dateFlag").val()=='3'){$("#ShouYi").html("当年收益（元）");}
			//当年
			$(".timeYearBtn").click(function(){
				//获取userFlag 是否是人的标志位的值
				var  userFlag   =  $(".userFlag").val();
				var  paramValue   =    $("#param").val();
				if(paramValue ==""){//判断如果paramValue  为空就是查询全部
					userFlag  =0;
				}else{//如果部位空就是条件查询
					userFlag  =1;
				}
				var trans_type   = $(".trans_type").val();
				window.location.href="/Qiqiang/ConsumptionController/getRecord?dateFlag=3&userFlag="+userFlag+"&paramValue="+paramValue+"&trans_type="+trans_type;
			});
			//当月
			$(".timeMonthBtn").click(function(){
				var   userFlag   =  $(".userFlag").val();
				var  paramValue   =    $("#param").val();
				if(paramValue ==""){//判断如果paramValue  为空就是查询全部
					userFlag  =0;
				}else{//如果部位空就是条件查询
					userFlag  =1;
				}
				var trans_type   = $(".trans_type").val();
				window.location.href="/Qiqiang/ConsumptionController/getRecord?dateFlag=2&userFlag="+userFlag+"&paramValue="+paramValue+"&trans_type="+trans_type;
			});
			//当天
			$(".timeDayBtn").click(function(){
				var   userFlag   =  $(".userFlag").val();
				var  paramValue   =    $("#param").val();
				if(paramValue ==""|| paramValue == null){//判断如果paramValue  为空就是查询全部
					userFlag  =0;
				}else{//如果部位空就是条件查询
					userFlag  =1;
				}
				var trans_type   = $(".trans_type").val();
				window.location.href="/Qiqiang/ConsumptionController/getRecord?dateFlag=1&userFlag="+userFlag+"&paramValue="+paramValue+"&trans_type="+trans_type;
			});
			//全部
			$(".timeAllBtn").click(function(){
				var   userFlag   =  $(".userFlag").val();
				var  paramValue   =    $("#param").val();
				if(paramValue ==""|| paramValue == null){//判断如果paramValue  为空就是查询全部
					userFlag  =0;
				}else{//如果部位空就是条件查询
					userFlag  =1;
				}
				var trans_type   = $(".trans_type").val();
				window.location.href="/Qiqiang/ConsumptionController/getRecord?dateFlag=0&userFlag="+userFlag+"&paramValue="+paramValue+"&trans_type="+trans_type;
			});
			//查询按钮
			$(".thisButton").click(function(){
				var   userFlag   =  $(".userFlag").val();
				var  paramValue   =    $("#param").val();
				if(paramValue ==""|| paramValue == null){//判断如果paramValue  为空就是查询全部
					userFlag  =0;
				}else{//如果部位空就是条件查询
					userFlag  =1;
				}
				var trans_type   = $(".trans_type").val();
				window.location.href="/Qiqiang/ConsumptionController/getRecord?dateFlag=0&userFlag="+userFlag+"&paramValue="+paramValue+"&trans_type="+trans_type;
			});
			//分页方法
			$(".jump").click(function(){
			    var  pageNum =	$(this).next().val();//需要跳转得页码
			    if(pageNum == 0 ){
			    	pageNum=1;
			    }
			    var  userFlag   =  $(".userFlag").val();
				var  paramValue   =    $("#param").val();
				if(paramValue ==""|| paramValue == null){//判断如果paramValue  为空就是查询全部
					userFlag  =0;
				}else{//如果部位空就是条件查询
					userFlag  =1;
				}
				var  trans_type   = $(".trans_type").val();
				var  dateFlag   = $(".dateFlag").val();
				//获取隐藏的参数 对比条件是否改变
				var   tj1   =   $.trim($("#tj1").val());
				var   tj2  =   $.trim($("#tj2").val());
				if($.trim(userFlag)==$.trim($("#tj1").val())&&$.trim(paramValue)==$.trim($("#tj2").val())&&$.trim(trans_type)==$.trim($("#tj3").val())){
					window.location.href="/Qiqiang/ConsumptionController/getRecord?userFlag="+userFlag+"&paramValue="+paramValue+"&pageNum="+pageNum+"&trans_type="+trans_type+"&dateFlag="+dateFlag;;
				}else{
					window.location.href="/Qiqiang/ConsumptionController/getRecord?userFlag="+userFlag+"&paramValue="+paramValue+"&trans_type="+trans_type+"&dateFlag="+dateFlag;
				} 
			})
			//充值消费改变隐藏域  trans_type  是充值还是消费   1 充值    0 扣款  
			$(".consumption").click(function(){
				$(".trans_type").val(0);
				var trans_type   = $(".trans_type").val();
				var   userFlag   =  $(".userFlag").val();
				var  paramValue   =    $("#param").val();
				if(paramValue ==""|| paramValue == null){//判断如果paramValue  为空就是查询全部
					userFlag  =0;
				}else{//如果部位空就是条件查询
					userFlag  =1;
				}
				window.location.href="/Qiqiang/ConsumptionController/getRecord?dateFlag=0&userFlag="+userFlag+"&paramValue="+paramValue+"&trans_type="+trans_type;
			})
			//充值消费改变隐藏域  trans_type  是充值还是消费   1 充值    0 扣款  
			$(".Recharge").click(function(){
				$(".trans_type").val(1);
				var   userFlag   =  $(".userFlag").val();
				var  paramValue   =    $("#param").val();
				if(paramValue ==""|| paramValue == null){//判断如果paramValue  为空就是查询全部
					userFlag  =0;
				}else{//如果部位空就是条件查询
					userFlag  =1;
				}
				var trans_type   = $(".trans_type").val();
				window.location.href="/Qiqiang/ConsumptionController/getRecord?dateFlag=0&userFlag="+userFlag+"&paramValue="+paramValue+"&trans_type="+trans_type;
			})
						$("#param").keyup(function(){
							if($("#param")!=''){
								$("#all").attr("checked",false)
								$(".userFlag").val(1);
							}
						});
						
						$("#all").change(function(){
							if($("#all")[0].checked){
							$("#param").val('');
							$(".userFlag").val(0);
							}
						});
						
						function seeIt(id){
							$.ajax({
								type:"post",
								dataType:"json",
								url:"/Qiqiang/StatisticController/selectGiftInf",
								data:{
									record_id : id 
								},
								success:function(msg){
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
												area: ['320px', '320px'], //宽高
												btn:[],
												content:text
												}
										)
										$('.layui-layer-btn').hide();
								},
								error:function(){
									alert('数据异常!');
								}
								
								
							})
						}
						
						   $(".titleDiv span").click(function () {
						        $(this).addClass("active").siblings().removeClass("active");
						    });	
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
  <script type="text/javascript">
  //备注，点击弹出
  $(".selectRemark").click(function(){
	  
	  var remark = "<div style='padding:10px 10px'>"+$(this).next(".myRemark").val()+"</div>";
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
  
  </script>
</body>
</html>
