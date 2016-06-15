<!DOCTYPE>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>农交天下</title>
    <style>

        body {
            width: 100%;
            margin: 0 auto;
        }

        .register-container {
            max-width: 640px;
			padding: 20px 20px 10px 10px;
            margin: 0 auto;
        }

        .register-input {
            width: 100%;
			padding-left:10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            line-height: 42px;
            margin-top: 10px;
        }

        .register-submit {
            width: 100%;
            margin-top: 10px;
            text-align: center;
            padding: 0 10px;
        }

        .register-submit > input[type="submit"] {
            width: 100%;
            background-color: #0AB552;
            height: 42px;
            border: none;
            border-radius: 3px;
            margin-bottom: 10px;
        }

        .register-input > input {
            border: none;
            outline: none;
            padding: 0 10px;
			height: 42px;
			min-width:180px;
        }

        .register-input > span {
            border-right: 1px solid #ccc;
            padding-right: 10px;
            width: 65px;
            display: inline-block;
        }

        .register-input > textarea {
            width: 100%;
            border: none;
            outline: none;
            padding: 10px 0;
            text-align: left;
            resize: none;
        }

        .register-title {
            padding-bottom: 10px;
        }

        .register-title > span {
            padding-bottom: 10px;
        }

        .register-line {
            width: 100%;
            height: 1px;
            border-top: 1px solid #ccc;
            padding: 0 10px;
        }

        .register-input > .sms-code {
            width: 75px;
			height: 42px;
            font-size: 13px;
            border-left: 1px solid #ccc;
            border-right: none;
            padding-left: 5px;
            cursor: pointer;
			float: right;
			line-height: 42px;
        }

        .register-input > .location{
            width: 40px;
			height: 42px;
            font-size: 13px;
            border-left: 1px solid #ccc;
            border-right: none;
            cursor: pointer;
            padding-right: 0;
            text-align: center;
			float:right;
			line-height: 42px;
        }
        
        .register-input > .sms-code-input{
        	width:85px;
        }
        
        .register-input > .addr-input{
        	min-width:150px;
        }
		
		
		
		.lSelect{
			width:60px;
		}
		<#--
		.area-div > .area-select{
			border: 0px;
            display: inline-block;
            margin-top:5px;
		}
		-->
    </style>

</head>
<body>

<div class="register-container">
    <div class="register-title">
        <span style="border-bottom: solid 2px #FF8C10;">经纪人注册</span>
    </div>
    <div class="register-line"></div>
    <form id="valid_form" action="save-broker" method="post">
    	<input type="hidden" name="coor" id="coor" value="${(membAddlMdl.coor)!}" />
        <div class="register-input">
            <span>真实姓名</span>
            <input type="text" name="name" placeholder="请输入真实姓名" maxlength="10" value="${(membAddlMdl.name)!}">
        </div>
        <div class="register-input">
            <span>性别</span>
            <label><input name="sex" type="radio" value="SX01" <#if membAddlMdl??&&membAddlMdl.sex??&&membAddlMdl.sex == 'SX01'>checked</#if> >男</label>
            <label><input name="sex" type="radio" value="SX02" <#if membAddlMdl??&&membAddlMdl.sex??&&membAddlMdl.sex == 'SX02'>checked</#if> >女</label>
        </div>
        <div class="register-input">
            <span>手机号码</span>
            <input type="text" name="phone" placeholder="请输入手机号码" maxlength="11" >
        </div>
        <div class="register-input">
            <span>推荐码</span>
            <input type="text" name="invCode" placeholder="请输入推荐码" maxlength="7" <#if invCode??&&invCode!=''>value="${(invCode)!}" readonly</#if>  />
        </div>
        <div class="register-input">
            <span>验证码</span>
            <input type="text" name="smsCode" style="min-width:50px;" class="sms-code-input" placeholder="请输入验证码" maxlength="3" value="${(membAddlMdl.smsCode)!}" >
            <span class="sms-code">获取验证码</span>
        </div>
        <div class="register-input">
            <span>密码</span>
            <input type="password" name="pwd" placeholder="请输入密码"   >
        </div>
        <div class="register-input">
            <span>常用邮箱</span>
            <input type="text" name="email" placeholder="请输入常用邮箱" maxlength="30" value="${(membAddlMdl.email)!}" >
        </div>

        <div class="register-input" >
            <span>地区</span>
            <#assign path=''/>
    		<#if (membAddlMdl.area)?length gt 1>
    			<#assign path=membAddlMdl.area[0..1]/>
    			<#if (membAddlMdl.area)?length gt 3>
	    			<#assign path=path+','+membAddlMdl.area[0..3]/>
	    			<#if (membAddlMdl.area)?length gt 5>
		    			<#assign path=path+','+membAddlMdl.area[0..5]/>
		    			<#if (membAddlMdl.area)?length gt 7>
			    			<#assign path=path+','+membAddlMdl.area[0..7]/>
			    		</#if>
		    		</#if>
	    		</#if>
    		</#if>
				<@spring.formInput path="membAddlMdl.area" attributes="defaultSelectedPath='${path}' "/>
        </div>

        <div class="register-input">
            <span>详细地址</span>
            <input type="text" style="width:60px;" class="addr-input" name="addr" placeholder="请输入详细地址" value="${(membAddlMdl.addr)!}" >
            <span class="location" onclick="getPosition()">定位</span>
        </div>

        <div id="map"  class="register-input" style="height: 200px;"> </div>

        <div class="register-input">
            <span>专业领域</span>
            <input type="text" name="prof" placeholder="请输入专业领域" value="${(membAddlMdl.prof)!}" >
        </div>

        <div class="register-input">
            <textarea name="intr" placeholder="请输入经营介绍" >${(membAddlMdl.intr)!}</textarea>
        </div>

        <div class="register-submit">
            <input type="submit" value="注册" class="register-submit-btn">
        </div>
    </form>

<div id="tong" style="display:none;" ><img style="width:300px;height:300px;" src='${confs["content.url"]}/${confs["content.small.img"]}'></div>
</div>
</body>
<#--<script src="http://www.jutubao.com/Public/static/jquery-2.0.3.min.js" type="text/javascript"></script>-->
<script type="text/javascript" src="${confs["content.url"]}/js/jquery-1.10.2.min.js"></script>
<script src="${confs["content.url"]}/plugin/layer/layer.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery.lSelect.js"></script>
<script>
    $().ready(function () {

        var $validForm = $("#valid_form");
        $validForm.submit(function () {
            if (!valid()) {
                return false;
            }
            return true;
        })
		var IsPhone=false;
		$("input[name='phone']").blur( function () { 
			if(!validInput("phone", "请输入手机号码")
                    || !validMobile("phone")){
                    return false;
			}
			$.ajax({
                url : "check-phone",
                type: "post",
                data: {
                    phone: $("input[name='phone']").val()
                },
                dataType: "json",
                success:function(data){
                    if(!data.succ){
   							IsPhone=false;
   							layer.msg(data.msg);
   							if(data.make == "1"){
   								layer.msg(data.msg);
   								IsPhone=true;
   							}
   						}else{
   							IsPhone=true;
   						}
                }
            })
  				
		 });
		$("#area").lSelect({
			url: "../addr-sel"// AJAX数据获取url
		});

        $smsCode = $(".sms-code");
        $smsCode.click(function () {
           smsCode();
        })
		
		/**
         *  发送短信
         */
        var VALID_TIME = 180;
        var date = VALID_TIME;
        var intrId;
        function smsCode(){
             if(validInput("phone", "请输入手机号码")){
                sms();
            }
        }

        function sms(){
        	if(!validPhone()){
        		layer.msg("该手机已注册")
        		return;
        	}
        	$smsCode.unbind("click");
            $.ajax({
                url : "sms",
                type: "post",
                data: {
                    phone: $("input[name='phone']").val(),
                    make : "1"
                },
                dataType: "json",
                success:function(result){
                    if(result.succ){
                        // 短信发送成功
                        countDown();
                    }else{
                        layer.msg("短信发送失败,请稍后重试...")
                        clearCountDown();
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
        function valid() {
            if (!validInput("name", "请输入真实姓名")
                    || !validRadio("sex", "请选择性别")
                    || !validInput("phone", "请输入手机号码")
                    || !validMobile("phone")
                    || !validPhone()
                    || !validInput("smsCode", "请输入验证码")
                    || !validInput("pwd", "请输入密码")
                    || !validEmail("email")
                    || !validInput("area", "请选择居住地区")
                    || !validInput("addr", "请输入详细地址")
                    || !validInput("coor", "请定位地址")
                    || !validInput("prof", "请输入专业领域")
                    ) {
                return false;
            }else{
            	return true;
            }
        }

        function validInput(name, msg) {
            if ($("input[name='" + name + "']").val() == null || $("input[name='" + name + "']").val().length == 0) {
                layer.msg(msg);
                return false;
            }
            return true;
        }
        
        function validRadio(name,msg){
        	 if ($("input[name='" + name + "']:checked").val() == null || $("input[name='" + name + "']:checked").val().length == 0) {
                layer.msg(msg);
                return false;
            }
            return true;
        }

        function validSelect(name, msg) {
            if ($("select[name='" + name + "']").val() == null || $("select[name='" + name + "']").val().length == 0) {
                layer.msg(msg);
                return false;
            }
            return true;
        }
        
        function validPhone(){
        	if(IsPhone == false){
        		layer.msg("该手机已注册");
                return false;
        	}
        	return true;
        }

        /**
         * 验证邮箱地址
         * @param name
         * @returns {boolean}
         */
        function validEmail(name) {
            var pattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!pattern.test($("input[name='" + name + "']").val())) {
                layer.msg("邮箱格式不正确");
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
                layer.msg("手机号码格式错误");
                return false;
            }
            return true;
        }
         <#if msg??>
         	layer.msg("${msg}");
         </#if>
         
         <#if var??&&var=="1">
         	IsPhone=true;
         </#if>
         
         <#if membAddlMdl??&&membAddlMdl.invCode!=''>
         	$("input[name='invCode']").val("${(membAddlMdl.invCode)!}");
         </#if>
         
         <#if basePath??&&basePath!=''>
         	$("#tong img").attr("src","http://pan.baidu.com/share/qrcode?w=400&h=350&url="+"${basePath}"+"/memb/add-broker?parentId="+${(parentId)!});
         	//页面层-佟丽娅
			layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 0,
			  area: ['300px', '800px'],
			  skin: 'layui-layer-nobg', //没有背景色
			  shadeClose: true,
			  content: $('#tong')
			});
         </#if>
    })
	
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DoHxZdERGnB2yCGyCfp7H5Qh"></script>
<script type="text/javascript">
    //百度地图
    var map = new BMap.Map("map");
    map.centerAndZoom("成都",11);
    var marker = new BMap.Marker({enableDragging: true});
    //查找地址点
    function getPosition(){
        map.clearOverlays();
        var addrSel = $(".lSelect option:selected").text().replace("请选择","");
        var addr = addrSel+$("input[name='addr']").val();
        new BMap.Geocoder().getPoint(addr, function(point){
            if (point) {
                $("#coor").val(point.lng+"#"+point.lat);
                map.centerAndZoom(point,12);
                var marker = new BMap.Marker(point, {enableDragging: true});
                map.addOverlay(marker);
                marker.addEventListener('dragend', function(e){
                    $("#coor").val(e.point.lng+"#"+e.point.lat);
                });
            }else{
                layer.msg("请选择居住地区");
            }
        }, addrSel);
    }
</script>
</html>