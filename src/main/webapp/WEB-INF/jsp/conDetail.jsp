﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>消费详情</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/staReport.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/scrollTable.css" />
    <style>
        .sec div span{
            display: inline-block;
            padding-left: 0px;
            padding-right: 0px;
            width: 80%;
        }
        .tableDiv{
            width: 100%;
            height: auto;
            overflow-x: scroll;
            overflow-y: scroll;
        }
        .table{
            margin-top: 10px;
            margin-top: 0.2rem;
        }
        .table-responsive{
        	border:0px;
        }

		table td
        {
            white-space: nowrap;
            border-top:1px solid #ddd;
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
    <div class="row">
<c:choose>
	  	<c:when test="${sessionScope.selectInfo != null }">
		  <input type="hidden" id="footKey" value="single">
		</c:when>
		<c:otherwise>
			<input type="hidden" id="footKey" value="all">
		</c:otherwise>
	  </c:choose>
        <div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							消费详情 <a data-toggle="collapse" data-parent="true"
								href="#collapseOne" style="float:right"><i
								class="	glyphicon glyphicon-minus gly"></i> </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body" style="">
							<div class="col-md-12 " style="padding:0px 0px;">

							<div class="titleDiv text-center thisSearch">
					
								<span  <c:if test='${trans_type == 0}'> class="active consumption" </c:if> <c:if test='${trans_type != 0}'> class=" consumption" </c:if>  style="width: 49%;">消费</span>
						
								<span  <c:if test='${trans_type == 1}'> class="active Recharge" </c:if> <c:if test='${trans_type != 1}'> class="Recharge" </c:if>  style="width: 49%;">充值</span>
								<input  type="hidden"  class="trans_type"  value="${trans_type}">
							</div>
								<div class="tableDiv" style="margin-top:10px;">
							<input type="hidden" name="user_id"  class="user_id"  value="${user_id}">
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
										<input type="hidden" id="flag" value="0"> <input
										type="hidden" id="us_id" value="${us.id}">
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
										 <input type="hidden" id="trans_type"  class="trans_type" value="${trans_type}"/>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
    </div>
  
</div>

  <script type="text/javascript"
		src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/footerKP.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>
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
<script>
    $(".titleDiv span").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    });
    
  //充值消费改变隐藏域  trans_type  是充值还是消费   1 充值    0 扣款  
	$(".consumption").click(function(){
		//获取用户的user_id
		var  user_id  =$(".user_id").val();
		if(user_id==null||""==user_id){
			alert("获取用户信息失败");
			return  false;
		}
		$(".trans_type").val(0);
		var trans_type   = $(".trans_type").val();
		window.location.href="/Qiqiang/ConsumptionController/fLConDetailCustomer?pageNum=1&trans_type="+trans_type+"&user_id="+user_id;
	})
	//充值消费改变隐藏域  trans_type  是充值还是消费   1 充值    0 扣款  
	$(".Recharge").click(function(){
		//获取用户的user_id
		var  user_id  =$(".user_id").val();
		if(user_id==null||""==user_id){
			alert("获取用户信息失败");
			return  false;
		}
		$(".trans_type").val(1);
		var trans_type   = $(".trans_type").val();
		window.location.href="/Qiqiang/ConsumptionController/fLConDetailCustomer?pageNum=1&trans_type="+trans_type+"&user_id="+user_id;
	})
  //分页方法
	$(".jump").click(function(){
		//获取用户的user_id
		var  user_id  =$(".user_id").val();
		if(user_id==null||""==user_id){
			alert("获取用户信息失败");
			return  false;
		}
	    var  pageNum =	$(this).next().val();//需要跳转得页码
	    if(pageNum == 0 ){
	    	pageNum=1;
	    }
		var  trans_type   = $(".trans_type").val();
		//获取隐藏的参数 对比条件是否改变
			window.location.href="/Qiqiang/ConsumptionController/fLConDetailCustomer?pageNum="+pageNum+"&trans_type="+trans_type+"&user_id="+user_id;
	
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
				var text;
				text = '<table class="shTa"><thead><tr><td>项目名</td><td>赠送次数</td><td>剩余次数</td><td>车牌号</td></tr></thead><tbody>'
				for(var i = 0 ; i < msg.data.list.length ; i++){
						if(text == null){
							/* text =  "<div class='seeClass'><span>项目名："+msg.data.list[i].svr_item+"</span>"
									+"<span>类型："+msg.data.list[i].type+"</span>"
									+"<span>赠送次数："+msg.data.list[i].number+"</span>"
									+"<span>剩余次数："+msg.data.list[i].balancenumber+"</span>"
									+"<span>用户："+msg.data.list[i].name+"</span>"
									+"<span>车牌号："+msg.data.list[i].plateno+"</span>"
									+"</div></br>" */
									text+='<tr><td>';
															text+=msg.data.list[i].svr_item;
															text+='</td><td>';
															text+=msg.data.list[i].number;
															text+='</td><td>';
															text+=msg.data.list[i].balancenumber;
															text+='</td><td>';
															text+=msg.data.list[i].plateno;
															text+='</td></tr>';
						}else{
							/* text = text + "<div class='seeClass'><span>项目名："+msg.data.list[i].svr_item+"</span>"
										+"<span>类型："+msg.data.list[i].type+"</span>"
										+"<span>赠送次数："+msg.data.list[i].number+"</span>"
										+"<span>剩余次数："+msg.data.list[i].balancenumber+"</span>"
										+"<span>用户："+msg.data.list[i].name+"</span>"
										+"<span>车牌号："+msg.data.list[i].plateno+"</span>"
										+"</div></br>" */
										text+='<tr><td>';
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
							content:text
							}
					)
					$('.layui-layer-btn').hide();
					
			},
			error:function(){
				alert("后台错误");
			}
			
			
		})
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
</body>
</html>
