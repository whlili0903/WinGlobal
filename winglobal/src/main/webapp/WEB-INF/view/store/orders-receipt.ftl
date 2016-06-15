<!DOCTYPE html>
<html lang="en">
<head>
	<#include "head.ftl">
    <meta charset="UTF-8">
    <title>订单详情</title>
    <style>
        body {
            width: 100%;
            margin: 0;
        }

        .page-container {
            width: 1200px;
            margin: 0 auto;
            padding-top: 30px;
            padding-bottom: 100px; 
        }

        .addr-select .left {
            background: url("${confs["content.url"]}/img/addr_border_left.png") repeat-y left;
        }

        .addr-select .right {
            margin: 0;
            background: url("${confs["content.url"]}/img/addr_border_left.png") repeat-y right;
        }

        .addr-select .border-bottom {
            clear: both;
        }

        .addr-select .title {
            padding: 18px 20px;
            font-size: 18px;
            color: #222;
            border-bottom: 1px solid #c7c7c7;
        }

        .addr-select .addr-info {
            padding-top: 29px;
            padding-bottom: 29px;
            padding-left: 102px;
            font-size: 16px;
            color: #222;
        }

        .memb-box {
            height: 102px;
            margin-top: 15px;
            background-color: #f6f5f5;
        }

        .memb-box .title {
            height: 52px;
            line-height: 52px;
            padding-left: 24px;
            color: #222;
            font-size: 18px;
            border-bottom: 1px solid #c1c1c1;
        }

        .memb-box .content {
            padding-left: 109px;
            font-size: 14px;
            padding-top: 18px;
            color: #222;
        }

        .memb-box .content .memb-phone {
            padding-left: 72px;
        }

        .order-info {
            background-color: #f6f5f5;
            padding: 18px 0;
            margin-top: 16px;
        }

        .order-info .title {
            color: #222;
            font-size: 18px;
        }

        .goods-info table {
            width: 100%;
            text-align: center;
        }

        .goods-info table th {
            padding-bottom: 20px;
        }

        .goods-info table th {
            border-bottom: 1px solid #CCCCCC;
        }

        .goods-info table td {
            padding-top: 18px;
            padding-bottom: 13px;
        }

        .goods-info table .goods-name img {
            width: 78px;
            height: 78px;
            border: 1px solid #bfbebe;
        }

        .goods-info .goods-name {
            color: #222;
            font-size: 14px;
        }

        .goods-info .goods-name span {
            vertical-align: top;
            padding-top: 10px;
        }

        .goods-info .goods-price, .goods-info .goods-amount {
            color: #ff6600;
            font-size: 16px;
        }

         .total-amount {
            padding-top: 20px;
            text-align: right;
            padding-right: 100px;
        }

        .total-amount span {
            color: #ff6600;
        }

        .logis-box {
            margin: 16px 0 0 0;
            background-color: #f6f5f5;
        }

        .logis-box .title {
            padding: 18px 0 18px 24px; border-bottom: 1px solid #d9d7d7
        }

        .logis-box .input {
            padding-top: 21px; padding-left: 109px; display: inline-block;
        }

        .logis-box .select {
            display: inline-block;
        }

        .logis-box .select select {
            width: 216px; height: 35px; line-height: 35px;
        }

        .logis-box .text {
            display: inline-block; margin-left: 100px;
        }

        .logis-box .text input {
            width: 216px; height: 29px; line-height: 29px;
        }

        .submit-box {
            margin: 15px 90px 15px 10px;
            float: right;
            vertical-align: top;
            display: inline-block;
        }

        .submit-box button {
            width: 153px;
            height: 48px;
            margin-left: 24px;
            text-align: center;
            font-size: 20px;
            color: #ffffff;
            background-color: #0bb552;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .block {
            display: block;
        }

    </style>
</head>
<#include "header2.ftl">
<body>
<div class="page-container">
    <div class="addr-select">
        <div style="background-color: #f6f5f5;">
            <img src="${confs["content.url"]}/img/addr_border_top.png" class="block">
            <div class="left">
                <div class="right">
                    <div class="title">收货人信息</div>
                    <div class="addr-info">
                        <span>收货地址:</span>
                        <span style="margin-left: 30px;">${(orders.ordersAddr.shipName)!}</span>
                        <span style="margin-left: 18px;">${(orders.ordersAddr.shipPhone)!}</span>
                        <span style="margin-left: 18px;">
                        	<#if orders.ordersAddr.shipArea??>
                        		<#if orders.ordersAddr.shipArea?length gt 1>${addrs[orders.ordersAddr.shipArea[0..1]].name}</#if>
                        		<#if orders.ordersAddr.shipArea?length gt 3>${addrs[orders.ordersAddr.shipArea[0..1]].children[orders.ordersAddr.shipArea[0..3]].name}</#if>
                        		<#if orders.ordersAddr.shipArea?length gt 5>${addrs[orders.ordersAddr.shipArea[0..1]].children[orders.ordersAddr.shipArea[0..3]].children[orders.ordersAddr.shipArea[0..5]].name}</#if>
                        	</#if>
                        	${(orders.ordersAddr.shipAddr)!}
                        </span>
                    </div>
                </div>
            </div>
            <img class="border-bottom block" src="${confs["content.url"]}/img/addr_border_top.png">
        </div>
    </div>
    <div class="memb-box">
        <div class="title">
            卖家信息
        </div>
        <div class="content">
            <span class="memb-nickname">昵称：${(acceptMemb.name)!}</span>
            <span class="memb-phone">联系电话：${(acceptMemb.phone)!}</span>
        </div>
    </div>

    <div class="order-info">
        <div class="goods-info">
            <table>
                <thead>
                <tr>
                    <th style="width: 40%;">商品名称</th>
                    <th style="width: 15%;">单价（元）</th>
                    <th style="width: 10%;">数量</th>
                    <th style="width: 10%;">小计</th>
                    <th style="width: 20%;">订单状态</th>
                </tr>
                </thead>
                <tbody>
                
                <#list orders.ordersProds as prod>
	                <tr>
	                    <td class="goods-name">
	                        <img src="${(confs["content.njtx.url"])}/img/${(prod.product.goods.coverImg)!}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
	                        <span style="display: inline-block; max-width: 150px; text-align: left;">
	                        	<#if (prod.prodcutName)?length gt 30 >${(prod.prodcutName?substring(0,30))!}<#else>${(prod.prodcutName)!}</#if>
	                        </span>
	                    </td>
	                    <td class="goods-price">${(prod.prodcutPrice)!0.00}</td>
	                    <td class="goods-quantity">${(prod.prodcutQuantity)!0}</td>
	                    <td class="goods-amount">${(prod.prodcutPrice * prod.prodcutQuantity)!0.00}</td>
	                    <td class="goods-quantity">${(opts['OT'].children[orders.status].name)!}</td>
	                </tr>
                </#list>
                </tbody>
            </table>
        </div>
        <div class="mome" style="padding: 22px 0; border-top: 1px solid #d9d7d7;border-bottom: 1px solid #d9d7d7;">
            <span style="margin-left: 92px;">买家留言：${(orders.ordersAddr.shipMemo)!}</span>
            <span style="margin-left: 290px;">支付方式：在线支付</span>
            <span style="margin-left: 224px;">运送方式：快递 包邮</span>
        </div>
        
        <div class="total-amount">
       		 合计：<span>${(orders.ordersAddr.shipMemo)!}</span>
        </div>
    </div>
      <div class="logis-box">
      		<input type="hidden" name="ordersId" value="${(orders.id)!}"> 
	        <div>
	            <div class="title">
	                	确认收货
	            </div>
	            <div>
	                <div class="input">
	                    <div class="text">
	                        	支付密码：
	                        <input type="password" name="pwd" placeholder="默认为登录密码">
	                    </div>
	                </div>
	                <div class="submit-box">
	                    <button id="submitBtn">确认收货</button>
	                </div>
	            </div>
	        </div>
	        <div style="clear: both;"></div>
	    </div>

</div>
<#include "footer.ftl">
</body>
<script>
	$(function(){
		$("#submitBtn").click(function(){
			var pwd = $("input[name='pwd']").val();
			if(pwd == null || pwd.length == 0){
				alert("请输入密码");
				return;
			}
			var ordersId = $("input[name='ordersId']").val();
			$.ajax({
				url : "confirm-receipt",
				type : "post", 
				data: {
					ordersId: ordersId,
					pwd: pwd
				},
				dataType : "json",
				success:function(result){
					if(result.succ){
						alert("交易完成");
						window.location.href = "../memb/orders-buyer?meneIndex=22";
					} else {
						alert(result.errorMsg);
					}
				},
				error: function(){
					alert("系统错误..");
				}
			});
		})
	})
</script>
</html>