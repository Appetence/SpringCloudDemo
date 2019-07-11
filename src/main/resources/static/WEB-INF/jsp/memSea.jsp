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
<title>会员查询</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css"/>
<link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
	<style>
	.tableDiv {
	width: 100%;
	height: auto;
	overflow-x: scroll;
	overflow-y: scroll;
	}
	.table{
	margin-top:10px;
	margin-top:0.2rem;
	}
	.table-responsive{
		border:0px;
	}
	th,td{
    	white-space:nowrap;
    }
    i{
        	font-style:normal;
        }
	</style>
</head>
<body>
<div class="container">
    <div class="row">

        <div class="col-md-12 info-con">
            <p class="titleP"><i class="glyphicon glyphicon-search"></i> 客户查询</p>
            <section class="sec">
                <div class="row" style="padding: 0px 15px;margin-top: 10px;">
               		<form action="" method="post">
	                    <span>
	                        <input type="text" name="param" placeholder="姓名/手机号/车牌号" class="form-control" value="${statistic.param }" style="height:40px;">
	                    </span>
	                    <button type="submit" class="btn"  style="height:40px;margin-bottom:3px;">查询</button>
                    </form>
					<div class="tableDiv">
						<div class="table-responsive">
							<table class="table xfxq">
								<thead>
									<tr>
										<td>姓名</td>
										<td>车牌号</td>
										<td>卡余额</td>
										<td>操作</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${u_list }" var="u">
									<tr>
										<td>${u.name }</td>
										<td>${u.plateno }</td>
										<td>${u.balance }</td>
										<td><a href="/Qiqiang/SelfInfoController/selfInfo.action?user_id=${u.id }">查看</a></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
	                <div class="text-center">
	                    <input type="hidden" name="start" value="${statistic.start }">
	               	 	<input type="hidden" name="count" value="${statistic.count }">
	               	 	<input type="hidden" name="last" value="${statistic.last }">
	               	 	<input type="hidden" name="param" value="${statistic.param }">
	               	 	<input type="hidden" name="cur_page" value="${statistic.cur_page }">
	               	 	<input type="hidden" name="pages" value="${statistic.pages }">
	               	 	<p>共<i id="total">${statistic.total }</i>条记录&nbsp;&nbsp;第<i id="cur_page">${statistic.cur_page }</i>页&nbsp;&nbsp;共<i id="pages">${statistic.pages }</i>页</p>
	                   	<button class="btn trans_type" id="start">首页</button>
	                   	<button class="btn trans_type" id="prev">上一页</button>
	                   	<button class="btn trans_type" id="next">下一页</button>
	                   	<button class="btn trans_type" id="last">尾页</button>
	                </div>
                </div>
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
$(".trans_type").click(function(){
	var trans_type = $(this).attr("id");
	console.log("trans_type "+trans_type);
	var count = parseInt($("input[name='count']").val());
	var start = parseInt($("input[name='start']").val());
	var last = parseInt($("input[name='last']").val());
	var param = $("input[name='param']").val();
	var pages = parseInt($("input[name='pages']").val());
	var cur_page = parseInt($("input[name='cur_page']").val());
	var cur_page_cli = parseInt($("#cur_page").text());
	//alert("pages "+pages);
	//alert("cur_page "+cur_page);
	//alert("cur_page_cli "+cur_page_cli);
	//var oidx = parseInt($(".xfxq").find("tbody").find("tr").first().find("td").first().text());
	switch(trans_type){
	case "start":
		start = 0;
		//oidx = 1;
		$("#cur_page").text(cur_page);
		break;
	case "prev":
		start -= count;
		if (start < 0){
			start = 0;
			$("#cur_page").text(cur_page);
		}else{
			//oidx -= count;
			$("#cur_page").text(cur_page_cli - 1);
		}
		break;
	case "next":
		start += count;
		if (start > last){
			start = last;
			$("#cur_page").text(pages);
		}else{
			//oidx += count;
			$("#cur_page").text(cur_page_cli + 1);
		}
		break;
	case "last":
		start = last;
		//oidx = last + 1;
		$("#cur_page").text(pages);
		break;
	} 
	$("input[name='start']").val(start);
	$.post({
		url:"/Qiqiang/SelfInfoController/memPageTrans",
		data:{
			"start":start,
			"count":count,
			"param":param,
		},
		async:false,
		success:function(args){
			var pList = $.parseJSON(args).u_list;
			$(".xfxq").find("tbody").empty();
			$.each(pList,function(idx,val){
				var url = "/Qiqiang/SelfInfoController/selfInfo.action?user_id="+val.id
				$(".xfxq").find("tbody").append(
					"<tr><td>"+val.name+"</td><td>"+val.plateno+"</td><td>"+val.balance+"</td><td><a href="+url+">查看</a></td></tr>"
				)
				//oidx += 1;
			});
		}
	})
})
</script>
</body>
</html>
