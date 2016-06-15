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
<form action="../memb/goods?menuIndex=21" method="post" id="ListForm">
<div class="body-div">
	<div class="header-div"></div>
	 	<div class="page-container">
	 		<#include "memb/memb-menu.ftl">
        	<div class="content">
        		<div class="content-header">
		            <div class="title">
		                我的商品
		                <img src="${confs["content.url"]}/img/memb_tab.png">
		            </div>
		            <div class="action-bar">
		                <label class="check-all"><input type="checkbox"  id="sltAll" onclick="sltAllDeal()" >&nbsp;全选</label>
		                <a class="del del_all" href="javascript:;">删除</a>
		            </div>
		        </div>
		        <div <#if  pager.result?size lt 1 >style="height:534px;text-align: center;background-color: white;"</#if> >
		        <#if pager.result?size gt 0>
		        	<#list pager.result as g>
		            <table class="table">
		                <colgroup>
		                    <col style="width: 30%;">
		                    <col style="width: 30%;">
		                    <col style="width: 13%;">
		                    <col style="width: 13%;">
		                    <col style="width: 14%;">
		                </colgroup>
		                <thead>
		                    <tr>
		                        <td style="padding-left: 10px;">
		                            <input class="check-goods" type="checkbox" name="check_stat" check-id="${(g.id)!}" style="vertical-align: middle;">
		                            	图片信息
		                        </td>
		                        <td>商品信息</td>
		                        <td>单价（元）</td>
		                        <td>状态</td>
		                        <td>操作
		                            <a href="javascript:;" bind-id="${(g.id)!}" class="goods_del" title="删除">
		                                <img src="${confs["content.url"]}/img/ic_del.png" style="float: right;padding-right: 15px;">
		                            </a>
		                        </td>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td>
		                            <img class="cover-img" src="${confs["content.njtx.url"]}/img/${g.coverImg}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'">
		                        </td>
		                        <td>
		                            <p class="name">
		                            	 <#if g.name ? length gt 30>
		                            	 	${(g.name)?substring(0,30)!}
		                            	 <#else>
		                            	 	${(g.name)!}
		                            	 </#if>
		                            </p>
		                            <p class="store">库存：${(g.store)!0}</p>
		                        </td>
		                        <td><p class="price">${(g.price)!}</p></td>
		                        <td>
		                            <p>
		                            	<#if g.isMarketable>
								                                上架
			                            <#else>
			                            	 下架
		                                </#if>
		                            </p>
		                        </td>
		                        <td>
		                            <p>
		                                <a href="../goods/edit?id=${(g.id)!}">编辑</a>
		                                <#if g.isMarketable>
			                                <a href="javascript:;" class="up_down_link" bind-id="${(g.id)}" bind-isMarketable="false" >下架</a>
			                            <#else>
			                            	 <a href="javascript:;" class="up_down_link" bind-id="${(g.id)}" bind-isMarketable="true" >上架</a>
		                                </#if>
		                            </p>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		        	</#list>
		        	<#else>
						<img style="margin-top: 15%;" src="${confs["content.url"]}/img/prom_goods.png" />
	    				<div class="btn-div"><a href="../goods/add" target="_self"><input type="button" class="btn-link" value="我要发布" /></a></div>
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
		<#-- 上架或下架 -->
		$(document).on("click",".up_down_link",function(){
			var id=$(this).attr("bind-id");
			var isMarketable=$(this).attr("bind-isMarketable");
			var $this=$(this);
			if(confirm(isMarketable == 'false'?'您确定下架该商品吗？':'你确定上架该商品吗？'))
			{
				$.ajax({
				   type: "GET",
				   url: "../goods/up-down-frame",
				   data: "id="+id+"&isMarketable="+isMarketable,
				   async: false,
				   success: function(data){
				     	$this.attr("bind-isMarketable",data.isMarketable);
				        $this.html(data.isMarketable?'上架':'下架');
				        $this.parent().parent().prev().find("p").html(data.isMarketable?'下架':'上架');
				   }
				});
			}
		});
		<#-- 删除商品   -->
		$(document).on("click",".goods_del",function(){
			var $this=$(this);
			var id=$this.attr("bind-id");
			if(confirm('您确定删除该商品吗？'))
			{
				$.ajax({
				   type: "GET",
				   url: "../goods/del",
				   data: "ids="+id,
				   success: function(data){
				     	$this.parent().parent().parent().parent().remove();
				   }
				});
			}
		});
		
		<#-- 删除选中的商品   -->
		$(".del_all").click(function(){
			var idsLength=$("input[name='check_stat']:checked").length;
			var ids=new Array(idsLength);
			$("input[name='check_stat']:checked").each(function(index){
				ids[index]=$(this).attr("check-id");
			});
			if(confirm('您确定删除选中的商品吗？'))
			{
				$.ajax({
				   type: "GET",
				   url: "../goods/del",
				   data: "ids="+ids,
				   success: function(data){
				     	window.location.reload();
				   }
				});
			}
		});
		
	})
	<#-- 全选 -->
	function sltAllDeal(){
		if($("#sltAll").prop("checked")){
			$(".check-goods").prop("checked",true);
		}else{
			$(".check-goods").prop("checked",false);
		}
	}
</script>
</html>