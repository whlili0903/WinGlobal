<!DOCTYPE html>
<html lang="en">
<head>
	<#include "head.ftl">
	<#assign  parm=5>
    <meta charset="UTF-8">
    <title>商品详情</title>

    <style>

        body {
            width: 100%;
            margin: 0 auto;
        }

        ul, ol {
            list-style: none;
        }

        .page-container {
            width: 1200px;
            margin: 0 auto;
            padding: 20px 0;
        }

        .goods-info {
            height: 495px;
        }

        .goods-info .goods-img {
            float: left;
        }

        .goods-img .big {
            width: 400px;
            height: 400px;
        }

        ul.cover li {
            display: inline-block;5
            margin: 0;
            width: 83px;
            height: 83px;
            border-radius: 3px;

        }

        ul.cover li {
            margin-left: 20px;
        }

        ul.cover li a img {
            width: 83px;
            height: 83px;
        }

        ul.cover li.checked{
            border: 2px solid #8c8d8d;
        }

        .goods-meta {
            top: 0;
            width: 734px;
            height: 453px;
            margin-left: 20px;
            border: 1px solid #c8c6c6;
            float: left;
            padding: 26px 22px 10px;
        }

        .goods-title {
            font-size: 20px;
            color: #222;
        }

        .goods-title .goods-weight {
            margin-left: 16px;
        }

        .goods-intr {
            padding-top: 22px;
            font-size: 18px;
            color: #222;
        }

        .goods-price {
            height: 94px;
            margin-top: 22px;
            background: url("${confs["content.url"]}/img/bg_goods_price.png");
            margin-left: -22px;
            margin-right: -22px;
        }

        .goods-price .left {
            display: inline-block;
            font-size: 18px;
            color: #222;
            margin-left: 22px;
            padding-top: 16px;
            margin-right: 100px;
        }

        .market-price {
            text-decoration: line-through;
        }

        .goods-price .collection {
            background: url("${confs["content.url"]}/img/ic_collection.png") no-repeat center;
            display: inline-block;
            margin-top: 38px;
            padding-left: 55px;
            margin-right: 22px;
            float: right;
        }

        .btn-add, .btn-del {
            position: relative;
            display: inline-block;
            width: 26px;
            height: 25px;
            text-align: center;
            border: 1px solid #222;
            line-height: 25px;
            cursor: pointer;
            top: 1px;
        }

        .buy-count {
            display: inline-block;
            width: 76px;
            height: 25px;
            text-align: center;
            border: 1px solid #222;
            line-height: 25px;
            margin: 0 -3px;
        }

        .buy-btn {
            display: inline-block;
            margin-top: 36px;
        }

        .buy-btn input[type='submit'] {
            border: none;
            width: 160px;
            height: 45px;
            text-align: center;
            background-color: #fc984b;
            color: #fff;
            font-size: 22px;
            cursor: pointer;
        }

        .store {
            display: inline-block;
            height: 50px;
            line-height: 50px;
            float: right;
            margin-top: 40px;
        }

        .store img {
            width: 45px;
            height: 45px;
            border: 1px solid #ccc;
            border-radius: 23px;
            vertical-align: middle;
        }

        .store span {
            font-size: 14px;
            color: #222;
        }

        .goods-desc {
        	margin-top:10px;
            clear: both;
            border: 1px solid #ccc;
        }

        .goods-desc .tab {
            height: 50px;
            line-height: 50px;
            border-bottom: 1px solid #ccc;
        }

        .goods-desc .tab label {
            display: inline-block;
            width: 117px;
            text-align: center;
            border-right: 1px solid #ccc;
        }

        .goods-desc .content {
            min-height: 500px;
            padding: 20px;
        }

    </style>

</head>
<body>
<#include "header1.ftl">
<div class="page-container">
    <div class="goods-info">
        <div class="goods-img">
            <img class="big" src="${confs["content.njtx.url"]}/img/${goods.coverImg}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
            <ul class="cover">
            	<#if (goods.imgs) ??>
            		<#list goods.imgs as img>
            			<#if img_index < 4>
	            		  	<li <#if img_index == 0>class="checked"</#if> style="margin-left: 0;">
			                    <a href="javascript:">
			                        <img src="${confs["content.njtx.url"]}/img/${img.url}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
			                    </a>
			                </li>
            			</#if>
            		</#list>
            	</#if>
            </ul>
        </div>
        <form id="submitForm" action="../orders/add" method="post">
        <input type="hidden" name="goodsId" value="${(goods.id)!}">
        <div class="goods-meta">
            <div class="goods-title">
                <span class="goods-name">${(goods.name)!}</span>
                <span class="goods-weight">${(goods.weight)!}g</span>
            </div>
            <div class="goods-intr">
                <span>商品简介：${(goods.intr)!}</span>
            </div>
            <div class="goods-price">
                <div class="left">
                    <div>
                        <span>市场价：</span>
                        <span class="market-price">￥${(goods.marketPrice)!0.00}</span>
                    </div>
                    <div class="price">
                        <span>农交价格：</span>
                        <span style="font-size: 30px; color: #ff6600;">￥${(goods.price)!0.00}</span>
                    </div>
                </div>
                <span class="collection">收藏</span>
            </div>
            <div class="goods-intr">
                <span>商品重量：</span><span>${(goods.weight)!0}g</span>
            </div>
            <div class="goods-intr">
                <span>商品已售：</span><span>${(goods.sales)!0}</span>
            </div>
            <div class="goods-intr">
                <span>数量：</span>
                <span class="btn-del">-</span>
                <input class="buy-count" name="quantity" value="1">
                <span class="btn-add">+</span>
            </div>
            <div>
                <div class="buy-btn">
                    <input type="submit" value="立即购买" >
                </div>
                <#if storeMemb ??>
	                <div class="store">
	                    <img src="${confs["content.njtx.url"]}/img/${storemMemb.head}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
	                    <span>${(storemMemb.name)!''}</span>
	                </div>
                </#if>
            </div>
        </div>
        </form>
    </div>
    <div class="goods-desc">
        <div class="tab">
            <label>商品详情</label>
        </div>
        <div class="content">
            ${(goods.desc)!}
        </div>
    </div>
</div>
<#include "footer.ftl">
</body>
<script>

    $().ready(function () {

        $("ul.cover>li").mouseover(function () {
            var imgUrl = $(this).find("a>img").attr("src");
            $("img.big").attr("src", imgUrl);
            $("ul.cover>li.checked").removeClass("checked");
            $(this).addClass("checked")
        });

        var $buyCount = $(".buy-count");
        $(".btn-add").click(function(){
            var count = parseInt($buyCount.val());
            $buyCount.val(++count);
        });

        $(".btn-del").click(function(){
            var count = parseInt($buyCount.val());
            if(count > 1 ){
                $buyCount.val(--count);
            }
        });
        
        $("#submitForm").submit(function(){
        	var loginMembId = "${(memb.id)!}";
        	var goodsMembId = "${(goods.membId)!}";
        	if(loginMembId != '' && loginMembId == goodsMembId ){
        		alert("自己不能购买自己的商品");
        		return false;
        	}
        	return true;
        });
    });

</script>
</html>