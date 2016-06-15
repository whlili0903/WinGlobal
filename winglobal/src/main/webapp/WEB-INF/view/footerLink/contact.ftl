<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<style>
	.gy-content-div{
		width:1200px;
		margin:auto;
		padding-top:50px;
		background-color: #f0f0f0;
		font-size:16px;
		line-height:30px;
		font-family:微软雅黑,sans-serif;
		padding-bottom:50px;
	}
	.gy-center-div{
		width:1080px;
		margin:auto;
		background-color: #f0f0f0;
	}
	.gy-center-div *{
		background-color: #f0f0f0;
		
	}
	.left-div{
			margin-left:100px;
		    width: 500px;
    		float: left;
	}
	.right-div{
		
	}
	ul li{
		float:left;
		margin-right:55px;
	}
	</style>
</head>
<body>
	<#include "header2.ftl">
<div class="gy-content-div">
<div class="gy-center-div">
	<div style="width:100%;text-align:center;"><h2 style="color:#666666">联系我们</h2></div><br/><br/>
	
	<div class="left-div">
		<div class="">联系电话：${confs["cust.tel"]}</div>
		<br />
        <div class="">工作时间：9:00-17:00</div>
		<br />
        <div class="">邮箱：${confs["cust.email"]}</div>
		<br />
        <div class="">微博：${confs["cust.blog"]}</div>
	</div>
	<br/>
	<div class="right-div">
		<div class="">
		<img src="${confs["content.url"]}${confs["cust.qr"]}" class="footer-erwei-img"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="${confs["content.url"]}/img/nongjiaowb.png" class="footer-erwei-img"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="${confs["content.url"]}/img/wxcode.jpg" class="footer-erwei-img"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<br />
		<ul >
			<li>农交天下APP</li>
			<li>新浪微博</li>
			<li>&nbsp;&nbsp;&nbsp;关注微信</li>
		</ul>
	</div>
	<br /><br /><br />
</div>
</div>
	<#include "footer.ftl">
</body>
</html>