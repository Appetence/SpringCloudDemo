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
  <title>余额维护</title>
  <link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
  <link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
  <link rel="stylesheet" href="/Qiqiang/static/css/memSea.css"/>
  <link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
  <style>

    .sec .row span{
      display: inline-block;
      font-size: 14px;
      float: left;
      font-size: 0.32rem;
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
      width: 60%;
    }
    .toUpSec .row .col-md-10 .form-control{
      width: 100%;
      display: inline-block;
    }
    .tableIpt{
      background-color: transparent;
      height: 0.56rem;
      width:80%;
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

    <div class="col-md-12 info-con">
      <p class="titleP"><i class="iconfont icon-yonghuxiangmuweihu"></i> 余额维护</p>

      <section class="sec" style=" margin-top: 30px;">
        <div >
          <div class="row" style="margin:0rem;width: 100%;text-align: center;">
                  <span style="width:18%;" >
                  	姓名：
                  </span><span style="width:30%;text-align: left;margin-left:-0.18rem;">
                  	${customer.name}
                  </span><span style="width:20%;text-align: left;margin-left:0.18rem;">
                  	手机号：
                  </span><span style="width:30%;text-align: left;margin-left:-0.18rem;">
                  	${customer.mobile}
                  </span>
            <!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
          </div>
          <form action="/Qiqiang/SelfInfoController/updateCard" style="margin-top:5%">
            <table class="table" style="margin-top: 5px;table-layout: fixed;" style="">
              <tr style="text-align: center;padding-left: 30px;">
                <td style="padding-right: 32px;">卡片类型</td>
                <td style="padding-right: 32px;">余额</td>
                <td style="padding-right:32px;">实充金额</td>
              </tr>
              <input type="hidden" name="user_id" value="${customer.id }">
              <c:forEach items="${cards}" var="c">
              	<tr>
                <td>
                  <input type="text" class="form-control tableIpt" value="${c.cardtype }" disabled="disabled">
                  <input type="hidden" name="card_id" value="${c.id }">
                  <!--洗车-->
                </td>
                <td>
                  <input type="text" name="balance" required class="form-control tableIpt" value="${c.balance }" style="background-color: white;" pattern="^(0|([0-9]+\.[0-9]*)|([0-9]+\.[0-9]*[1-9][0-9]*)|([1-9][0-9]*\.[0-9]+)|([1-9][0-9]*))$" oninvalid="setCustomValidity('请输入正确金额')" oninput="setCustomValidity('')">
                </td>
                <td>
                  <input type="text" name="practical" required class="form-control tableIpt" value="${c.practical }" style="background-color: white;" pattern="^(0|([0-9]+\.[0-9]*)|([0-9]+\.[0-9]*[1-9][0-9]*)|([1-9][0-9]*\.[0-9]+)|([1-9][0-9]*))$" oninvalid="setCustomValidity('请输入正确金额')" oninput="setCustomValidity('')">
                </td>
              </tr>
              </c:forEach>
            </table>
            <div id="mask2">
			  <div class="simpleAlertBody" style="width: 85%;left: 7%;height: 155px;">
			    <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove" style="top: 8px;right: 5px;"></i>
			    <div class="simpleAlertBodyContent text-center" style="height: 1.4rem;top: 20%;width: 88%;left: 8%;line-height: 1.4rem; ">
			      	确定后用户的账户余额将发生变动!
			    </div>
			    <button class="simpleAlertBtn simpleAlertBtn2" style="right: 53%;" id="alterCon">确定</button>
			    <button class="simpleAlertBtn simpleAlertBtn2" onClick="return false;" style="right: 22%;background-color: #bfbfbf !important;">取消</button>
			
			  </div>
			</div>
          </form>

          <div class="text-center " style=" margin-top: 40px;">
            <button class="btn edit" onClick="return false;">确定修改</button>
          </div>

        </div>
        <!--日报结束-->
      </section>
    </div>
  </div>
  
</div>
	<script type="text/javascript" src="/Qiqiang/static/js/footerKP.js"></script>
<!--弹窗开始-->

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
<script type="text/javascript" src="/Qiqiang/static/js/mask.js"></script>
<script>

    $(".edit").click(function () {
        $("#mask2").fadeIn();
        $("#mask2").height(window.innerHeight);
        $("#mask2").css("margin-left","-15px");
    });

    $(".simpleAlertBtn2").click(function(){
        $("#mask2").fadeOut();
    })
    
    $(".simpleAlertBodyClose").click(function(){
        $("#mask2").fadeOut();
    })
    $("#alterCon").click(function(){
    	
    })

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
</body>
</html>
