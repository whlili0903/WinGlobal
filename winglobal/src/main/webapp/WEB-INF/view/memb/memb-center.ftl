<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-menu.css"/>
	<style>

        .tab-lands {
            display: inline-block;
            width: 372px;
            padding: 34px;
            background-color: #ffffff;
        }

        .tab-goods {
            display: inline-block;
            width: 372px;
            padding: 34px;
            background-color: #ffffff;
            vertical-align: top;
        }

        .tab-name {
            margin-bottom: 4px;
        }

        .tab-goods .title div, .tab-lands .title div {
            width: 80px;
            text-align: center;
        }

        .tab-goods .title img, .tab-lands .title img {
            width: 80px;
        }

        .list ul {
            list-style: none;
            margin-top: 0px;
            padding: 0;
        }

        .list ul li {
            padding: 16px 0;
            border-bottom: 1px dashed #a0a0a0;
        }

        .list ul li img {
            width: 80px;
            height: 80px;
        }

        .list .info {
            max-width: 265px;
            display: inline-block;
            vertical-align: top;
            margin-left: 18px;
        }

        .list .info .name {
            font-size: 14px;
            color: #222;
        }

        .list .info .area, .list .info .price {
            margin-top: 8px;
            font-size: 12px;
            color: #706f6f;
        }

        .btn-more {
            text-align: center;
            padding-top:10px;
        }

        .btn-more button {
            height: 26px;
            width: 68px;
            line-height: 16px;
            border: 1px solid #0ab552;
            background: #FFFFFF;
            border-radius: 3px;
            cursor: pointer;
            font-size: 12px;
            color: #807e7e;
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
	</style>
	<script>
        $(document).ready(function(){
        	//initPage();
        });
	</script>
</head>
<body>
<#include "header2.ftl">
<div class="body-div">
	<div class="header-div"></div>
	 <div class="page-container">
	 	<#include "memb/memb-menu.ftl">
        <div class="content" style="padding-bottom:40px;">
        <div class="tab-lands" <#if lands?size lt 1 >style="height:422px;text-align: center;"</#if>  >
            <div class="title">
                <div class="tab-name">
                    	我的土地
                </div>
                <div>
                    <img src="${confs["content.url"]}/img/memb_tab.png">
                </div>
            </div>
            <#if lands?size gt 0>
            <div class="list">
                <ul>
                    <#list lands as land>
                    <li>
                    	<img src="${confs["content.njtx.url"]}/img/${land.img}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
                        <div class="info">
                            <div class="name">
                            	<#if (land.name)?length gt 30>${(land.name)?substring(0,30) + ".."!}<#else>${(land.name)!}</#if>
                            </div>
                            <div class="area">面积：${(land.acre)!0}${(fetrs[land.upu])!}</div>
                            <div class="price">总价：${(land.sp)!'面议'}${(fetrs[land.spu])!}</div>
                        </div>
                        </li>
                    </#list>
                </ul>
            </div>
            <#if lands?? && lands?size = 5 >
	            <div class="btn-more">
	                <button id="landMoreBtn">更多</button>
	            </div>
            </#if>
            <#else>
            	<img style="margin-top: 30%;" src="${confs["content.url"]}/img/prom_land.png" />
            	<div class="btn-div"><button class="btn-link" onclick="javascript:window.location.href='../land/add-init'" >我要发布</button> </div>
            </#if>
        </div>
        <div class="tab-goods" <#if goods?size lt 1>style="height:422px;text-align: center;"</#if> >
            <div class="title">
                <div class="tab-name">
                    	我的商品
                </div>
                <div>
                    <img src="${confs["content.url"]}/img/memb_tab.png">
                </div>
            </div>
            <#if goods?size gt 0>
            <div class="list">
                <ul>
                    <#list goods as g>
                    	<li>
	                        <img src="${confs["content.njtx.url"]}/img/${g.coverImg}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
	                        <div class="info">
	                            <div class="name">
	                            	<#if (g.name)?length gt 30>${(g.name)?substring(0,30)!}<#else>${(g.name)!}</#if>
	                            </div>
	                            <div class="area">库存：${(g.store)!0}</div>
	                            <div class="price">单价：${(g.price)!0.00}元</div>
	                        </div>
                    	</li>
                    </#list>
                </ul>
            </div>
            <#if goods?? && goods?size = 5 >
	            <div class="btn-more">
	                <button id="goodsMoreBtn">更多</button>
	            </div>
            </#if>
            <#else>
            	<img style="margin-top: 27%;" src="${confs["content.url"]}/img/prom_goods.png" />
            	<div class="btn-div"><button class="btn-link" onclick="javascript:window.location.href='../goods/add'" >我要发布</button> </div>
            </#if>
        </div>
    </div>
    </div>
<div class="clear-float"></div>
</div>
<#include "footer.ftl">
</body>
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
<script>
	$(function(){
		
		$("#landMoreBtn").click(function(){
			window.location.href = "../land/memb-land";
		})
		
		$("#goodsMoreBtn").click(function(){
			window.location.href = "../memb/goods";
		})
		
	})
</script>
</html>