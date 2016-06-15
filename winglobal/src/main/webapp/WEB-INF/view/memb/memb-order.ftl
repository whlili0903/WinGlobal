<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/persion.css" />
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-order.css"/>
	<style>
	.left-center-div a{
		color:#fff;
	}
	.body-content-name a{
		color:#202020;
	}
	.body-content-name a:hover{
		color:#0AB552;
	}
	.body-content-div5:hover{
		color:#0AB552;
	}
	.persion-meun-img{
		margin-top:7px;
	}
	.right-div{
		display:block;
	}
	</style>
	<script>
        $(document).ready(function(){
        	initPage();
        });
	</script>
</head>
<body>
	<#include "header2.ftl">
<div class="body-div">
	<div class="header-div"></div>
	 <div class="center-div">
	 <#include "memb/persion.ftl">
        <div class="right-div" id="ddContent" style="display:block;" >
        	
        	<div class="page-container">
			    <div class="content">
			    	<div class="right-head-div" style=" position: relative;width: 966px;">
            	<div class="head-text-div" style="cursor: pointer;" onclick="changMenu('yyDiv','yyContent','noYyMenu','../reserve/resv-land-buy')">我是买家</div>
            	<div class="head-text-div" style="cursor: pointer;"  onclick="changMenu('yyDiv','yyContent','noYyMenu','../reserve/resv-land-seller')">我是卖家</div>
                <div class="right-head-oper"><div class="all-select-img"  style="margin-top:0px;"><img src="${confs["content.url"]}/img/ku.png" style="margin-top:24px;    display: none;" /> </div><div class="all-select" ></div><div class="all-oper" id="resvAllOper"></div></div>
                <div class="clear-float"></div>
                <div class="img-div" <#if isOwner==true> style="margin-left:140px;"</#if>><img src="${confs["content.url"]}/img/bottom.png"/></div>
            </div>
			        <div class="order" style="margin-top:15px;">
			            <div class="tab-content">
			                <table>
			                    <colgroup>
			                        <col style="width: 40%">
			                        <col style="width: 15%;">
			                        <col style="width: 10%;">
			                        <col style="width: 15%;">
			                        <col style="width: 20%;">
			                    </colgroup>
			                    <thead>
			                    <tr>
			                        <td>订单详情</td>
			                        <td>单价（元）</td>
			                        <td>数量</td>
			                        <td>小计（元）</td>
			                        <td>订单状态</td>
			                    </tr>
			                    </thead>
			                </table>
			
			                <table class="item">
			                    <colgroup>
			                        <col style="width: 40%">
			                        <col style="width: 15%;">
			                        <col style="width: 10%;">
			                        <col style="width: 15%;">
			                        <col style="width: 20%;">
			                    </colgroup>
			                    <thead>
			                    <tr class="orders-head">
			                        <td class="orders-crt-time" colspan="4">
			                            <span>2016-01-01 11:11:11</span>
			                            <span style="margin-left: 22px;">订单编号：<span>4545555554545455</span></span>
			                        </td>
			                        <td class="align-right">
			                            <a class="order-show" href="javascript:"> 查看订单</a>
			                        </td>
			                    </tr>
			                    </thead>
			                    <tbody>
			                    <tr>
			                        <td class="orders-goods-info">
			                            <div class="cover-img">
			                                <img src="img/lingmeng.png">
			                            </div>
			                            <div class="goods-name">
			                                香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉..
			                            </div>
			                        </td>
			                        <td>33.50</td>
			                        <td>x2</td>
			                        <td>67.00</td>
			                        <td class="orders-state">
			                            <div><a href="javascript:">去支付</a></div>
			                            <div>
			                                <button class="btn-order">去支付</button>
			                            </div>
			                            <div>
			                                <button class="btn-order">查询物流</button>
			                                <button class="btn-order">确认收货</button>
			                            </div>
			                        </td>
			                    </tr>
			                    </tbody>
			                </table>
			
			                <table class="item">
			                    <colgroup>
			                        <col style="width: 40%">
			                        <col style="width: 15%;">
			                        <col style="width: 10%;">
			                        <col style="width: 15%;">
			                        <col style="width: 20%;">
			                    </colgroup>
			                    <thead>
			                    <tr class="orders-head">
			                        <td class="orders-crt-time" colspan="4">
			                            <span>2016-01-01 11:11:11</span>
			                            <span style="margin-left: 22px;">订单编号：<span>4545555554545455</span></span>
			                        </td>
			                        <td class="align-right">
			                            <a class="order-show" href="javascript:"> 查看订单</a>
			                        </td>
			                    </tr>
			                    </thead>
			                    <tbody>
			                    <tr>
			                        <td class="orders-goods-info">
			                            <div class="cover-img">
			                                <img src="img/lingmeng.png">
			                            </div>
			                            <div class="goods-name">
			                                香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉..
			                            </div>
			                        </td>
			                        <td>33.50</td>
			                        <td>x2</td>
			                        <td>67.00</td>
			                        <td class="orders-state">
			                            <div><a href="javascript:">去支付</a></div>
			                            <div>
			                                <button class="btn-order">去支付</button>
			                            </div>
			                            <div>
			                                <button class="btn-order">查询物流</button>
			                                <button class="btn-order">确认收货</button>
			                            </div>
			                        </td>
			                    </tr>
			                    </tbody>
			                </table>
			
			                <table class="item">
			                    <colgroup>
			                        <col style="width: 40%">
			                        <col style="width: 15%;">
			                        <col style="width: 10%;">
			                        <col style="width: 15%;">
			                        <col style="width: 20%;">
			                    </colgroup>
			                    <thead>
			                    <tr class="orders-head">
			                        <td class="orders-crt-time" colspan="4">
			                            <span>2016-01-01 11:11:11</span>
			                            <span style="margin-left: 22px;">订单编号：<span>4545555554545455</span></span>
			                        </td>
			                        <td class="align-right">
			                            <a class="order-show" href="javascript:"> 查看订单</a>
			                        </td>
			                    </tr>
			                    </thead>
			                    <tbody>
			                    <tr>
			                        <td class="orders-goods-info">
			                            <div class="cover-img">
			                                <img src="img/lingmeng.png">
			                            </div>
			                            <div class="goods-name">
			                                香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉香蕉..
			                            </div>
			                        </td>
			                        <td>33.50</td>
			                        <td>x2</td>
			                        <td>67.00</td>
			                        <td class="orders-state">
			                            <div><a href="javascript:">去支付</a></div>
			                            <div>
			                                <button class="btn-order">去支付</button>
			                            </div>
			                            <div>
			                                <button class="btn-order">查询物流</button>
			                                <button class="btn-order">确认收货</button>
			                            </div>
			                        </td>
			                    </tr>
			                    </tbody>
			                </table>
			
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>