<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-menu.css"/>
	<style>
		.content{
			    background-color: white;
		}
		.head-text-div{
			font-size: 16px;
		}
		.right-head-div{
			margin-top: 34px;
    		margin-left: 34px;
		}
		.img-div{
		    margin-top: 20px;
		}
		.right-body-div{
			height: 479px;
    		width: 547px;
			background-image: url(${confs["content.url"]}/img/share_code_bj.png);
			background-repeat: no-repeat;
			margin: auto; 
		}
		.share-code-div{
			margin: auto; 
			width: 194px;
			height: 194px;
		    padding-top: 130px;
		}
		.tjm_span{
			font-family: "微软雅黑";
		    font-size: 18px;
		    margin-left: 10px;
		}
		.right-link{
			width: 250px;
		    float: right;
		    margin-top: 90px;
	        margin-right: 5px;
		}
		.right-link span{
			font-family: "微软雅黑";
		    font-size: 12px;
		}
		#a_url{
			word-wrap: break-word;
		    overflow: hidden;
		    width: 100px;
		    color:#000000;
		}
	</style>
</head>
<body>
<#include "header2.ftl">
<div class="body-div">
	 <div class="page-container" style="padding-bottom:0;">
	 <#include "memb/memb-menu.ftl">
        <div class="content" id="fxContent">
        	<input type="hidden" id="url" value="/memb/add-broker?invCode=${(invCode)!}" />
        	<#--
            <div class="right-head-div">
                <div class="head-text-div">生成邀请码</div> 
                <div class="clear-float"></div>
                <div class="img-div"><img src="${confs["content.url"]}/img/bottom.png"/></div>
            </div>
            -->
            <br />
            <br />
            <div class="right-body-div" id="updPwdDiv">
                <div class="share-code-div">
                    <img style="-webkit-user-select: none" src="" id="img_url">
                    <span class="tjm_span">&nbsp;&nbsp;&nbsp;推荐码：${(invCode)!}</span>
                </div>
                <div class="right-link">
                	<span>邀请链接：</span>
                	<br />
                	<span><a href="javascript:;" id="a_url"></a><a href="javascript:;" id="copy_a" class="copy_a" style="float: right; margin-right: 16px;" >点击复制</a></span>
                </div>
                <#--<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您的上级推荐人是</span>${(parentName)!'无'},您的下级用户${(count)!0}个</a>
                <br /><br />-->
                <#--
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;推荐码：</span>${(invCode)!}</a>
                <br /><br />
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;复制分享链接地址：</span><a href="javascript:;" id="a_url"></a><a href="javascript:;">点击复制</a>
                -->
            </div>
        </div>
        <div class="clear-float"></div>
    </div>
</div>
<div class="clear-float"></div>
<#include "footer.ftl">
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/js/ZeroClipboard.js"></script>
<script>
	$("#img_url").attr("src","http://pan.baidu.com/share/qrcode?w=194&h=194&url="+"${basePaths}"+$("#url").val());
	//$("#a_url").attr("href",localhostPaht+$("#url").val());
	$("#a_url").html("${(basePaths)!}"+$("#url").val());
	$("#a_url").attr("href","${basePaths}"+$("#url").val());
	
	$(function(){
		  <#-- 复制邀请地址 兼容各个浏览器 -->
	   	  var clip = new ZeroClipboard.Client();
		  clip.setHandCursor( true );
		  clip.setCSSEffects( true );
		  clip.addEventListener( 'mouseUp', function(client){
		    clip.setText( $("#a_url").html() );
		  });
		  clip.addEventListener( 'complete', function(){alert('复制成功');});
		  clip.glue("copy_a");
	});
	
	
</script>
</body>
</html>