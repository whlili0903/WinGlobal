<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-menu.css"/>
	<style>

     	.content .content-header {
            width:100%;
            height: 60px;
            background: #ffffff;
        }

        .content .content-header .title {
            width: 80px;
            margin-left: 34px;
            padding-top: 13px;
            display: inline-block;
            text-align: center;
            font-size: 14px;
        }

        .content .content-header .title img {
            width: 80px;
            margin-top: 7px;
        }
        
        .content .content-header .action-bar {
            height: 60px;
            line-height: 60px;
            display: inline-block;
            float: right;
            padding-right: 30px;
            font-size: 16px;
        }

        .content .content-header .action-bar .del {
            margin-left: 10px;
            text-decoration: none;
            cursor: pointer;
            color: #222222;
        }

        .content .table {
            width: 100%;
            text-align: left;
            background: #ffffff;
            margin-top: 14px;
            font-size: 12px;
        }

        .content .table thead td {
            border-bottom: 1px solid #eeeeee;
            height: 35px;
        }

        .content .table tbody td {
            vertical-align: top;
            padding-top: 15px;
            padding-bottom: 15px;
        }

        .content .table td a {
            text-decoration: none;
            color: #222;
        }

        .content .table td .name {
            font-size: 14px;
        }

        .content .table td .store {
        	padding-top: 15px;
            font-size: 12px;
        }

        .content .table td .cover-img {
            width: 175px;
            height: 135px;
        }

        .content .table td .price {
            color: #fe4200;
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
<form action="../land/memb-land?menuIndex=31" method="post" id="ListForm">
<div class="body-div">
	<div class="header-div"></div>
	 	<div class="page-container">
	 		<#include "memb/memb-menu.ftl">
        	<div class="content">
        		<div class="content-header">
		            <div class="title">
		                我的土地
		                <img src="${confs["content.url"]}/img/memb_tab.png">
		            </div>
		            <div class="action-bar">
		                <label class="check-all"><input type="checkbox" value="true">&nbsp;全选</label>
		                <a class="del" href="javascript:">删除</a>
		            </div>
		        </div>
		        <div <#if  pager.result?size lt 1 >style="height:534px;text-align: center;background-color: white;"</#if> >
		        	<#if pager.result?size gt 0>
		        	<#list pager.result as land>
		            <table class="table">
		                <colgroup>
		                    <col style="width: 30%;">
		                    <col style="width: 30%;">
		                    <col style="width: 15%;">
		                    <col style="width: 10%;">
		                    <col style="width: 15%;">
		                </colgroup>
		                <thead>
		                    <tr>
		                        <td style="padding-left: 10px;">
		                            <input class="check-goods" type="checkbox" style="vertical-align: middle;">
		                            	图片信息
		                        </td>
		                        <td>土地信息</td>
		                        <td>审核状态</td>
		                        <td>上传时间</td>
		                        <td>操作</td>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td>
		                            <img class="cover-img" src="${confs["content.njtx.url"]}/img/${land.img}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
		                        </td>
		                        <td>
		                            <p class="name">
		                            	 <#if land.name ? length gt 30>
		                            	 	${(land.name)?substring(0,30)!}
		                            	 <#else>
		                            	 	${(land.name)!}
		                            	 </#if>
		                            </p>
		                            <p class="store">土地类型：${fetrs['LT'].children[land.type].name}</p>
		                            <p class="store">区域位置：<#if land.area??><#if land.area?length gt 1>${addrs[land.area[0..1]].name}</#if><#if land.area?length gt 3>${addrs[land.area[0..1]].children[land.area[0..3]].name}</#if><#if land.area?length gt 5>${addrs[land.area[0..1]].children[land.area[0..3]].children[land.area[0..5]].name}</#if></#if>${land.addr}</p>
		                            <p class="store">
		                            	<#if land.sp != null && land.sp != 0>
			                            	${land.sp?string("#.##")}${opts["SU"].children[land.spu].name}
			                            <#elseif land.up != null && land.up != 0>
			                            	${land.up?string("#.##")}${opts["UU"].children[land.upu].name}
			                            <#else>
			                            	面议
			                            </#if>
			                            &nbsp;${land.acre?string("#.##")}${opts["AU"].children[land.au].name}&nbsp;
			                            &nbsp;${land.years}年
		                            </p>
		                        </td>
		                        <td>
		                        	<p class="store">${opts["AS"].children[land.stat].name}</p>
		                        </td>
		                        <td><p class="price">${land.crtTime?string("yyyy-MM-dd")}</p></td>
		                        <td>
		                            <p>
		                            	<#if opts["AS"].children[land.stat].code=="AS02" || opts["AS"].children[land.stat].code=="AS03">
				                   			<a href="../land/detail?id=${land.id}" target="_blank">查看</a>
					                   	<#else>
					                   		<a class="delBtn" href="javascript:" landId=${(land.id)!}>删除</a>
					                    </#if>   
		                            </p>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		        	</#list>
		        	<#else>
						<img style="margin-top: 15%;" src="${confs["content.url"]}/img/prom_goods.png" />
	    				<div class="btn-div"><a href="../land/add-init" target="_self"><input type="button" class="btn-link" value="我要发布" /></a></div>
					</#if>
					<#if pager.result?size gt 0>
					<#include "pager.ftl" />
					</#if>
		        </div>
    		</div>
    	</div>
    </div>
</form>    
<div class="clear-float"></div>
</div>
<#include "footer.ftl">
</body>
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
<script src="${confs["content.url"]}/plugin/laypage/laypage.js"></script>
<script>
	$(function(){
		$(function(){
		    $(".check-all").change(function(){
		        $(".check-goods:checkbox").prop("checked", true);
		    });
		    
		    $("a.delBtn").click(function(){
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
		    
		})
		
	})
</script>
</html>