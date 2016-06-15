<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/persion.css" />
	<!-- <script type="text/javascript" src="${confs["content.url"]}/js/persion.js"></script> -->
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
	</style>
	<script>
        $(document).ready(function(){
        	initPage();
            $(".all-select-img").click(function(){
                var imgElement = $(this).find("img");
                var imgSrc = imgElement.attr("src");
                if(imgSrc.indexOf("ku.png") !=-1 ){
                    imgElement.attr("src",imgSrc.replace("ku.png","go.png"));
                    $(".body-head-div1").find("img").attr("src",imgSrc.replace("ku.png","go.png"));
                }else{
                    imgElement.attr("src",imgSrc.replace("go.png","ku.png"));
                    $(".body-head-div1").find("img").attr("src",imgSrc.replace("go.png","ku.png"));
                }
            });
            
            $(".all-select").click(function(){
                $(".all-select-img").click();
            });
            
             $(".body-head-div1").click(function(){
                var imgElement = $(this).find("img");
                var imgSrc = imgElement.attr("src");
                if(imgSrc.indexOf("ku.png") !=-1 ){
                    imgElement.attr("src",imgSrc.replace("ku.png","go.png"));
                }else{
                    imgElement.attr("src",imgSrc.replace("go.png","ku.png"));
                    $(".all-select-img").find("img").attr("src",imgSrc.replace("go.png","ku.png"));
                }
            });
            $("#sltLandDel").click(function(){
           		var reserveId = $(this).attr("id");
            	var objIds = "";
            	$(".body-head-div1").find("img").each(function(index,element){
            		if($(element).attr("src").indexOf("go.png") != -1){
            			var imgId = $(element).attr("landId");
            			objIds = objIds+imgId+",";
            		}
            	});
            	if(objIds == ""){
            		msgPrompt("请选择要删除的土地","warn");
            		return false;
            	}
            	msgPrompt("你确定要删除吗？","warn",function(objIds){
           			$.post("../land/remove", { "landId":objIds,"pageCode":$("#pageCode").val()},
   					function(data){
   					if(data.succ){
   						var ids = objIds.split(",");
   						msgPrompt(data.msg,"succ");
	   					for(var i = 0 ; i<ids.length ; i++){
	   						$("div[landIdDiv='"+ids[i]+"']").remove();
	   					}
   					}else{
   						msgPrompt(data.msg,"warn");
   					}
  				}, "json");
           		},objIds);
            });
            
            $("div[divId='membLand']").click(function(){
          		var landId = $(this).attr("landId");
            	msgPrompt("你确定要删除吗？","warn",function(landId){
           			$.post("../land/remove", { "landId":landId,"pageCode":$("#pageCode").val()},
   					function(data){
   					if(data.succ){
   						msgPrompt(data.msg,"succ");
   						$("div[landIdDiv='"+landId+"']").remove();
   					}else{
   						msgPrompt(data.msg,"warn");
   					}
  				}, "json");
           		},landId);
            });
        });
	</script>
</head>
<body>
	<#include "header2.ftl">
<div class="body-div" style="height:865px;">
	<div class="header-div"></div>
	 <div class="center-div">
	 	<#include "memb/persion.ftl">
          <div class="right-div" id="olContent" >
            <div class="right-head-div" style="position:relative"><div class="head-text-div">我的土地</div>
                <div class="right-head-oper"><div class="all-select-img" style="margin-top:0px;"><img src="${confs["content.url"]}/img/ku.png" style="margin-top:24px;    display: block;" /> </div><div class="all-select">全选</div><div class="all-oper" id="sltLandDel">删除</div></div>
                <div class="clear-float"></div>
                <div class="img-div"><img src="${confs["content.url"]}/img/bottom.png"/></div>
            </div>
            <div style="height:675px;overflow:auto;float:left;margin-top:30px;position:relative">
            <#list membLands as land>
            <div class="right-body-div" landIdDiv="${land.id}"  style="position:relative">
                <div class="right-body-head">
                    <div class="body-head-div1">
                    <#if !(opts["AS"].children[land.stat].code=="AS02" || opts["AS"].children[land.stat].code=="AS03")>
                    <img src="${confs["content.url"]}/img/ku.png" landId="${land.id}" style=" display: block;" />
                    <#else>
                    &nbsp;
                    </#if></div>
                    <div  class="body-head-div2">图片信息</div>
                    <div  class="body-head-div3">土地信息</div>
                    <div  class="body-head-div6">操作</div>
                    <div  class="body-head-div5">审核状态</div>
                    <div  class="body-head-div4">上传时间</div>
                </div>
                <div class="right-body-content">
                    <div class="body-content-div1">
                     <img src="${confs["content.njtx.url"]}/img/${land.img}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'"/>
                     </div>
                    <div class="body-content-text">
                    <div  class="body-content-div2">
                        <div class="body-content-name"><#if land.audit = "AS01" ><a href="../land/detail?id=${land.id}" target="_blank">${land.name}</a><#else>${land.name}</#if></div>
                            <div class="body-content-info">土地类型：${fetrs['LT'].children[land.type].name}</div>
                            <div class="body-content-info">区域位置：<#if land.area??><#if land.area?length gt 1>${addrs[land.area[0..1]].name}</#if><#if land.area?length gt 3>${addrs[land.area[0..1]].children[land.area[0..3]].name}</#if><#if land.area?length gt 5>${addrs[land.area[0..1]].children[land.area[0..3]].children[land.area[0..5]].name}</#if></#if>${land.addr}</div>
                            <div class="body-content-info">
                            <#if land.sp != null && land.sp != 0>
                            	${land.sp?string("#.##")}${opts["SU"].children[land.spu].name}
                            <#elseif land.up != null && land.up != 0>
                            	${land.up?string("#.##")}${opts["UU"].children[land.upu].name}
                            <#else>
                            	面议
                            </#if>
                            &nbsp;${land.acre?string("#.##")}${opts["AU"].children[land.au].name}&nbsp;
                            &nbsp;${land.years}年
                            </div>
                    </div>
	                    <#if opts["AS"].children[land.stat].code=="AS02" || opts["AS"].children[land.stat].code=="AS03">
	                   		<div  class="body-content-div5" >
	                   			<a href="../land/detail?id=${land.id}" target="_blank">查看</a>
	                   		</div>
	                   	<#else>
	                    <div  class="body-content-div5" landId="${land.id}" divId="membLand" > 删除</div>
	                    </#if>
	                    <div  class="body-content-div4">${opts["AS"].children[land.stat].name}</div>
	                    <div  class="body-content-div3">${land.crtTime?string("yyyy-MM-dd")}</div>
                    </div>
                </div>
            </div>
           </#list>
           </div>
           <div class="clear-float"></div>
        </div>
        <div class="clear-float"></div>
    </div>
</div>
<div class="clear-float"></div>
<#include "footer.ftl">
</body>
</html>