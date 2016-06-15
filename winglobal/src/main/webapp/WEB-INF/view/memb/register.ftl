<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/register.css"/>
	<!-- <script type="text/javascript" src="${confs["content.url"]}/js/register.js"></script> -->
	<script>
		document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
             if(e && e.keyCode==13){ 
             	$("#submitDiv").click();
            }
        }; 
       	var count = 180;
        var isObtSms = false;
        var checkPhoneFlag = false;
        var overId ;
        var smsFlag = false;
        function reduce(){
        	if(count <=0){
				window.clearTimeout(overId);
				$("#smsCodeDiv").text("重新获取");
				$("#smsCodeDiv").css("background-color","#0ab552");
	        	$("#smsCodeDiv").css("color","#fff");
				count = 180;
				$("input[name='phone']").attr("readonly",false);
			}else{
				count --;
				overId =  window.setTimeout("reduce()",1000);
				$("#smsCodeDiv").text(count);
			}
		}
        $(document).ready(function(){
        	$("#smsCodeDiv").css("background-color","#0ab552");
        	$("#smsCodeDiv").css("color","#fff");
        	function chechPhone(){
        		if($("input[name='phone']").val() == "" || $("input[name='phone']").val() ==null){
        			$("#phoneError").text("请输入手机号码");
        			return false;
        		}else{
        			$("#phoneError").text("");
        		}
        		if($("input[name='phone']").val().length != 11){
        			$("#phoneError").text("手机号格式错误");
        			return ;
        		}else{
        			$("#phoneError").text("");
        		}
        		return true;
        	}
        	
        	$("#imgCodeDiv").click(function(){
        		$(this).find("img").attr("src","code?ran="+Math.random())
        	});
        	
        	function checkImgCode(){
        		if($("input[name='imgCode']").val() == ""){
        			$("#imgCodeError").text("请输入图片验证码");
        			return false;
        		}else{
        			$("#imgCodeError").text("");
        		}
        		
        		if($("input[name='imgCode']").val().length != 4){
        			$("#imgCodeError").text("图片验证码错误");
        			return false;
        		}else{
        			$("#imgCodeError").text("");
        		}
        		return true;
        	}
        	
        	function checkSmsCode(){
        		if(!isObtSms){
        			$("#smsCodeError").css("color","red");
        			$("#smsCodeError").text("请先获取短信验证码");
        			return false;
        		}else{
        			$("#smsCodeError").text("");
        		}
        		
        		if($("input[name='smsCode']").val() == ""){
        			$("#smsCodeError").css("color","red");
        			$("#smsCodeError").text("请输入短信验证码");
        			return false;
        		}else{
        			$("#smsCodeError").text("");
        		}
        		
        		if($("input[name='smsCode']").val().length != 3){
        			$("#smsCodeError").css("color","red");
        			$("#smsCodeError").text("短信验证码错误");
        			return false;
        		}else{
        			$("#smsCodeError").text("");
        		}
        		$.post("check-sms", {"smsCode":$("input[name='smsCode']").val(), "phone": $("input[name='phone']").val(),"checkCode":$("input[name='checkCode']").val()},
   						function(data){
   						if(!data.succ){
   							$("#smsCodeError").css("color","red");
   							$("#smsCodeError").text(data.msg);
   						}else{
   							smsFlag = true;
   						}
  					 }, "json");
        		
        		return true;
        	}
        	
        	function checkPwd(){
        		if($("input[name='pwd']").val().length == 0){
        			$("#pwdError").text("请输入密码");
        			return false;
        		}else{
        			$("#pwdError").text("");
        		}
        		return true;
        	}
        	$("input[name='phone']").blur(function(){
        		if(!chechPhone()){
        			return false;
        		}
        		$.post("check-phone", { "phone": $("input[name='phone']").val()},
   						function(data){
   						if(!data.succ){
   							$("#phoneError").text(data.msg);
   							checkPhoneFlag = false;
   						}else{
   							$("#phoneError").text("");
   							checkPhoneFlag = true;
   						}
  				}, "json");
        	});
        	$("input[name='imgCode']").blur(checkImgCode);
        	
        	$("input[name='smsCode']").blur(checkSmsCode);
        	
 			$("#smsCodeDiv").click(function(){
        		if(!isObtSms){
        			if(!checkPhoneFlag){
        				$("input[name='phone']").blur();
        				return false;
        			}
        			if(!checkImgCode()){
        				return false;
        			}
        			$.post("sms", {"imgCode":$("input[name='imgCode']").val(), "phone": $("input[name='phone']").val(),"checkCode":$("input[name='checkCode']").val()},
   						function(data){
   						smsFlag = false;
   						if(data.succ){
   							isObtSms = true;
   							$("#smsCodeError").css("color","green");
   							if(count = 180){
   								$("#smsCodeDiv").css("background-color","#eee");
								$("#smsCodeDiv").css("color","#aaa");
   								var id = window.setTimeout(reduce(),1000);
   								$("input[name='phone']").attr("readonly",true);
   							}
   						}else{
   							$("#smsCodeDiv").text("重新获取");
   							$("#smsCodeError").css("color","red");
   						}
   						if(data.isImgCode){
   							$("#imgCodeError").text(data.msg);
   						}else{
   							$("#smsCodeError").text(data.msg);
   						}
  					 }, "json");
        		}
        	});
        	$("#submitDiv").click(function(){
        		if(!chechPhone()){
        			return false;
        		}
        		if(!checkPhoneFlag){
        			$("input[name='phone']").blur();
        			return false;
        		}
        		if(!checkSmsCode()){
        			return false;
        		}
        		if(!smsFlag){
        			checkSmsCode();
        			return false;
        		}
        		if(!checkImgCode()){
        			return false;
        		}
        		if(!checkPwd()){
        			return false;
        		}
        		if($(".register-user-ag").attr("src").indexOf("go.png") ==-1 ){
        			$("#noAg").text("请勾选");
        			return false;
        		}else{
        			$("#noAg").text("");
        		}
        		$("form").submit();
        		return true;
        	});
        	$(".register-user-ag").click(function(){
        		if($(this).attr("src").indexOf("ku.png") ==-1 ){
        			$(this).attr("src","${confs["content.url"]}/img/ku.png");
        		}else{
        			$(this).attr("src","${confs["content.url"]}/img/go.png");
        		}
        	});
        	
		});	
       	
         <#if succ == true >
        	$(function(){
        		msgPrompt("注册成功","succ", function(parm){
        			window.location.href="${url}";
        		},"",true);
       		});
    	  </#if>
	</script>
	<style>
	.login-input{
			margin-top: 12px;
	}
	.register-user-ag{
		vertical-align: middle;
		margin-top: -4px;
		margin-right: 6px;
		cursor: pointer;
	}
	</style>
</head>
<body>
	<#include "header2.ftl">
<div class="center-div">
<div class="body-div">
    <div class="center-body"></div>
    <div class="register-div">
        <div class="div-form">
            <div class="div1 div-base"><div class="div8">会员注册</div></div>
            <div class="div2 div-base"> </div>
            <form action="../memb/register" method="post">
            <input type="hidden" name="url" value="${url}" />
            <div class="div3 div-base"><div class="img-div"><img src="${confs["content.url"]}/img/phone.png" class="img-top1" /></div>
            <input type="text" name="phone" value="${membMdl.phone}" class="login-input" placeholder="请输入手机号" maxlength="11"/> </div>
            <div class="div4 div-base" ><span class="span-error" id="phoneError">${phoneError}</span></div>
           	 <div><div class="div9 div-base">
                <div class="img-div"><img src="${confs["content.url"]}/img/code.png" class="img-top2" style="margin-top:14px;" /></div>
                <input type="text" name="imgCode" value="${membMdl.imgCode}" class="login-input" placeholder="请输图片验证码"  maxlength="4"/> </div>
                <div class="div-code" id="imgCodeDiv"  style="cursor: pointer;"><img src="code" style="width:112px;height:42px;border-radius: 3px;"/></div>
            </div>
            <div class="clear-float"></div>
            <div class="div4 div-base"><span class="span-error"  id="imgCodeError">${imgCodeError}</span> </div>
            <div><div class="div9 div-base">
                <div class="img-div"><img src="${confs["content.url"]}/img/code.png" class="img-top2" style="margin-top:14px;" /></div>
                <input type="text" name="smsCode" value="${membMdl.smsCode}" class="login-input" placeholder="请输短信验证码"  maxlength="3"/> </div>
                <div class="div-code" id="smsCodeDiv"  style="cursor: pointer;">获取验证码</div>
            </div>
             <div class="clear-float"></div>
               <div class="div4 div-base"><span class="span-error"  id="smsCodeError">${msg}${smsCodeError}</span> </div>
           
            <div class="div3 div-base"><div class="img-div"><img src="${confs["content.url"]}/img/lock.png" class="img-top2" /></div>
            <input type="password" name="pwd" vaule="${membMdl.pwd}" placeholder="请输入密码" class="login-input"  maxlength="30"/> </div>
            <div class="div5 div-base"> <span class="span-error" id="pwdError">${pwdError}</span></div>
            <div class="div10 div-base">
            	<div style="float: left;">
            		<img src="${confs["content.url"]}/img/go.png"  class="register-user-ag" />
            		<a href="../tp/agreement"  target="_blank">同意用户协议</a>
            		<span  class="span-error" id="noAg" style="margin:0"></span>
            	</div>
            	<div style="float: right;">已有账号？<a href="memb-login" >登录>></a></div>
            </div>
            <div class="div6 div-base" id="submitDiv" style="cursor: pointer;">注册</div>
            </form>
            <input type="hidden" value="${checkCode}" name="checkCode" />
        </div>
    </div>
  </div>
</div>
	<#include "footer.ftl">
</body>
</html>