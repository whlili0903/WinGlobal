<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:wb="http://open.weibo.com/wb">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<#assign  parm=1>
	<script type="text/javascript">
		function selectType(id){
			$(".ul-lt").css("display","none");
			$("#ul-"+id).css("display","block");
			$("#typeTitle a").attr("class","rginptu2");
			$("#a-"+id).attr("class","rginptu");
		}
	</script>
	<style>
		.category ul li:hover img{
		border-color:#0AB552;
}
.category ul li:hover img .introwrap{
	border-color:#0AB552;
}
.intro{
	font-size:16px;
	color: #202020;
	margin-bottom: 15px;
	height: 27px;
}
.intro:hover{
	color:#0AB552;
}
.foot-img-div{
	float: left;
    width: 120px;
    height: 80px;
    line-height: 23px;
    text-align:center;
    margin-left: 40px;
    margin-right: 40px;
}
.foot-img-div img{
	width:77px;
	height:70px;
	border-radius: 100px;
}
.foot{
	overflow: hidden;
	background: #ffffff;
	height: 150px;
    line-height: 150px;
}
.foot-top-line{
    width: 1200px;
    margin: 0 auto;
    margin-top: 50px;
    vertical-align: middle;
    text-align: center;
    font-size:18px;
}
.body-div{
	width:1200px;
	margin:auto;
}
.land-title{
    height: 128px;
    text-align: center;
    width: 100%;
}
.birder-line-m1{
	font-weight: bold;
	font-size: 28px;
	color: #222222;
	padding-top:63px;
	margin:auto;
	width:200px;
	text-align:center;
	display: block;
}
.land-hr-left{
    width: 490px;
    margin-top: 81px;
    margin-left: 8px;
    float: left;
    border-top: solid 1px #979797;
}
.land-hr-right{
    width: 490px;
    margin-top: 81px;
    margin-right: 8px;
    float: right;
    border-top: solid 1px #979797;
}
<#assign landTypeLength = 0 />
<#list fetrs['LT'].children?values as t>
	<#if lands[t.code]?? >
		<#assign landTypeLength = landTypeLength+1 />		
	</#if>
</#list>
<#assign landTypeLength = landTypeLength*171 />	
.land-type-title{
	width:${landTypeLength}px;
	padding-top: 32px;
	height:162px;
	margin:auto;
	text-align:center;
}
.land-type-div{
	width: 171px;
    float: left;
    height: 100px;
}
.land-title-name{
	padding-top: 22px;
    display: block;
    width:171px;
    text-center:center;
}
.land-type-div img{
 	     cursor: pointer;
 }  
.rginptu {
    color: #0ab552;
    font-size: 18px;
}
.rginptu2 {
    color: #222222;
    font-size: 18px;
}
	.land-tag{
		width:60px;
		position: absolute;
    	z-index: 222;
	}
	</style>
</head> 
<body>
	<#include "header1.ftl">
	<div class="body-div">
	<#include "banner.ftl">
	<div style="width:1200px;height:194px;background-color: #eee;">
	<div class="land-type-title" id="typeTitle">
	<#assign ltIndex = 0>
	<#list fetrs['LT'].children?values as t>
		<#if lands[t.code]?? >
			<div class="land-type-div">
				<img src="${confs["content.url"]}/img/${t.code}.png" onclick="selectType('${t.code}')"/><br/>
			<a id="a-${t.code}" class="<#if ltIndex==0>rginptu<#else>rginptu2</#if>" href="javascript:selectType('${t.code}');">
				<span class="land-title-name">${t.name}</span>
			</a>
	        </div>
	        <#assign ltIndex = 1>
	    </#if>
	</#list>
	</div>
	</div>
    <div class="mid">
       	  <div class="category">
       	  	<div class="land-title">	
	           <div class="land-hr-left" ></div>
	           <div class="land-hr-right"></div>
	           <span class="birder-line-m1" >农交推荐</span>
	        </div>
        <#assign ltIndex = 0>
		<#list fetrs['LT'].children?values as t>
		<#if lands[t.code]?? >
        <ul id="ul-${t.code}" class="ul-lt" style="display:<#if ltIndex==0>block<#else>none</#if>;">
        <#assign ltIndex = 1>
        	<#list lands[t.code] as land>
            <li>
                <a href="../land/detail?id=${land.id}" target="_blank">
                <img src="${confs["content.njtx.url"]}/img/${land.img}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'"/>
              <#if land.stat=="AS02">  <img src="${confs["content.url"]}/img/jyz.png"
                style="width: 86px;height: 84px; border: none; position: absolute;margin-top: -222px;margin-left: 6px;" /></#if>
                <div class="introwrap">
                    <p class="intro"><#if land.name?length gte 30 >${(land.name)?substring(0,30)+"..."}<#else>${land.name}</#if></p>
                    <span class="red">
                     <#if land.sp != null>
                     <span style="font-size:20px;">${land.sp?string("#.##")}</span>${opts["SU"].children[land.spu].name}&nbsp;&nbsp;&nbsp;
                    </#if>
                    <#if land.up != null && land.up !=0>
                    	<span style="<#if land.sp == null || land.sp == 0>font-size:20px;</#if>">${land.up?string("#.##")}</span>${opts["UU"].children[land.upu].name}
                    <#else>
                    	<#if land.sp == null || land.sp == 0>
                    		<span style="font-size:20px;">面议</span>
                    	</#if>
                    </#if>
                    </span></span>
                   <!-- <p class="benifit">
                        <span>性价比高</span>
                        <span>面积集中</span>
                        <span>水源便利</span>
                    </p>-->
                </div>
                </a>
            </li>
            </#list>
        </ul>
         </#if>
        </#list>
    </div>
	<#list fetrs['SU'].children?values as su>
	<#if lands[su.code]??>
    <div class="category">
        <div class="land-title">	
	           <div class="land-hr-left" ></div>
	           <div class="land-hr-right"></div>
	           <span class="birder-line-m1">${su.name}</span>
	        </div>
        <ul>
        	<#list lands[su.code] as land>
            <li>
                <a href="../land/detail?id=${land.id}" target="_blank">
                <img src="${confs["content.njtx.url"]}/img/${land.img}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'" />
                <#if land.stat=="AS02">  <img src="${confs["content.url"]}/img/jyz.png"
                style="width: 86px;height: 84px; border: none; position: absolute;margin-top: -222px;margin-left: 6px;" /></#if>
                <div class="introwrap">
                    <p class="intro"><#if land.name?length gte 30 >${(land.name)?substring(0,30)+"..."}<#else>${land.name}</#if></p>	
                    <span class="red">
                     <#if land.sp != null>
                    	 <span style="font-size:20px;">${land.sp?string("#.##")}</span>${opts["SU"].children[land.spu].name}&nbsp;&nbsp;&nbsp;
                    </#if>
                    <#if land.up != null && land.up!=0 >
                    	<span style="<#if land.sp == null || land.sp == 0>font-size:20px;</#if>">${land.up?string("#.##")}</span>${opts["UU"].children[land.upu].name} 
                    <#else>
                   		 
                    	<#if land.sp == null || land.sp == 0>
                    		<span style="font-size:20px;">面议</span>
                    	</#if>
                    </#if>
                   </span>
                    <!--<p class="benifit">
                        <span>性价比高</span>
                        <span>面积集中</span>
                        <span>水源便利</span>
                    </p> -->
                </div>
                </a>
            </li>
            </#list>
        </ul>
    </div>
    </#if>
	</#list>
    </div>
	<div class="foottop">
		<div class="foot foot-top-line">
		<div style="margin:auto;width:800px;margin-top:20px;">
			<div class="foot-img-div">
		  	  <img src="${confs["content.url"]}/img/mj.png" />
		  	  <div>卖家保障</div>
		    </div>
		    <div class="foot-img-div">
		    	<img src="${confs["content.url"]}/img/mj2.png" />
		      	<div>买家保障</div>
		    </div>
		    <div class="foot-img-div">
		    	<img src="${confs["content.url"]}/img/bz.png" />
		   		<div>贴心服务</div>
		    </div>
		    <div class="foot-img-div">
		    	<img src="${confs["content.url"]}/img/tx.png" />
		    	<div>权证服务</div>
		    </div>
		    </div>
		</div>
	</div>
	<div class="clear-float"></div>
</div>
<#include "footer.ftl">
<#include "suspend-menu.ftl">
</body>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
</html>
<script type="text/javascript">
$(function() {
    var bannerSlider = new Slider($('#banner_tabs'), {
        time: 3000,
        delay: 400,
        event: 'hover',
        auto: true,
        mode: 'fade',
        controller: $('#bannerCtrl'),
        activeControllerCls: 'active'
    });
    $('#banner_tabs .flex-prev').click(function() {
        bannerSlider.prev()
    });
    $('#banner_tabs .flex-next').click(function() {
        bannerSlider.next()
    });
    $(".category p span a").click(function() {
		 $(this).css("color","#0ab552");
		$(this).siblings().css("color","#202020");
	});
})
</script>
