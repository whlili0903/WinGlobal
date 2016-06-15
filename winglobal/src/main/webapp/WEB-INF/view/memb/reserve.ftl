<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/persion.css" />
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-menu.css" />
	<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/plupload.full.min.js"></script>
	<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/jquery.ui.plupload/jquery.ui.plupload.min.js"></script>
	<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/i18n/zh_CN.js"></script>
	<link rel="stylesheet" href="${confs["content.url"]}/plugin/plupload/jquery.ui.plupload/css/jquery.ui.plupload.css"/>
	<link rel="stylesheet" href="${confs["content.url"]}/plugin/jquery-ui/jquery-ui.min.css"/>
	<style>
	.left-center-div a{
		color:#fff;
	}
	
	.right-div {
		display:block;
	}
	
	.body-content-name a{
		color:#202020;
	}
	.body-content-name a:hover{
		color:#0AB552;
	}
	.body-content-div5 a{
		color:#202020;
	}
	.body-content-div5 a:hover{
		color:#0AB552;
	}
	.body-content-div5:hover{
		color:#0AB552;
	}
	.body-content-div6-line:hover{
		color:#0AB552;
	}
	.body-content-div6{
    	float:right;
   	 	width:50px;
    	cursor:pointer;
    	margin-right:42px;
	}
	.persion-meun-img{
		margin-top:7px;
	}
	.img-uploaded{
		width:100px;
		height:80px;
		top:10px;
		position:relative;
	}
	.li-uploaded{
		float:left;
		width:120px;
		height:100px;
		background:#F6F6F6;
		text-align:center;
		margin-top:10px;
		margin-left:10px;
	}
	</style>
	<script>
		 function showPic(path){
  			var domStr = '<li class="li-uploaded">'+
  					'<img class="img-uploaded" src="${confs["content.njtx.url"]}/img/'+path+'"/>'+
  					'<span class="span-remove" onclick="removePic(this);">'+
  						'<img style="width:30px;height:30px;" src="${confs["content.url"]}/img/delete.png" alt="删除"/>'+
  					'</span>'+
  					'<input type="hidden" name="imgs" value="'+path+'"/>';
  			$("#ul-uploaded").append(domStr);
 		  }
 		  function removePic(obj){
  	   		$(obj).parent().remove();
  		  }
  		 function loadPic(){
   	 	 <#list landMdl.imgs as imgPath >
    	  showPic("${imgPath}");
		 </#list>
  	     }
  	     var certImgs = [<#list orders as order >
  	     	<#if order.certs??>
  	     {orderId:"${order.id}",
  	     	type:"${order.certs[0].type}",
  	     	imgs:[<#list order.certs as cert>"${cert.url}"<#if cert_index != (cert?size-1) >,</#if></#list>]
  	     }
  	     <#if order_index != (orders?size-1)>,</#if>
  	     	</#if>
  	     </#list>];
        $(document).ready(function(){
	$("#div-uploader").plupload({
        url : "../../img-upload",
        file_data_name:"imgFile",
        multipart_params:{"folder":"cert"},
        max_file_size : '2mb',
        
        filters : [
            {title : "Image files", extensions : "jpg,gif,png"},
        ],
        rename: true,
        sortable: true,
 		dragdrop: false,
        views: {
            list: false,
            thumbs: true,
            active: 'thumbs'
        },
        flash_swf_url : '../Moxie.swf',
        silverlight_xap_url : '../Moxie.xap',
        uploaded:function(uploader,file){
        	if(file.result.status == 200){
        		var r = $.parseJSON(file.result.response);
        		if(r.result == "SUCCESS"){
        			showPic(r.path);
        		}
        	}
        }
});
        
        	//initPage();
            $(".body-head-div1").click(function(){
                var imgElement = $(this).find("img");
                var imgSrc = imgElement.attr("src");
                if(imgSrc.indexOf("ku.png") !=-1 ){
                    imgElement.attr("src",imgSrc.replace("ku.png","go.png"));
                }else{
                    imgElement.attr("src",imgSrc.replace("go.png","ku.png"));
                    $(".all-select-img").find("img").attr("src",imgSrc.replace("go.png","ku.png"));
                }
            });
            $(".all-select-img").click(function(){
                var imgElement = $(this).find("img");
                var imgSrc = imgElement.attr("src");
                if(imgSrc.indexOf("ku.png") !=-1 ){
                    imgElement.attr("src",imgSrc.replace("ku.png","go.png"));
                    $(".body-head-div1").find("img").attr("src",imgSrc.replace("ku.png","go.png"));
                }else{
                    imgElement.attr("src",imgSrc.replace("go.png","ku.png"));
                    $(".body-head-div1").find("img").attr("src",imgSrc.replace("go.png","ku.png"));
                }

            });
            $(".all-select").click(function(){
                $(".all-select-img").click();
            });
            $("div[divId='qxResv']").click(function(){
            	var reserveId = $(this).attr("reserveId");
           		msgPrompt("你确定要取消吗？","warn",function(reserveId){
           			$.post("../reserve/remove", { "ids":reserveId},
   					function(data){
   					if(data.succ){
   						msgPrompt(data.msg,"succ");
   						$("div[reserveIdDiv='"+reserveId+"']").remove();
   					}else{
   						msgPrompt(data.msg,"error");
   					}
  				}, "json");
           		},reserveId);
            });
            $("#resvAllOper").click(function(){
           		var reserveId = $(this).attr("id");
            	var objIds = "";
            	$(".body-head-div1").find("img").each(function(index,element){
            		if($(element).attr("src").indexOf("go.png") != -1){
            			var imgId = $(element).attr("reserveId");
            			objIds = objIds+imgId+",";
            		}
            	});
            	if(objIds == ""){
            		msgPrompt("请选择要取消的预约","warn");
            		return false;
            	}
            	msgPrompt("你确定要取消吗？","warn",function(objIds){
            		$.post("../reserve/remove", { "ids":objIds},
   					function(data){
   					if(data.succ){
   						var ids = objIds.split(",");
   						msgPrompt(data.msg,"succ");
	   					for(var i = 0 ; i<ids.length ; i++){
	   						$("div[reserveIdDiv='"+ids[i]+"']").remove();
	   					}
   					}else{
   						msgPrompt(data.msg,"error");
   					}
  				}, "json");
            	},objIds);
            });
            $("div[divId='tran']").click(function(){
            	var obj ={
            		id:$(this).attr("parmId"),
            		url:$(this).attr("url")
            	} 
            	msgPrompt($(this).attr("info"),"warn",function(obj){
            		$.post(obj.url, { "id":obj.id},
   					function(data){
   					if(data.succ){
   						window.location.reload();
   					}else{
   						msgPrompt(data.msg,"error");
   					}
  				}, "json");
            	},obj);
            });
            $("div[divId='upCert']").click(function(){
            	var orderId = $(this).attr("parmId");
            	$("input[name='orderId']").val(orderId);
            	$("#ul-uploaded").html(null);
            	if(certImgs.length != 0){
            		for(var i = 0 ;i <certImgs.length ;i++){
            			if(certImgs[i].orderId == orderId){
            				$("select[name='type']").val(certImgs[i].type);
            				for(var j = 0 ; j < certImgs[i].imgs.length ; j++){
            					showPic(certImgs[i].imgs[j]);
            				}
            			}
            		}
            	}
            	$("#certDiv").show();
            });
            $(".cert-body-bg").click(function(){
            	$("#certDiv").hide();
            });
            $("#submitDiv").click(function(){
            	if($("select[name='type']").val() == ""){
            		$("#typeError").text("请选择凭证类型");
            		return false;
            	}else{
            		$("#typeError").text("");
            	}
           		var $inputs = $("input[name='imgs']");
           		var imgs ="";
           		if($inputs.length > 0){
           			$("#imgError").html(null);
            		for(var i = 0 ;i< $inputs.length ;i++){
            			imgs = imgs+ $($inputs[i]).val();
            			if(i < $inputs.length-1){
            				imgs = imgs+ ",";
            			}
            		}
            		$("#imgError").text("");
            	}else{
            		$("#imgError").text("请上传凭证");
            		return false;
            	}
            	var parm={
            		"certMdl.orderId":$("input[name='orderId']").val(),
            		"certMdl.type":$("select[name='type']").val(),
            		"imgs":imgs
            	}
            	
            	$.post("../order/crt-cert", parm,
   					function(data){
   						if(data.succ){
   							msgPrompt("上传成功","succ",function(parm){
   								window.location.reload();
   							},"", true);
   						}else{
   							$("#imgError").text(data.msg);
   						}
  				}, "json");
            });
        });
	</script>
	<style>
	.cert-body{
	    width: 1000px;    
        height: 420px;   
        position: fixed; 
        z-index: 777;    
        left: 0px;       
        right: 0px;      
        top: 0px;        
        bottom: 0px;     
        opacity: 1;      
        margin: auto;    
        color: #202020; 
        padding-left:20px;
        padding-right:20px;
        padding-top:30px;
        background-color: #eee;
	}
	.cert-body-bg {
    	background-color: #000;
   	 	opacity: 0.5;
    	padding: 0;
    	margin: 0;
    	height: 100%;
    	width: 100%;
    	position: fixed;
    	z-index: 666;
	}
	.reserve-biaoqian{
		position: relative;
    	margin-left: -178px;
    	margin-top: 31px;
   	 	float: left;
   	 	z-index: 222;
	}
	</style>
</head>
<body>
<div id="certDiv" style="display:none;">
	<div class="cert-body-bg"></div>
	<div class="cert-body">
		<form action="../order/crt-cert" method="post">
		<input type="hidden" name="orderId" />
		<select name="type">
			<option value="">请选择</option>
			<#list fetrs["CT"].children?values as ct>
			<option value="${ct.code}">${ct.name}</option>
			</#list>
		</select><span style="color:red" id="typeError"></span>
  		<div class="content" style="width:100%;height:300px;margin-top:16px;">
		    <div id="div-uploader" style="width:520px;float:left;"></div>
		    <div id="div-uploaded" style="width:435px;height:300px;float:right;border:#DDDDDD 1px solid;">
		    	<div style="width:100%;height:50px;background:#F6F6F6;border-bottom:#C5C5C5 1px solid;">
		    		<span style="margin-left:20px;font-size:18px;line-height:40px;">已上传图片</span>
		    	</div>
		    	<ul id="ul-uploaded" style="width:100%;height:250px;overflow-y: auto;background-color: #fff;">
		    	</ul>
		    </div>
  		</div>
  		<div style="height:30px;width:100px;color:red" id="imgError"> </div>
  		<div id="submitDiv" style="margin:auto;width:100px;height:40px;background-color:#0AB552;color:#fff;
  		cursor: pointer;text-align: center;line-height: 40px;">保存凭证</div>
  		</form>
  	</div>
</div>
<#include "header2.ftl">
<div class="body-div">
	<div class="header-div"></div>
	 <div class="center-div">
	 	<#include "memb/memb-menu.ftl">
        <div class="right-div" id="yyContent" >
            <div class="right-head-div" style=" position: relative;">
            	<div class="head-text-div" style="cursor: pointer;" onclick="javascript:window.location.href='../reserve/resv-land-buy?menuIndex=32'">我是买家</div>
            	<#if memb?? && memb.type == 'MT02'>
            		<div class="head-text-div" style="cursor: pointer;"  onclick="javascript:window.location.href='../reserve/resv-land-seller?menuIndex=32'">我是卖家</div>
            	</#if>
                <div class="right-head-oper"><div class="all-select-img"  style="margin-top:0px;"><img src="${confs["content.url"]}/img/ku.png" style="margin-top:24px;    display: block;" /> </div><div class="all-select" >全选</div><div class="all-oper" id="resvAllOper">取消预约</div></div>
                <div class="clear-float"></div>
                <div class="img-div" <#if isOwner==true> style="margin-left:140px;"</#if>><img src="${confs["content.url"]}/img/bottom.png"/></div>
            </div>
            <div style="height:675px;overflow:auto;float:left;margin-top:15px;position: relative;<#if  lands?size lt 1 >height:520px;text-align: center;width: 100%;background-color: white;</#if> " >
            <#if lands?size gt 0>
            <#list lands as land>
            <#list reserves as reserve>
            <#if reserve.landId == land.id>
            <div class="right-body-div" style="    position: relative;" reserveIdDiv="${reserve.id}"  >
                <div class="right-body-head">
                    <div class="body-head-div1" ><#if opts["RV"].children[reserve.status].code == "RV01"><img src="${confs["content.url"]}/img/ku.png" reserveId="${reserve.id}" /><#else>&nbsp;</#if></div>
                    <div  class="body-head-div2">图片信息</div>
                    <div  class="body-head-div3">土地信息</div>
                    <div  class="body-head-div6">操作</div>
                    <div  class="body-head-div5">状态</div>
                    <div  class="body-head-div4">预约时间</div>
                </div>
                <div class="right-body-content">
                    <div class="body-content-div1">
                     <img src="${confs["content.njtx.url"]}/img/${land.img}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'"/>
                     </div>
                    <#if reserve.type=="RT02">
                    	<img src="${confs["content.url"]}/img/lxpt.png" class="reserve-biaoqian" />
                    <#elseif  isOwner!=true>
                    	<img src="${confs["content.url"]}/img/yydz.png" class="reserve-biaoqian" />
                    </#if>
                    <div class="body-content-text">
                    <div  class="body-content-div2">
                        <div class="body-content-name"><a href="../land/detail?id=${land.id}" target="_blank" >${land.name}</a></div>
                            <div class="body-content-info">土地类型：${fetrs['LT'].children[land.type].name}</div>
                            <div class="body-content-info">区域位置：<#if land.area??><#if land.area?length gt 1>${addrs[land.area[0..1]].name}</#if><#if land.area?length gt 3>${addrs[land.area[0..1]].children[land.area[0..3]].name}</#if><#if land.area?length gt 5>${addrs[land.area[0..1]].children[land.area[0..3]].children[land.area[0..5]].name}</#if></#if>${land.addr}</div>
                            <div class="body-content-info">
                           <#if land.sp != null>
                            	${land.sp?string("#.##")}${opts["SU"].children[land.spu].name}
                           	<#elseif land.up != null && land.up != 0>
                            	${land.up?string("#.##")}${opts["UU"].children[land.upu].name}
                            <#else>
                            	面议
                            </#if>
                            &nbsp;${land.acre?string("#.##")}${opts["AU"].children[land.au].name}&nbsp;
                            &nbsp;${land.years}年
                            </div>
                            <div class="body-content-info">
                            	<#if isOwner==true> 
                            		买家：${reserve.membPhone}
                            	<#else>
                            		${land.landAddl.ownerName}${opts['SX'].children[land.landAddl.ownerSex].value}&nbsp;${land.landAddl.ownerTel}
                            	</#if>
                            </div>
                    	</div>
                    	<#if reserve.status == 'RV02'>
	                  	<#list orders as order>
	                  		<#if order.reserveId == reserve.id>
	                    		<#if isOwner==true>
                    				<#if opts["TV"].children[order.stat].code == "TV01">
	                   					<div  class="body-content-div6" >
	                   					<div class="body-content-div6-line" divId="tran" parmId="${order.id}"
	                   					info="你确定交易成功吗？" url="../order/order-succ" >交易成功</div>
	                   						<div divId="tran" parmId="${order.id}" class="body-content-div6-line"
	                   					info="你确定取消交易吗？" url="../order/order-cancel" >取消交易</div>
	                   					</div>
	                   				<#elseif opts["TV"].children[order.stat].code == "TV02" ||  opts["TV"].children[order.stat].code == "TV04" ||
	                   				opts["TV"].children[order.stat].code == "TV06">
	                   					<div  class="body-content-div5" divId="upCert" parmId="${order.id}" >上传凭证</div>
	                   	 			<#else>
	                    				<div  class="body-content-div5" >
	                    					<a href="../land/detail?id=${land.id}" target="_blank">查看</a>
	                    				</div>
	                    			</#if>
	                  			<#else>
	                  				<#if opts["RV"].children[reserve.status].code == "RV01">
	                   					<div  class="body-content-div5" divId="qxResv" reserveId="${reserve.id}" >取消</div>
	                   	 			<#else>
	                    				<div  class="body-content-div5" >
	                    					<a href="../land/detail?id=${land.id}" target="_blank">查看</a>
	                    				</div>
	                    			</#if>
	                  			</#if>
	                    		<div  class="body-content-div4">${opts["TV"].children[order.stat].name}</div>
	                    	</#if>
	                    </#list>
	                   	<#else>	
	                   			<#if isOwner==true>
                    				<#if opts["RV"].children[reserve.status].code == "RV01">
	                   					<div  class="body-content-div5" divId="tran" info="你确定要进行交易吗？" url="../order/crt-order"
	                   					 parmId="${reserve.id}" >进行交易</div>
	                   	 			<#else>
	                    				<div  class="body-content-div5" >
	                    					<a href="../land/detail?id=${land.id}" target="_blank">查看</a>
	                    				</div>
	                    			</#if>
	                  			<#else>
	                  				<#if opts["RV"].children[reserve.status].code == "RV01">
	                   					<div  class="body-content-div5" divId="qxResv" reserveId="${reserve.id}" >取消</div>
	                   	 			<#elseif opts["RV"].children[reserve.status].code =='RV03'>
	                    				<div id="look"  class="body-content-div5" onclick="msgPrompt('已出售','error')" >
	                    					查看
	                    				</div>
	                    			<#else>
	                    				<div  class="body-content-div5" >
	                    					<a href="../land/detail?id=${land.id}" target="_blank">查看</a>
	                    				</div>
	                    			</#if>
	                  			</#if>
	                   		<div  class="body-content-div4">${opts["RV"].children[reserve.status].name}</div>
	                   	</#if>
	                    <div  class="body-content-div3">${reserve.crtTime?string("yyyy-MM-dd")}</div>
                    </div>
                </div>
            </div>
             </#if>
            </#list>
           </#list>
           
           <#else>
           	  <img style="margin-top: 10%;" src="${confs["content.url"]}/img/<#if make??&&make=='buy'>res_land1.png<#else>res_land.png</#if>" />
           </#if>
           </div>
           <div class="clear-float"></div>
        </div>
        <div class="clear-float"></div>
    </div>
</div>
<div class="clear-float"></div>
<#include "footer.ftl">
</body>
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
</html>