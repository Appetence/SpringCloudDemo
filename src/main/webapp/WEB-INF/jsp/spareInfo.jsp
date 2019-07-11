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
<title>配件信息</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/staReport.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/spareInfo.css"/>
<link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
<style>
.col-md-10{
    width: 64%;
    display: inline-block;
}

.qlc_zdz{
padding:0px 6px;
margin-top:11px;
}
.table-responsive{
        	border:0px;
        }
.list {
	overflow: auto;
	overflow-y: auto;
}

.list::-webkit-scrollbar-track-piece {
	background-color: rgba(0, 0, 0, 0);
	border-left: 1px solid rgba(0, 0, 0, 0);
	margin-top:10px;
	margin-top:0.2rem;
}

.list::-webkit-scrollbar {
	width: 5px;
	height: 0px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.list1::-webkit-scrollbar {
	width: 5px;
	height: 13px;
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

		table td
        {
            white-space: nowrap;
            border-top:1px solid #ccc;
        }
        
        td {
    		padding: 8px!important;
		}
        
</style>
</head>
<body>
<div class="container">
    <div class="row">

        <div class="col-md-12 info-con">
            <p class="titleP"><i class="iconfont icon-peijian"></i> 配件信息</p>
            <section class="sec">
                <div class="titleDiv">
                    <span class="active One">入库</span><span class="Two">配件查询</span><span class="Three">配件预定</span></a>
                </div>
                <!--出/入库开始-->
                <div id="One" class="">
                <form id="thisForm" onsubmit="return false;">
                    <div class="row topSec">
                        <span class="col-md-2">操作类型</span>
                        <span class="col-md-10">
                            <select name="ps_type" id="" class="form-control">
                                <option value="1">入库</option>
                            </select>
                    </span>
                    </div>
                    <div class="toUpSec abc">
                        <i class="glyphicon glyphicon-remove pull-right delete"></i>
                        <div class="row" style="margin-top: 25px;margin-top: 0.5rem;">
                            <span class="col-md-2">配件类型</span>
                            <span class="col-md-10">
                           <div id="GYS-div">
					        <span  style="margin-top:11px;">
					        <!--这个是个多选框，用onchange事件的时候 ，将这个select的id传进去-->
					            <select name="trains"  class="form-control qlc_zdz1" id="selectID" name="trantype"  style="width:100%">
					            	 <option id="" value="">请选择配件类型</option>
						            <c:if test="${!empty pList}">
										 <c:forEach items="${pList}" var="t">  
										 	<c:if test='${t.parts_type != "无耗材"}'>
										 		<option id="${t.id}" value="${t.id}">${t.parts_type}</option>
											 </c:if>
										</c:forEach>  
									</c:if>
					            </select>
					        </span>
					        <span style="width:88%">
					            <input type="text" required="required" value="" name="parts_type" id="ps_type_id" class="ccdd qlc_zdz" placeholder="请选择或输入配件类型" style="width:100%;padding:0px;padding-left:0.1rem;">
					        </span>
					    </div>
                   			</span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">配件名称</span>
                            <span class="col-md-10">
                            
                           <div id="GYS-div">
					        <span  style="margin-top:11px;">
					        <!--这个是个多选框，用onchange事件的时候 ，将这个select的id传进去-->
					            <select name="trains"  class="form-control qlc_zdz1 parts_id" id="parts_id">
						           
					            </select>
					        </span>
					        <span  style="width:88%">
					            <input type="text" required="required"  name="parts" id="parts" class="ccdd qlc_zdz" placeholder="请选择或输入配件名称" style="width:100%;padding:0px;padding-left:0.1rem;">
					        </span>
					    </div>
                  	  </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">供应商</span>
                            <span class="col-md-10">
                            
                            <div id="GYS-div">
					       <span  style="margin-top:11px;">
					        <!--这个是个多选框，用onchange事件的时候 ，将这个select的id传进去-->
					            <select   class="form-control qlc_zdz1 chooseSupplier" id="supplierId">
						            <c:if test="${!empty supplierList}">
									 <c:forEach items="${supplierList}" var="t">  
										<c:if test='${t.supplier != "无耗材"}'>
									 		<option id="" value="${t.id}">${t.supplier}</option>
									 	</c:if>
									</c:forEach>  
								</c:if>
					            </select>
					        </span>
					        <span style="width:88%;">
					            <input type="text" required="required" name="supplier" id=supplier class="ccdd qlc_zdz" placeholder="请选择或输入供应商" style="width:100%;padding:0px; padding-left:0.1rem;">
					        </span>
					    </div>
                    </span>
                        </div>
                        <div class="row" style="margin-top:14px; ">
                            <span class="col-md-2" style="vertical-align:top;margin-top:0.01rem;">进货单价(元)</span>
                            <span class="col-md-10">
                        <input type="number" name="ps_price" value="1"  required="required"  class="form-control" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">出厂日期</span>
                            <span class="col-md-10">
                        <input type="date" name="sc_date"   class="form-control chrq"   style="line-height:normal;vertical-align:middle; padding-top:0.2rem;">
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">保质期</span>
                            <span class="col-md-10">
                        <input type="text"  name="expire_date" value="" class="form-control" >
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">进货数量</span>
                            <span class="col-md-10">
                        <input type="number" required="required"   name="ps_sum" value="1" class="form-control" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">进货日期</span>
                            <span class="col-md-10">
                        <input type="date"  name="ps_date"   required="required" value="" class="form-control jhrqDate"  style="line-height:normal;vertical-align:middle; padding-top:0.2rem;"  />
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">备注</span>
                            <span class="col-md-10">
                        <input type="text" name="remark" required="required" value="备注" class="form-control">
                    </span>
                        </div>
                    </div>
                    
                    <div class="text-center" style="margin-top: 20px;">
                        <button class="btn add" type="button" style="background-color: #48a3da;">增加</button>
                        <!-- <button class="btn insertBtn" type="button" style="background-color: #48a3da;">确定</button> -->
                        <input class="btn insertBtn" type="submit" style="background-color: #48a3da;" value="确定">
                    </div>
                   </form>
                </div>
                <!--出/入库结束-->

                <!--配件查询开始-->
                <div id="Two">
                    <div class="topSec twoDiv">
                        <div class="row" style="margin-top: 0rem;">
                            <span class="col-md-2">查询类型</span>
                            <span class="col-md-10">
                            <select name="" id="falgID"   class="form-control">
                                <option value="2">出库</option>
                                <option value="1">入库</option>
                                <option value="3">库存</option>
                            </select>
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">配件类型</span>
                            <span class="col-md-10">
                            <select name="" id="selectIDTwo"   class="form-control">
                           	  <option id="" value="">请选择配件类型</option>
                            	<c:if test="${!empty pList}">
									 <c:forEach items="${pList}" var="t">  
											 <c:if test='${t.parts_type != "无耗材"}'>
										 		<option id="${t.id}" value="${t.id}">${t.parts_type}</option>
											 </c:if>
									</c:forEach>  
								</c:if>
                            </select>
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">配件名称</span>
                            <span class="col-md-10">
                            <select name="" id="partsName" class="form-control  selectStock">
                            <option id="" value="">请选择</option>
                            	
                            </select>
                    </span>
                        </div>
                        
                          <div class="row">
                            <span class="col-md-2">配件总库存</span>
                            <span class="col-md-10">
                          <input type="text"  id="partsStock" name="" value="" class="form-control" readonly="readonly">
                   		 </span>
                        </div>
                        
                        
                        
                        <div class="row">
                            <span class="col-md-2">供应商</span>
                            <span class="col-md-10">
                            <select name="" id="supplierIdTwo" class="form-control">
                            	<c:if test="${!empty supplierList}">
									 <c:forEach items="${supplierList}" var="t">  
									  	<c:if test='${t.supplier != "无耗材"}'>
									 		<option id="" value="${t.id}">${t.supplier}</option>
									 	</c:if>
									</c:forEach>  
								</c:if>
                            </select>
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">开始日期</span>
                            <span class="col-md-10">
                        <input type="date" id="start_date" value="" class="form-control  jhrqDate"  style="line-height:normal;vertical-align:middle; padding-top:0.2rem; ">
                    </span>
                        </div>
                        <div class="row">
                            <span class="col-md-2">结束日期</span>
                            <span class="col-md-10">
                        <input type="date" id="endDate" value="2018-09-18" class="form-control jhrqDate"   style="line-height:normal;vertical-align:middle; padding-top:0.2rem;">
                    </span>
                        </div>
                    </div>
                    <div class="text-center" style="margin-top: 10px;margin-top: 0.2rem;">
                        <button class="btn sure" style="background-color: #48a3da;">查询</button>
                    </div>
                </div>
                <!--配件查询结束-->

                <!--配件预定开始-->
                <div id="Three">
                    <div class="ThreeTop">
                        <div class="row ThreeSea">
                            <button class="btn btn-block ThreeSeaAdd">新增预定</button>
                        </div>
                        <div class="row ThreeSea page">
                             <span><input id="searchCriteria" type="text" placeholder="姓名/手机号/配件类型/配件名称/供应商" class="form-control"></span> <button id="search" class="btn">查询</button>
                        </div>
                        <div class="tableDiv">
<!--                             <div > -->
                                <form action="">
	                                <div class="cxTable list">
	                                    <table class="table prepareSearch"  style="margin-bottom:0px;">
	                                       
	                                    </table>
	                                 </div>
                                </form>
                   <!--          </div> -->

                        </div>
                        
	                      <div class="text-center pageHelper">
		                       
		                       
	                     </div>
                        
                    </div>
                    <div class="ThreeBot" style="display: none">
                        <div class="row ThreeSea">
                            <span>
                                <input type="text"  id="searchReserveCriteria" placeholder="姓名/手机号/车牌号" class="form-control">
                            </span>
                            <button  id="searchReserve" class="btn">搜索</button>
                        </div>
                        <form action="">
                        <div class="table-responsive list">
                            <table class="table  xzTable" style="margin-top: 10px;margin-top: 0.2rem;">
                               	
                            </table>
                            </div>
                        </form>
                        <!--<div class="text-center">-->
                            <!--<button class="btn">首页</button>-->
                            <!--<button class="btn">上一页</button>-->
                            <!--<button class="btn">下一页</button>-->
                            <!--<button class="btn">尾页</button>-->
                        <!--</div>-->
                        <div class="toUpSec repairDiv">
                            <div class="row">
                                <span class="col-md-2">配件类型</span>
                                <span class="col-md-10">
                            <select name="" id="selectIDThree" class="form-control">
                          		  <option id="" value="">请选择配件类型</option>
                            	<c:if test="${!empty pList}">
									 <c:forEach items="${pList}" var="t">  
									 	<c:if test='${t.parts_type != "无耗材"}'>
										 		<option id="${t.id}" value="${t.id}">${t.parts_type}</option>
										</c:if>
									</c:forEach>  
								</c:if>
                            </select>
                                </span>

                            </div>
                            <div class="row">
                                <span class="col-md-2">配件名称</span>
                                <span class="col-md-10">
                            <select name="" id="partsName" class="form-control">
                            	<option id="" value="">请选择配件名称</option>
                            </select></span>
                            </div>
                            <div class="row">
                                <span class="col-md-2">供应商</span>
                                <span class="col-md-10">
                            <select name="" id="supplierIdThree" class="form-control">
                            <option id="" value="">请选择供应商</option>
                            	<c:if test="${!empty supplierList}">
									 <c:forEach items="${supplierList}" var="t">  
									 	<c:if test='${t.supplier != "无耗材"}'>
									 		<option id="" value="${t.id}">${t.supplier}</option>
									 	</c:if>
									</c:forEach>  
								</c:if>
                            </select>
                                </span>
                            </div>
                            <div class="row">
                                <span class="col-md-2">预定数量</span>
                                <span class="col-md-10">
                            <input type="number"  id="PreseNumber" value="1" class="form-control"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
                    </span>
                            </div>

                            <div class="row">
                                <span class="col-md-2">备注</span>
                                <span class="col-md-10">
                            <input type="text"  id="PreseRemark" value="备注" class="form-control">
                    </span>
                            </div>

                        </div>
                        <div class="text-center" style="margin-top: 0.2rem;">
                            <button id="PresetButton" class="btn">预定</button>
                            <button id="ThisReturn" class="btn">返回</button>
                        </div>

                    </div>
                </div>
                <!--配件预定结束-->

            </section>
        </div>
    </div></div>
    <script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>
<!--弹窗开始-->
<div id="mask">
    <div class="simpleAlertBody" style="width: 85%;left: 7%;height: 280px;">
        <i id="thisDelete" class="simpleAlertBodyClose 	glyphicon glyphicon-remove"></i>
        <div class="rightTop">
            查询列表
        </div>
        <div class="simpleAlertBodyContent">
            <div class="tableDiv">
                <div>
                    <form action="">
                        <table class="table">
                        
                        </table>
                    </form>
                </div>

            </div>
        </div>
        <button class="simpleAlertBtn simpleAlertBtn2" style="right:39%;">确定</button>
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
<script>
var month=new Date().getMonth() + 1>9 ? new Date().getMonth() + 1 : "0"+(new Date().getMonth() + 1);
var dateDay=new Date().getFullYear()+"-"+month+"-"+new Date().getDate();
$(".jhrqDate").val(dateDay);

		//信息得定位
		var  flag  =0;
		flag =${flag};
		if(flag==1){//配件入库
		  //默认为配件入库
		}else if(flag==2){//配件查询
			 $("#One").hide();
       		 $("#Two").fadeIn();
       		 $("#Three").hide();
       		 $(".One").removeClass("active");
       		 $(".Two").addClass("active");
		}else if(flag==3){//配件预定
			 $("#One").hide();
       		 $("#Two").hide();
       		 $("#Three").fadeIn();
       		 $(".One").removeClass("active");
       		 $(".Three").addClass("active");
		}else{
		
		}
        //	 $("#selectID option:first").prop("selected", 'selected');
  	    //防止刷新时二级下拉菜单出现问题
  	    var parts_type = $("#ps_type_id").text();//配件类型名称
       	var  selected = $("#parts_id");
        $("select[name='trantype']:first").parent().parent().find("#ps_type_id").val(parts_type);//将值赋值给input输入框
        selected.empty();
       //根据配件类型查询配件名称
        	 $.ajax({
                type: "POST",
                url: "/Qiqiang/StoreController/getPartsByConditions",
                data: {parts_type:parts_type},
                success:function(args){
				var proList = $.parseJSON(args).pList;
   				if (proList != null && proList.length > 0 ){
   				 $(".abc").find("#parts").attr('placeholder',"请选择或输入配件名称");
   				$.each(proList,function(idx,val){
   						$("#parts_id").append("<option value="+val.id+">"+val.parts+"</option>"); //为Select追加一个Option(下拉项)
					});
   				};
			}
       });
       
       
       
       //防止刷新时二级下拉菜单出现问题
  	   var parts_type = $("#selectIDTwo option:selected").text();//配件类型名称
       var  selected = $(".selectStock");
       selected.empty();
       //根据配件类型查询配件名称
        	 $.ajax({
                type: "POST",
                url: "/Qiqiang/StoreController/getPartsByConditions",
                data: {parts_type:parts_type},
                success:function(args){
				var proList = $.parseJSON(args).pList;
   				if (proList != null && proList.length > 0 ){
   				$.each(proList,function(idx,val){
   						if(idx==0){
   							$(".selectStock").append("<option value="+val.id+">"+val.parts+"</option>"); //为Select追加一个Option(下拉项)
   							//查询配件的总库存
   							 $.ajax({
				            	//几个参数需要注意一下
				                type: "POST",//方法类型
				                dataType: "json",//预期服务器返回的数据类型
				                url: "/Qiqiang/StoreController/getStoreByParts_id" ,//url
				                data: {parts_id:val.id},
				                success: function (msg) {
				                   $("#partsStock").val(msg.data.store);
				                },
				                error : function() {
				                    alert("数据异常！");
				                }
				            });
   						}else{
   							$(".selectStock").append("<option value="+val.id+">"+val.parts+"</option>"); //为Select追加一个Option(下拉项)
   						}
					});
   				};
			}
       });
       
       
       
       
       
  
  
    $(".titleDiv span").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    })
    $(".simpleAlertBtn,.simpleAlertBodyClose").click(function () {
        $("#mask").fadeOut();
    })
    

    $(".One").click(function () {
        $("#One").fadeIn();
        $("#Two").hide();
        $("#Three").hide();
    })
    $(".Two").click(function () {
        $("#One").hide();
        $("#Two").fadeIn();
        $("#Three").hide();
    })
    $(".Three").click(function () {
        $("#One").hide();
        $("#Two").hide();
        $("#Three").fadeIn();
    })
    $(".ThreeSeaAdd").click(function () {
        $(".ThreeTop").fadeOut();
        $(".ThreeBot").fadeIn();
    })
      //配件查询
    $(".sure").click(function () {
    	 var  $this =$(this);
     	 var  flag =  $this.parent().parent().find("#falgID").find("option:selected").val();//查询标志位  
	 //   	var  partsTypeId =$this.parent().parent().find("#selectIDTwo").val();//配件类型id
	    	var  parts_type =$this.parent().parent().find("#selectIDTwo").find("option:selected").text();//配件类型名称
	//    	var  partsid =$this.parent().parent().find("#partsName").val();//配件部位id
	    	var  parts =$this.parent().parent().find("#partsName").find("option:selected").text();//配件部位名称
	    	var  start_date =$this.parent().parent().find("#start_date").val(); //获取开始时间
	    	var  endDate=$this.parent().parent().find("#endDate").val(); //获取结束时间
	    	var  supplier=$this.parent().parent().find("#supplierIdTwo").find("option:selected").text();
	   		if(flag==3){//库存查询
	   			$("#mask").find(".table").append("<tr><th>配件类型</th><th>配件名称</th><th>供应商</th><th>库存</th><th>进货数量</th><th>进货日期</th> <th>进货单价</th><th>出厂日期</th><th>保质期</th></tr>");
		    	 $.ajax({
	                type: "POST",
	                url: "/Qiqiang/StoreController/storeQueryExt",
	                data: {supplier:supplier,parts_type:parts_type,parts:parts,start_date:start_date,endDate:endDate},
	                success:function(args){
					var proList = $.parseJSON(args).pList;
		   				//$(".breadcrumb").empty();
		   				if (proList != null && proList.length > 0 ){
		   				$.each(proList,function(idx,val){
		   					var  sc_date = val.sc_date;
		   					var  expire_date = val.expire_date
		   					if(val.sc_date ==null ){
		   						sc_date ="";
		   					}
		   					if(expire_date ==expire_date ){
		   						expire_date ="";
		   					}
		   						$("#mask").find(".table").append("<tr><td>"+val.parts_type+"</td><td>"+val.parts+"</td><td>"+val.supplier+"</td><td>"+val.store+"</td><td>"+val.ps_sum+"</td><td>"+val.ps_date+"</td><td>"+val.ps_price+"</td><td>"+sc_date+"</td><td>"+expire_date+"</td></tr>");
							});
		   				};
				}
	            });
      			  $("#mask").fadeIn();
	    	}else if(flag==2){//出库
	    			$("#mask").find(".table").append("<tr><th>配件类型</th><th>配件名称</th><th>供应商</th><th>出厂日期</th><th>销售价格</th> <th>销售数量</th><th>销售日期</th><th>客户名称</th><th>车牌号</th></tr>");
	    		$.ajax({
	                type: "POST",
	                url: "/Qiqiang/StoreController/purQuery",
	                 data: {supplier:supplier,parts_type:parts_type,parts:parts,start_date:start_date,endDate:endDate,ps_type:flag},
	                success:function(args){
					var proList = $.parseJSON(args).pList;
		   				//$(".breadcrumb").empty();
		   				if (proList != null && proList.length > 0 ){
		   				$.each(proList,function(idx,val){
		   					var  sc_date = val.sc_date;
		   					if(val.sc_date ==null ){
		   						sc_date ="";
		   					}
		   						$("#mask").find(".table").append("<tr><td>"+val.parts_type+"</td><td>"+val.parts+"</td><td>"+val.supplier+"</td><td>"+sc_date+"</td><td>"+val.ps_price+"</td><td>"+val.ps_sum+"</td><td>"+val.ps_date+"</td><td>"+val.name+"</td><td>"+val.plateno+"</td></tr>");
							});
		   				};
					}
	            	});
	            	  $("#mask").fadeIn();
	    		}else if(flag==1){//入库
	    			$("#mask").find(".table").append("<tr><th>配件类型</th><th>配件名称</th><th>供应商</th><th>进货单价</th><th>出厂日期</th><th>保质期</th> <th>进货数量</th><th>进货日期</th><th>备注</th></tr>");
	    				 $.ajax({
	                type: "POST",
	                url: "/Qiqiang/StoreController/purQuery",
	                data: {supplier:supplier,parts_type:parts_type,parts:parts,start_date:start_date,endDate:endDate,ps_type:flag},
	                success:function(args){
					var proList = $.parseJSON(args).pList;
		   				//$(".breadcrumb").empty();
		   				if (proList != null && proList.length > 0 ){
		   				$.each(proList,function(idx,val){
		   					var  sc_date = val.sc_date;
		   					var  expire_date = val.expire_date
		   					if(val.sc_date ==null ){
		   						sc_date ="";
		   					}
		   					if(expire_date ==expire_date ){
		   						expire_date ="";
		   					}
		   			$("#mask").find(".table").append("<tr><td>"+val.parts_type+"</td><td>"+val.parts+"</td><td>"+val.supplier+"</td><td>"+val.ps_price+"</td><td>"+sc_date+"</td><td>"+expire_date+"</td><td>"+val.ps_sum+"</td><td>"+val.ps_date+"</td><td>"+val.remark+"</td></tr>");
							});
		   				};
					}
	            	});
	            	 $("#mask").fadeIn();
	    		}
      			
	    	
    });
</script>

<script type="text/JavaScript">
       $("#selectIDTwo").change(function(){
       var  $this =$(this);
        var parts_type = $this.find("option:selected").text();//配件类型名称
       var  selected =  $this.parent().parent().parent().find("#partsName");
       
       selected.empty();
       //根据配件类型查询配件名称
        	 $.ajax({
                type: "POST",
                url: "/Qiqiang/StoreController/getPartsByConditions",
                data: {parts_type:parts_type},
                success:function(args){
				var proList = $.parseJSON(args).pList;
   			//	$this.empty();
   				if (proList != null && proList.length > 0 ){
   				$.each(proList,function(idx,val){
   						if(idx==0){
   							selected.append("<option value="+val.id+">"+val.parts+"</option>"); //为Select追加一个Option(下拉项)
   							//查询配件的总库存
   							 $.ajax({
				            	//几个参数需要注意一下
				                type: "POST",//方法类型
				                dataType: "json",//预期服务器返回的数据类型
				                url: "/Qiqiang/StoreController/getStoreByParts_id" ,//url
				                data: {parts_id:val.id},
				                success: function (msg) {
				                   $("#partsStock").val(msg.data.store);
				                },
				                error : function() {
				                    alert("数据异常！");
				                }
				            });
   						}else{
   							selected.append("<option value="+val.id+">"+val.parts+"</option>"); //为Select追加一个Option(下拉项)
   						}
   						
					});
   				}else{
   					 $("#partsStock").val(0);
   				}
			}
            });
       });
        $("#selectIDThree").change(function(){
	       var  $this =$(this);
	        var parts_type = $this.find("option:selected").text();//配件类型名称
	       var  selected =  $this.parent().parent().parent().find("#partsName");
       
      		 selected.empty();
       	//根据配件类型查询配件名称
        	 $.ajax({
                type: "POST",
                url: "/Qiqiang/StoreController/getPartsByConditions",
                data: {parts_type:parts_type},
                success:function(args){
				var proList = $.parseJSON(args).pList;
   				//$this.empty();
   				if (proList != null && proList.length > 0 ){
   				$.each(proList,function(idx,val){
   						selected.append("<option value="+val.id+">"+val.parts+"</option>"); //为Select追加一个Option(下拉项)
					});
   				};
			}
            });
       });
      
         $(".simpleAlertBtn2").click(function(){
         	var  $this =$(this);
         	$this.parent().parent().find(".table").html("");
       });
       $("#thisDelete").click(function(){
         	var  $this =$(this);
         	$this.parent().parent().find(".table").html("");
       });
       
       
     
       
         $("#search").click(function(){
         	var  $this =$(this);
         	var  param = $this.parent().find("#searchCriteria").val();
         	$this.parent().find(".table").html("");
         	$this.parent().parent().find(".table").html("");
         	$.ajax({
                type: "POST",
                data: {param:param},
                url: "/Qiqiang/StoreController/QuerytPartsReservation",
                success:function(args){
                var  page  = $.parseJSON(args).pList;
				var proList = $.parseJSON(args).pList.list;
   				//$(".breadcrumb").empty();
   				if (proList != null && proList.length > 0 ){
   				$this.parent().parent().find(".table").append(" <tr><td>配件类型</td><td>配件名称</td><td>供应商</td><td>预定数量</td><td>预定人</td><td>手机号</td><td>预定时间</td> <td>备注</td></tr>");
   				$.each(proList,function(idx,val){
   						$this.parent().parent().find(".table").append(" <tr><td>"+val.parts_type+"</td><td>"+val.parts+"</td><td>"+val.supplier+"</td><td>"+val.number+"</td><td>"+val.name+"</td><td>"+val.mobile+"</td><td>"+val.createDate+"</td> <td>"+val.remarks+"</td></tr>");
					});
   				};
   				$(".pageHelper").empty();
   				//增加上一页下一页 分页
   				$(".pageHelper").append("<p class='total'>共"+page.total+"条记录&nbsp;&nbsp;第"+page.pageNum+"页&nbsp;&nbsp;共"+page.pages+"页</p>");
   				$(".pageHelper").append(' <button class="btn jump">首页</button>');
   				$(".pageHelper").append(' <input type="hidden"  id="first" class="pagenow"  value="1">');
   				$(".pageHelper").append(' <button class="btn jump">上一页</button>');
   				$(".pageHelper").append(' <input type="hidden"  id="last" class="pagenow" value='+page.prePage+'>');
   				$(".pageHelper").append(' <button class="btn jump">下一页</button>');
   				$(".pageHelper").append(' <input type="hidden"  id="nest" class="pagenow" value='+page.nextPage+'>');
   				$(".pageHelper").append(' <button class="btn jump">尾页</button>');
   				$(".pageHelper").append(' <input type="hidden" id="end" class="pagenow" value='+page.pages+'>');
   				$(".cxTable").addClass("list1");
			}
            });
       });
       
       
       $("#searchReserve").click(function(){
         	var  $this =$(this);
         	 var  param = $this.parent().find("#searchReserveCriteria").val();
         	 $this.parent().parent().find(".table").html("");
         	$.ajax({
                type: "POST",
                data: {param:param},
                url: "/Qiqiang/StoreController/PartsReservation",
                success:function(args){
	                if(args!=""){
						var proList = $.parseJSON(args).pList;
			   				if (proList != null && proList.length > 0 ){
			   				
			   				$this.parent().parent().find(".table").append("<tr><td>姓名</td><td>手机号</td><td>车牌号</td><td>卡级别</td><td>选择</td></tr>");
			   				$.each(proList,function(idx,val){
			   						$this.parent().parent().find(".table").append("<tr><td>"+val.name+"</td><td>"+val.mobile+"</td><td>"+val.plateno+"</td><td>"+val.viplevel+"</td><td><input type='radio' name='userid' value="+val.id+"></td></tr>");
								});
			   				};
			   				if($(".xzTable").height()>200){
				   					$(".table-responsive").height(200);
				   			}else{
				   					$(".table-responsive").height($(".xzTable").height()+10);
				   			}
		   				}else{
							$(".table-responsive").height(10);
						}
	   				
			}
			
            });
            
       });
      //配件预定按钮
      $("#PresetButton").click(function(){
         	var  $this =$(this);
         	 //用户的id
         	 var  userid = $this.parent().parent().find(".table").find('input[name="userid"]:checked').val();
         	 if(userid==null || userid ==""){
         	 	alert("请选择用户");
         	 	return false;
         	 }
         	 //配件类型id
         	 var  parts_type_id = $this.parent().parent().find("#selectIDThree").find("option:selected").val();
         	 if(parts_type_id==null||parts_type_id==""){
         	 	alert("请先选择配件类型");
         	 	return false;
         	 }
         	  //配件名称id
         	 var  partsId= $this.parent().parent().find("#partsName").find("option:selected").val();
         	  if(partsId==null||partsId==""){
         	 	alert("请选择配件名称");
         	 	return false;
         	 }
         	 //供应商
         	 var  supplierid= $this.parent().parent().find("#supplierIdThree").find("option:selected").val();
         	if(supplierid==null||supplierid==""){
         	 	alert("请选择供应商");
         	 	return false;
         	 }
         	  //预定数量
         	 var  PreseNumber= $this.parent().parent().find("#PreseNumber").val();
         	  if(null !=PreseNumber && ""!=PreseNumber ){
         		  if(PreseNumber<=0){
         			 alert("预定数量必须大于0");
               	 	return false;
         		  }
         	  }else{
         		alert("请填写预定数量");
          	 	return false;
         	  }
         	 //备注
         	   var  PreseRemark= $this.parent().parent().find("#PreseRemark").val();
         	 if(PreseRemark==null||PreseRemark==""){
         	 	alert("请填写备注");
         	 	return false;
         	 }
         	$.ajax({
                type: "POST",
                data: {userId:userid,parts_type_id:parts_type_id,partsId:partsId,supplierId:supplierid,number:PreseNumber,remarks:PreseRemark},
                url: "/Qiqiang/StoreController/InsertPartsReservation",
                success:function(msg){
               		if(msg.result>0){
               			alert("预定成功");
               			location.href="/Qiqiang/StoreController/getPartsType?flag=3";
               		}else{
               			alert("预定成功");
               		}
				}
            });
       }); 
       
      //新增
      $(".add").click(function(){
      	var  $this =$(this);
      		$this.parent().parent().find(".jhrqDate").attr("value",$this.parent().parent().find(".jhrqDate").val()); 
    	  	$(this).parent().before($(".abc:first").clone(true));
    	  	$("#thisForm").find(".abc:last").find(".chrq").val(""); 
       }); 
          //删除
      $(".delete").click(function(){
      	var  $this =$(this);
      	if($(".abc").length>1){
	    		layer.confirm('确认删除?', {
	    			  btn: ['确认','取消'] //按钮
	    			}, function(){
	    			  $this.parent().remove();
	    			  layer.msg('已经删除', {icon: 1});
	    			}, function(){
	    			  layer.msg('已取消', {icon: 1});
	    			});
    	   }else{
    	   	alert("最后一条不能删除");
    	   }
       }); 
       

</script>
<script>
      $("#selectID").change(function(){
       var  $this =$(this);
        var parts_type = $this.find("option:selected").text();//配件类型名称
       	var  selected =  $this.parent().parent().parent().parent().parent().find("#parts_id");
        $this.parent().parent().find("#ps_type_id").val(parts_type);//将值赋值给input输入框
       selected.empty();
       $(".abc").find("#parts").val(null);
       //根据配件类型查询配件名称
        	 $.ajax({
                type: "POST",
                url: "/Qiqiang/StoreController/getPartsByConditions",
                data: {parts_type:parts_type},
                success:function(args){
				var proList = $.parseJSON(args).pList;
				selected.append("<option value=''>请选择配件名称</option>"); 
   				if (proList != null && proList.length > 0 ){
   				$.each(proList,function(idx,val){
   						selected.append("<option value="+val.parts+">"+val.parts+"</option>"); //为Select追加一个Option(下拉项)
					});
   				};
			}
            });
       });
  	
  	
  	    $(".chooseSupplier").change(function(){
		  var  $this =$(this);
      	  var supplier = $this.find("option:selected").text();
      	  $this.parent().parent().find("#supplier").val(supplier);//将值赋值给input输入框
       });
  	
       $(".parts_id").change(function(){
      	  var  $this =$(this);
      	  var parts = $this.find("option:selected").val();//配件名字
          $this.parent().parent().find("#parts").val(parts);//将值赋值给input输入框
       });
       
       //配件如果的提交
      /* $(".insertBtn").click(function(){ */
       $("#thisForm").submit(function(){ 
      		 $.ajax({
            	//几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/Qiqiang/StoreController/storeEnter" ,//url
                data: $('#thisForm').serialize(),
                success: function (data) {
                    console.log(data);//打印服务端返回的数据(调试用)
                    if (data.result>0) {
                        alert(data.message);
                        //跳进配件查询页面
                        location.href="/Qiqiang/StoreController/getPartsType?flag=2";
                    }else{
                   		 alert(data.message);
                    }
                },
                error : function() {
                    alert("数据异常！");
                }
            });
      });
       //页面的返回
       $("#ThisReturn").click(function(){
      	     $(".ThreeTop").fadeIn();
     		 $(".ThreeBot").fadeOut();
       });
       $(".selectStock").change(function(){
       		var  $this =$(this);
       		var parts_id = $this.find("option:selected").val();//配件id
       		 $.ajax({
            	//几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/Qiqiang/StoreController/getStoreByParts_id" ,//url
                data: {parts_id:parts_id},
                success: function (msg) {
                   $("#partsStock").val(msg.data.store);
                },
                error : function() {
                    alert("数据异常！");
                }
            });
       });
     	  $(".pageHelper").delegate(".jump","click",function(){
				var $this =$(this);
				var  pageNum =	$this.next().val();
				var   endPage  =    $("#end").val();
				  if(pageNum<=0){
					  pageNum=1;
				}
				  var  param = $("#searchCriteria").val();
				  $(".prepareSearch").empty();
		         	$.ajax({
		                type: "POST",
		                data: {param:param,pageNum:pageNum},
		                url: "/Qiqiang/StoreController/QuerytPartsReservation",
		                success:function(args){
			                var  page  = $.parseJSON(args).pList;
							var proList = $.parseJSON(args).pList.list;
			   				//$(".breadcrumb").empty();
			   				if (proList != null && proList.length > 0 ){
			   				$this.parent().parent().find(".table").append(" <tr><td>配件类型</td><td>配件名称</td><td>供应商</td><td>预定数量</td><td>预定人</td><td>手机号</td><td>预定时间</td> <td>备注</td></tr>");
			   				$.each(proList,function(idx,val){
			   						$this.parent().parent().find(".table").append(" <tr><td>"+val.parts_type+"</td><td>"+val.parts+"</td><td>"+val.supplier+"</td><td>"+val.number+"</td><td>"+val.name+"</td><td>"+val.mobile+"</td><td>"+val.createDate+"</td> <td>"+val.remarks+"</td></tr>");
								});
			   				};
			   				//增加上一页下一页 分页
			   				//修改当前的页数
	                        $("#last").val(page.prePage);
	                        $("#nest").val(page.nextPage);
	                        $(".total").text("共"+page.total+"条记录  第"+page.pageNum+"页  "+"共"+page.pages+"页");
	                        $("#end").val(page.pages);
			   				$(".cxTable").addClass("list1");
						}
		            });
     	  });
         
      	 
 </script>
</body>
</html>
