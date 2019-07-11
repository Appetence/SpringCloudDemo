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
<title>项目维护</title>
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
        .tableIpt{
            background-color: transparent;
            height: 0.56rem;
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
            <p class="titleP"><i class="iconfont icon-yonghuxiangmuweihu"></i> 项目维护</p>
            <!--<p style="padding: 0rem 0.2rem" class="sure">-->
                <!--<button class="btn btn-block ">新增项目</button>-->
            <!--</p>-->
            <section class="sec">
                <div>
                    <div class="row" style="margin:0rem;width: 100%;text-align: center;">
                        <span>
                        <input type="text" placeholder="项目名称" class="form-control">
                        </span>
                        <button id="selectsome" class="btn">搜索</button>
                        <!--<i class="glyphicon glyphicon-search" style="padding: 5px;font-size: 16px;"></i>-->
                    </div>
                <form action="">
                    <table class="table" style="margin-top: 5px;table-layout: fixed;">
                        <tr>
                            <td>项目名称</td>
                            <td>单次金额</td>
                            <td>修改</td>
                        </tr>
                       
                        <c:forEach items="${pageItemFirstInfo.getList()}" var="item">
                        <tr>
                           <td>${item.svr_item}</td>
                           <td>${item.svr_free}</td>
                           <td><a href="javascript:;" onclick="">修改</a></td>
                           </tr>
                        </c:forEach>
                        
                            <!-- <td>
                                <input type="text" class="form-control tableIpt" value="洗车">
                                洗车
                            </td>
                            <td>
                                <input type="text" class="form-control tableIpt" value="100">
                            </td>
                            <td>
                                <a href="javascript:;">修改</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="form-control tableIpt" value="洗车">
                                洗车
                            </td>
                            <td>
                                <input type="text" class="form-control tableIpt" value="100">
                            </td>
                            <td>
                                <a href="javascript:;">修改</a>
                            </td>
                        </tr> -->

                    </table>
                </form>
                    <!--
                <div class="text-center">
                    <button>首页</button>
                    <button>上一页</button>
                    <button>下一页</button>
                    <button>尾页</button>
                </div>
                -->
                </div>
                <!--日报结束-->
            </section>

            <div class="text-center" style="margin-top: 20px;">
                <button class="btn sure">新增项目</button>
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
    <div class="simpleAlertBody" style="width: 85%;left: 7%;height: 230px;">
        <i class="simpleAlertBodyClose 	glyphicon glyphicon-remove" style="top: 8px;right: 5px;"></i>
        <div class="simpleAlertBodyContent" style="height: 2.7rem;top: 20%;width: 88%;left: 8%; ">
            <div class="toUpSec">
                <div id="rowItem1" class="row">
                    <span class="col-md-2">项目名称</span>
                    <span class="col-md-10">
                            <select name="" id="" class="form-control">
                                <option value="">洗车</option>
                                <option value="">打蜡</option>
                                <option value="">修理</option>
                            </select>
                    </span>
                </div>
                <div id="rowItem2" class="row">
                    <span class="col-md-2">单次金额</span>
                    <span class="col-md-10">
                            <input type="text" class="form-control" value="500">
                    </span>
                </div>
            </div>
        </div>
        <a href="javascript:;" ><button class="simpleAlertBtn simpleAlertBtn2" style="right: 41%;">确定</button></a>

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
	 $(function(){
        nav(); 
       })
       function nav(){
          $.ajax({
            url:"Qiqiang/InfoDetailsController/ItemList",
            type :"post",
            dataType:"json",
            success:function(pageItemInfo){
              $("#table").html(" <tr><td>项目名称</td><td>单次金额</td><td>修改</td> </tr><c:forEach items='"
              +${pageItemInfo.getList()}
              +"'><tr><td><>input type='text' class='form-control tableIpt' value='"
              +${pageItemInfo.getList().svr_item}
              +"'></td><td> <input type='text' class='form-control tableIpt' value='"
              +${pageItemInfo.getList().svr_free}
              +"'></td><td><a href='javascript:;' onclick='update()'>修改</a></td></tr></c:forEach>"
              )
            }
            })  
       };
       $("#selectsome").click(function(){
       
           var name=$(".form-control").val();
             function update(name){
          $.ajax({
             url:"Qiqiang/InfoDetailsController/Item/{name}", 
             type :"post",
             dataType:"json",
             success:function(itemOne){
               $("#table").append(" <div id='mask'><div class='simpleAlertBody' style='width: 85%;left: 7%;height: 230px;'><i class='simpleAlertBodyClose 	glyphicon glyphicon-remove' style='top: 8px;right: 5px;'></i><div class='simpleAlertBodyContent' style='height: 2.7rem;top: 20%;width: 88%;left: 8%; '><div class='toUpSec'><div id='rowItem1' class='row'><span class='col-md-2'>项目名称</span><span class='col-md-10'><input type='text' id='rowItem1' class='form-control' value='"
               +${itenOne.svr_item}
               + "'></span></div><div id='rowItem2' class='row'><span class='col-md-2'>单次金额</span><span class='col-md-10'><input type='text' class='form-control' value='"
               +${itemOne.svr_free}
               +"'></span></div></div></div><a href='javascript:;' onclick='updateOne("
               +${itenOne.svr_item}
               +","
               +${itenOne.svr_free}+")'><button class='simpleAlertBtn simpleAlertBtn2' style='right: 41%;'>确定</button></a></div></div>");
             }
          })
          $("#rowItem1").attr("readonly","readonly");
       }
           }
       );
       //新增
       function insertnew(){
           var svr_item=$(".col-md-10").val();
           var  svr_free  =$(".col-md-2").val();
            $,ajax({
             url:"Qiqiang/InfoDetailsController/Item/insertItem/{svr_item}{svr_free}",
            type :"post",
            dataType:"json",
            success:function(status){
               if(status == 1){
               alert("该项目已经存在");
               }else{
                alert("保存成功");
               }
            },
            error:function(){
                 //
            }
            })
       }
       //更新
     
       function updateOne(svr_item,svr_free){
             url:"Qiqiang/InfoDetailsController/ItemNew/{svr_item}{svr_free}",
             type :"post",
             dataType:"json",
             success:function(type){
              if(type == 1){
                alert("更新成功");
              }else{
                alert("未知错误");
              }
             }
       }
       /*
      
       
        */
</script>
<script type="text/javascript" src="../../static/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../../static/js/mask.js"></script>
<script>
    $(".simpleAlertBtn,.simpleAlertBodyClose").click(function () {
        $("#mask").fadeOut();
    });
    $(".btn sure").click(function () {
        $("#mask").fadeIn();
    })

</script>
</body>
</html>
