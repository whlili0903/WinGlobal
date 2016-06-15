<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/login.css"/>
	 <style>
        *{
            margin:0;
            padding: 0;
            font-family:微软雅黑;
        }
        .body-div{
            width:1200px;
            padding-top: 36px;
            background-color: #f0f0f0;
            margin:auto;
        }
        .broker-title{
            height:56px;
            line-height:56px;
            text-align: center;
            font-size:20px;
        }
        .broker-title-01{
            width:614px;
            background: url("${confs["content.url"]}/img/title-bg.png");
            float: left;
            color:#fff;
        }
        .broker-title-02{
            width:608px;
            background: url("${confs["content.url"]}/img/title-2bg.png");
            float: right;
            margin-left: -22px;
            color:#414040;
        }
        .clear-float{
            clear: both;
            display: block;
            height: 0px;
        }
        .broker-content{
            margin-top:26px;
            background-color: #f0f0f0;
            height:450px;
        }
        .span-01 {font-style:italic;    margin-right: 15px;}
        .broker-succ{
            padding-top:74px;
            width: 165px;
            margin:auto;
        }
        .broker-ts-div {
            margin-left: 22px;
            float: right;
            margin-top: 20px;
            color: #0bb552;
        }
        .broker-ts-02{
            width: 100%;
            text-align: center;
            margin-top: 78px;
            color: #333;
        }
    </style>
</head>
<body>
	<#include "header2.ftl">
	 <div class="body-div">
        <div class="broker-title">
            <div class="broker-title-01"><span class="span-01">1</span>填写申请资料基本信息</div>
            <div class="broker-title-02"><span class="span-01">2</span>提交申请，等待答复</div>
        </div>
        <div class="clear-float"></div>
        <div class="broker-content">
            <div class="broker-succ"><img src="${confs["content.url"]}/img/broker-succ.png" /> <div class="broker-ts-div">已提交申请</div></div>
            <div class="broker-ts-02">尊敬的用户您的申请已提交，一个工作日内进行审核</div>
        </div>
    </div>
	<#include "footer.ftl">
</body>
</html>