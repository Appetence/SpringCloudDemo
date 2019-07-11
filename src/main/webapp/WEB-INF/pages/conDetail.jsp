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
<link rel="stylesheet" href="../../static/css/bootstrap.css"/>
<link rel="stylesheet" href="../../static/css/commom.css"/>
<link rel="stylesheet" href="../../static/css/staReport.css"/>
    <style>
        .sec div span{
            display: inline-block;
            padding-left: 0px;
            padding-right: 0px;
            width: 80%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 bcg-head text-center" style="">
            <div>
                <img src="../../static/images/d4.jpg" alt="" style="margin-top: 16%;">
                <p style="margin-top: 5px;">
                    <span>张三</span>
                </p>
                <p class="text-center NO" style="left: 0rem;">
                    <span class="iconfont  icon-huiyuanqia-xianxing" style="font-size: 16px!important;"></span>
                    <br>
                    <span>ID-123456</span>
                </p>
                <p class="text-center NO" style="right: 0rem;">
                    <span class="iconfont  icon-jifen" style="font-size: 16px!important;"></span>
                    <br>
                    <span>345</span>
                </p>
            </div>
        </div>
        <div class="col-md-12 info-con">
            <p class="titleP" ><i class="glyphicon glyphicon-list-alt"></i> 消费详情</p>
            <section class="sec">
                <div class="titleDiv text-center">
                    <a href="javascript:;" onclick="nav(id,1)" value="消费"><span class="active" style="width: 49%;">消费</span></a><a href="javascript:;" onclick="nav(id,1)" value="充值"><span style="width: 49%;">充值</span></a>
                </div>
                <div>
                    <div class="row" style="padding: 0px 15px;margin-top: 10px;">
                        <b>交易记录</b>
                    </div>
                <form action="">
                    <table class="table table-bordered" style="margin-top: 5px;">
                       <tr>
                            <td>姓名</td>
                            <td>交易时间</td>
                            <td>金额</td>
                            <td>服务项目</td>
                            <td>车牌号</td>
                            <td>余额</td>
                        </tr>
                         <c:forEach items="${recordDetailsPage}" var="record">
                      <td>${record.customername}</td>
                      <td><fmt:parseDate value="${record.inputtime}" pattern="dd-MM-yyyy"/></td>
                      <td>${record.total_price}</td>
                      <td>${record.trans_type}</td>
                      <td>${record.plateNo}</td>
                      <td>${record.balance}</td>
                   </c:forEach>
                        
                    </table>
                </form>
     <div class="text-center">
    <a href="javascript:;" onclick="nav(${recordDetailsPage.getList().user_id},1)"><button id="buttonOne" class="btn">首页</button></a>
    <c:if test="${recordDetailsPage} !=1">
    <a href="javascript:;" onclick="nav(${recordDetailsPage.getList().user_id},${recordDetailsPage.pageNum-1})"><button id="buttonTwo" class="btn" value="">上一页</button></a>
    </c:if>
     <c:if test="${recordDetailsPage.pageNum!=recordDetailsPage.pages}">
     <a href="javascript:;" onclick="nav(${recordDetailsPage.getList().user_id},${recordDetailsPage.pageNum+1})"> <button id="buttonThree" class="btn">下一页</button></a>
   </c:if>
    <c:if test="${recordDetailsPage.pageNum!=recordDetailsPage.pages}">
     <a href="javascript:;" onclick="nav(${recordDetailsPage.getList().user_id},${recordDetailsPage.pages})"><button id="buttonFour" class="btn">尾页</button></a>
    </c:if>
    </div>
    <script>
         var id=0; 
   $(function(){
        nav(1); 
       })
       var statu=$(this).val();
       var status;
       if(statu =="消费"){
         status=0;
       }
       if(statu == "充值"){
          status=1;
       }
       function nav(id,pageNo){
        $.ajax({
         url:"Qiqiang/UserCarCardDetailsController/RecordDetails/{id}{pageNo}{status}",
         type :"post",
         //data:index,
         dataType:"json",
         success:function(recordDetailsPage){
            $(".table table-bordered").html("< <tr><td>姓名</td><td>交易时间</td> <td>金额</td><td>服务项目</td><td>车牌号</td><td>余额</td></tr><c:forEach items='"
            +${recordDetailsPage.getList()}
            +"' var='info'><td>"
            +${info.customername}
            +"</td><td>"
            +${info.inputtime}
            +"</td><td>"
            +${info.total_price}
            +"</td><td>"
            +${info.trans_type}
            +"<a href='javascript:; onclick='type("
            +${info.plateNo }
            + ")'><input type='radio' name='cardtype'  checked='checked'></a></td><td>"
            +${info.balance }
            +"</td></tr></c:forEach>"
            );
           
         },
          error: function(){
              $(table).html("000");
            }
        })
       
       };
    
    </script>
    </div>
                <div class="row" style="padding: 0px 15px;margin-top: 20px;">
                    <b>修车记录</b>
                </div>
                    <div class="row" style="margin:0.2rem 0rem 0rem;width: 100%;text-align: center;">
                        <span style="width: 100%">
                        <input type="date" style="width: 46%;display: inline-block;" class="form-control"> - <input type="date" style="width: 46%;display: inline-block;" class="form-control">
                        </span>
                    </div>
                    <div class="row" style="margin:0.2rem 0rem 0rem;width: 100%;text-align: center;">
                        <span>
                        <input type="text" placeholder="姓名/手机号/车牌号" class="form-control">
                        </span>
                        <button class="btn">搜索</button>
                    </div>
                <form action="">
                    <table class="table" id="twotable" style="margin-top: 5px;">
                        <tr>
                            <td>姓名</td>
                            <td>手机号</td>
                            <td>车牌号</td>
                            <td>修理日期</td>
                            <td>消费金额</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>洗车</td>
                            <td>-200.00</td>
                            <td>1</td>
                            <td>-200.00</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>打蜡</td>
                            <td>-298.00</td>
                            <td>1</td>
                            <td>-200.00</td>
                        </tr>

                    </table>
                </form>
  <div class="text-center">
    <a href="javascript:;" onclick="nav(1)"><button id="buttonOne" class="btn">首页</button></a>
    <c:if test="${repairDetailsInfo} !=1">
    <a href="javascript:;" onclick="nav(${repairDetailsInfo.pageNum-1})"><button id="buttonTwo" class="btn" value="">上一页</button></a>
    </c:if>
     <c:if test="${repairDetailsInfo.pageNum!=repairDetailsInfo.pages}">
     <a href="javascript:;" onclick="nav(${repairDetailsInfo.pageNum+1})"> <button id="buttonThree" class="btn">下一页</button></a>
   </c:if>
    <c:if test="${repairDetailsInfo.pageNum!=repairDetailsInfo.pages}">
     <a href="javascript:;" onclick="nav(${repairDetailsInfo.pages})"><button id="buttonFour" class="btn">尾页</button></a>
    </c:if>
    </div>
 </div>
                <!--日报结束-->
<script >
 $(function(){
        repair(1); 
       })
       function repair(pageNo){
        $.ajax({
         url:"Qiqiang/UserCarCardDetailsController/RepairCarDetails/{pageNo}",
         type :"post",
         //data:index,
         dataType:"json",
         success:function(repairDetailsInfo){
            $("#twotable").html("< <tr><td>姓名</td><td>手机号</td> <td>车牌号</td><td>修理日期</td><td>消费金额</td><td>操作</td></tr><c:forEach items='"
            +${recordDetailsPage.getList()}
            +"' var='info'><td>"
            +${info.name}
            +"</td><td>"
            +${info.mobile}
            +"</td><td>"
            +${info.plateno}
            +"</td><td>"
            +${info.inputtime}
            +"<a href='javascript:; onclick='type("
            +${info.totalprice}
            + ")'><input type='radio' name='cardtype'  checked='checked'></a></td><td>更多</td></tr></c:forEach>"
            );
           
         },
          error: function(){
              $(table).html("000");
            }
        })
       
       };
       function repairDetails(id){
         url:"Qiqiang/UserCarCardDetailsController/RepairCarDetails/{pageNo}",
         type :"post",
         //data:index,
         dataType:"json",
         success:function(repairSomeDetails){
           $()
         }
       }
</script>
            </section>
        </div>
    </div>
    <footer>
        <div>
            <i class="glyphicon glyphicon-list"></i>
            <p>我的信息</p>
        </div>
        <div>
            <i class="glyphicon glyphicon-list-alt"></i>
            <p>消费详情</p>
        </div>
        <div>
            <i class="glyphicon glyphicon-usd"></i>
            <p>赚钱</p>
        </div>
    </footer>
</div>
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
<script type="text/javascript" src="../../static/js/jquery-2.2.3.min.js"></script>
<script>
    $(".titleDiv span").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    })
</script>
</body>
</html>
