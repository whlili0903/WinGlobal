<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-menu.css"/>
	<style>
		.body-content-name a{
			color:#202020;
		}
		.body-content-name a:hover{
			color:#0AB552;
		}
		.body-content-div5:hover{
			color:#0AB552;
		}
		.page-container {
            width: 1200px;
            margin: 0 auto;
        }

        .content {
            width: 898px;
            left: 282px;
            height: 500px;
            float: right;
            background-color: white;
            text-align: center;
        }
        
        .btn-order {
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
        
        .img-div{
        	line-height: 250px;
    		height: 250px;
	        position:relative;
  			top:30%;
        }
        
        .btn-div{
        	position:relative;
  			top:30%;
        }
	</style>
</head>
<body>
<#include "header2.ftl">
<div class="body-div" style="min-height:700px;">
	<div class="header-div"></div>
		<div class="page-container">
	 		<#include "memb/memb-menu.ftl">
        	<div class="content">
		        <div class="img-div">
		        	<img src="${confs['content.url']}/img/prom.png" />
		        </div>
		        <div class="btn-div">
		        	<button class="btn-order" onclick="javascript:window.location.href='../memb/add-broker'" >注册经纪人</button>
		        </div>
		    </div>
		</div>
	</div>
</div>
<div class="clear-float"></div>
<#include "footer.ftl">
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
</body>
</html>