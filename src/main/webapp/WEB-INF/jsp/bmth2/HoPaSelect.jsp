 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>会员卡</title>
<link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/commom.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/memSea.css" />
<link rel="stylesheet" href="/Qiqiang/static/css/inde.css" />
<link rel="stylesheet" type="text/css"
	href="/Qiqiang/static/css/iconfont.css">

<style>
.toUpSec .row {
	width: 100%;
	margin: 0.2rem 0rem 0rem;
}

.toUpSec .row .col-md-2 {
	padding-left: 0rem !important;
}

.toUpSec .row .col-md-10 {
	display: inline-block;
	width: 72%;
}

.table {
	margin-top: 10px;
	margin-top: 0.2rem;
}

.tableDiv {
	width: 100%;
	height: auto;
	overflow-x: scroll;
	overflow-y: scroll;
}

.tableDiv>div {
	overflow-x: scroll;
}

.table-responsive {
	border: 0px;
}

.list {
	overflow: auto;
	overflow-y: auto;
	overflow-x: auto;
}

.list::-webkit-scrollbar-track-piece {
	background-color: rgba(0, 0, 0, 0);
	border-left: 1px solid rgba(0, 0, 0, 0);
	margin-top: 10px;
	margin-top: 0.2rem;
}

.list::-webkit-scrollbar {
	width: 5px;
	height: 0px;
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

.list1::-webkit-scrollbar {
	width: 0px;
	height: 8px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}
table td{vertical-align:middle!important;	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 info-con">
				<form action="/Qiqiang/SelfInfoController/bmthInfo.action" method="post"
					ID="topup">
					<section class="sec" style='margin-top: 15px;'>
						<div>
							<input type="hidden" value="${k}" id="k"> <input
								type="hidden" value="${user.pass}" id="userpass">
							<div class="row" style="padding: 0px 15px;margin-top: 10px;">
								<span> <input type="text" id="search_user" name="value" value="${value}"
									placeholder="姓名/手机号/车牌号" class="form-control"
									style="height:50px;font-size:16px;"> </span>
								<button type="button" class="btn" id="search"
									style="height:48px;margin-bottom:3px;">查询</button>
							</div>

							<div class="tableDiv">
								<div class="list table-responsive">
									<table class="table infotable" id="select_user">
										<tr id="sysinfo">
											<th >操作</th>
											<th >姓名</th>
											<th >车牌号</th>
											<th >手机号</th>
											<th >卡类型</th>
										</tr>
										<c:forEach items="${userlist}" var="user">
										<tr class='searchinfo' car_id="${user.bid }">
											<td class="td-tableCZButton"><a href="/Qiqiang/deductions?car_id=${user.bid }"><button class='tableCZButton btn'  type="button" style="padding: 0px 0px;">扣&nbsp;&nbsp;减</button></a></td>
											<td><a>${user.name}</a></td>
											<td><a>${user.plateno}</a></td>
											<td><a>${user.mobile}</a></td>
											<td><a>${user.level}</a></td>
										</tr>
										</c:forEach>
									</table>
										<input type='hidden' name='page' id="page" value="${pageinfo.pageNum}">
										<input type='hidden' id='pages' value="${pageinfo.pages}">
							
								</div>
							</div>
							<c:if test="${e_flag != '1' }">
							<center>共${pageinfo.total}条数据   当前第${pageinfo.pageNum}页   共${pageinfo.pages}页</center>
									
									<div class="text-center" id="btnDiv">
										<button class="btn jump" type='button' targ="1">首页</button>
										<button class="btn jump" type='button' targ="${pageinfo.prePage}">上一页</button>
										<button class="btn jump" type='button' targ="${pageinfo.nextPage}">下一页</button>
										<button class="btn jump" type='button' targ="${pageinfo.pages}">尾页</button>
									</div>
                                    </c:if>
						</div>
						<!--日报结束-->
					</section>

				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/Qiqiang/static/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="/Qiqiang/static/js/footerHP.js"></script>

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
		$(".titleDiv span").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
		});
		
		$("#search").click(function(){
		$("input[name='page']").val(1);
		$("form").submit();
		});
		$(".jump").click(function(){
		var page=$(this).attr("targ");
		var pages=$("#pages").val();
		if(Number(page)>Number(pages)){
		$("input[name='page']").val(1);
		}
		$("input[name='page']").val(page);
		$("form").submit();
		});
		$(".searchinfo").click(function(){
			location.href="mainPage.action?bid="+$(this).attr("car_id");
		})
		$.post({
		url:"/Qiqiang/getPermission.action",
		async:false,
		data:{},
		success:function(args){
			var consume = args.consume;
			if (consume ==null || consume == ""){
				$(".td-tableCZButton").find("a").attr("href","javascript:void(0);");
				$('tr').find('th:eq(0)').hide(); $('tr').find('td:eq(0)').hide();
			}
		}
		});
	</script>
</body>
</html>
