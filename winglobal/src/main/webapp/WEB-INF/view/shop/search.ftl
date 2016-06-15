<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link rel="stylesheet" href="${confs["content.url"]}/css/pager.css"/>
	<#include "head.ftl">
	<#assign  parm=2>
	<script type="text/javascript">
		function page(obj){
			window.location.search;
			var orgUrl = window.location.href;
			window.location.href=orgUrl+"&pager.page="+$(obj).prev("input").val();
		}
	</script>
	
	<style type="text/css">
	.atag-selector-item{
		color:black;
	}
	.atag-selector-item:hover{
		color:green;
	}
	.atag-selector-selected {
		color:white;
	}
	.atag-selector-selected .atag-selector-item{
		color:white;
		background: rgb(10, 181, 82);
	}
	.atag-pager-selected{
		color:#202020;
		text-align: center;
		background: rgb(10, 181, 82);
	}
	.atag-pager-selected .atag-pager-item{
		color:white;
	}
	
	#commentPager{font:12px/16px arial}
	#commentPager span{float:left;margin:0px 3px;}
	#commentPager a{float:left;margin:0 3px;border:1px solid #ddd;padding:3px 7px; text-decoration:none;color:#666}
	#commentPager a.curr,#commentPager a:hover{color:#fff;background:#05c}

	</style>
</head>
<body>
<div id="div-title" style="height:0" ></div>
<#include "header1.ftl">
<div class="main main_title"></div>
<div class="main main_title2">
    <div class="main_area">区域</div>
    <div class="main_area_right">
    	<@atag.radioSelector path="landSrchMdl.area" options=addrs["51"].children?values/>
    </div> 
    <div class="main_area_public">类型</div>
    <div class="main_area_right_public">
    	<@atag.radioSelector path="landSrchMdl.type"  options=fetrs["LT"].children?values/>
    </div>  
    <div class="main_area_public">用途</div>
    <div class="main_area_right_public">
    	<@atag.radioSelector path="landSrchMdl.landFetrs[SU]"  options=fetrs["SU"].children?values/>
    </div>
    <div class="main_area_public">流转</div>
    <div class="main_area_right_public">
    	<@atag.radioSelector path="landSrchMdl.landFetrs[TM]"  options=fetrs["TM"].children?values/>
    </div>
    <div class="main_area_public">面积</div>
    <div class="main_area_right_public">
        <@atag.radioSelector path="landSrchMdl.ranAcre" options=opts["AR"].children?values value="value"/>
    </div>
    <div class="main_area_public">总价</div>
    <div class="main_area_right_public">
        <@atag.radioSelector path="landSrchMdl.ranPrice"  options=opts["PR"].children?values value="value"/>
    </div>
    <div id="div-info" class="main_info_search">
        <span class="main_zh">综合</span>
        <span class="main_line">|</span>
        <span class="main_zti">最新</span>
        <span class="page_tools_info">共${landSrchMdl.pager.counts}条信息<@atag.pagerMini path="landSrchMdl.pager"/></span>
    </div>
</div>
<div class="mid">
    <div class="category" style="margin-bottom: 0px;">
        <ul>
        	<#list lands as land>
            <li>
                <a href="../land/detail?id=${land.id}" target="_blank">
                <img src="${confs["content.njtx.url"]}/img/${land.img}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'"/>
					<#if land.stat=="AS02"> <img src="${confs["content.url"]}/img/jyz.png"
                style="width: 86px;height: 84px; border: none; position: absolute;margin-top: -222px;margin-left: 6px;" />  </#if>
    			<div class="introwrap">
                    <p class="intro"><#if land.name?length gte 30 >${(land.name)?substring(0,30)+"..."}<#else>${land.name}</#if></p>
                    <span class="red">
                     <#if land.sp != null && land.sp !=0>
                     <span style="font-size:20px;">${land.sp?string("#.##")}</span>${opts["SU"].children[land.spu].name}&nbsp;&nbsp;&nbsp;
                    </#if>
                    <#if land.up != null && land.up !=0>
                    	<span style="<#if land.sp == null || land.sp== 0>font-size:20px;</#if>">${land.up?string("#.##")}</span>${opts["UU"].children[land.upu].name}
                    <#else>
                    	<#if land.sp == null || land.sp == 0>
                    		<span style="font-size:20px;">面议</span>
                    	</#if>
                    </#if>
                    </span>
                   <!--  <p class="benifit">
                       	<span>性价比高</span>
                        <span>面积集中</span>
                        <span>水源便利</span>
                    </p>-->
                </div>
                </a>
            </li>
            </#list>
        </ul>
    </div>
</div>
<div class="main_page page" id="page_strs">
<@atag.pager path="landSrchMdl.pager"/>
</div>
<#-- js 分页方法 
<script type="text/javascript">
  $(document).ready(function (){
  	var temp_str='<div class=pagnation id=pagnation>';
  	var pageNo=parseInt($("#pages_param").attr('page'));
  	var pageCount=parseInt($("#pages_param").attr('pages'));
  	var pageSize = 5;
  	var start = 0;
  	var end = 0;
  	if (pageNo < pageSize) {
		start = 1;
		end = pageSize;
	} else {
		start = pageNo - 2;
		end = pageNo + 2;
	}
	if (end > pageCount) {
		end = pageCount;
	}	
	if (pageNo < 2) {
		temp_str+='<a class=page-prev disabled=disabled>上一页</a>';
	}	
	if (pageNo > 1) {
		temp_str+='<a href=/njtx-lips/land/list?pager.page='+(parseInt(pageNo)-1)+' class=page-prev>上一页</a>';
	}
	if (start > 1) {
		temp_str+='<a href=/njtx-lips/land/list?pager.page=1#div-info>1</a>';
		temp_str+='<span>...</span>';
	}
  	for (var i = start; i <= end; i++) {
		if (i == pageNo) {
			temp_str+='<a href=/njtx-lips/land/list?pager.page='+i+'#div-info'+' class=current>'+i+'</a>';
		} else {
			temp_str+='<a href=/njtx-lips/land/list?pager.page='+i+'#div-info'+'>'+i+'</a>';
		}
	}
	if (end < pageCount) {
		if (end != pageCount - 1) {
			temp_str+='<span>...</span>';
		}
		temp_str+='<a href=/njtx-lips/land/list?pager.page='+pageCount+'#div-info>'+pageCount+'</a>';
	}
	if (pageNo < pageCount) {
		temp_str+='<a href=/njtx-lips/land/list?pager.page='+(parseInt(pageNo)+1)+' class=page-next >下一页</a>';
	}
	if (pageNo == pageCount) {
		temp_str+='<a disabled=disabled class=page-next>下一页</a>';
	}		
	temp_str+='</div>'
	document.getElementById('page_strs').innerHTML=temp_str;
  });
</script>
-->

<#include "footer.ftl">
<#include "suspend-menu.ftl">
</body>
</html>
