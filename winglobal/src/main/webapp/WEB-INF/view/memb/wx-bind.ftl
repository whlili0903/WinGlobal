<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>微信绑定</title>

    <style>

        body {
            margin: 0;
            background: url("${confs["content.url"]}/img/bg-bind.png") no-repeat;
            margin: 0 auto;
        }

        .page-container {
            text-align: center;
        }

        .page-container .title {
            margin-top: 60px;
            font-size: 36px;
            color: #ffffff;
            text-align: center;
        }

        .page-container .content {
            width: 367px;
            height: 319px;
            margin: 57px auto 0;
            background-color: #ffffff;
            text-align: center;
        }

        .page-container .content .field {
            width: 282px;
            height: 44px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 25px;
            line-height: 44px;
            border: 1px solid #bfc0c0;
            border-radius: 3px;
            text-align: left;
        }

        .page-container .content .pwd-box {
            display: none;
        }

        .page-container .content .field-m {
            border: none;
        }

        .page-container .content .field .m {
            width: 150px;
            /*display: inline-block;*/
            border: 1px solid #bfc0c0;
            border-radius: 3px;
            float: left;
        }

        .page-container .content .field .icon-box {
            width: 30px;
            display: inline-block;
        }

        .page-container .content .field .icon-box img {
            padding-left: 10px;
            vertical-align: middle;
        }

        .page-container .content .field .input {
            width: 220px;
            margin-left: -5px;
            border: none;
            border-left: 1px solid #cccccc;
            outline: none;
            padding-left: 15px;
        }

        .page-container .content .field-m .input {
            width: 85px;
            margin-left: -5px;
            border: none;
            border-left: 1px solid #cccccc;
            outline: none;
            padding-left: 15px;
            padding-right: 15px;
        }

        .page-container .content .field .sms-code {
            width: 122px;
            height: 44px;
            line-height: 44px;
            display: block;
            float: right;
        }

        .page-container .content .btn {
            background-color: #0ab552;
            font-size: 16px;
            color: #FFFFFF;
            text-align: center;
            height: 44px;
            line-height: 44px;
            border-radius: 5px;
            text-decoration: none;
        }

        .page-container .content .btn-box {
            height: 69px;
            background: #ebebeb;
            margin-top: 49px;
            padding-top: 29px;
        }

        .page-container .content .btn-box .btn {
            width: 280px;
            margin: 0 auto;
            display: inline-block;
            cursor: pointer;
            border:none;
        }

        .page-container .content .tab {
            height: 28px;
            width: 250px;
            margin:0 auto;
        }

        .page-container .content .tab .item {
            width: 118px;
            display: inline-block;
            line-height:28px;
            text-align: center;
            font-size: 14px;
            color: #979797;
            border: 1px solid #ebebeb;
            cursor: pointer;
            text-decoration: none;
        }

        .page-container .content .tab .checked {
            background: url("${confs["content.url"]}/img/bg_bind_tab_checked.png");
        }

    </style>
</head>
<body>

<div class="page-container">
    <div class="title">
        	账户绑定
    </div>
    <div class="content">
    	 <div class="tab">
            <a class="item checked" for="bind" href="javascript:">绑定农交账户</a><a class="item" for="register" href="javascript:">注册农交账户</a>
        </div>
        <form id="submitForm" action="../wechat/bind" method="post">
        <div style="width: 283px;margin: 0 auto;">
            <div class="field">
                <div class="icon-box">
                    <img src="${confs["content.url"]}/img/phone.png">
                </div>
                <input class="input" name="phone" placeholder="请输入手机号码">
            </div>
            <div class="field field-m">
                <div class="m">
                    <div class="icon-box">
                        <img src="${confs["content.url"]}/img/code.png">
                    </div>
                    <input class="input" name="smsCode" maxlength=3 placeholder="请输入验证码">
                </div>
                <a class="sms-code btn" href="javascript:">获取验证码</a>
            </div>
            <div style="clear: both;"></div>
            <div class="field pwd-box">
                <div class="icon-box">
                    <img src="${confs["content.url"]}/img/lock.png">
                </div>
                <input class="input" type="password" name="pwd" placeholder="请输入密码">
            </div>
        </div>
        <div class="btn-box">
            <input type="submit" class="btn" value="绑定手机" />
        </div>
        </form>
        <div style="margin-top: 20px;">
            <img src="${confs["content.url"]}/img/inverted.png" style="width: 367px; height: 159px;">
        </div>
    </div>
</div>

</body>
<script src="${confs["content.url"]}/js/jquery-1.10.2.min.js" type="application/javascript"></script>
<script>
    $(function(){


		var errorMsg = "${(errorMsg)!}";
		if(errorMsg != null && errorMsg.length > 0){
			alert(errorMsg);
		}

		var isBind = true;
		var $tabItem = $(".tab>.item");
        var $pwdBox = $(".pwd-box");
        var submitForm = $("#submitForm");
        $tabItem.click(function(){
            $(".tab > .checked").removeClass("checked");
            $(this).addClass("checked");
            var type = $(this).attr("for");
            if(type == 'bind'){ //　绑定账户
                $pwdBox.hide();
                submitForm.attr("action", "../wechat/bind");
                isBind = true;
            } else { // 注册新账户
                $pwdBox.show();
                submitForm.attr("action", "../wechat/register");
                isBind = false;
            }
        })

        $smsCode = $(".sms-code");
        $smsCode.click(function () {
            smsCode();
        })

        /**
         *  发送短信
         */
        var VALID_TIME = 60;
        var date = VALID_TIME;
        var intrId;
        function smsCode(){
            if(validMobile("phone")){
                $smsCode.unbind("click");
                sms();
            }else{
                alert("手机号码错误");
            }
        }

        function sms(){
            $.ajax({
                url : "../wechat/sms",
                type: "post",
                data: {
                    phone: $("input[name='phone']").val()
                },
                dataType: "json",
                success:function(result){
                    if(result.succ){
                        // 短信发送成功
                        countDown();
                    }else{
                        clearCountDown();
                        alert(result.msg);
                    }
                }
            })
        }

        /**
         *  发送短信倒计时
         */
        function countDown(){
            // 设置定时事件
            intrId = setInterval(function(){
                if(date == 1){
                    clearCountDown();
                }else{
                    $smsCode.text(date+"s")
                    date--;
                }
            }, 1000);
        }

        /**
         * 清除倒计时功能
         */
        function clearCountDown(){
            clearInterval(intrId);
            $smsCode.bind("click", smsCode);
            $smsCode.text("获取验证码");
            date = VALID_TIME;
        }

        function validInput(name) {
            if ($("input[name='" + name + "']").val() == null || $("input[name='" + name + "']").val().length == 0) {
                return false;
            }
            return true;
        }
        
        /**
         * 验证手机号码
         * @param name
         * @returns {boolean}
         */
        function validMobile(name) {
            var pattern = /^1\d{10}$/;
            if (!pattern.test($("input[name='" + name + "']").val())) {
                return false;
            }
            return true;
        }
        
        submitForm.submit(function(){
        	if(!validMobile("phone")){
        		alert("手机号码错误");
        		return false;
        	}
        	
        	if(!validInput("smsCode")){
        		alert("请输入短信验证码");
        		return false;
        	}
        	
        	if(!isBind && !validInput("pwd")){
        		alert("请输入密码");
        		return false;
        	}
        	
        	return true;
        })

    });
</script>
</html>