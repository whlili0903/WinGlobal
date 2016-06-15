<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<#assign  parm=3>
<head>
	<#include "head.ftl">
	<style>
		.body-div {
   			 width: 100%;
    		background-color: #eee;
    		font-family: '微软雅黑';
		}
		.body-center-div{
			width:1200px;
			margin:auto;
			height:800px;
		}
		.help-right-div{
			width: 968px;
    		height: 100px;
    		background-color: #fff;
    		float: right;
		}
	</style>
</head>
<body>
	<#include "header2.ftl">
<div class="body-div" style="padding-top:45px;">
	<div class="body-center-div"> 
		<#include "footerLink/helf-left.ftl">
		<div class="help-right-div">
			<img src="${confs["content.url"]}/img/help-content03.png">
		</div>
	</div>
</div>
<#include "footer.ftl">
</body>
</html>