<#assign parm=4>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
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
   			<#if stationMdl.mstrSide != null>
        	background:url('${confs["content.njtx.url"]}/img/${stationMdl.mstrSide}')no-repeat;
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
        	<#if stationMdl.mstrFace != null>
        	background:url('${confs["content.njtx.url"]}/img/${stationMdl.mstrFace}')no-repeat;
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
    <link href="${confs["content.url"]}/plugin/uploadify/uploadify.css"/>
<script type="text/javascript" src="${confs["content.url"]}/plugin/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="${confs["content.url"]}/plugin/jquery.lSelect.js"></script>
</head>
<body>
	<#include "header1.ftl">
<div class="body-div">
        <div class="broker-title">
            <div class="broker-title-01"><span class="span-01">1</span>填写申请资料基本信息</div>
            <div class="broker-title-02"><span class="span-01">2</span>提交申请，等待答复</div>
        </div>
        <div class="clear-float"></div>
        <form action="<#if stationMdl.id?? >upd-station<#else>save-station</#if>" method="post" id="myform">
        <input type="hidden" name="id" value="${stationMdl.id}"/>
                <div class="broker-content">
            <div class="broker-content-title" id="sqjjr">申请资料填写</div>
            <div class="broker-content-line">
                <div class="broker-content-line-left" id="sqjjr2">
                     你的申请身份是：
                 </div>
                <div class="broker-content-line-right" >
                    <select id="applyType">
                    	<option value="station">分站</option>
                        <option value="broker">经纪人</option>
                    </select>
                </div>
                <div class="broker-content-line-right" style="margin-left:15px;font-size:14px;">
                    你需要全部填写以下个人信息和公司信息，才能完成申请
                </div>
            </div>
            <div class="clear-float"></div>
            <div  class="broker-content-title" style="margin-top:43px">分站资料</div>
            <#if errorMsg??>
            <div class="broker-content-line" >
                <div class="broker-content-line-left">
                    <span class="broker-span">&nbsp;</span>  <span style="color:red">驳回原因</span>：
                </div>
                <div class="broker-content-line-right" >
                	<span style="color:red">${errorMsg}</span>
                </div>
            </div>
             <div class="clear-float"></div>
            </#if>
            <div class="broker-content-line">
                <div class="broker-content-line-left">
                   <span class="broker-span">*</span> 真实姓名：
                </div>
                <div class="broker-content-line-right">
                <@spring.formInput path="stationMdl.mstrName" attributes=" maxlength='10' class='broker-content-input'"/>
                <@spring.showErrors classOrStyle="err-msg"/>
                </div>
            </div>
            <div class="clear-float"></div>
            <div class="broker-content-line">
            <div class="broker-content-line-left" id="mstrSexDiv">
                <span class="broker-span">*</span>  性别：
            </div>
            <div class="broker-content-line-right">
                <@atag.formRadioButtons path="stationMdl.mstrSex" options=opts["SX"].children?values labelAttr="class='broker-label'"  attributes="style='margin-left:13px'" />
                <@spring.showErrors classOrStyle="err-msg"/>
            </div>
            </div>
            <div class="clear-float" id="hashDiv"></div>
            <div class="broker-content-line">
                <div class="broker-content-line-left">
                    <span class="broker-span">*</span>  联系电话：
                </div>
                <div class="broker-content-line-right">
                    <@spring.formInput path="stationMdl.mstrTel" attributes=" maxlength='11' class='broker-content-input'"/>
                <@spring.showErrors classOrStyle="err-msg"/>
                </div>
            </div>
            <div class="clear-float"></div>
            <div class="broker-content-line" style="height:90px;" id="areaDiv">
                <div class="broker-content-line-left">
                    <span class="broker-span">*</span>  分站地址：
                </div>
                <div class="broker-content-line-right">
                <#assign parm=3>
                    <#assign path=''/>
		    		<#if (stationMdl.area)?length gt 1>
		    			<#assign path=stationMdl.area[0..1]/>
		    			<#if (stationMdl.area)?length gt 3>
			    			<#assign path=path+','+stationMdl.area[0..3]/>
			    			<#if (stationMdl.area)?length gt 5>
				    			<#assign path=path+','+stationMdl.area[0..5]/>
				    			<#if (stationMdl.area)?length gt 7>
					    			<#assign path=path+','+stationMdl.area[0..7]/>
					    		</#if>
				    		</#if>
			    		</#if>
		    		</#if>
		    		<@spring.formInput path="stationMdl.area" attributes="defaultSelectedPath='${path}'"/><@spring.showErrors classOrStyle="err-msg"/></br>
		    		<@spring.formInput path="stationMdl.addr" attributes="class='broker-content-input broker-addr-input'"/><@spring.showErrors classOrStyle="err-msg"/>
                </div>
            </div>
            <div class="clear-float"></div>
            <div class="broker-content-line">
                <div class="broker-content-line-left">
                    <span class="broker-span">*</span>   业务范围：
                </div>
                <div class="broker-content-line-right">
                   	<@spring.formInput path="stationMdl.biz" attributes="maxlength='15' class='broker-content-input'"/>
					<@spring.showErrors classOrStyle="err-msg"/>
                </div>
            </div>
            <div class="clear-float"></div>
            <div class="broker-content-line">
                <div class="broker-content-line-left">
                    <span class="broker-span">*</span>   经营介绍：
                </div>
                <div class="broker-content-line-right" >
                   <@spring.formTextarea path="stationMdl.intr" attributes=" maxlength='255' style='width:388px;height:126px;padding-left:10px;padding-top:10px;'" />
                   	<@spring.showErrors classOrStyle="err-msg"/>
                </div>
            </div>
            <div class="clear-float"></div>
            <div class="broker-content-line" style="margin-top:122px;">
                <div class="broker-content-line-left">
                    <span class="broker-span">*</span>   常用邮箱：
                </div>
                <div class="broker-content-line-right" >
                <@spring.formInput path="stationMdl.mstrEmail" attributes="maxlength='20'  class='broker-content-input'"/>
                <@spring.showErrors classOrStyle="err-msg"/>
                </div>
            </div>
            <div class="clear-float"></div>
         <#--   <div class="broker-content-line">
                <div class="broker-content-line-left">
                  	  身份证号：
                </div>
                <div class="broker-content-line-right" >
                    <@spring.formInput path="stationMdl.mstrSn" attributes="maxlength='18' class='broker-content-input'"/>
                <@spring.showErrors classOrStyle="err-msg"/>
                </div>
            </div>
            <div class="clear-float"></div>
            <div class="broker-content-line">
                <div class="broker-content-line-left">
                   	上传身份证：
                </div>
                <div class="broker-content-line-right" >
                	<div id="mstrFaceDiv"></div>
                    <div id="mstrSideDiv" ></div>
                    <div class="clear-float"></div>
                    <div style="font-size: 14px;color:#999;">图片格式为：GIF、JPEG、PNG格式，文件大小限3M以内</div>
                    <input  type="hidden" name="mstrSide"  />
                    <input  type="hidden" name="mstrFace"/>
                </div>
            </div>
            <div class="clear-float"></div>
            -->
        </div>
        <div class="broker-buttom-div">
            <div  class="broker-submit">提交</div>
            <div class="broker-reset">重置</div>
        </div>
        <div class="clear-float"></div>
        </div>
        </form>
    </div>

<script >
	$(function(){
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
				window.location.href="../memb/add-broker?flag=a";
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
		if($("input[name='mstrSex']:last +label+span").length == 0){
			$("input[name='mstrSex']:last +label").after("<span class='err-msg'></span>");
		}
		if($("textarea[name='intr'] +span").length==0){
			$("textarea[name='intr']").after("<span class='err-msg'></span>");
		}
		<#if isRepeat==true>
    		<#if msg??>
    				$(".body-div input").attr("disabled","disabled");
    				$(".body-div  textarea").attr("disabled","disabled");
    				$(".body-div  select").attr("disabled","disabled");
    				$("#applyType").attr("disabled",false);
    		</#if>
   		</#if>
		$(".broker-submit").click(function(){
			<#if isRepeat==true>
    			<#if msg??>
    				return false;
    			</#if>
   			</#if>
			if($("input[name='mstrName']").val() == ""){
				$("input[name='mstrName']+span").text("名字不能为空");
				 changeHash(1);
				return false;
			}else{
				$("input[name='mstrName']+span").text("");
			}
			if(!$("input[name='mstrSex']")[0].checked){
				if(!$("input[name='mstrSex']")[1].checked){
					$("input[name='mstrSex']:last +label +span").text("请选择性别");
					changeHash(1);
					return false;
				}else{
					$("input[name='mstrSex']:last +label +span").text("");
				}
			}else{
				$("input[name='mstrSex']:last +label +span").text("");
			}
			
			if($("input[name='mstrTel']").val() == ""){
				$("input[name='mstrTel'] +span").text("请填写手机号");
				changeHash(1);
				return false;
			}else{
				if($("input[name='mstrTel']").val().length!=11){
					$("input[name='mstrTel'] +span").text("手机号码格式不正确");
					changeHash(1);
					return false;
				}
				$("input[name='mstrTel'] +span").text("");
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
			if($("input[name='biz']").val()==""){
				$("input[name='biz'] +span").text("请填写专业领域");
				changeHash(1);
				return false;
			}else{
				$("input[name='biz'] +span").text("");
			}
			if($("textarea[name='intr']").val()==""){
				$("textarea[name='intr'] +span").text("请填写介绍");
				changeHash(2);
				return false;
			}else{
				$("textarea[name='intr'] +span").text("");
			}
			
			if($("input[name='mstrEmail']").val() == ""){
				$("input[name='mstrEmail'] +span").text("请填写邮箱");
				changeHash(2);
				return false;
			}else{
				if(!(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test($("input[name='mstrEmail']").val()))){
					$("input[name='mstrEmail'] +span").text("请填写正确的邮箱");
					changeHash(2);
					return false;
				}else{
					$("input[name='mstrEmail'] +span").text("");
				}
			}
			/* if($("input[name='mstrSn']").val() == ""){
				$("input[name='mstrSn'] +span").text("请填写身份证号");
				return false;
			}else{
				$("input[name='mstrSn'] +span").text("");
			}
			if($("input[name='mstrSn']").val() != ""){
				if($("input[name='mstrSn']").val().length != 18){
					$("input[name='mstrSn'] +span").text("身份证号格式不正确");
					return false;
				}
			}
			$("input[name='mstrSn'] +span").text("");
			*/
			$("#myform").submit();
		});
		$(".broker-reset").click(function(){
			$("#myform")[0].reset();
		});
	/*	$("#mstrFaceDiv").uploadify({
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
        'fileTypeExts'	 : '*.jpg; *.png; *.gif;',
        "onUploadSuccess" : function(file,data){
        	var data = $.parseJSON(data);
        	console.log(data);
        	if(data.result=='SUCCESS'){
            	$("input[name='mstrFace']").val(data.path);
            	$("#mstrFaceDiv-button").css("background","none");
            	$("#mstrFaceDiv").append("<img src='${confs["content.njtx.url"]}/img/"+data.path+"'/>");
       	 	}
        },
        "sizeLimit":'1024kb',
        "multi":false,
        "removeCompleted":true,
        'onFallback' : function() {
           alert("未检测到与flah");
        }
    });
    $("#mstrSideDiv").uploadify({
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
            	$("input[name='mstrSide']").val(data.path);
            	$("#mstrSideDiv-button").css("background","none");
            	$("#mstrSideDiv").append("<img src='${confs["content.njtx.url"]}/img/"+data.path+"'/>");
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
    <#if add==true>
    	$("input[name='mstrTel']").val('${memb.phone}');
    </#if>
    <#if msg??>
        msgPrompt("${msg}","warn", function(parm){
        	<#if isRepeat == true>//window.location.href="../";</#if>
        },"",true);
    </#if>
	});
</script>
<div class="clear-float"></div>
<#include "footer.ftl">
<#include "suspend-menu.ftl">
</body>
</html>