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
		
		.form-control{
    height: 34px;
    /*padding: 0px 6px;*/
	padding-left:6px;
	padding-right:6px;
    height: 0.68rem;
    padding: 0rem 0.12rem;
}
    </style>
</head>
<body>
<div class="container">
    <div class="row">

        <div class="col-md-12 info-con">
            <p class="titleP"><i class="glyphicon glyphicon-list-alt"></i> 消费详情</p>
            <div class="row" style="margin:0.2rem 0rem 0rem;width: 100%;text-align:center;">
                        <span style="width: 100%">
                        <input type="date"  id="beginDate" style="width: 46%;display: inline-block;vertical-align:middle;line-height:34px;padding-top:7px;;" class="form-control xfrq" > - <input type="date" id="endDate" style="width: 46%;display: inline-block;vertical-align:middle;line-height:34px;padding-top:7px;;" class="form-control xfrq">
                        </span>
            </div>
            <div class="row" style="margin:0.2rem 0rem 0rem;width: 100%;text-align: center;">
                        <span style="display: inline-block;padding-left: 0px;padding-right: 0px;width: 80%;">
                        <input type="text" id="param"  placeholder="姓名/手机号/车牌号" class="form-control" style="height:40px;">
                        </span>
                <button class="btn thisButton" style="height:40px;margin-bottom:3px;">查询</button>
            </div>
            <section class="sec" style="margin-top: 10px;margin-top: 0.2rem;">
                <div class="titleDiv text-center thisSearch">
                    <span class="active consumption" style="width: 49%;">消费</span><span  class="Recharge" style="width: 49%;">充值</span>
                </div>
                <div>
                    <div class="row" style="padding: 0px 15px;margin-top: 10px;">
                        <b>交易记录</b>
                    </div>
                    <div class="tableDiv">
                        
                            <form action="">
                            <div class="table-responsive">
                                <table class="table  consumptionTable">
						                        <tr>
						                            <td>姓名</td>
						                            <td>交易时间</td>
						                            <td>金额</td>
						                            <td>服务项目</td>
						                            <td>车牌号</td>
						                            <td>余额</td>
						                        </tr>
					                       <c:forEach items="${recordlist}" var="record">
												<tr>
													<td>${record.name}</td>
						                            <td>${record.date}</td>
						                            <td>${record.price}</td>
						                            <td>${record.svr_item }</td>
						                            <td>${record.plateno}</td>
						                            <td>${record.balance}</td>
												</tr>
											</c:forEach>
                  		  	</table>
                  		  	  </div>
                </form>
                      
                    </div>
                    <div class="text-center">
                        <input type="hidden" id="flag" value="0">
                       <p class="total">共${page.total} 条记录&nbsp;&nbsp;第${page.pageNum}页&nbsp;&nbsp;共${page.pages}页</p>
                        <button class="btn jump">首页</button>
                        <input type="hidden"  id="first" class="pagenow"  value="1">
                        <button class="btn jump">上一页</button>
                        <input type="hidden"  id="last" class="pagenow" value="${page.prePage}">
                        <button class="btn jump">下一页</button>
                        <input type="hidden"  id="nest" class="pagenow" value="${page.nextPage}">
                        <button class="btn jump">尾页</button>
                        <input type="hidden" id="end" class="pagenow" value="${page.pages}">
                    </div>
                <div class="row" style="padding: 0px 15px;margin-top: 20px;">
                    <b>消费详情查询</b>
                </div>
                    <div class="row" style="margin:0.2rem 0rem 0rem;width: 100%; text-align:center;">
                        <span style="width: 100%">
                        <input type="date" id="recordbeginDate" style="width: 46%;display: inline-block;vertical-align:middle;line-height:34px;padding-top:7px;;" class="form-control xfrq"> - <input id="recordendDate" type="date" style="width: 46%;display: inline-block;vertical-align:middle;line-height:34px;padding-top:7px;;" class="form-control xfrq">
                        </span>
                    </div>
                    <div class="row" style="margin:0.2rem 0rem 0rem;width: 100%;text-align: center;">
                        <span>
                        <input type="text" id="recordparam"  placeholder="姓名/手机号/车牌号" class="form-control"style="height:40px;">
                        </span>
                        <button class="btn twoButton" style="height:40px;margin-bottom:3px;">查询</button>
                    </div>
                    <div class="tableDiv ">
                        
                            <form action="">
                            <div class="table-responsive list">
                                <table class="table recordCar">
                      	 <tr>
                            <td>姓名</td>
                            <td>手机号</td>
                            <td>车牌号</td>
                            <td>修理日期</td>
                            <td>消费金额</td>
                            <td>修理项目</td>
                            <td>备注</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${repairOrderList}" var="repair">
						<tr>
							<td>${repair.name}</td>
                            <td>${repair.mobile}</td>
                            <td>${repair.plateno}</td>
                            <td>${repair.inputtime }</td>
                            <td>${repair.sumprice}</td>
                            <td>${repair.svr_item}</td>
                            <td>${repair.remark}</td>
                          	<td><input type="button" id="${repair.orderId}" class='details' value="查看"></td>
						</tr>
						</c:forEach>
                    </table>
                    </div>
                </form>
                        
                    </div>
                <div class="text-center">
                     <input type="hidden" id="flag" value="0">
                       <p class="repairtotal">共${repairpage.total}条记录&nbsp;&nbsp;第${repairpage.pageNum}页&nbsp;&nbsp;共${repairpage.pages}页</p>
                        <button class="btn recordjump">首页</button>
                        <input type="hidden"  id="recordfirst" class="pagenow"  value="1">
                        <button class="btn recordjump">上一页</button>
                        <input type="hidden"  id="recordlast" class="pagenow" value="${repairpage.prePage}">
                        <button class="btn recordjump">下一页</button>
                        <input type="hidden"  id="recordnest" class="pagenow" value="${repairpage.nextPage}">
                        <button class="btn recordjump">尾页</button>
                        <input type="hidden" id="recordend" class="pagenow" value="${repairpage.pages}">
                </div>

                </div>
                <!--日报结束-->

            </section>
        </div>
    </div>
    
</div>
<script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>
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
var month=new Date().getMonth() + 1>9 ? new Date().getMonth() + 1 : "0"+(new Date().getMonth() + 1);
var date = new Date().getDate()>9? new Date().getDate():"0"+new Date().getDate();
var dateDay=new Date().getFullYear()+"-"+month+"-"+date;
$(".xfrq").val(dateDay);
$("#beginDate").val(new Date().getFullYear()+"-"+month+"-01");
$("#recordbeginDate").val(new Date().getFullYear()+"-"+month+"-01");

    $(".titleDiv span").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    });
    

    
    $(".consumption").click(function(){
    	
    	 var  status  =  1 ;//管理员 或者商家
    	//获取开始时间
        var  beginDate = 	$("#beginDate").val();
    	//获取结束时间
    	 var  endDate = 	$("#endDate").val();
    	//获取参数
    	var  param = $("#param").val();
    	var  $this =$(this);
		    	var   flag =0;
		    	$("#flag").val(flag);
		    	  $.ajax({
		            	//几个参数需要注意一下
		                type: "POST",//方法类型
		                url: "/Qiqiang/ConsumptionController/queryConsumption" ,//url
		                data: {flag:flag,beginDate:beginDate,endDate:endDate,param:param,status:status},
		                success: function (Msg) {
		                	if(Msg.result>0){
		                		var  data =	  Msg.data.list;
			                	$(".consumptionTable").empty()
			               		 $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>金额</td> <td>服务项目</td><td>车牌号</td><td>余额</td></tr>");
			                	for(var  i =0;i<data.length;i++){
			                		$(".consumptionTable").append("	<tr><td>"+data[i].name+"</td> <td>"+data[i].date+"</td> <td>"+data[i].price+"</td>  <td>"+data[i].svr_item+"</td><td>"+data[i].plateno+"</td><td>"+data[i].balance+"</td></tr>");
			                	}
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
    
    
    $(".Recharge").click(function(){
    	 var  status  =  1 ;//管理员 或者商家
     	//获取开始时间
         var  beginDate = 	$("#beginDate").val();
     	//获取结束时间
     	 var  endDate = 	$("#endDate").val();
     	//获取参数
     	var  param = $("#param").val();
     	var pageNum =1;
    	var  $this =$(this);
		    	var   flag =1;//消費
		    	$("#flag").val(flag);
		    	  $.ajax({
		            	//几个参数需要注意一下
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "/Qiqiang/ConsumptionController/queryConsumption" ,//url
		                data: {flag:flag,beginDate:beginDate,endDate:endDate,param:param,status:status,pageNum:pageNum},
		                success: function (Msg) {
		                	if(Msg.result>0){
		                		var  data =	  Msg.data.list;
			                	$(".consumptionTable").empty()
			               		 $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>金额</td> <td>服务项目</td><td>余额</td></tr>");
			                	for(var  i =0;i<data.length;i++){
			                		$(".consumptionTable").append("	<tr><td>"+data[i].name+"</td> <td>"+data[i].date+"</td> <td>"+data[i].price+"</td><td>"+data[i].svr_item+"</td><td>"+data[i].balance+"</td></tr>");
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
    

	$(".jump").click(function(){
	var	  searchFlag =  $(".thisSearch").find(".active").text();
	var  flag = $("#flag").val();
	 var  status  =  1 ;//管理员 或者商家
  	//获取开始时间
      var  beginDate = 	$("#beginDate").val();
  	//获取结束时间
  	 var  endDate = 	$("#endDate").val();
  	//获取参数
  	var  param = $("#param").val();
		  var pageNum;
		  var  pageNum =	$(this).next().val();
		  var   endPage  =    $("#end").val();
		  if(pageNum<=0){
			  pageNum=1;
		  }
		  var  status  =  1 ;//管理员 或者商家
		  $.ajax({
          	//几个参数需要注意一下
              type: "POST",//方法类型
              dataType: "json",//预期服务器返回的数据类型
              url: "/Qiqiang/ConsumptionController/queryConsumption" ,//url
              data: {flag:flag,pageNum:pageNum,status:status,beginDate:beginDate,endDate:endDate,param:param},
              success: function (Msg) {
            	  if(Msg.result>0){
            			var  data =	  Msg.data.list;
                      	$(".consumptionTable").empty();
                      		if(searchFlag=="消费"){
                      			 $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>金额</td> <td>服务项目</td><td>车牌号</td><td>余额</td></tr>");
	                      			for(var  i =0;i<data.length;i++){
	                              		$(".consumptionTable").append("	<tr><td>"+data[i].name+"</td> <td>"+data[i].date+"</td> <td>"+data[i].price+"</td>  <td>"+data[i].svr_item+"</td><td>"+data[i].plateno+"</td><td>"+data[i].balance+"</td></tr>");
	                              	}
	                      		//修改当前的页数
	                                $("#last").val(Msg.data.prePage);
	                                $("#nest").val(Msg.data.nextPage);
	                                $(".total").text("共"+Msg.data.total+"条记录  第"+Msg.data.pageNum+"页"+"  共"+Msg.data.pages+"页");
	                                $("#end").val(Msg.data.pages);
                      		}else{
                      			$(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>金额</td> <td>服务项目</td><td>余额</td></tr>");
                      			for(var  i =0;i<data.length;i++){
                              		$(".consumptionTable").append("	<tr><td>"+data[i].name+"</td> <td>"+data[i].date+"</td> <td>"+data[i].price+"</td>  <td>"+data[i].svr_item+"</td><td>"+data[i].balance+"</td></tr>");
                              	}
                      		//修改当前的页数
                                $("#last").val(Msg.data.prePage);
                                $("#nest").val(Msg.data.nextPage);
                                $(".total").text("共"+Msg.data.total+"条记录  第"+Msg.data.pageNum+"页"+"  共"+Msg.data.pages+"页");
                                $("#end").val(Msg.data.pages);
                      		}
            	  }else{
            		 	 alert("查询失败");
            	  }
              
              },
              error : function() {
                  alert("数据异常！");
              }
          });
	})
    
	
	
	$(".recordjump").click(function(){
		 var  status  =  1 ;//管理员 或者商家
	     //获取开始时间
	     var  beginDate = 	$("#recordbeginDate").val();
	    //获取结束时间
	     var  endDate = 	$("#recordendDate").val();
	    //获取参数
	    var  param = $("#recordparam").val();
		var pageNum =1;
		var  status  =  1 ;//管理员 或者商家
		var  pageNum =	$(this).next().val();
		  if(pageNum<=0){
			  pageNum=1;
		  }
		  $.ajax({
          	//几个参数需要注意一下
              type: "POST",//方法类型
              dataType: "json",//预期服务器返回的数据类型
              url: "/Qiqiang/ConsumptionController/queryRepairOrder" ,//url
              data: {pageNum:pageNum,status:status,beginDate:beginDate,endDate:endDate,param:param},
              success: function (Msg) {
            	  if(Msg.result>0){
            		  var  data =	  Msg.data.list;
                    	$(".recordCar").empty();
                    	$(".recordCar").append("<tr><td>姓名</td><td>手机号</td><td>车牌号</td><td>修理日期</td><td>消费金额</td><td>修理项目</td><td>备注</td><td>操作</td></tr>");
                    	for(var  i =0;i<data.length;i++){
                    		$(".recordCar").append("<tr><td>"+data[i].name+"</td><td>"+data[i].mobile+"</td> <td>"+data[i].plateno+"</td><td>"+data[i].inputtime+"</td><td>"+data[i].sumprice+"</td><td>"+data[i].svr_item+"</td><td>"+data[i].remark+"</td><td><input type='button' id="+data[i].orderId+" class='details'  value='查看'></td></tr>");
                    	}
                    	//修改当前的页数
                      $("#recordlast").val(Msg.data.prePage);
                      $("#recordnest").val(Msg.data.nextPage);
                      $(".repairtotal").text("共"+Msg.data.total+"条记录  第"+Msg.data.pageNum+"页"+"  共"+Msg.data.pages+"页");
                      $("#recordend").val(Msg.data.pages);
            	  }else{
            		  alert("查询失败");
            	  }
              },
              error : function() {
                  alert("数据异常！");
              }
          });
	})
    
    $(".thisButton").click(function(){
       var	  searchFlag =  $(".thisSearch").find(".active").text();
		if(searchFlag=="消费"){
			 var  status  =  1 ;//管理员 或者商家
		    	//获取开始时间
		        var  beginDate = 	$("#beginDate").val();
		    	//获取结束时间
		    	 var  endDate = 	$("#endDate").val();
		    	//获取参数
		    	var  param = $("#param").val();
		    	var  $this =$(this);
				    	var   flag =0;
				    	$("#flag").val(flag);
				    	  $.ajax({
				            	//几个参数需要注意一下
				                type: "POST",//方法类型
				                url: "/Qiqiang/ConsumptionController/queryConsumption" ,//url
				                data: {flag:flag,beginDate:beginDate,endDate:endDate,param:param,status:status},
				                success: function (Msg) {
				                	if(Msg.result>0){
				                		var  data =	  Msg.data.list;
					                	$(".consumptionTable").empty()
					               		 $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>金额</td> <td>服务项目</td><td>车牌号</td><td>余额</td></tr>");
					                	for(var  i =0;i<data.length;i++){
					                		$(".consumptionTable").append("	<tr><td>"+data[i].name+"</td> <td>"+data[i].date+"</td> <td>"+data[i].price+"</td>  <td>"+data[i].svr_item+"</td><td>"+data[i].plateno+"</td><td>"+data[i].balance+"</td></tr>");
					                	}
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
		}else if(searchFlag=="充值"){
			var  status  =  1 ;//管理员 或者商家
	     	//获取开始时间
	         var  beginDate = 	$("#beginDate").val();
	     	//获取结束时间
	     	 var  endDate = 	$("#endDate").val();
	     	//获取参数
	     	var  param = $("#param").val();
	    	var  $this =$(this);
			    	var   flag =1;//消費
			    	$("#flag").val(flag);
			    	  $.ajax({
			            	//几个参数需要注意一下
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "/Qiqiang/ConsumptionController/queryConsumption" ,//url
			                data: {flag:flag,beginDate:beginDate,endDate:endDate,param:param,status:status},
			                success: function (Msg) {
			                	if(Msg.result>0){
			                		var  data =	  Msg.data.list;
				                	$(".consumptionTable").empty()
				               		 $(".consumptionTable").append("<tr><td>姓名</td> <td>交易时间</td><td>金额</td> <td>服务项目</td><td>余额</td></tr>");
				                	for(var  i =0;i<data.length;i++){
				                		$(".consumptionTable").append("	<tr><td>"+data[i].name+"</td> <td>"+data[i].date+"</td> <td>"+data[i].price+"</td>  <td>"+data[i].svr_item+"</td><td>"+data[i].balance+"</td></tr>");
				                	}
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
		} 	
    });
    $(".twoButton").click(function(){
    	 var  status  =  1 ;//管理员 或者商家
	     //获取开始时间
	     var  beginDate = 	$("#recordbeginDate").val();
	    //获取结束时间
	     var  endDate = 	$("#recordendDate").val();
	    //获取参数
	     var  param = $("#recordparam").val();
		 var pageNum;
		 var  status  =  1 ;//管理员 或者商家
		 var  pageNum =	$(this).next().val();
		  $.ajax({
          	//几个参数需要注意一下
              type: "POST",//方法类型
              dataType: "json",//预期服务器返回的数据类型
              url: "/Qiqiang/ConsumptionController/queryRepairOrder" ,//url
              data: {pageNum:pageNum,status:status,beginDate:beginDate,endDate:endDate,param:param},
              success: function (Msg) {
            	  if(Msg.result>0){
            		  var  data =	  Msg.data.list;
                    	$(".recordCar").empty();
                    	$(".recordCar").append("<tr><td>姓名</td><td>手机号</td><td>车牌号</td><td>修理日期</td><td>消费金额</td><td>修理项目</td> <td>备注</td><td>操作</td></tr>");
                    	for(var  i =0;i<data.length;i++){
                    		$(".recordCar").append("<tr><td>"+data[i].name+"</td><td>"+data[i].mobile+"</td> <td>"+data[i].plateno+"</td><td>"+data[i].inputtime+"</td><td>"+data[i].sumprice+"</td><td>"+data[i].svr_item+"</td><td>"+data[i].remark+"</td><td><input type='button' id="+data[i].orderId+"  class='details'  value='查看'></td></tr>");
                    	}
                    	//修改当前的页数
                      $("#recordlast").val(Msg.data.prePage);
                      $("#recordnest").val(Msg.data.nextPage);
                      $(".repairtotal").text("共"+Msg.data.total+"条记录  第"+Msg.data.pageNum+"页"+"  共"+Msg.data.pages+"页");
                      $("#recordend").val(Msg.data.pages);
            	  }else{
            		  alert("查询失败");
            	  }
              },
              error : function() {
                  alert("数据异常！");
              }
          });
    	
    	
    });
    
    $(".recordCar").delegate(".details","click",function(){
    	var  $this =$(this);
    	var  thisOrderId  = $this.attr("id");
    	window.location.href="/Qiqiang/ConsumptionController/Queryrepair?orderId="+thisOrderId;
    }) 
</script>
</body>
</html>
