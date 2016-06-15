<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-menu.css"/>
	<style>
		.body-content-name a{
			color:#202020;
		}
		.body-content-name a:hover{
			color:#0AB552;
		}
		.body-content-div5:hover{
			color:#0AB552;
		}
		
        .order {
            display: inline-block;
            width: 100%;
            padding: 34px;
            background-color: #ffffff;
        }

        .tab-title ul {
            display: inline-block;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .tab-title ul li {
            display: inline-block;
            margin-right: 20px;
            vertical-align: top;
            cursor: pointer;
        }

        .tab-title ul li p {
            width: 80px;
            margin: 0 0 -8px 0;
            text-align: center;
        }

        .tab-title ul li img {
            width: 80px;
        }

        .tab-content table {
            width: 100%;
            margin-top: 15px;
        }

        .tab-content * {
            text-align: center;
        }

        .item {
            border: 1px solid #CFCFCF;
            border-collapse: collapse;
        }

        .item td {
            border: 1px solid #CFCFCF;
            font-size: 14px;
        }

        .btn-order {
            border: 1px solid #919593;
            border-radius: 3px;
            background-color: #ffffff;
            height: 24px;
            line-height: 10px;
            cursor: pointer;
            padding-left:3px;
            padding-right:3px;
            color: #222;
        }

        .btn-order:hover {
            /*border: 1px solid #0ab552;*/
        }

        .orders-state div {
            margin-top: 5px;
        }

        .orders-head {
            background-color: #eeeeee;
            height: 34px;
        }

        .orders-head .orders-crt-time {
            text-align: left;
            padding-left: 18px;
            font-size: 12px;
        }

        .align-left {
            text-align: left;
        }

        .align-right {
            text-align: right;
        }

        .order-show {
            font-size: 12px;
            margin-right: 15px;
            text-decoration: none;
            color:#7a7a7a;
        }

        .orders-goods-info {
            text-align: left;
            height: 80px;
            padding: 20px 18px;
            clear: both;
        }

        .orders-goods-info .cover-img {
            width: 80px;
            float: left;
        }

        .orders-goods-info .cover-img img {
            width: 80px;
            height: 80px;
            border: 1px solid #CFCFCF;
        }

        .orders-goods-info .goods-name {
            display: block;
            margin-left: 100px;
            height: 80px;
            text-align: left;
        }
        
        .tab-title .btm-img{
        	margin-top:20px;
        }
        
        .tab-title p{
        	font-size: 16px;
        }
        
        .order-status{
        	margin-bottom: 10px;
        }
        
        .btn-link {
            border: 1px solid #0ab552;
            border-radius: 3px;
            background-color: #ffffff;
            height: 40px;
            line-height: 10px;
            cursor: pointer;
            padding-left:3px;
            padding-right:3px;
            width:130px;
            color:#0ab552;
        }
		.btn-div{
        	position:relative;
  			top:20%;
        }
		
		.search-title{
			margin-left: 10px;
		}
		
		.search-title ul {
            display: inline-block;
            list-style: none;
            margin: 15px 0px;
            padding: 0;
        }

        .search-title ul li {
            display: inline-block;
            margin-right: 20px;
            vertical-align: top;
            cursor: pointer;
            font-size: 15px;
        }
		.split-div{
		    height: 15px;
		    background-color: #EEEEEE;
		    margin-left: -35px;
		    margin-right: -35px;
		}
		.search-title ul .checked{
			color:#30ab52;
		}
	</style>
</head>
<body>
<#include "header2.ftl">
<form action="../memb/orders-buyer?menuIndex=22" method="post" id="ListForm">
<div class="body-div">
		<div class="page-container">
	 		<#include "memb/memb-menu.ftl">
        	<div class="content">
		        <div class="order">
		            <div class="tab-title">
		                <ul>
		                    <li class="checked" onclick="javascript:window.location.href='../memb/orders-buyer?menuIndex=22';"  >
		                        <p>我是买家</p>
		                        <img class="btm-img" src="${confs["content.url"]}/img/bottom.png" >
		                    </li>
		                    <#if memb?? && memb.type == 'MT02'>
		                    <li onclick="javascript:window.location.href='../memb/orders-seller?menuIndex=22';" >
		                        <p>我是卖家</p>
		                    </li>
		                    </#if>
		                </ul>
		            </div>
		            <div class="search-title" >
		            	<ul class="search-ul" >
		            	<li value="" <#if pager.params.status == '' > class="checked" </#if> >全部</li>
			    		<#list opts["OT"].children?values as ot>
							<li value="${(ot.code)!}" <#if pager.params.status == ot.code >class="checked"</#if> >${ot.name}</li>
			    		</#list>
		                </ul>
		                <input type="hidden" name="params['status']" class="hn-stat" value="${(pager.params.status)!}" />
		            </div>
					<div class="split-div" ></div>
		            <div class="tab-content" <#if  pager.result?size lt 1 >style="height:488px;text-align: center;"</#if> >
		            <#if pager.result?size gt 0>
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
						<#list pager.result as order>
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
			                            <span>${order.crtTime?string("yyyy-MM-dd HH:mm:ss")}</span>
			                            <span style="margin-left: 22px;">订单编号：<span>${(order.sn)!}</span></span>
			                        </td>
			                        <td class="align-right">
			                            <a class="order-show" href="../orders/details?ordersId=${(order.id)!}&type=buyer"> 查看订单</a>
			                        </td>
			                    </tr>
			                    </thead>
			                    <tbody>
			                    <tr>
			                        <td class="orders-goods-info">
			                            <div class="cover-img">
			                                <img src="${confs["content.njtx.url"]}/img/${(order.ordersProds[0].product.goods.coverImg)!}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
			                            </div>
			                            <div class="goods-name">
			                                ${(order.ordersProds[0].product.goods.name)!}
			                            </div>
			                        </td>
			                        <td>${(order.ordersProds[0].product.price)!0.00}</td>
			                        <td>x${(order.ordersProds[0].prodcutQuantity)!0}</td>
			                        <td>
			                        	<#if order??&&order.ordersProds??&&order.ordersProds?size gt 0&&order.ordersProds[0].product??&&order.ordersProds[0].product.price !=''
			                        		&& order.ordersProds[0].prodcutQuantity!=''
			                        	 >
			                        		${(order.ordersProds[0].product.price*order.ordersProds[0].prodcutQuantity)?string("#.##")}
			                        	<#else>
			                        		0.00	
			                        	</#if>
			                        </td>
			                        <td class="orders-state">
			                        		<div class="order-status" >${opts['OT'].children[order.status].name}</div>
			                        	<#if order.status == 'OT01'>
				                            <div>
				                                <a class="btn-order">去支付</a>
				                            </div>
			                            </#if>
			                            <#if order.status == 'OT03'>
				                            <div>
				                                <a type="button" class="btn-order" target="_blank" href="../orders/logis-jump?ordersId=${(order.id)!}" >查询物流</a>
				                                <a type="button" class="btn-order" href="../orders/confirm-receipt-jump?ordersId=${(order.id)!}" >确认收货</a>
				                            </div>
			                            </#if>
			                        </td>
			                    </tr>
			                    </tbody>
			                </table>
						</#list>
						<#else>
							<img style="margin-top: 5%;" src="${confs["content.url"]}/img/prom_order1.png" />
            				<div class="btn-div"><a href="../tp/store" target="_self"><input type="button" class="btn-link" value="我要下单" /></a></div>
						</#if>
		            </div>
		        </div>
		        <#if pager.result?size gt 0>
		        	<#include "pager.ftl" />
		        </#if>
		    </div>
		</div>
	</div>
</div>
</form>
<div class="clear-float"></div>
<#include "footer.ftl">
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
<#if pager.result?size gt 0>
<script src="${confs["content.url"]}/plugin/laypage/laypage.js"></script>
</#if>
<script>
	$(function(){
		 <#-- 订单状态选择 -->
		 $(document).on("click",".search-ul li",function(){
		 		var $this=$(this);
		 		$(".search-ul li").each(function(){
		 			if($this.html() == $(this).html()){
		 				$this.attr("class","checked");
		 				$(".hn-stat").val($this.attr("value"));
		 				$("input[name='pageNo']").val(1);
		 				$("#ListForm").submit();
		 			}else{
		 				$(this).removeAttr("class");
		 			}
		 		});
		 }); 
	});
</script>
</body>
</html>