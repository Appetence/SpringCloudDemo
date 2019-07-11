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
    <title>统计报表</title>
    <link rel="stylesheet" href="/Qiqiang/static/css/bootstrap.css"/>
    <link rel="stylesheet" href="/Qiqiang/static/css/commom.css"/>
    <link rel="stylesheet" href="/Qiqiang/static/css/staReport.css"/>
<link rel="stylesheet" href="/Qiqiang/static/css/scrollTable.css" />
    <link rel="stylesheet" type="text/css" href="/Qiqiang/static/css/iconfont.css">
    <link rel="stylesheet" href="/Qiqiang/static/css/daterangepicker.css">
    <style>
        select {
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            background-color:#48a3da!important;
            color:#fff!important;
            padding-left:0.5rem!important;
        }
    .tableDiv {
    width: 100%;
    height: auto;
    overflow-x: scroll;
    overflow-y: scroll;
    }
    .table{
    margin-top:10px;
    margin-top:0.2rem;
    margin-bottom:0px;
    }
    th,td{
    	white-space:nowrap;
    }
    i{
        	font-style:normal;
        }
        .seeClass span{
	display: block;
    padding: 3px 6px;
    margin-left: 20px;
    font-size: 14px;
}
    </style>
</head>
<body>
<div class="container">
    <div class="row">

        <div class="col-md-12 info-con">
            <p class="titleP"><i class="iconfont icon-tongjibaobiao"></i> 统计报表</p>
            <section class="sec">
                <div class="titleDiv">
                    <span id="ribao">日报</span><span id="huizong">汇总</span><span class="active">查询统计</span>
                </div>
                <!--查询统计开始-->
                <div id="Three" class="">
                    <!--充值项目开始-->
                    <div class="row" style="padding: 0px 15px;margin-top: 10px;">
                        <b>充值消费情况</b>
                    </div>
                    <div style="margin-top: 0.2rem;">
                        <p>
                            <button class="btn" id="daterange-btn">
                                <span id="rc_date_choice">
                                  	 日期选择
                                </span>
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <select name="" id="rc_query_type" class="form-control" style="background-color: #48a3da;width:30%;float:right">
                                <option value="day">按天查询</option>
                                <option value="month">按月查询</option>
                            </select>
                        </p>
                        <p>
                            <select name="" id="rc_select" class="form-control" style="display: inline-block;width: 80%;">
                                <option value="all">全部客户</option>
                                <!-- <option value="new">新用户</option>
                                <option value="old">老用户</option> -->
                            </select>
                            <button class="btn" id="rc_query">查询</button>
                        </p>
                    </div>
                    <div id="ThreeBar"  style="height: 100%;height:200px!important;"></div>
                    <!--充值项目结束-->
                    <!--消费项目开始-->
                    <div class="row" style="padding: 0px 15px;margin-top: 0.1rem;">
                        <b>消费项目占比</b>
                    </div>
                    <div style="margin-top: 0.2rem;">
                        <p>
                            <button class="btn" id="daterange-btn2">
                                <span id="service_date_choice">
                                  	 日期选择
                                </span>
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <!-- <select name="" id="service_query_type" class="form-control" style="background-color: #48a3da;width:30%;float:right">
                                <option value="day">按天查询</option>
                                <option value="month">按月查询</option>
                            </select> -->
                        </p>
                        <p>
                            <select name="" id="service_select" class="form-control" style="background-color: #48a3da;display: inline-block;width: 80%;">
                                <option value="all">全部客户</option>
                                <!-- <option value="new">新客户</option>
                                <option value="old">老客户</option> -->
                            </select>
                            <button class="btn" id="service_query">查询</button>
                        </p>
                    </div>
                    <div id="ThreePie"  style="height: 100%;height:260px!important;"></div>
                    <!--消费项目结束-->
                    <!--综合查询开始-->
                    <div class="row" style="padding: 0px 15px;margin-top: 0.1rem;">
                        <b>综合查询</b>
                    </div>
                    <div style="margin-top: 0.2rem;">
                        <p>
                        	<button class="btn" id="daterange-btn3">
                                <span id="zhcx_date_choice">
                                  	日期选择
                                </span>
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <select name="svr_item_id" id="zhcx_select" class="form-control" style="background-color: #48a3da;display: inline-block;width: 30%;float: right;">
                                <option value="all">全部项目</option>
                               	<c:forEach items="${p_list }" var="p">
                                <option value="${p.id }">${p.svr_item }</option>
                                </c:forEach>
                            </select>
                            <div>
                                <span><input style="width: 80%;display: inline-block;" type="text" placeholder="姓名/手机号/车牌号" class="form-control" id="zhcx_param"></span> <button class="btn" id="zhcx_query">查询</button>
                            </div>
                        </p>

                        <div class="tableDiv">
                            <div style="width:100%;" class="list">
                                <table class="table xfxq" >
	                                <thead>
	                                	<tr>
	                                        <th>项目</th>
	                                        <!--<th>支付类型</th>-->
	                                        <th>姓名</th>
	                                        <th>车牌号</th>
	                                        <th>手机号</th>
	                                        <th>金额</th>
	                                        <th>赠送金额</th>
	                                        <!--<th>余额</th>-->
	                                        <th>消费次数</th>
	                                        <th>剩余次数</th>
	                                        <th>消费时间</th>
	                                        <th>余额</th>
	                                        <th>赠送项目</th>
	                                        <th>备注</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach items="${u_list }" var="u" >
	                                		<tr>
		                                        <td>${u.svr_item }</td>
		                                        <!--<td>米其林</td>-->
		                                        <td>${u.name }</td>
		                                        <td>${u.plateno }</td>
		                                        <td>${u.mobile }</td>
		                                        <td style="text-align: center;">${u.price_s }</td>
		                                        <td style="text-align: center;">
		                                        
		                                        <c:if test="${u.practical == null || empty u.practical}">
		                                        
		                                        0
		                                        </c:if>
		                                          <c:if test="${u.practical != null || !empty u.practical}">
		                                        
		                                        ${u.practical }
		                                        
		                                        </c:if>
		                                        
		                                       </td>
		                                        <!--<td>3年</td>-->
		                                         <td>
		                                         	<c:if test="${empty u.record_number || u.record_number == null}">
		                                         	
		                                         	0
		                                         	
		                                         	</c:if>
		                                         	<c:if test="${!empty u.record_number || u.record_number != null}">
		                                         	
		                                         	${u.record_number }
		                                         	
		                                         	</c:if>
		                                        <td>
		                                       		<c:if test="${empty u.realnumber || u.realnumber==null }">
		                                       		0
		                                       		</c:if>
		                                       		<c:if test="${ !empty u.realnumber || u.realnumber != null}">
		                                       		 ${u.realnumber }
		                                       		</c:if>
		                                        <td>${u.date }</td>
		                                        <td>${u.balance }</td>
		                                        <td style="text-align: center;">
		                                        	<c:if test="${u.flag == 1 }">
		                                        		<a class="giftInf">查看</a>
		                                        		<input type="hidden" value = "${u.record_id }" />
		                                        	</c:if>
		                                        	<c:if test="${u.flag != 1 }">
		                                        		<a>无</a>
		                                        	</c:if>
		                                        
		                                        </td>
		                                        <td><a class= "selectRemark">详情</a>
																<input name = "myRemark" class="myRemark" type="hidden" readonly="readonly" value="${record.remark}"/>
												</td>
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

                    <!--综合查询结束-->
                </div>
                <!--查询统计结束-->
            </section>
        </div>
    </div></div>
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
<script type="text/javascript" src="/Qiqiang/static/js/moment.js"></script>
<script type="text/javascript" src="/Qiqiang/static/js/daterangepicker.js"></script>
<script type="text/javascript" src="/Qiqiang/static/layer/layer.js"></script>
<!--日期JS-->
<script type="text/javascript">
    var locale = {
        "format": 'YYYY-MM-DD',
        "separator": " - ",//
        "applyLabel": "确定",
        "cancelLabel": "取消",
        "fromLabel": "起始时间",
        "toLabel": "结束时间'",
        "customRangeLabel": "自定义",
        "weekLabel": "W",
        "daysOfWeek": ["日", "一", "二", "三", "四", "五", "六"],
        "monthNames": ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        "firstDay": 1
    };
            $('#daterange-btn').daterangepicker({
            "locale": locale,
            ranges: {
                '本周': [moment().startOf('week'), moment().endOf('week')],
                '本月': [moment().startOf('month'), moment().endOf('month')]
            },
            startDate: moment(),
            endDate: moment().endOf('month')
        },
        function(start, end) {
            $('#daterange-btn span').html(start.format('YYYY/MM/DD') + ' - ' + end.format('YYYY/MM/DD'));
            //alert(start.format('YYYYMMDD') + " " + end.format('YYYYMMDD'));
        }
    );
    $('#daterange-btn2').daterangepicker({
            "locale": locale,
            ranges: {
                '本周': [moment().startOf('week'), moment().endOf('week')],
                '本月': [moment().startOf('month'), moment().endOf('month')]
            },
            startDate: moment(),
            endDate: moment().endOf('month')
        },
        function(start, end) {
            $('#daterange-btn2 span').html(start.format('YYYY/MM/DD') + ' - ' + end.format('YYYY/MM/DD'));
            //alert(start.format('YYYYMMDD') + " " + end.format('YYYYMMDD'));
        }
    );
    $('#daterange-btn3').daterangepicker({
            "locale": locale,
            ranges: {
                '本周': [moment().startOf('week'), moment().endOf('week')],
                '本月': [moment().startOf('month'), moment().endOf('month')]
            },
            startDate: moment(),
            endDate: moment().endOf('month')
        },
        function(start, end) {
            $('#daterange-btn3 span').html(start.format('YYYY/MM/DD') + ' - ' + end.format('YYYY/MM/DD'));
            //alert(start.format('YYYYMMDD') + " " + end.format('YYYYMMDD'));
        }
    );

    //Date picker
    // $('#datepicker').datepicker({
    //     autoclose: true
    // });
</script>
<script type="text/javascript" src="/Qiqiang/static/js/echarts.min.js"></script>
<!--柱状图JS-->
<script type="text/javascript">
    var dom = document.getElementById("ThreeBar");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '堆叠柱状图';

    option = {
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data:['充值','消费']
        },
        grid: {
            top:'12%',
            left: '0%',
            right: '4%',
            bottom: '3%',
            containLabel: true,
            borderWidth: 1,
            height:150
        },
        xAxis : [
            {
                type : 'category',
                data : ['1.1','1.2','1.3']
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'充值',
                type:'bar',
                data:[320, 632, 771],
                itemStyle: {   
                    //通常情况下：
                    normal:{  
                       color: function (params){
                           var colorList = ['rgb(97,192,222)'];
                           return colorList[params.dataIndex];
                       }
                    },
                },
            },
            {
                name:'消费',
                type:'bar',
                stack: '广告',
                data:[420, 332, 201],
                itemStyle: {   
                    //通常情况下：
                    normal:{  
                       color: function (params){
                           var colorList = ['rgb(243,164,59)'];
                           return colorList[params.dataIndex];
                       }
                    },
                },
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
    
    function rcCharts(d_list,r_list,c_list){
    	var dom = document.getElementById("ThreeBar");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        app.title = '堆叠柱状图';

        option = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data:['充值','消费']
            },
            grid: {
                top:'12%',
                left: '0%',
                right: '4%',
                bottom: '3%',
                containLabel: true,
                borderWidth: 1,
                height:150
            },
            xAxis : [
                {
                    type : 'category',
                    data : d_list
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'充值',
                    type:'bar',
                    data:r_list,
                    itemStyle: {   
                        //通常情况下：
                        normal:{  
                           color: function (params){
                               var colorList = ['rgb(97,192,222)'];
                               return colorList[params.dataIndex];
                           }
                        },
                    },
                },
                {
                    name:'消费',
                    type:'bar',
                    stack: '广告',
                    data:c_list,
                    itemStyle: {   
                        //通常情况下：
                        normal:{  
                           color: function (params){
                               var colorList = ['rgb(243,164,59)'];
                               return colorList[params.dataIndex];
                           }
                        },
                    },
                }
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    	
    }
</script>

<!--饼状图JS-->
<script type="text/javascript">
	var color_list_first = ['rgb(97,192,222)','rgb(243,164,59)','rgb(40,114,123)'];
    var dom = document.getElementById("ThreePie");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title : {
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        color:color_list_first,
        series : [
            {
                name: '访问来源',
                type: 'pie',
                radius : '72%',
                center: ['50%', '60%'],
                data:[
                    {value:635, name:'洗车'},
                    {value:310, name:'修车'},
                    {value:34, name:'其他'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(1, 0, 0, 0.5)'
                    },
                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
    
    function serviceChats(s_list) {
    	var dom = document.getElementById("ThreePie");
        var myChart = echarts.init(dom);
        var color_list_second = [
			'rgb(97,192,222)',
			'rgb(243,164,59)',
			'rgb(40,114,123)',
			'rgb(192,35,42)',
			'rgb(182,195,53)',
			'rgb(251,26,15)',
			'rgb(232,124,36)',
			'rgb(255,132,99)',
			'rgb(155,202,98)',
			'rgb(250,215,95)',
			'rgb(56,151,197)'
		]
		if(s_list.length/2<11){
			color_list_second = color_list_second.splice(0,s_list.length/2);
		}
        var app = {};
        option = null;
        option = {
            title : {
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            color:color_list_second,
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius : '75%',
                    center: ['50%', '50%'],
                    data:s_list,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    }
</script>

<script> 
    $("#rc_query").click(function(){
    	//var $this = $(this);
    	//$(this).prop("disabled",true)
    	var rc_date_choice = $("#rc_date_choice").text().trim();
    	var query_type = $("#rc_query_type").val();
    	if (rc_date_choice != '日期选择'){
    		var date_list = rc_date_choice.split("-");
        	var start_date = date_list[0].trim(" ") + " 00:00:00";
        	var end_date = date_list[1].trim(" ") + " 23:59:59";
        	var rc_select = $("#rc_select").val();
        	
        	$.post({
        		url:"/Qiqiang/StatisticController/cxtjGetRC",
        		data:{
        			"start_date":start_date,
        			"end_date":end_date,
        			"customer_type":rc_select,
        			"query_flag":"true",
        			"query_type":query_type,
        		},
        		async:false,
        		success:function(args){
        			var recharge_list = $.parseJSON(args).recharge_list;
        			var consume_list = $.parseJSON(args).consume_list;
        			var d_list = [];
        			var r_list = [];
        			var c_list = [];
        			for (i=0;i<recharge_list.length;i++){
        				d_list.push(recharge_list[i].cdate);
        				r_list.push(recharge_list[i].cprice);
        				c_list.push(consume_list[i].cprice);
        			}
        			rcCharts(d_list,r_list,c_list);
        			//$this.prop("disabled",false);
        		}
        	});
    	}
    	//$this.prop("disabled",false);
    })
    
    $("#service_query").click(function(){
    	var service_date_choice = $("#service_date_choice").text().trim();
    	if (service_date_choice != '日期选择'){
    		var date_list = service_date_choice.split("-");
        	var start_date = date_list[0].trim(" ") + " 00:00:00";
        	var end_date = date_list[1].trim(" ") + " 23:59:59";
        	var service_select = $("#rc_select").val();
        	
        	$.post({
        		url:"/Qiqiang/StatisticController/cxtjGetService",
        		data:{
        			"start_date":start_date,
        			"end_date":end_date,
        			"customer_type":service_select,
        			"query_flag":"true",
        		},
        		async:false,
        		success:function(args){
        			var s_list = [];
        			//var s_dict = {};
        			/**
        				data:[
		                    {value:635, name:'洗车'},
		                    {value:310, name:'修车'},
		                    {value:34, name:'其他'}
		                ],
        			*/
        			var s_list = $.parseJSON(args).s_list;
        			$.each(s_list,function(idx,val){
        				var s_dict = {};
        				//s_dict['name'] = val.svr_item+"("+val.record.price+")";
        				s_dict['name'] = val.svr_item;
        				s_dict['value'] = val.price;
        				s_list.push(s_dict);
        			});
        			console.log("s_list ==="+s_list);
        			serviceChats(s_list);
        			//$this.prop("disabled",false);
        		}
        	});
    	}
    });
    
    //综合查询
    $("#zhcx_query").click(function(){
    	var zhcx_date_choice = $("#zhcx_date_choice").text().trim();
    	var query_flag = "true";
    	if (zhcx_date_choice != '日期选择'){
    		var date_list = zhcx_date_choice.split("-");
        	var start_date = date_list[0].trim(" ") + " 00:00:00";
        	var end_date = date_list[1].trim(" ") + " 23:59:59";
    	}else{
    		query_flag = "false";
    	}
       	var svr_item_id = $("#zhcx_select").val();
       	var param = $("#zhcx_param").val();
       	$.post({
       		url:"/Qiqiang/StatisticController/getZhcx",
       		data:{
       			"start_date":start_date,
       			"end_date":end_date,
       			"svr_item_id":svr_item_id,
       			"query_flag":query_flag,
       			"param":param,
       		},
       		async:false,
       		success:function(args){
       			var u_list = $.parseJSON(args).u_list;
       			$(".xfxq").find("tbody").empty();
       			$.each(u_list,function(idx,val){
       				var number = "";
    				var realnumber = "";
    				var practical = "";
    				if(val.number == null || val.number == ""){
    					number = 0;
    				}else{
    					number = val.number;
    				}
    				if(val.realnumber == null || val.realnumber == ""){
    					realnumber = 0;
    				}else{
    					realnumber = val.realnumber;
    				}
    				if(val.practical == null || val.practical == ""){
    					practical = 0;
    				}else{
    					practical = val.practical;
    				}
       				var con
       				if(val.flag == 1){
       					con = "<tr><td>"+val.svr_item+"</td><td>"+val.name+"</td><td>"+val.plateno+"</td><td>"+val.mobile+"</td><td>"+val.price_s+"</td><td>"+practical+"</td><td>"+number+"</td><td>"+realnumber+"</td><td>"+val.date+"</td><td>"+val.balance+"</td><td style='text-align: center;'>"
						+"<a class='giftInf'>查看</a>"
		        		+"<input type='hidden' value = "+val.record_id +" />"
						+"</td>"
						+"<td><a class='selectRemark'>详情</a><input class='myRecark' name='myRecard' type='hidden' value='"+val.remark+"'/></td>"
						+"</tr>"
       				}else{
       					con = "<tr><td>"+val.svr_item+"</td><td>"+val.name+"</td><td>"+val.plateno+"</td><td>"+val.mobile+"</td><td>"+val.price_s+"</td><td>"+practical+"</td><td>"+number+"</td><td>"+realnumber+"</td><td>"+val.date+"</td><td>"+val.balance+"</td><td style='text-align: center;'>"
       					+"<a>无</a>"
       					+"</td>"
       					+"<td><a class='selectRemark'>详情</a><input class='myRecark' name='myRecard' type='hidden' value='"+val.remark+"'/></td>"
       					+"</tr>"
       				}
       				$(".xfxq").find("tbody").append(
       					con
       				)
       				//oidx += 1;
       			});
       			var statistic = $.parseJSON(args).statistic;
       			/* <input type="hidden" name="start" value="${statistic.start }">
          	 		<input type="hidden" name="count" value="${statistic.count }">
          	 		<input type="hidden" name="last" value="${statistic.last }">
          	 		<input type="hidden" name="param" value="${statistic.param }"> */
          	 		$("input[name='start']").val(statistic.start);
          	 		$("input[name='count']").val(statistic.count);
          	 		$("input[name='last']").val(statistic.last);
          	 		$("input[name='param']").val(statistic.param);
          	 		$("input[name='cur_page']").val(statistic.cur_page);
          	 		$("input[name='pages']").val(statistic.pages);
  					$("#total").text(statistic.total);
  					$("#cur_page").text(statistic.cur_page);
  					$("#pages").text(statistic.pages);
       		}
       	});
    	
    });
    
</script>
<script>
	$("#ribao").click(function(){
		location.href="/Qiqiang/StatisticController/staReportDay"
	})
	$("#huizong").click(function(){
		location.href="/Qiqiang/StatisticController/statisticHz"
	})
</script>
<script>
$(".trans_type").click(function(){
	var zhcx_date_choice = $("#zhcx_date_choice").text().trim();
	var query_flag = "true";
	if (zhcx_date_choice != '日期选择'){
		var date_list = zhcx_date_choice.split("-");
    	var start_date = date_list[0].trim(" ") + " 00:00:00";
    	var end_date = date_list[1].trim(" ") + " 23:59:59";
	}else{
		query_flag = "false";
	}
   	var svr_item_id = $("#zhcx_select").val();
   	var param = $("#zhcx_param").val();
	var trans_type = $(this).attr("id");
	var count = parseInt($("input[name='count']").val());
	var start = parseInt($("input[name='start']").val());
	var last = parseInt($("input[name='last']").val());
	var param = $("input[name='param']").val();
	var pages = parseInt($("input[name='pages']").val());
	var cur_page = parseInt($("input[name='cur_page']").val());
	var cur_page_cli = parseInt($("#cur_page").text());
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
		url:"/Qiqiang/StatisticController/zhcxTrans",
		data:{
			"start":start,
			"count":count,
			"start_date":start_date,
   			"end_date":end_date,
   			"svr_item_id":svr_item_id,
   			"query_flag":query_flag,
   			"param":param,
		},
		async:false,
		success:function(args){
			var pList = $.parseJSON(args).u_list;
			$(".xfxq").find("tbody").empty();
			$.each(pList,function(idx,val){
				var number = "";
				var realnumber = "";
				var practical = "";
				if(val.number == null || val.number == ""){
					number = 0;
				}else{
					number = val.number;
				}
				if(val.realnumber == null || val.realnumber == ""){
					realnumber = 0;
				}else{
					realnumber = val.realnumber;
				}
				if(val.practical == null || val.practical == ""){
					practical = 0;
				}else{
					practical = val.practical;
				}
				var con
				if(val.flag == 1){
					con = "<tr><td>"+val.svr_item+"</td><td>"+val.name+"</td><td>"+val.plateno+"</td><td>"+val.mobile+"</td><td>"+val.price_s+"</td><td>"+practical+"</td><td>"+number+"</td><td>"+realnumber+"</td><td>"+val.date+"</td><td>"+val.balance+"</td><td style='text-align: center;'>"
					+"<a class='giftInf'>查看</a>"
	        		+"<input type='hidden' value = "+val.record_id +" />"
					+"</td>"
					+"<td><a class='selectRemark'>详情</a><input class='myRecark' name='myRecard' type='hidden' value='"+val.remark+"'/></td>"
	        		+"</tr>"
				}else{
					con = "<tr><td>"+val.svr_item+"</td><td>"+val.name+"</td><td>"+val.plateno+"</td><td>"+val.mobile+"</td><td>"+val.price_s+"</td><td>"+practical+"</td><td>"+number+"</td><td>"+realnumber+"</td><td>"+val.date+"</td><td>"+val.balance+"</td><td style='text-align: center;'>"
					+"<a>无</a>"
					+"</td>"
					+"<td><a class='selectRemark'>详情</a><input class='myRecark' name='myRecard' type='hidden' value='"+val.remark+"'/></td>"
					+"</tr>"
				}
				
				$(".xfxq").find("tbody").append(
						con
				)
				//oidx += 1;
			});
		}
	})
})
//查看按钮点击
$("table").delegate(".giftInf","click",function(){
	var record_id = $(this).next().val();
	$.ajax({
		type:"post",
		dataType:"json",
		url:"/Qiqiang/StatisticController/selectGiftInf",
		data:{
			record_id : record_id 
		},
		success:function(msg){
				var text;
				for(var i = 0 ; i < msg.data.list.length ; i++){
						if(text == null){
							text =  "<div class='seeClass'><span>项目名："+msg.data.list[i].svr_item+"</span>"
									+"<span>类型："+msg.data.list[i].type+"</span>"
									+"<span>赠送次数："+msg.data.list[i].number+"</span>"
									+"<span>剩余次数："+msg.data.list[i].balancenumber+"</span>"
									+"<span>用户："+msg.data.list[i].name+"</span>"
									+"<span>车牌号："+msg.data.list[i].plateno+"</span>"
									+"</div></br>"
						}else{
							text = text + "<div class='seeClass'><span>项目名："+msg.data.list[i].svr_item+"</span>"
												+"<span>类型："+msg.data.list[i].type+"</span>"
												+"<span>赠送次数："+msg.data.list[i].number+"</span>"
												+"<span>剩余次数："+msg.data.list[i].balancenumber+"</span>"
												+"<span>用户："+msg.data.list[i].name+"</span>"
												+"<span>车牌号："+msg.data.list[i].plateno+"</span>"
												+"</div></br>"
						}
				}
				//弹出层
				layer.open(
						{type: 0,
						skin : 'layui-layer-lan', //样式类名
						title:'赠送项目',
						area: ['280px', '280px'], //宽高
						content:text
						}
				)
		},
		error:function(){
			alert("服务器繁忙");
		}
		
		
	})
	
});
</script>
<script type="text/javascript">
  //备注，点击弹出
  $("table").delegate(".selectRemark","click",function(){
	  
	  var remark = $(this).next().val();
	  if(remark == null || remark == "" || remark == "null" || remark == "undefined"){
		  remark = '';
	  }
	  layer.open(
				{type: 0,
				skin : 'layui-layer-lan', //样式类名
				title:'备注',
				area: ['280px', '280px'], //宽高
				content:remark
				}
		)
  });
  
  </script>
</body>
</html>
