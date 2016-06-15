<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/persion.css" />
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-menu.css" />
	<style>
	.right-div {
		display: block;
	}
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
        var overId ;
        var timeInt = 2;
        function countdown(){
        	$("#timeSpan").text(timeInt);
        	timeInt--;
        	if(timeInt == 0){
        		window.clearTimeout(overId);
        		window.location.href="../memb/memb-login";
        	}else{
        		overId =  window.setTimeout("countdown()",1000);
        	}
        }
        $(document).ready(function(){
            var checkPwd = false; 
            $("#pwd").blur(function(){
            	var pwd = $("#pwd").val();
            	if(pwd == ""){
            		$("#pwdError").text("当前密码不能为空");
            	}else{
            		$("#pwdError").text("");
            	}
            });
            $(".subimit-div").click(function(){
            	var pwd = $("#pwd").val();
            	if(pwd == ""){
            		$("#pwdError").text("当前密码不能为空");
            		return false;
            	}else{
            		$("#pwdError").text("");
            	}
            	var newPwd = $("#newPwd").val();
            	if(newPwd ==""){
            		$("#newPwdError").text("新密码不能为空");
            		return false;
            	}else{
            		$("#newPwdError").text("");
            	}
            	
            	var newPwdTo = $("#newPwdTo").val();
            	if(newPwdTo ==""){
            		$("#newPwdToError").text("确认密码不能为空");
            		return false;
            	}else if(newPwdTo != newPwd){
            		$("#newPwdToError").text("两次密码输入不一致");
            		return false;
            	}else{
            		$("#newPwdError").text("");
            	}
            	
        		$.post("../memb/upd-pwd", { "pwd":pwd,"newPwd":newPwd},
					function(data){
					if(data.succ){
						checkPwd = true;
						$("#updPwdDiv").remove();
						$(".succ-div").show();
						$("#timeSpan").text(3);
						overId =  window.setTimeout("countdown()",1000);
					}else{
						checkPwd = false;
						$("#pwdError").text(data.msg);
					}
  				}, "json");
            });
            
        });
	</script>
</head>
<body>
	<#include "header2.ftl">
<div class="body-div" style="height:640px;">
	<div class="header-div"></div>
	 <div class="center-div">
	 <#include "memb/memb-menu.ftl">
        <div class="right-div" id="persion">
          <div class="right-head-div" style=" position: relative;">
        	<div class="head-text-div" style="cursor: pointer;" onclick="javascript:window.location.href='../memb/memb-resv?menuIndex=4'">基本信息</div>
        	<div class="head-text-div" style="cursor: pointer;"  onclick="javascript:window.location.href='../memb/memb-pwd?menuIndex=4'">修改密码</div>
            <div class="clear-float"></div>
            <div class="img-div" style="margin-left: 135px;" ><img src="${confs["content.url"]}/img/bottom.png"/></div>
          </div>
          <div class="right-body-div" style="margin-top:15px;height:450px;">
                <div class="repwd-jg"><div class="repwd-jg-img"><img src="${confs["content.url"]}/img/jg.png" style="margin-top:14px;" /></div>
                    <div class="repwd-jg-text">您正在修改密码，请牢记您设定的新密码。</div>
                </div>
                <div class="repwd-content">
                    <div class="repwd-content-line">
                        <div class="repwd-line-div1">当前密码</div>
                        <div class="repwd-line-div2"><input type="password" maxlength=30 id="pwd" /></div>
                        <div class="repwd-error" id="pwdError"></div>
                    </div>
                    <div class="repwd-content-line">
                        <div class="repwd-line-div1">新密码</div>
                        <div class="repwd-line-div2"><input type="password" maxlength=30 id="newPwd" /></div>
                        <div class="repwd-error" id="newPwdError"></div>
                    </div>
                    <div class="repwd-content-line">
                        <div class="repwd-line-div1">确认密码</div>
                        <div class="repwd-line-div2"><input type="password" maxlength=30 id="newPwdTo"/></div>
                        <div class="repwd-error" id="newPwdToError"></div>
                    </div>
                    <div class="repwd-content-line">
                        <div class="repwd-line-div1">&nbsp;</div>
                        <div class="subimit-div">确认修改</div>
                        <div class="repwd-error"></div>
                    </div>
                </div>
            </div>
            <div class="succ-div">
   				<div class="repwd-jg"><div class="repwd-jg-img"><img src="${confs["content.url"]}/img/jg.png" /></div>
                    <div class="repwd-jg-text">您正在修改密码，请牢记您设定的新密码。</div>
                </div>
            	<div class="succ-text">密码修改成功！将在<span id="timeSpan"></span>秒后跳转到登录页面</div>
            </div>
        </div>
        <div class="clear-float"></div>
    </div>
</div>
<div class="clear-float"></div>
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
<#include "footer.ftl">
</body>
</html>