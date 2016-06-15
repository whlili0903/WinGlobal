<!DOCTYPE html>
<html lang="en">
<head>
	<#include "head.ftl">
	<#assign  parm=5>
    <meta charset="UTF-8">
    <title>农产品</title>
	<link rel="stylesheet" href="${confs["content.url"]}/css/banner.css"/>
	<style>
	    body {
	        width: 100%;
	        margin: 0 auto;
	    }
	
	    .page-container {
	        width: 1200px;
	        margin: 0 auto;
	        padding-top: 33px;
	    }
	
	    .index-page-header {
	        height: 540px;
	        width: 100%;
	        margin: 0 auto;
	    }
	
	    .index-page-header .banner {
	        width: 100%;
	        height: 540px;
	    }
	
	    .flexslider {
	        margin: 0 auto;
	        position: relative;
	        width: 100%;
	        height: 540px;
	        overflow: hidden;
	        zoom: 1;
	    }
	
	    .flexslider ul {
	        margin: 0;
	    }
	
	    .index-page-header .slid-menu {
	        width: 100%;
	        height: 540px;
	        position: absolute;
	        top: 0;
	        padding: 0;
	    }
	
	    .index-page-header > .slid-menu > div {
	        width: 1200px;
	        margin: 0 auto;
	    }
	
	    .index-page-header .slid-menu > div > ul.slid-menu-list {
	        width: 202px;
	        height: 540px;
	        list-style: none;
	        background-color: #000000;
	        opacity: 0.7;
	        filter: Alpha(opacity=70);
	        margin: 0;
	        padding-left: 0px;
	    }
	
	    .slides > li > img {
	        no-repeat: center;
	        position: absolute;
	        top: 0;
	    }
	
	    ul.slid-menu-list > li {
	    	width:100%;
	        height: 50px;
	        line-height: 50px;
	        color: #ffffff;
	        font-size: 18px;
	        cursor: pointer;
	        text-align: center;
	        clear: both;
	    }
	
	    ul.slid-menu-list > li > .enter {
	        height: 50px;
	        margin-right: 12px;
	        display: inline-block;
	        float: right;
	    }
	
	    .recommend-title {
	        width: 100%;
	        background: #47b475;
	        height: 46px;
	        border-radius: 10px;
	    }
	
	    .recommend-title > div {
	        display: inline-block;
	        width: 124px;
	        height: 34px;
	        margin-top: 6px;
	        margin-left: 10px;
	        text-align: center;
	        line-height: 34px;
	        font-size: 18px;
	        color: #222;
	        border-radius: 10px;
	        background-color: white;
	    }
	
	    .recommend-content {
	        margin-top: 25px;
	    }
	
	    .recommend-content > .item {
	        float: left;
	    }
	
	    .recommend-content .item .goods-img {
	        width: 213px;
	        height: 211px;
	        border: 1px solid #d6d4d4;
	        border-radius: 5px;
	    }
	
	    .recommend-content .item .goods-name {
	    	width: 213px;
	        font-size: 16px;
	        color: #222222;
	        margin-top: 10px;
	    }
	
	    .recommend-content .item .goods-price {
	        color: #fe4200;
	        font-size: 18px;
	        margin-top: 5px;
	    }
	
	    .margin-left-30 {
	        margin-left: 30px;
	    }
	
	    .session-title {
	        width: 100%;
	        border-bottom: 1px solid #47b475;
	        padding: 20px 0 20px;
	        clear: both;
	    }
	
	    .session-title > .page {
	    	margin: 0;
	        background-image: url('${confs["content.url"]}/img/bg_title.png');
	        color: white;
	        display: inline-block;
	        width: 91px;
	        height: 42px;
	        text-align: center;
	        line-height: 42px;
	        clear: both;
	    }
	
	    .session-title .more {
	    	padding-top:20px;
	        display: inline-block;
	        width: 91px;
	        text-align: center;
	        line-height: 42px;
	        float: right;
	        font-size: 18px;
	        color: #222222;
	    }
	
	    .session-title > .name {
	        line-height: 42px;
	        display: inline-block;
	        font-size: 26px;
	        color: #222;
	    }
	
	    .session-content {
	        height: 473px;
	        padding-top: 23px;
	        padding-bottom: 10px;
	    }
	
	    .session-content > .slogan {
	        float: left;
	        position: relative;
	        width: 262px;
	        height: 473px;
	        background: url("${confs["content.url"]}/img/bg_bar.png");
	        text-align: center;
	        border: 1px solid #cdcccc;
	        clear: right;
	    }
	
	    .session-content .slogan .title {
	        font-size: 28px;
	        color: #333333;
	        margin-top: 54px;
	    }
	
	    .session-content .slogan .sub-title {
	        margin-top: 18px;
	        font-size: 18px;
	        color: #676767;
	    }
	
	    .session-content > .container {
	        width: 935px;
	        height: 473px;
	        float: left;
	    }
	
	    .session-content > .container > .goods {
	    	position: relative;
	        border-top: 1px solid #cdcccc;
	        border-right: 1px solid #cdcccc;
	        border-bottom: 1px solid #cdcccc;
	        display: block;
	        width: 231px;
	        height: 236px;
	        float: left;
	    }
	    
	   .session-content > .container > .goods img{
	   	 	width: 100%;
	   	 	height:100%;
	   }
	
	    .goods .title-con {
	    	position: absolute;
        	top:0;
	        height: 80px;
	        width: 100%;
	        background-color: white;
	        opacity: 0.7;
	        filter: Alpha(opacity=70);
	    }
	
	    .goods .title-con .goods-name {
	    	height: 50px;
	        padding-top: 6px;
	        padding-left: 16px;
	        font-size: 16px;
	        color: #222222;
	    }
	
	    .goods .title-con .goods-price {
	        margin-bottom: 8px;
	        padding-left: 16px;
	        font-size: 16px;
	        color: #fe4200;
	    }
	
	</style>
</head>

<body>
<#include "header1.ftl">
<div class="index-page-header">
    <div class="banner">
        <div id="banner_tabs" class="flexslider">
            <ul class="slides">
                <li>
                    <img alt="" style="background: url(${confs["content.url"]}/img/shop_banner1.png);"
                         src="${confs["content.url"]}/img/alpha.png">
                </li>
                <li>
                    <img alt="" style="background: url(${confs["content.url"]}/img/shop_banner2.png);"
                         src="${confs["content.url"]}/img/alpha.png">
                </li>
                <li>
                    <img alt="" style="background: url(${confs["content.url"]}/img/shop_banner3.png);"
                         src="${confs["content.url"]}/img/alpha.png">
                </li>
            </ul>
            <ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
                <li><a>1</a></li>
                <li><a>2</a></li>
                <li><a>3</a></li>
            </ol>
        </div>
        <div style="width:1200px; margin: 0 auto;">
        	<div class="slid-menu">
		        <div>
		            <ul class="slid-menu-list">
		                <li style="background: url('${confs["content.url"]}/img/ic_1.png') no-repeat center left 10%;">
		                    	生鲜水果
		                    <div class="enter">
		                        <img src="${confs["content.url"]}/img/ic_enter.png">
		                    </div>
		                </li>
		                <li style="background: url('${confs["content.url"]}/img/ic_1.png') no-repeat center left 10%;">
		                   	 干货特产
		                    <div class="enter">
		                        <img src="${confs["content.url"]}/img/ic_enter.png">
		                    </div>
		                </li>
		                <li style="background: url('${confs["content.url"]}/img/ic_1.png') no-repeat center left 10%;">
		                    	休闲食品
		                    <div class="enter">
		                        <img src="${confs["content.url"]}/img/ic_enter.png">
		                    </div>
		                </li>
		                <li style="background: url('${confs["content.url"]}/img/ic_1.png') no-repeat center left 10%;">
		                   	 茶
		                    <div class="enter">
		                        <img src="${confs["content.url"]}/img/ic_enter.png">
		                    </div>
		                </li>
		                <li style="background: url('${confs["content.url"]}/img/ic_1.png') no-repeat center left 10%;">
		                    	其他
		                    <div class="enter">
		                        <img src="${confs["content.url"]}/img/ic_enter.png">
		                    </div>
		                </li>
		            </ul>
		        </div>
		    </div>
        </div>
    </div>
</div>

<div class="page-container">
	<#if goods['sales'] ??>
	    <div class="recommend-title">
	        <div>今日特供</div>
	    </div>
	
	    <div class="recommend-content">
	    	<#list goods['sales'] as g>
	        <div class="item <#if g_index != 0>margin-left-30</#if> ">
	        	<a href="../goods/detail?id=${(g.id)!}">
		            <img class="goods-img" src="${confs["content.njtx.url"]}/img/${g.coverImg}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'" >
		            <div class="goods-name"><#if g.name?length gt 30 >${(g.name)?substring(0,30)+"..."}<#else>${(g.name)!}</#if> ${(g.weight)!0}g</div>
		            <div class="goods-price">￥${(g.price)!}</div>
	        	</a>
	        </div>
	    	</#list>
	    </div>
     	<div style="clear:both;"></div>
	</#if>
	
	<#assign itemIndex = 0 />	
	<#list opts['GC'].children?values as gc>
		<#if goods[gc.code?string] ?? >
			<#assign itemIndex = itemIndex + 1 />	
			<div class="session-title">
	            <label class="page">P${(itemIndex)!1}</label>
	            <label class="name">${(gc.name)!}</label> 
	            <label class="more">查看更多</label>
        	</div>
        	<div class="session-content">
            <div class="slogan">
                <div class="title">${(gc.name)!}专场</div>
                <div class="sub-title">美味多汁 健康生活</div>
            </div>
            <div class="container">
            	<#list goods[gc.code] as g>
	                <div class="goods" >
	                	<a href="../goods/detail?id=${(g.id)!}">
		                	<img src="${confs["content.njtx.url"]}/img/${g.coverImg}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
		                    <div class="title-con">
		                        <div class="goods-name"><#if g.name?length gt 15 >${(g.name)?substring(0,15)+"..."}<#else>${(g.name)!}</#if> ${(g.weight)!0}g</div>
		                        <div class="goods-price">￥${(g.price)!}</div>
		                    </div>
	                    </a>
	                </div>
            	</#list>
            </div>
        </div>
		</#if>
	</#list>
</div>
<#include "footer.ftl">
</body>
<script>
    $().ready(function () {
        var bannerSlider = new Slider($('#banner_tabs'), {
            time: 3000,
            delay: 400,
            event: 'hover',
            auto: true,
            mode: 'fade',
            controller: $('#bannerCtrl'),
            activeControllerCls: 'active'
        });
        $('#banner_tabs .flex-prev').click(function () {
            bannerSlider.prev()
        });
        $('#banner_tabs .flex-next').click(function () {
            bannerSlider.next()
        });
        $(".category p span a").click(function () {
            $(this).css("color", "#0ab552");
            $(this).siblings().css("color", "#202020");
        });
    })
</script>
</html>