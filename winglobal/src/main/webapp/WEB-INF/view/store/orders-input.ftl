<!DOCTYPE html>
<html lang="en">
<head>
	<#include "head.ftl">
	<#assign  parm=5>
    <meta charset="UTF-8">
    <title>提交订单</title>
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

        .title-tab {
            height: 45px;
            line-height: 45px;

        }

        .title-tab label {
            text-align: center;
            font-size: 20px;
        }

        .title-tab .selected {
            width: 615px;
            height: 100%;
            display: inline-block;
            background: url("${confs["content.url"]}/img/bg_tab_selected.png") no-repeat;
            color: #fff;
        }

        .title-tab .unselected {
            width: 607px;
            height: 100%;
            margin-left: -30px;
            display: inline-block;
            background: url("${confs["content.url"]}/img/bg_tab_unselected.png") no-repeat;
            color: #414040;
        }

        .title-tab label span {
            padding-right: 15px;
            font-style: italic;
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
            padding-left: 78px;
            display: none;
            font-size: 16px;
            color: #222;
        }

        .addr-info button {
            width: 62px;
            height: 31px;
            text-align: center;
            float: right;
            margin-right: 83px;
            font-size: 18px;
            color: #0bb552;
            background-color: #ffffff;
            border: 1px solid #CCCCCC;
            border-radius: 5px;
            cursor: pointer;
        }

        .input-group {
            width: 100%;
            margin-top: 20px;
        }

        .input-group > .label {
            width: 150px;
            height: 35px;
            line-height: 35px;
            color: #222222;
            font-size: 16px;
            float: left;
            text-align: right;
        }

        .input-group > input.field {
            width: 216px;
            height: 35px;
            border: 1px solid #bfbfbf;
            padding: 0 10px;
            clear: left;
        }

        .input-group > select.field {
            width: 238px;
            height: 35px;
            border: 1px solid #bfbfbf;
            padding: 0 10px;
            clear: left;
        }
        
        .input-group > select.lSelect {
        	height: 35px;
            border: 1px solid #bfbfbf;
            padding: 0 10px;
            clear: left;
        }

        .order-info {
            background-color: #f6f5f5;
            padding: 18px;
            margin-top: 16px;
        }

        .order-info .title {
            color: #222;
            font-size: 18px;
        }

        .goods-info {
            padding-left: -20px;
            padding-right: -20px;
        }

        .goods-info table {
            width: 100%;
            margin-top: 38px;
            text-align: center;
        }

        .goods-info table th {
            padding-bottom: 20px;
        }

        .goods-info table th {
            border-bottom: 1px solid #CCCCCC;
        }

        .goods-info table td {
            padding-top: 28px;
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

        .other-info {
            border-top: 1px solid #CCCCCC;
            margin-top: 10px;
            padding-top: 15px;
        }

        .other-info .memo {
            width: 344px;
            height: 78px;
            margin-left: 83px;
            resize: none;
            padding: 7px;
        }

        .other-info .pay-type {
            margin-left: 116px;
            vertical-align: top;
            padding-top: 5px;
        }

        .other-info .shipping-type {
            margin-left: 224px;
            vertical-align: top;
            padding-top: 5px;
        }

        .submit-box {
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .submit-box .amount-box {
            margin-left: 850px;
        }

        .amount-box .total-amount {
            color: #ff6600;
            font-size: 16px;
        }

        .submit-box input[type='submit'] {
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
        
        /** jquery validation 错误信息样式 **/
        input.error { border: 1px solid red; }
        label.error {
            margin-left: 12px;
            padding-bottom: 2px;
            font-weight: bold;
            font-size: 14px;
            color: red;
        }

    </style>
</head>
<body>
<#include "header1.ftl">
<div class="page-container">
    <div class="title-tab">
        <label class="selected"><span>1</span>填写订单基本信息</label>
        <label class="unselected"><span>2</span>提交生成订单</label>
    </div>
    <form id="valid-form" action="save" method = "post">
    <div class="addr-select">
        <img src="${confs["content.url"]}/img/addr_border_top.png">
        <div class="left">
            <div class="right">
                <div class="title">收货人信息</div>
                <div class="addr-info">
                    <span><input type="radio">收货地址:</span>
                    <span style="margin-left: 30px;">Mr.Li</span>
                    <span style="margin-left: 18px;">18628228047</span>
                    <span style="margin-left: 18px;">四川省成都市高新区香年广场T328楼</span>
                    <button>修改</button>
                </div>
                <div class="addr-append">
                	<input name="goodsId" value="${(goods.id)!}" type="hidden">
                	<input name="quantity" value="${(quantity)!}" type="hidden">
                    <div class="input-group">
                        <label class="label">收货地区<span style="color:red;">*</span>：</label>
                        <input class="field" type="text" name="shipArea">
                    </div>
                    <div class="input-group">
                        <label class="label">详细地址<span style="color:red;">*</span>：</label>
                        <input class="field" name="shipAddr" type="text" placeholder="请输入详细地址">
                    </div>
                    <div class="input-group">
                        <label class="label">收件人<span style="color:red;">*</span>：</label>
                        <input class="field" name="shipName" type="text" placeholder="请输入详细地址">
                    </div>
                    <div class="input-group">
                        <label class="label">联系方式<span style="color:red;">*</span>：</label>
                        <input class="field" name="shipPhone" type="text" maxlength="11" placeholder="请输入联系方式">
                    </div>
                    <div class="input-group">
                        <label class="label">邮政编码：</label>
                        <input class="field" name="shipZip" type="text" maxlength="6" placeholder="请输入邮政编码">
                    </div>
                </div>
            </div>
        </div>
        <img class="border-bottom" src="${confs["content.url"]}/img/addr_border_top.png">
    </div>
    <div class="order-info">
        <div class="title">确认订单信息</div>
        <div class="goods-info">
            <table>
                <thead>
                <tr>
                    <th style="width: 200px;">商品名称</th>
                    <th style="width: 100px;">单价（元）</th>
                    <th style="width: 100px;">数量</th>
                    <th style="width: 100px;">小计</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="goods-name">
                        <img src="${confs["content.njtx.url"]}/img/${goods.coverImg}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
                        <span style="display: inline-block; max-width: 150px;">
                        	<#if (goods.name)?length gt 30 >${(goods.name)?substring(0,30) + "..."}<#else>${(goods.name)!0}</#if>
                        </span>
                    </td>
                    <td class="goods-price">${(goods.price)!}</td>
                    <td class="goods-quantity">${(quantity)!1}</td>
                    <td class="goods-amount">${(goods.price * quantity)!}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="other-info">
            <textarea class="memo" name="shipMemo" placeholder="买家留言"></textarea>
            <span class="pay-type">支付方式：在线支付</span>
            <span class="shipping-type">运送方式：快递 包邮</span>
        </div>
        <div class="submit-box">
            <span class="amount-box">合计：<span class="total-amount">${(goods.price * quantity)!}</span></span>
            <input type="submit" value="提交订单" >
        </div>
    </div>
</form>

</div>
<#include "footer.ftl">
</body>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery.lSelect.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function(){
		var $areaSelect =$("input[name='shipArea']");
		$areaSelect.lSelect({
			url: "../addr-sel"// AJAX数据获取url
		});
		
		$("#valid-form").validate({
            rules: {
                shipName : {
                    required: true
                },
                shipPhone: {
                	required: true,
                	isMobile: true
                },
                shipArea : {
                	required: true
                },
                shipAddr :{
                	required : true
                }
            },
            messages: {
                shipName : {
                    required: "请输入收货人姓名"
                },
                shipPhone: {
                	required: "请输入联系电话",
                	isMobile: "手机号码格式错误"
                },
                shipArea : {
                	required: "请选择收货地区"
                },
                shipAddr :{
                	required : "请输入详细地址"
                }
            }
        });
        
        // 手机号码验证
		jQuery.validator.addMethod("isMobile", function(value, element) {
			var length = value.length;
			var mobile = /^(1[0-9]{10})$/;
			return this.optional(element) || (length == 11 && mobile.test(value));
		}, "手机号码格式错误");
	});
</script>
</html>