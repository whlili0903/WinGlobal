<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/login.css"/>
	<script type="text/javascript" src="${confs["content.url"]}/js/login.js"></script>
	<style>
		.login-input{
			margin-top: 12px;
		}
		
		.logo-login {
			margin-top:22px; margin-bottom:18px; display: inline-block;
		}
		
		.logo-login img {
			width : 53px;
			height: 43px;
		}
		
		.left26{
			margin-left : 26px;
		}
		
	</style>
	<script>
		document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
             if(e && e.keyCode==13){ 
             	$("#submitDiv").click();
            }
        }; 
	</script>
</head>
<body>
	<#include "header2.ftl">
<div class="center-div">
	<div class="body-div">
    <div class="center-body"></div>
    <div class="register-div" style="height:500px;">
        <div class="div-form">
            <div class="div1 div-base"><div class="div8">会员登录</div></div>
            <div class="div2 div-base"> </div>
            <form action="../memb/login" method="post">
            <input type="hidden" value="${url}" name="url" />
            <div class="div3 div-base"><div class="img-div"><img src="${confs["content.url"]}/img/phone.png" class="img-top1" /></div><input type="text" placeholder="请输入手机号" class="login-input" name="phone" value="${(membMdl.phone)!}"  maxlength="11"/> </div>
            <div class="div4 div-base"><span class="span-error" id="phoneError">${phone}</span> </div>
            <div class="div3 div-base"><div class="img-div"><img src="${confs["content.url"]}/img/lock.png" class="img-top2" /></div><input type="password" name="pwd" class="login-input" value="${(membMdl.pwd)!}" placeholder="请输入密码" maxlength="30"/> </div>
            <div class="div5 div-base"><span class="span-error" id="pwdError">${pwd}</span> </div>
            <div class="div7 div-base"><div class="img-reme" onclick="reme()"><img src="${confs["content.url"]}/img/ku.png" id="remePwd" class="img-top3" /></div><label style="    float: left;" onclick="reme()">记住密码</label></label>
                <div class="repwd"><a href="memb-repwd" >忘记密码？</a></div></div>
            <div class="div6 div-base" id="submitDiv" style="cursor: pointer;">登录</div>
            <input type="hidden" value="${(membMdl.isRemePwd)!}" name="isRemePwd" />
            </form>
            <input type="hidden" name="imgUrl" value="${confs["content.url"]}" />
            <div class="div10 div-base">没有账号？<a href="memb-register" >注册一个>></a> </div>
        </div>
        
        <div style="padding-top:22px;border-top: 1px solid #e1e1e1; text-align: center;">
        	<p>您还可以使用以下方式直接登录</p>
        	<a class="logo-login" href="javascript:" title="QQ登录">
        		<img src="${confs["content.url"]}/img/logo_qq.png">
        	</a>
        	<a class="logo-login left26" href="javascript:" title="微博登录">
        		<img src="${confs["content.url"]}/img/logo_weibo.png">
        	</a>
        	<a class="logo-login left26" href="../memb/wechat" title="微信登录">
        		<img src="${confs["content.url"]}/img/logo_wx.png">
        	</a>
        </div>
        
    </div>
    </div>
</div>
	<#include "footer.ftl">
</body>
</html>