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

        .logis-box {
            display: inline-block;
            padding-left: 92px;
            font-size: 14px;
        }

        .submit-box {
            margin-top: 15px;
            margin-bottom: 15px;
            float: right;
            margin-right: 90px;
            vertical-align: top;
        }

        .amount-box .total-amount {
            color: #ff6600;
            font-size: 16px;
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
        
        .submit-box .btn-order {
        	display: inline-block;
        	width: 153px;
            height: 48px;
			line-height: 48px;
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
        
        .popup-box {
            width: 715px;
            height: 437px;
            margin: 0;
            background: url("${confs["content.url"]}/img/bg_pay_popup.png");
        }

        .popup-box .use-wx {
            padding-top: 28px;
            margin-left: 87px;
            font-size: 18px;
            color: #222;
        }

        .popup-box .scan-text {
            margin-top: 12px;
            margin-left: 102px;
            font-size: 18px;
            color: #222;
        }

        .popup-box .tips {
            margin-left: 64px;
            margin-top: 33px;
            text-align: center;
            width: 210px;
            font-size: 12px;
            color: #ed935b;
        }

        .popup-box .qrcode-box {
            width: 210px;
            height: 210px;
            margin-left: 64px;
            margin-top: 36px;
        }

        .popup-box .qrcode-box img {
            width: 100%;
        }

    </style>
</head>
<body>
<#include "header2.ftl">
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
            <span class="memb-nickname">昵称：${(acceptMemb.membAddl.name)!}</span>
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

        <div style="padding: 10px 0 0 0;">
            <div class="logis-box">
                <p>订单编号：${(orders.sn)!}</p>
                <p>下单时间：${(orders.crtTime)?string('yyyy-MM-dd HH:mm:ss')!}</p>
                <#if (orders.status == 'OT02')||(orders.status == 'OT03')||(orders.status == 'OT09') >
	                <p>付款时间：${((orders.payDate)?string('yyyy-MM-dd HH:mm:ss'))!}</p>
                </#if>
                <#if orders.status == 'OT03'||orders.status == 'OT09' >
	                <p>发货时间：${((orders.shipmentsDate)?string('yyyy-MM-dd HH:mm:ss'))!}</p>
                </#if>
                <#if orders.status == 'OT09' >
	                <p>收货时间：${((orders.succeedDate)?string('yyyy-MM-dd HH:mm:ss'))!}</p>
                </#if>
            </div>
            <div class="submit-box" style="display: inline-block;">
                <span class="amount-box">合计：<span class="total-amount">${(orders.totalAmount)!0.00}</span></span>
                <#if !type??  || type == 'buyer'>
                	<#if orders.status == 'OT01'>
	                	<button id="payShow">去付款</button>
                	</#if>
	                <#if orders.status == 'OT03'>
                    	<button onclick="location.href='confirm-receipt-jump?ordersId=${(orders.id)!}'">确认收货</button>
	                </#if>
                <#elseif type == 'seller'>
                	<#if orders.status == 'OT02'>
		                <button onclick="location.href='shipping-jump?ordersId=${(orders.id)!}'">发货</button>
	                </#if>
                </#if>
                <#if orders.status == 'OT03' || orders.status == 'OT09'>
                	<a type="button" class="btn-order" target="_blank" href="../orders/logis-jump?ordersId=${(orders.id)!}" >查询物流</a>
            	</#if>
                
            </div>
            <div style="clear: both;"></div>
        </div>

    </div>

</div>
<#include "footer.ftl">
</body>
<script type="text/javascript" src="${confs["content.url"]}/plugin/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        var $payShow = $("#payShow");
        $payShow.click(function () {
        	// 发起支付请求
			$.ajax({
				url : "../wxpay/ajaxpay",
				type: "post",
				data: {
					ordersId: "${(orders.id)!}"
				},
				dataType: "json",
				success: function(result){
					if(result.status == 'success'){
						showPopup(result.qrCodeUrl);
						checkOrders();
					}else{
						console.log("系统出现错误..");
					}
				},
				error: function(){
					console.log("系统出现错误..");
				}
			});
        })
        var ordersInterval;
        // 检测订单状态
        function checkOrders(){
        	ordersInterval = setInterval(function(){
        		queryOrders();
        	}, 1000)
        }
        
        function queryOrders(){
        	$.ajax({
	        	url : "../orders/query-orders",
				type: "post",
				data: {
					ordersId: "${(orders.id)!}"
				},
				dataType: "json",
				success: function(result){
					if(result.status == 'success'){
						// 已经成功支付 取消查询事件
						clearInterval(ordersInterval);
						// 关闭弹窗并 刷新界面
						layer.close(payPopup);
						window.location.reload(true);
					}
				},
				error: function(){
					console.log("系统出现错误..");
				}
			});
        }
        var payPopup;
        function showPopup(qrCodeUrl){
        	//页面层
            payPopup = layer.open({
                type: 1,
                area: ['715px', '437px'], //宽高
                content: '<div class="popup-box">'
                + '<div class="use-wx">请使用微信</div>'
                + '<div class="scan-text">扫描二维码支付</div>'
                + '<div class="qrcode-box">'
                + '<img src="data:image/png;base64,'+qrCodeUrl+'"></div>'
                + '<div class="tips">'
                + '二维码有效时厂为2小时，请尽快支付</div></div>',
                title: false,
                cancel: function(){ // 关闭弹框，取消微信支付订单
                	//cancleOrders();
                }
            });
        }
        
        // 取消微信订单
        function cancleOrders(){
        	$.ajax({
	        	url : "../wxpay/close-orders",
				type: "post",
				data: {
					ordersId: "${(orders.id)!}"
				},
				dataType: "json"
        	})
        }
    })
</script>
</html>