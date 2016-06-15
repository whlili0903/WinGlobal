<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/repwd.css"/>
	<script type="text/javascript" src="${confs["content.url"]}/js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="${confs["content.url"]}/js/repwd.js"></script>
	<script>
		 var JPlaceHolder = {
            //检测
            _check : function(){
                return 'placeholder' in document.createElement('input');
            },
            //初始化
            init : function(){
                if(!this._check()){
                    this.fix();
                }
            },
            //修复
            fix : function(){
                jQuery(':input[placeholder]').each(function(index, element) {
                    var self = $(this), txt = self.attr('placeholder');
                    self.wrap($('<div></div>').css({position:'relative', zoom:'1', border:'none', background:'none', padding:'none', margin:'none'}));
                    var pos = self.position(), h = self.outerHeight(true), paddingleft = self.css('padding-left');
                    var holder = $('<span></span>').text(txt).css({position:'absolute', left:pos.left,  height:h, lienHeight:h, paddingLeft:paddingleft, color:'#aaa'}).appendTo(self.parent());
                    self.focusin(function(e) {
                        holder.hide();
                    }).focusout(function(e) {
                        if(!self.val()){
                            holder.show();
                        }
                    });
                    holder.click(function(e) {
                        holder.hide();
                        self.focus();
                    });
                });
            }
        };
        //执行
        jQuery(function(){
            JPlaceHolder.init();
        });
	</script>
</head>
<body>
	<#include "header2.ftl">
<div class="div-body">
    <div style="height:1px;"></div>
    <div class="div-repwd">
        <div class="div-title"><div class="repwd-left">&nbsp;</div><div class="img-div"><img src="${confs["content.url"]}/img/tan.png" /></div>您正在找回您的密码！</div>
        <form action="repwd" method="post" >
        <div class="div-content"><div  class="repwd-left">手机号</div><div><input type="text" name="phone"  placeholder="请输入手机号" value="${membMdl.phone}"  maxlength="11"/>
        <span class="span-error" id="phoneError"><@spring.showErrors/></span></div></div>
        <div class="div-content"><div class="repwd-left">验证码</div><div ><div class="div-code" style="float:left;margin-left:0"><input type="text" name="smsCode" value="${membMdl.smsCode}" maxlength="3" placeholder="请输入验证码" />
            <div class="sms-code" id="smsCodeDiv" style="cursor: pointer;">获取验证码</div></div><span class="span-error" style="margin-left:50px;float:left" id="codeError"></span></div></div>
         <div class="clear-float"></div>
        <div class="div-content"><div class="repwd-left">密码</div><div><input type="password" name="pwd"  placeholder="请输入新密码" maxlength="30" /><span class="span-error" id="pwdError"></span></div></div>
       	</form>
        <div class="div-content"><div class="repwd-left">确认密码</div><div><input type="password" name="qrPwd" placeholder="请确认新密码" maxlength="30"  /><span class="span-error" id="qrPwdError"></span></div></div>
        <div class="div-qr"><div class="repwd-left">&nbsp;</div><div class="commit-div" id="submitDiv" style="cursor: pointer;">确定</div></div>
    	<input type="hidden" value="${checkCode}" name="checkCode" />
    </div>
</div>
	<#include "footer.ftl">
</body>
</html>