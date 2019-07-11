<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
<title>卡片类型设置</title>
<link rel="stylesheet" href="../../static/css/bootstrap.css"/>
<link rel="stylesheet" href="../../static/css/commom.css"/>
<link rel="stylesheet" href="../../static/css/memSea.css"/>
<link rel="stylesheet" type="text/css" href="../../static/css/iconfont.css">
    <style>
        .sec .row span{
            display: inline-block;
        }
        .toUpSec .row{
            width: 100%;
            margin: 0.2rem 0rem 0rem;
        }
        .toUpSec .row .col-md-2{
            padding-left: 0rem !important;
        }
        .toUpSec .row .col-md-10{
            display: inline-block;
            width: 70%;
        }
        .toUpSec .row .col-md-10 .form-control{
            width: 100%;
            display: inline-block;
        }
    </style>
</head>
<body >
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
            <p class="titleP"><i class="iconfont  icon-huiyuandengjishezhi"></i> 卡片类型设置</p>
            <section class="sec">
                <div>
                    <div class="row" style="margin:0rem;width: 100%;text-align: center;">
                        <span>
                        <input type="text" placeholder="姓名/手机号/车牌号" class="form-control">
                        </span>
                        <button class="btn" id="selectSome">搜索</button>
                        <!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
                    </div>
                <form action="">
                    <table class="table" style="margin-top: 5px;">
                        <tr>
                            <td>姓名</td>
                            <td>手机号</td>
                            <td>车牌号</td>
                            <td>卡级别</td>
                            <td>选择</td>
                        </tr>
                        <tr>
                          <c:forEach items="${pageFirstList.getList()}" var="page">
                              <td>${page.name}</td>
                            <td>${page.mobile}</td>
                            <td>${page.plateno}</td>
                            <td>${page.card}</td>
                          </c:forEach>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>洗车</td>
                            <td>-200.00</td>
                            <td>洗车</td>
                            <td>
                                <input type="radio">
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>打蜡</td>
                            <td>-298.00</td>
                            <td>洗车</td>
                            <td>
                                <input type="radio">
                            </td>
                        </tr>

                    </table>
                </form>
                  
               <div class="text-center">
    <a href="javascript:;" onclick="nav(1)"><button id="buttonOne" class="btn">首页</button></a>
    <c:if test="${pageUserInfo} !=1">
    <a href="javascript:;" onclick="nav(${pageUserInfo.pageNum-1})"><button id="buttonTwo" class="btn" value="">上一页</button></a>
    </c:if>
     <c:if test="${pageUserInfo.pageNum!=pageUserInfo.pages}">
     <a href="javascript:;" onclick="nav(${pageUserInfo.pageNum+1})"> <button id="buttonThree" class="btn">下一页</button></a>
   </c:if>
    <c:if test="${pageUserInfo.pageNum!=pageUserInfo.pages}">
     <a href="javascript:;" onclick="nav(${pageUserInfo.pages})"><button id="buttonFour" class="btn">尾页</button></a>
    </c:if>
    </div>
               
                </div>
                <!--日报结束-->
            </section>

            <div class="text-center" style="margin-top: 20px;">
                <button class="btn sure">设置等级</button>
                <button class="btn">确定</button>
            </div>
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
<!--弹窗开始-->
<div id="mask">
    <div class="simpleAlertBody" style="width: 85%;left: 7%;height: 190px;">
        <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove" style="top: 8px;right: 5px;"></i>
        <div class="simpleAlertBodyContent" style="height: 2.7rem;top: 20%;width: 88%;left: 8%; ">
            <div class="toUpSec text-center">
                <div class="row">
                    <span class="col-md-2">设置卡片等级</span>
                    <span class="col-md-10" style="margin-top: 0.2rem;">
                            <select name="" id="" class="form-control">
                                <option value="">洗车</option>
                                <option value="">打蜡</option>
                                <option value="">修理</option>
                            </select>
                    </span>
                </div>
            </div>
        </div>
       <button class="simpleAlertBtn simpleAlertBtn2" style="right: 41%;">确定</button>

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
	  document.body.onload=nav; 
	})(document, window);
</script>
<script>
    $(".simpleAlertBtn,.simpleAlertBodyClose").click(function () {
        $("#mask").fadeOut();
    })
    $(".sure").click(function () {
        $("#mask").fadeIn();
    })

</script>
<script>
    var id=0; 
    $(function(){
        nav(1);
       }); 
        function nav(pageNo){
        alert("cuole");
        var local_id=$(this).attr("id");
        $.ajax({
         url:"Qiqiang/UserCarCardDetailsController/UserCarCardDetails/{pageNo}",
         type :"post",
         //data:index,
         dataType:"json",
         success:function(pageList){
            $(".table").html("<tr><td>姓名</td><td>手机号</td> <td>车牌号</td><td>卡级别</td><td>选择</td></tr><c:forEach items='"
            +${pageList.getList()}
            +"' var='info'><tr><td>"
            +${pageList.getList().name}
            +"</td><td>"
            +${pageList.getList().mobile}
            +"</td><td>"
            +${pageList.getList().plateno}
            +"</td><td>"
            +${pageList.getList().carType}
            +"<a href='javascript:; onclick='type("
            +${pageList.getList().id}
            + ")'><input type='radio' name='cardtype'  checked='checked'></a></td></tr></c:forEach>"
            );
           
         },
          error: function(){
              $(table).html("0000");
            }
        })
       
       }; 
       var global_id=local_id;
        $("#selectSome").click(function(){
        var local_id=$(this).attr("id");
        var details=$(".form-control").val();
        $.ajax({
         url:"Qiqiang/UserCarCardDetailsController/DetailsPage/{details}",
         type :"post",
         //data:index,
         dataType:"json",
         success:function(detailsList){
            $("table").html("< <tr><td>姓名</td><td>手机号</td> <td>车牌号</td><td>卡级别</td><td>选择</td></tr><c:forEach items='"
            +${pageList.getList()}
            +"' var='info'><tr><td>"
            +${pageList.getList().name}
            +"</td><td>"
            +${pageList.getList().mobile}
            +"</td><td>"
            +${pageList.getList().plateno}
            +"</td><td>"
            +${pageList.getList().carType}
            +"<a href='javascript:; onclick='type("
            +${pageList.getList().id }
            +")'><input type='radio' name='cardtype'  checked='checked'></a></td></tr></c:forEach>"
            );
           
         }
     
    })
   var global_id=local_id;
   $(".cardtype").click(
     $.ajax({
       url:"Qiqiang/UserCarCardDetailsController/CardTypePage",
         type :"post",
         //data:index,
         dataType:"json",
         success:function(cardtype){
           $("#mask").html( "<div class='simpleAlertBody' style='width: 85%;left: 7%;height: 190px;'><i class='simpleAlertBodyClose 	glyphicon glyphicon-remove' style='top: 8px;right: 5px;'></i><div class='simpleAlertBodyContent' style='height: 2.7rem;top: 20%;width: 88%;left: 8%; ''><div class='toUpSec text-center'> <div class='row'> <span class='col-md-2'>设置卡片等级</span><span class='col-md-10' style='margin-top: 0.2rem;''><select name='' id='' class='form-control'><c:forEach items='"
           +${cardtype}
           +"'> <option value='"
           +${cardtype.cardType}
           +"'></option></c:forEach> </select></span></div></div>")
           }
     })
     );
      $("#mask").fadeIn();
      $(".simpleAlertBtn simpleAlertBtn2").click(function(){
         var id=global_id;
         var cardType=$(".form-control").val();
         $.ajax({
         url:"Qiqiang/UserCarCardDetailsController/CardPage/{id}{cardType}",
         type :"post",
         //data:index,
         dataType:"json",
         success:function(typestatus){
         if(typestatus ==1){
           $("#mask").fadeOut();
           alert("更新成功");
           }else{
           alert("更新失败");
           }
         },
         error:function(){
           alert("网络故障");
         }
         })
      }
   )
</script>
<script type="text/javascript" src="../../static/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../../static/js/mask.js"></script>

</body>
</html>
