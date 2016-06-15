<#assign parm=4>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
		<script src="http://www.jutubao.com/Public/static/jquery-2.0.3.min.js" type="text/javascript"></script>
	
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
            background: url("${confs["content.url"]}/img/title-1.png");
            float: left;
            color:#fff;
        }
        .broker-title-02{
            width:608px;
            background: url("${confs["content.url"]}/img/title-2.png");
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
            margin-left:86px;
            margin-top:26px;
            background-color: #f0f0f0;
        }
        .broker-content-title{
            font-size:18px;
            color:#222222;
            font-weight: bold;
        }
        .broker-content-line{
            font-size:16px;
            position: relative;
            color:#6c6b6b;
            margin-top:32px;
            line-height: 37px;;
        }
        .span-01 {font-style:italic;    margin-right: 15px;}
        .broker-select-01{

        }
        .broker-content-line-left{
            float:left;
        }
        .broker-content-line-right{
            float:left;
            margin-left:13px;
            text-align: left;
        }
        .broker-content-input{
            width:216px;
            height:35px;
            border:solid 1px #bfbfbf;
            padding-left:15px;
        }
        .broker-label{
            margin-left:10px;
        }
        .broker-span{
            color:red;
            margin-right:10px;
        }
        .broker-buttom-div{
            margin-left:196px;
            line-height: 45px;
            text-align: center;
            background-color:#f0f0f0;
            color:#fff;
            margin-top:76px;
            height: 126px;
        }
        .broker-submit{
        	cursor: pointer;
            float:left;
            width:102px;
            height:45px;
            border-radius: 3px;
            background-color: #0AB551;
        }
        .broker-reset{
        	cursor: pointer;
            background-color: #0AB551;
            border-radius: 3px;
            float:left;
            margin-left:200px;
            height:45px;
            width:102px;
        }
        .broker-upload-div{
        	width:109px;
        	height:70px;
        	cursor: pointer;
        	float: left;
   			margin-right: 65px;
        	<#if membAddlMdl.side != null>
        		background:url('${confs["content.njtx.url"]}/img/${membAddlMdl.side}')no-repeat;
        	background-size: 109px 70px;
        	<#else>
        	background:url('${confs["content.url"]}/img/prof.png');
        	</#if>
        }
         .broker-upload-face-div{
        	width:109px;
        	height:70px;
        	cursor: pointer;
        	float: left;
   			margin-right: 65px;
        	<#if membAddlMdl.face != null>
        	background:url('${confs["content.njtx.url"]}/img/${membAddlMdl.face}')no-repeat;
        	background-size: 109px 70px;
        	<#else>
        	background:url('${confs["content.url"]}/img/face.png');
        	</#if>
        }
         .uploadify img{
         	position: relative;
    		width: 108px;
    		height: 70px;
    		margin-top: -70px;
        	border-radius: 4px;
         }
         .uploadify{
         	float:left;
         	margin-right:40px;
         	position: relative;
         }
		.uploadify-queue {
			position: absolute;
			top: 70px;
			width: 200px;
		}
		.broder-face-upload{
			position: relative;
    		z-index: 555;
    		width: 108px;
    		height: 70px;
    		border-radius: 4px;
    		cursor: pointer;
		}
		.broker-addr-input{
			margin-top:10px;
		}
		.body-div select{
			height:35px;
		}
		.err-msg{
			color:red;
    		position: relative;
    		font-size:14px;
    		margin-left:10px;
		}
    </style>
    <style>
    	.body-div .content{
    		text-align: center;
			background-color: #f0f0f0;
			font-size: 14px;
    	}
    	.body-div .content1{
    		text-align: left;
    		background-color: #f0f0f0;
			font-size: 14px;
    	}
    	.land-mdfy-button{
		background-color: #46BF6F;
   	 	border: solid 1px #46bf6f;
    	color: #fff;
    	height: 35px;
    	width: 50px;
        cursor: pointer;
		}
		.land-mdfy-button:hover{
			color:#eee;
		}
		.addl-sms-button{
			background-color: #46BF6F;
	   	 	border: solid 1px #46bf6f;
	    	color: #fff;
	    	height: 35px;
	    	width: 100px;
	        cursor: pointer;
		}
		。addl-sms-button:hover{
		
		}
		.star{
			color:#EA081F;
		}
		.error{
			color:#EA081F;
		}
    </style>
    <link href="${confs["content.url"]}/plugin/uploadify/uploadify.css"/>
<script type="text/javascript" src="${confs["content.url"]}/plugin/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="${confs["content.url"]}/plugin/jquery.lSelect.js"></script>
</head>
<body>
	<#include "header1.ftl">
<div class="body-div">
        <div class="broker-title">
            <div class="broker-title-01">填写资料基本信息</div>
            <#--<div class="broker-title-02"><span class="span-01">2</span>提交申请，等待答复</div>-->
        </div>
        <div class="clear-float"></div>
        <form action="save-broker" method="post" id="myform">
                <div class="broker-content">
            <#--<input type="hidden" name="id" value="${membAddlMdl.id }" />-->
            <div class="clear-float"></div>
            <div  class="broker-content-title" style="margin-top:43px">个人资料</div>
            <div class="clear-float"></div>
            
            <table class="content">
            	<col width="70px" />
				<col width="280px" />
				<col width="150px" />
				<col width="500px" />
				<col width="70px" />
            	<tr>
            		<td class="field">真实姓名<span class="star">*</span></td>
			    	<td>
			    		<@spring.formInput path="membAddlMdl.name" attributes=" maxlength='10' class='broker-content-input' "/>
			    	</td>
			    	<td class="field" style="text-align:left;color:red;"><@spring.showErrors classOrStyle="err-msg"/><span class="error"></span></td>
			    	<td rowspan="6" colspan="5"><div id="map" style="width:100%;height:400px;"></div></td>
            	</tr>
            	<tr>
            		<td class="field"> 性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别<span class="star">*</span></td>
			    	<td>
			    		<@atag.formRadioButtons path="membAddlMdl.sex" options=opts["SX"].children?values labelAttr="class='broker-label'"  attributes="style='margin-left:-120px'" />
			    	</td>
			    	<td class="field" style="text-align:left;color:red;"><@spring.showErrors classOrStyle="err-msg"/><span class="error"></span></td>
            	</tr>
            	<tr>
            		<td class="field"> 手机号码<span class="star">*</span></td>
			    	<td>
			    		<@spring.formInput path="membAddlMdl.phone" attributes=" maxlength='11' class='broker-content-input'"/>
			    	</td>
			    	<td class="field" style="text-align:left;color:red;"><@spring.showErrors classOrStyle="err-msg"/><span class="error"></span></td>
            	</tr>
            	<tr>
            		<td class="field"> 推&nbsp;&nbsp;荐&nbsp;&nbsp;码</td>
			    	<td>
			    		<@spring.formInput path="membAddlMdl.invCode" attributes=" maxlength='7' class='broker-content-input'"/>
			    	</td>
			    	<td class="field" style="text-align:left;color:red;"><@spring.showErrors classOrStyle="err-msg"/><span class="error"></span></td>
            	</tr>
            	<tr>
            		<td class="field"> 验&nbsp;&nbsp;证&nbsp;&nbsp;码<span class="star">*</span></td>
			    	<td>
			    		<@spring.formInput path="membAddlMdl.smsCode" attributes=" maxlength='11' class='broker-content-input' style='width:100px;margin-left: -10px;'"/>
			    		<input type="button" value="获取验证码" id="smsCodeDiv" class="addl-sms-button">
			    	</td>
			    	<td class="field" style="text-align:left;color:red;"><@spring.showErrors classOrStyle="err-msg"/></td>
            	</tr>
            	<tr>
            		<td class="field"> 密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码<span class="star">*</span></td>
			    	<td>
			    		<@spring.formInput path="membAddlMdl.pwd" attributes=" maxlength='11' style='margin-left: -10px;'  class='broker-content-input'"/>
			    	</td>
			    	<td class="field" style="text-align:left;color:red;"><@spring.showErrors classOrStyle="err-msg"/><span class="error"></span></td>
            	</tr>
            	<tr>
            		<td class="field"> 常用邮箱<span class="star">*</span></td>
			    	<td>
			    		<@spring.formInput path="membAddlMdl.email" attributes=" maxlength='20' class='broker-content-input'"/>
			    	</td>
			    	<td class="field" style="text-align:left;color:red;"><@spring.showErrors classOrStyle="err-msg"/><span class="error"></span></td>
            	</tr>
            </table>
            <br />
            <table class="content1">
            	<col width="90px" />
				<col width="750px" />
				<col width="70px" />
            	<tr>
            		<td class="field"> &nbsp;常住地址<span class="star">*</span></td>
			    	<td colspan="3" >
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
			    		<@spring.formInput path="membAddlMdl.area" attributes="defaultSelectedPath='${path}'"/>
			    		<@spring.showErrors classOrStyle="err-msg"/>
			    		<@spring.formInput path="membAddlMdl.addr" attributes="class='broker-content-input'"/>
			    		<@spring.showErrors classOrStyle="err-msg"/>
						<input type="button" onclick="getPositon()" value="定位" class="land-mdfy-button">
			    	</td>
            	</tr>
            	<tr><td>&nbsp;</td></tr>
            	<tr>
            		<td class="field">&nbsp;经&nbsp;&nbsp;纬&nbsp;&nbsp;度<span class="star">*</span></td>
	            	<td><@spring.formInput path="membAddlMdl.coor" attributes="readonly='readonly' style='margin-right:33px;' class='broker-content-input'"/></td>
            	</tr>
            	<tr><td>&nbsp;</td></tr>
        		<tr>
            		<td class="field">&nbsp;专业领域<span class="star">*</span></td>
			    	<td colspan="3">
			    		<@spring.formInput path="membAddlMdl.prof" attributes="maxlength='15' class='broker-content-input'"/>
			    	</td>
			    	<td class="field"><@spring.showErrors classOrStyle="err-msg"/></td>
            	</tr>
            	<tr><td>&nbsp;</td></tr>
            	<tr>
            		<td class="field">&nbsp;经营介绍</td>
			    	<td colspan="3">
			    		<@spring.formTextarea path="membAddlMdl.intr" attributes=" maxlength='255' style='width:388px;height:126px;padding-left:10px;padding-top:10px;resize:none;'" />
			    	</td>
			    	<td class="field"><@spring.showErrors classOrStyle="err-msg"/></td>
            	</tr>
            </table>
            <#--<div class="broker-content-line">
                <div class="broker-content-line-left">
                   	 身份证号：
                </div>
                <div class="broker-content-line-right" >
                    <@spring.formInput path="membAddlMdl.sn" attributes="maxlength='18' class='broker-content-input'"/>
                <@spring.showErrors classOrStyle="err-msg"/>
                </div>
            </div>
            <div class="clear-float"></div>
            <div class="broker-content-line">
                <div class="broker-content-line-left">
                   	上传身份证：
                </div>
                <div class="broker-content-line-right" >
                	<div id="faceDiv"></div>
                    <div id="sideDiv" ></div>
                    <div class="clear-float"></div>
                    <div style="font-size: 14px;color:#999;">图片格式为：GIF、JPEG、PNG格式，文件大小限3M以内</div>
                    <input  type="hidden" name="side"  />
                    <input  type="hidden" name="face"/>
                </div>
            </div>
            <div class="clear-float"></div>
            -->
        </div>
        <div class="broker-buttom-div">
            <div  class="broker-submit">提交</div>
            <#--<div class="broker-reset">重置</div>-->
        </div>
        <div class="clear-float"></div>
        </div>
        </form>
    </div>
<script >
	$(function(){
		$("input[name='pwd']").attr("type","password");
	
		function changeHash(index){
			if(index == 1){
				if(location.hash == "#sqjjr"){
					location.hash = "#sqjjr2";
				}else{
					location.hash = "#sqjjr";
				}
			}else{
				if(location.hash == "#sexDiv"){
					location.hash = "#hashDiv";
				}else{
					location.hash = "#sexDiv";
				}
			}
		}
		
		$("#applyType").change(function(){
			if($("#applyType").val()=="broker"){
				window.location.href="../memb/add-broker";
			}else{
				window.location.href="../station/add-station";
			}
		});
  		$("#area").lSelect({
			url: "../addr-sel"// AJAX数据获取url
		});
		
		$("input[type='text']").each(function(index, element){
			if($(element).parent().find("span").length==0){
				if(element.name != 'area'){
					$(element).after("<span class='err-msg'></span>");
				}
			}
		});
		if($("input[name='sex']:last +label+span").length == 0){
			$("input[name='sex']:last +label").after("<span class='err-msg'></span>");
		}
		if($("textarea[name='intr'] +span").length==0){
			$("textarea[name='intr']").after("<span class='err-msg'></span>");
		}
		
		//检查是否数字
		function isNum(a)
		{
		    var reg = /^[0-9]*$/;
		    return reg.test(a);
		}
		
		$(".broker-submit").click(function(){
			if($("input[name='name']").val() == ""){
				$("input[name='name']").parent().next().first().html("名字不能为空");
				changeHash(1);
				return false;
			}else{
				$("input[name='name']").parent().next().first().html("");
			}
			if(!$("input[name='sex']")[0].checked){
				if(!$("input[name='sex']")[1].checked){
					$("input[name='sex']").parent().next().first().html("请选择性别");
					changeHash(1);
					return false;
				}else{
					$("input[name='sex']").parent().next().first().html("");
				}
			}else{
				$("input[name='sex']").parent().next().first().html("");
			}
			
			if($("input[name='phone']").val() == ""){
				$("input[name='phone']").parent().next().first().html("请填写手机号");
				changeHash(1);
				return false;
			}else{
				if($("input[name='phone']").val().length!=11){
					$("input[name='phone']").parent().next().first().html("手机号码格式不正确");
					changeHash(1);
					return false;
				}
				$("input[name='phone']").parent().next().first().html("");
			}
			
			if(!checkPhoneFlag){
				$("input[name='phone']").parent().next().first().html("该手机已注册");
				return false;
			}else{
				$("input[name='phone']").parent().next().first().html("");
			}
			
			if($("input[name='smsCode']").val() == ""){
				$("input[name='smsCode']").parent().next().first().html("请填写验证码");
				changeHash(1);
				return false;
			}else{
				if($("input[name='smsCode']").val().length!=3){
					$("input[name='smsCode']").parent().next().first().html("请填写3位数字");
					changeHash(1);
					return false;
				}
				if(!isNum($("input[name='smsCode']").val())){
					$("input[name='smsCode']").parent().next().first().html("请填写3位数字");
					changeHash(1);
					return false;
				}
				$("input[name='smsCode']").parent().next().first().html("");
			}
			
			if($("input[name='pwd']").val() == ""){
				$("input[name='pwd']").parent().next().first().html("请填写密码");
				changeHash(2);
				return false;
			}else{
				$("input[name='pwd']").parent().next().first().html("");
			}
			
			if($("input[name='email']").val() == ""){
				$("input[name='email']").parent().next().first().html("请填写邮箱");
				changeHash(2);
				return false;
			}else{
				if(!(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test($("input[name='email']").val()))){
					$("input[name='email']").parent().next().first().html("请填写正确的邮箱");
					changeHash(2);
					return false;
				}else{
					$("input[name='email']").parent().next().first().html("");
				}
			}
			
			if($("input[name='area']").val() == ""){
				$("input[name='addr'] +span").text("请选择区域");
				changeHash(1);
				return false;
			}

			if($("input[name='addr']").val() == ""){
				$("input[name='addr'] +span").text("请填写详细地址");
				changeHash(1);
				return false;
			}else{
				$("input[name='addr'] +span").text("");
			}
			
			if($("input[name='coor']").val() == ""){
				$("input[name='coor'] +span").text("请定位地址");
				changeHash(1);
				return false;
			}else{
				$("input[name='coor'] +span").text("");
			}
			
			if($("input[name='prof']").val()==""){
				$("input[name='prof'] +span").text("请填写专业领域");
				changeHash(1);
				return false;
			}else{
				$("input[name='prof'] +span").text("");
			}
			
		/*	if($("input[name='sn']").val() != ""){
				if($("input[name='sn']").val().length != 18){
					$("input[name='sn'] +span").text("身份证号格式不正确");
					return false;
				}
			}
			$("input[name='sn'] +span").text("");
			*/
			$("#myform").submit();
		});
		$(".broker-reset").click(function(){
			$("#myform")[0].reset();
		});
				
	/*	$("#faceDiv").uploadify({
        'buttonClass' : 'broker-upload-face-div',
        "height" : 70,
        "width" : 108,
        "swf" : "../uploadify.swf",
        "fileObjName" : "imgFile",
        "buttonText" : "",
        "uploader" : "../img-upload",
        "style":"none",
        'formData':{"folder":"cert"},
        'removeTimeout'	 : 1,
        'method':'post',
        'fileTypeExts'	 : '*.jpg; *.png; *.gif;',
        "onUploadSuccess" : function(file,data){
        	var data = $.parseJSON(data);
        	console.log(data);
        	if(data.result=='SUCCESS'){
            	$("input[name='face']").val(data.path);
            	$("#faceDiv-button").css("background","none");
            	$("#faceDiv").append("<img src='${confs["content.njtx.url"]}/img/"+data.path+"'/>");
       	 	}
        },
        "sizeLimit":'1024kb',
        "multi":false,
        "removeCompleted":true,
        'onFallback' : function() {
           alert("未检测到与flah");
        }
    });
    $("#sideDiv").uploadify({
        'buttonClass' : 'broker-upload-div',
        "height" : 70,
        "width" : 108,
        "swf" : "../uploadify.swf",
        "fileObjName" : "imgFile",
        "buttonText" : "",
        "uploader" : "../img-upload",
        "style":"none",
        'formData':{"folder":"cert"},
        'removeTimeout'	 : 1,
        'fileTypeExts'	 : '*.jpg; *.png; *.gif;',
        "onUploadSuccess" : function(file,data){
        	var data = $.parseJSON(data);
        	console.log(data);
        	if(data.result=='SUCCESS'){
            	$("input[name='side']").val(data.path);
            	$("#sideDiv-button").css("background","none");
            	$("#sideDiv").append("<img src='${confs["content.njtx.url"]}/img/"+data.path+"'/>");
       	 	}
        },
        "sizeLimit":'1024kb',
        "multi":false,
        "removeCompleted":true,
        'onFallback' : function() {
           alert("未检测到兼容的flash");
        }
    });
    */
    <#if invCode??&&invCode!=''>
    	$("#invCode").val("${(invCode)!}");
    	$("#invCode").attr("readonly","readonly");
    </#if> 
    
    <#if membAddlMdl??&&membAddlMdl.invCode??&&invCode!=''>
    	$("#invCode").val("${(membAddlMdl.invCode)!}");
    	$("#invCode").attr("readonly","readonly");
    </#if> 
    
    
    <#if add==true>
    	$("input[name='phone']").val('${memb.phone}');
    </#if>
    <#if msg??>
        msgPrompt("${msg}","warn", function(parm){
        	<#if isRepeat == true>//window.location.href="../";</#if>
        },"",true);
        
        $("#smsCode").val('');
        $("#pwd").val('');
    </#if>
    function chechPhone(){
		if($("input[name='phone']").val() == "" || $("input[name='phone']").val() ==null){
			$("input[name='phone']").parent().next().first().html("请输入手机号码"); 
			return false;
		}else{
			$("input[name='phone']").parent().next().first().html(""); 
		}
		if($("input[name='phone']").val().length != 11){
			$("input[name='phone']").parent().next().first().html("手机号格式错误");
			return ;
		}else{
			$("input[name='phone']").parent().next().first().html("");
		}
		return true;
	}
	
	<#if var??&&var == "1">
		checkPhoneFlag=true;
	</#if>
	
    $("input[name='phone']").blur(function(){
        		if(!chechPhone()){
        			return false;
        		}
        		$.post("check-phone", { "phone": $("input[name='phone']").val()},
   						function(data){
   						if(!data.succ){
   							$("input[name='phone']").parent().next().first().html(data.msg);
   							checkPhoneFlag = false;
   							//普通会员转经纪人
   							if(data.make == "1"){
   								checkPhoneFlag = true;
   								$("input[name='pwd']").parent().next().first().html("请输入原登录密码");
   							}
   						}else{
   							$("input[name='phone']").parent().next().first().html("");
   							$("input[name='pwd']").parent().next().first().html("");
   							checkPhoneFlag = true;
   						}
  				}, "json");
        	});
    $("#smsCodeDiv").click(function(){
    			if(!checkPhoneFlag){
    				$("input[name='phone']").blur();
    				return false;
    			}
    			$.post("sms", {"imgCode":$("input[name='imgCode']").val(), "phone": $("input[name='phone']").val(),"checkCode":$("input[name='checkCode']").val(),"make":"1"},
					function(data){
					if(data.succ){
						if(count = 180){
							$("#smsCodeDiv").css("background","#aaa");
							$("#smsCodeDiv").css("border","#aaa");
							$("#smsCodeDiv").css("color","#FFFEFE");
							$("#smsCodeDiv").attr("disabled","disabled");
							var id = window.setTimeout(reduce(),1000);
							$("input[name='phone']").attr("readonly",true);
						}
					}else{
						$("#smsCodeDiv").val("重新获取");
					}
				 }, "json");
        	});
	});
	var checkPhoneFlag=false;
    var count = 180;
    var overId ;
	function reduce(){
        	if(count <=0){
				window.clearTimeout(overId);
				$("#smsCodeDiv").val("重新获取");
				$("#smsCodeDiv").css("background-color","#46bf6f");
	        	$("#smsCodeDiv").css("color","#fff");
	        	$("#smsCodeDiv").removeAttr("disabled");
				count = 180;
				$("input[name='phone']").attr("readonly",false);
			}else{
				count --;
				overId =  window.setTimeout("reduce()",1000);
				$("#smsCodeDiv").val(count);
			}
		}
</script>
<div class="clear-float"></div>
<#include "footer.ftl">
<#include "suspend-menu.ftl">
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DoHxZdERGnB2yCGyCfp7H5Qh"></script>
<script type="text/javascript">
	//百度地图
	var map = new BMap.Map("map");
	map.centerAndZoom("中国",5);
	map.addControl(new BMap.NavigationControl());
	map.addControl(new BMap.MapTypeControl());
	marker = new BMap.Marker({enableDragging: true});
	//查找地址点
	function getPositon(){
		map.clearOverlays();
		var addrSel = $(".lSelect option:selected").text().replace("请选择","");
  		var addr = addrSel+$("#addr").val();
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
				alert("请选择省、市、县");
			}
		}, addrSel);
	}
	
</script>
</html>