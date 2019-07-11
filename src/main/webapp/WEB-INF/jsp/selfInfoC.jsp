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
        <title>个人信息</title>
        <link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
        <link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
        <link rel="stylesheet" href="/Qiqiang/static/css/selfInfo.css"/>
        <link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
        <style>
        	.simpleAlertBtn3 {
			    left: 15%;
			    position: absolute;
			    width: 70px;
			    height: 34px;
			    top: 60%;
			    border: 1px solid #bfbfbf;
			    cursor: pointer;
			    border-radius: 5px;
			    color: #fff;
			    font-size: 16px;
			}
			.simpleAlertBtn2 {
			    position: absolute;
			    width: 70px;
			    height: 34px;
			    top: 60%;
			    border: 1px solid #bfbfbf;
			    cursor: pointer;
			    border-radius: 5px;
			    color: #fff;
			    font-size: 16px;
			}
        </style>
        </head>
        <body>
        <div class="container">
        <div class="row">

        <form action="" method="post">
        <div class="info-con" style="margin-bottom: 0rem;">
            <p class="titleP" style="padding-left: 0.3rem;"><i class="glyphicon glyphicon-user"></i> &nbsp;个人信息</p>
            <section class="sec" style="background-color: white;padding: 0.1rem 0rem 0.2rem">
                <div class="row">
                    <span class="col-md-2">姓名</span>
                    <span class="col-md-10">
                        <input type="text" class="form-control" value="${customer.name}" name="name" required>
                        <input type="hidden" name="update_flag" value="update_flag">
                        <input type="hidden" name="id" value="${customer.id }">
                    </span>
                </div>
                <div class="row">
                    <span class="col-md-2">性别</span>
                    <span class="col-md-10">
                        <select name="gender" id="" class="form-control">
                            <option value="男" <c:if test="${customer.gender == '男' }">selected</c:if>>男</option>
                            <option value="女" <c:if test="${customer.gender == '女' }">selected</c:if>>女</option>
                        </select>
                    </span>
                </div>
                <div class="row">
                    <span class="col-md-2">手机号码</span>
                    <span class="col-md-10">
                        <input type="number" name="mobile" class="form-control" value="${customer.mobile}" required>
                    </span>
                </div>
                <div class="row">
                    <span class="col-md-2">地址</span>
                    <span class="col-md-10">
                        <input type="text" name="address" class="form-control" value="${customer.address}">
                    </span>
                </div>

                <div class="row">
                    <span class="col-md-2">会员卡号</span>
                    <span class="col-md-10">
                        <input type="number" disabled style="background-color:#fff" class="form-control" value="${card.cardid }">
                    </span>
                </div>
                <div class="row">
                    <span class="col-md-2">会员积分</span>
                    <span class="col-md-10">
                        <input type="number" disabled style="background-color:#fff" class="form-control" value="">
                    </span>
                </div>
                <div class="row">
                    <span class="col-md-2" style="width:32%;">会员卡余额</span>
                    <span class="col-md-10" style="width:45%;">
                        <input type="number" disabled style="background-color:#fff" class="form-control" value="${card.balance }">
                    </span>
                	<c:if test="${role == 'user' }">

                   	<span class="col-md-4 " id="modifyBtn" style="width:17%;font-size: 14px!important;border: 1px solid #48a3da;padding: 0.06rem
        0.1rem;border-radius: 0.15rem;color:#48a3da;margin-left:0.15rem;"><i class="glyphicon glyphicon-pencil"></i>修改 </span>

                	</c:if>  
                </div>
                <div class="row">
                    <span class="col-md-2">实际充值金额</span>
                    <span class="col-md-10">
                        <input type="number" disabled style="background-color:#fff" class="form-control" value="${card.practical }">
                    </span>
                </div>
                <div class="row">
                    <span class="col-md-2">剩余洗车次数</span>
                    <span class="col-md-10">
                        <input type="number" disabled style="background-color:#fff" class="form-control" value="${card.timest }">
                    </span>
                </div>
            </section>
        <!--<div class="text-center" style="margin-top: 20px">-->
        <!--<button class="btn btn-primary" style="background-color: #48a3da">修改</button>-->
        <!--</div>-->
        </div>
        <div class="info-con">
        <p class="titleP" style="padding-left: 0.3rem;">
        <i class="iconfont icon-car"></i> &nbsp;车辆信息
        <%-- <c:if test="${user.id == customer.id }"> --%>
        <span class="pull-right addCar" style="font-size: 14px!important;border: 1px solid #48a3da;padding: 0.04rem
        0.1rem;border-radius: 0.15rem;margin-right:0.25rem;"><i class="glyphicon glyphicon-plus"></i> 新增</span>
       <%--  </c:if> --%>
        </p>
            <c:forEach items="${cars }" var="car" varStatus="st">
        <section class="sec" style="background-color: white;padding: 0.1rem 0rem 0.2rem">
        <div class="row">
	        <span class="col-md-4" style="width:32%;">车牌号</span>
	        <span class="col-md-4" style="width:45%;">
               	<input type="hidden" name="car_id" value="${car.id }"> 
                   <input type="text" class="form-control" name="plateno" required value="${car.plateno }" required>
                  </span>
                	<c:if test="${ st.index > 0 }">
                       <span class="col-md-4 " style="width:17%;"><button class="btn btn_delete"  style="font-size: 12px!important;padding: 0.04rem
        0.1rem;border-radius: 0.15rem;" onClick="return false;" car_id="${car.id }" del_plateno="${car.plateno}"> 删除</button> </span>
                	</c:if> 
                </div>
                <div class="row">
                    <span class="col-md-2">车型</span>
                    <span class="col-md-10">
                        <input type="text" class="form-control" name="vehicle" value="${car.vehicle }">
                    </span>
                </div>
                <div class="row">
                    <span class="col-md-2">车险日期</span>
                    <span class="col-md-10">
                            <input type="date" class="form-control" name="insurance_date" value="${car.insurance_date_str }">
                       </span>
                </div>
                <div class="row">
                    <span class="col-md-2">验车日期</span>
                    <span class="col-md-10">
                            <input type="date" class="form-control" name="validate_date" value="${car.validate_date_str }">
                       </span>
                </div>
                <div class="row">
                    <span class="col-md-2">车龄</span>
                    <span class="col-md-10">
                            <select name="coty" id="" class="form-control">
                                <option value="0-6年" <c:if test="${car.coty == '0-6年' }">selected</c:if>>0-6年</option>
                                <option value="7-15年" <c:if test="${car.coty == '7-15年' }">selected</c:if>>7-15年</option>
                                <option value="15年以上" <c:if test="${car.coty == '15年以上' }">selected</c:if>>15年以上</option>
                            </select>
                       </span>
                </div>
                <div style="border-bottom: 2px solid #999;padding: 2px 0px;padding: 0.15rem 0rem;position: relative;width: 100%;margin: 0 auto;"></div>
            </section>
            </c:forEach>
            <div class="text-center" style="margin-top: 20px">
            <%-- <c:if test="${user.id == customer.id }"> --%>
            <input type="button" id="qd" class="btn sure" style="background-color: #48a3da;color:#fff" value="确定">
            <%-- </c:if> --%>
            </div>
        </div>
		<!--弹窗开始-->
                <div id="mask">
                        <!--确定弹窗开始-->
                        <div class="simpleAlertBody">
                                <i class="simpleAlertBodyClose glyphicon glyphicon-remove"></i>
                                <p class="simpleAlertBodyContent">确定后信息就修改了哦~</p>
                                <button class="simpleAlertBtn2" style="background-color: #aaa!important;" onClick="return false;">取消</button>
                                <button type="submit" class="simpleAlertBtn simpleAlertBtn1" id="formConfirm">确定</button>
                        </div>
                </div>
                <div id="mask3" style="display:none">
                        <!--确定弹窗开始-->
                        <div class="simpleAlertBody">
                                <i class="simpleAlertBodyClose glyphicon glyphicon-remove"></i>
                                <p class="simpleAlertBodyContent" style="text-align:left;left:7%;">是否删除车辆？车牌号：<span id="del_plateno"></span></p>
                                <button class="simpleAlertBtn2" style="background-color: #aaa!important;"onClick="return false;">取消</button>
                                <input type="hidden" name="del_car_id">
                                <button type="submit" class="simpleAlertBtn3" id="delCon" onClick="return false;">确定</button>
                        </div>
                </div>
                <!--确定弹窗结束-->
		</form>



        <!-- <div class="info-con col-md-12">
            <p class="titleP" style="padding-left: 0rem;"><i class="iconfont icon-car" style="font-size: 20px"></i> &nbsp;车辆信息</p>
           <section class="secCar">
               <div class="secCar-top">
                    <div><i class="iconfont icon-che secCarI"></i></div>
                    <div>
                        <p style="font-size: 16px;">法拉利</p>
                    </div>
                   <div class="pull-right" style="margin-top: 5%;">
                       <p><i class="glyphicon glyphicon-edit"></i> 编辑</p>
                       <p><i class="glyphicon glyphicon-plus"></i> 新增</p>
                   </div>
               </div>
               <div class="secCar-con">
                   <div class="row">
                       <span class="col-md-2">车牌号</span>
                       <span class="col-md-10">
                            京A13930
                       </span>
                   </div>
                   <div class="row">
                       <span class="col-md-2">车型</span>
                       <span class="col-md-10">
                            法拉利
                       </span>
                   </div>
                   <div class="row">
                       <span class="col-md-2">车险日期</span>
                       <span class="col-md-10">
                            2019/08/07
                       </span>
                   </div>
                   <div class="row">
                       <span class="col-md-2">验车日期</span>
                       <span class="col-md-10">
                            2018/08/07
                       </span>
                   </div>
                   <div class="row">
                       <span class="col-md-2">车龄</span>
                       <span class="col-md-10">
                            3年
                       </span>
                   </div>
               </div>
           </section>
        </div> -->

    </div>

      </div>
<script type="text/javascript" src="/Qiqiang/static/js/footer.js"></script>
      
      <!--新增弹窗开始-->
<div id="mask2">
<div class="simpleAlertBody" style="height: 300px;top: 25%;">
  <i class="simpleAlertBodyClose glyphicon glyphicon-remove"></i>
  <p class="simpleAlertBodyContent">
  <section class="sec" style="margin-top: 5%;">
          <div class="row">
                  <span class="col-md-2">车牌号</span>
                  <span class="col-md-10">
    <input type="text" class="form-control" name="_plateno">
    <span style="color:red" class="hidden err" id="plateno_err"></span>
    </span>
                                </div>
                                <div class="row">
                                        <span class="col-md-2">车型</span>
                                        <span class="col-md-10">
<input type="text" class="form-control" name="_vehicle">
<span style="color:red" class="hidden err" id="vehicle_err"></span>
</span>
                                </div>
                                <div class="row">
                                        <span class="col-md-2">车险日期</span>
                                        <span class="col-md-10">
<input type="date" class="form-control" name="_insurance_date">
<span style="color:red" class="hidden err" id="insurance_date_err"></span>
</span>
                                </div>
                                <div class="row">
                                        <span class="col-md-2">验车日期</span>
                                        <span class="col-md-10">
<input type="date" class="form-control" name="_validate_date">
<span style="color:red" class="hidden err" id="validate_date_err"></span>
</span>
                                </div>
                                <div class="row">
                                        <span class="col-md-2">车龄</span>
                                        <span class="col-md-10">
<select name="_coty" id="" class="form-control">
<option value="0-6年">0-6年</option>
<option value="7-15年">7-15年</option>
<option value="15年以上">15年以上</option>
</select>
<span style="color:red" class="hidden err" id="coty_err"></span>
</span>
                      </div>
              </section>
              </p>
              <div class="hidden" id="adderr">${adderr }</div>
              <input type="hidden" id="_customer_id" value="${customer.id }">
              <button class="simpleAlertBtn2" style="background-color: #aaa!important;top: 84%;" onClick="return false;">取消</button>
              <button class="simpleAlertBtn simpleAlertBtn3" id="addConfirm" style="top: 84%;">确定</button>
                </div>
                <!--新增弹窗结束-->
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
    <script type="text/javascript" src="/Qiqiang/static/js/mask.js"></script>
<script>
  $(".simpleAlertBtn,.simpleAlertBodyClose").click(function () {
  $("#mask").fadeOut();
  $("#mask3").fadeOut();
  if ($(this).attr("id") == 'addConfirm'){
  	//车辆录入
  	var plateno = $("input[name='_plateno']").val();
  	var vehicle = $("input[name='_vehicle']").val();
  	var insurance_date = $("input[name='_insurance_date']").val();
  	var validate_date = $("input[name='_validate_date']").val();
  	var customer_id = $("#_customer_id").val();
  	var coty = $("input[name='_coty']").val();
  	var $platenoStr = $("input[name='_plateno']").val();
  	if($platenoStr.replace(/\s/g,"") == ""){
  		alert("车牌号格式不正确");
  		return false;
  	}
  	$.post({
  		url:"/Qiqiang/SelfInfoController/addCar",
  		data:{
  			"plateno":plateno,
  			"vehicle":vehicle,
  			"insurance_date":insurance_date,
  			"validate_date":validate_date,
  			"coty":coty,
  			"user_id":customer_id
  		},
  		async:false,
  		success:function(args){
  			var return_message = $.parseJSON(args);
  			var add_flag = return_message.add_flag;
  			switch(add_flag){
  			case "false":
  				//console.log("进入 flase 分枝")
  				alert(return_message.plateno_err);
  				break;
  			case "error":
  				//console.log("进入 error 分枝")
  				alert(return_message.adderr);
  				break;
  			case "true":
  				//console.log("进入 true 分枝")
  				location.href="/Qiqiang/SelfInfoController/selfInfo.action?user_id="+customer_id;
  			}
  		}
  	})
  }
  if ($(this).attr("id") != 'addConfirm'){
  	$("#mask2").fadeOut();
  }
  
  })
  $(".sure").click(function () {
  $("#mask").fadeIn();
  })
  $(".addCar").click(function () {
      $("#mask2").fadeIn();
  })
  
 	$("form").submit(function(){
	var nameStr = $("input[name='name']").val();
      if(nameStr.replace(/\s/g,"") == ""){
      	alert('请输入正确姓名格式');
      	return false; 
      }
      var mobileStr = $("input[name='mobile']").val();
      if(mobileStr.replace(/\s/g,"") == ""){
      	alert("请输入正确手机号格式");
      	return false;
      }
      var m_pattern = /^[1][3,4,5,7,8][0-9]{9}$/;
      if(!m_pattern.test(mobileStr)){
      	alert("请输入正确手机号格式");
      	return false; 
      }
      var $plateno = $("input[name='plateno']");
      var plateno_flag = true;
      $plateno.each(function(){
      	if(($(this).val()).replace(/\s/g,"") == ""){
      		plateno_flag = false;
      		return false;
      	}
      })
      if (!plateno_flag){
      	alert('请输入正确车牌号格式');
      	return false;
      }
      
      var mobile = mobileStr.replace(/\s/g,"");
      var id = $("input[name='id']").val();
      var tj_flag = 1;
      $.post({
    	  url:"/Qiqiang/SelfInfoController/chkMobile.action",
    	  data:{"mobile":mobile,"id":id},
    	  async:false,
    	  success:function(args){
    		  if (args == 'repeat'){
    			  alert("手机号与其他用户重复");
    			  tj_flag = 0;
    		  }
    	  }
      });
      if (tj_flag == 0){
    	  return false;
      }
      
  })
  </script>
  <script>
  	$(".btn_delete").click(function(){
  		var del_plateno = $(this).attr("del_plateno");
  		$("#del_plateno").text(del_plateno);
  		var car_id = $(this).attr("car_id");
  		$("input[name='del_car_id']").val(car_id);
  		$("#mask3").fadeIn();
  		
  	})
  </script>
  <script>
  	$(".simpleAlertBtn2").click(function(){
  		$("#mask").fadeOut();
  		$("#mask2").fadeOut();
  		$("#mask3").fadeOut();
  	})
  </script>
  <script>
  	$("#delCon").click(function(){
  		var car_id = $("input[name='del_car_id']").val();
  		var plateno = $("#del_plateno").text();
  		$.post({
  			url:"/Qiqiang/SelfInfoController/delCar",
  			data:{
  				"id":car_id,
  				"plateno":plateno
  			},
  			async:false,
  			success:function(args){
  				switch(args){
  				case "success":
  					window.location.reload();
  					break;
  				case "forbidden":
  					alert("该车辆已有交易记录,暂不支持删除!");
  					break;
  				case "error":
  					alert("操作失败,请重试!");
  					break;
  				}
  			},
  			error:function(args){
  				alert("操作失败,请重试!");
  			}
  		})
  	})
  </script>
  <script>
  	$("#modifyBtn").click(function(){
  		var user_id = $("input[name='id']").val();
  		location.href="/Qiqiang/SelfInfoController/modifyCard?user_id="+user_id;
  	})
  </script>
</body>
</html>

