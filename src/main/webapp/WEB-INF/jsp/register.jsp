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
<title>注册</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
<script rel="stylesheet" href="/Qiqiang/static/js/bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/register.css">
<style>
.row {
    margin-right: 0px;
    margin-left: 0px;
}
.col-xs-offset-1 {
    margin-left: 0%;
}
.ycOp{color:#999!important;}

</style>
</head>
<body>
<div class="container">
        <form class="bs-example bs-example-form" action="Register.action" method="post">
            <div class="row bcg">
                <div class="col-xs-11 col-xs-offset-1">
                    <span> * </span>
                    <input type="text" class="form-control emojiTxt" placeholder="请输入姓名" name="name" required="required" maxlength="6">
                    <i class="glyphicon glyphicon-user"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <span> * </span>
                    <input type="text" class="form-control" placeholder="请输入手机号码" name="mobile" maxlength="11" required="required"
											pattern="^1[3|4|5|6|7|8][0-9]{9}$"
											oninvalid="setCustomValidity('手机号格式不正确')"
											oninput="setCustomValidity('')">
                    <i class="glyphicon glyphicon-phone"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <span> * </span>
                    <input type="text" class="form-control emojiTxt" placeholder="请输入车牌号码" name="plateno" maxlength="10" required="required">
                    <i class="iconfont icon-che" ></i>
                </div><!-- /.col-xs-6 -->
             <!--   <div class="col-xs-11 col-xs-offset-1">
                    <input type="date" class="form-control" placeholder="请选择验车日期" name="validate_date">
                    <i class="iconfont icon-yanche"></i>
                </div> /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <select name="coty" id="coty" class="form-control" name="coty" >
                    <option value="0~6年" selected="selected" style="display:none;" class="ycOp">请选择车龄</option>
                        <option value="0~6年">0~6年</option>
                        <option value="7~15年">7~15年</option>
                        <option value="15年以上">15年以上</option>
                    </select>
                    <i class="iconfont icon-cheling-" style="font-size: 26px"></i>
                </div><!-- /.col-xs-6 -->
                <div class="col-xs-11 col-xs-offset-1">
                    <button class="btn btn-block " id='zc' type="button">注册</button>
                    <p>标 * 为必填项</p>
                </div><!-- /.col-xs-6 -->
            </div><!-- /.row -->
        </form>
</div>
<script type="text/javascript" src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
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
	
	
	$("#zc").click(function(){
	var flag;
	var name=$("input[name='name']").val();
	var over=$("#over").length;
	if(over>0){
	layer.msg("请不要重复注册");
	return false;
	}
	
	if($.trim(name).length<1){
	layer.msg("请输入用户姓名");
	return false;	
	}
	else{
	var mobile=$("input[name='mobile']").val();
	  if(!(/^1[34578]\d{9}$/.test(mobile))){ 
		  layer.msg("请输入正确手机号");  
	        return false; 
	    }
	  if(!($.trim(mobile).length==11)){
		  layer.msg("请输入正确手机号");  
	        return false; 
	  }
	$.ajax({
			url : "getmobile.action",
			type : "post",
			async : false,
			timeout : "1000",
			data : {
				"mobile" : mobile
			},
			success : function(data) {
				if (data.length!=0) {
					layer.msg("手机号已被注册");
					$("#mobile").val("");
					flag=  false;
				}
			},
			error : function(XMLResponse) {
				alert("数据异常");
			}
		});
	//车牌号校验
	var plateno = $("input[name='plateno']").val();
	if($.trim(plateno).length<7 ||$.trim(plateno).length>10){
		layer.msg("请输入正确的车牌号");
		return false; 
	}
	/* var express = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
	if(!(express.test(plateno))){
		layer.msg("请输入正确的车牌号");
		return false; 
	} */
	
	$.ajax({
		url : "getCarNumber.action",
		type : "post",
		async : false,
		timeout : "1000",
		data : {
			"plateno" : plateno
		},
		success : function(data) {
			if (data.length!=0) {
				layer.msg("车牌号已被注册");
				$("input[name='plateno']").val("");
				return  false;
			}else{
			if(flag==false){
			return false;
			}
				$("button").attr('disabled',true);
				$("body").append("<input type='hidden' id='over'/>");
					$("form").submit(); 
					return true;
					
				
			}
		},
		error : function(XMLResponse) {
			alert("数据异常");
		}
	});
	
	
	
	}
	
	})
</script>
	
	<script>
	
	
	var regStr = /[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF][\u200D|\uFE0F]|[\uD83C|\uD83D|\uD83E][\uDC00-\uDFFF]|[0-9|*|#]\uFE0F\u20E3|[0-9|#]\u20E3|[\u203C-\u3299]\uFE0F\u200D|[\u203C-\u3299]\uFE0F|[\u2122-\u2B55]|\u303D|[\A9|\AE]\u3030|\uA9|\uAE|\u3030/ig;
								
								$("body").delegate(".emojiTxt","keyup",function(){
									$(this).val($(this).val().replace(regStr, '').replace(/(\s*$)/g, ""));
									
								});
								
	  
	</script>
</body>
</html>
