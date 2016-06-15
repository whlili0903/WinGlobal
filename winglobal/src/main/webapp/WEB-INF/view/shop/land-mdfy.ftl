<!DOCTYPE html>
<html>
<head>
<#include "head.ftl">
<#assign parm=3>
<script type="text/javascript" src="${confs["content.url"]}/plugin/dhtmlxCalendar/dhtmlxcalendar.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery.lSelect.js"></script>

<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/jquery.ui.plupload/jquery.ui.plupload.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/i18n/zh_CN.js"></script>


<link rel="stylesheet" href="${confs["content.url"]}/plugin/dhtmlxCalendar/dhtmlxcalendar.css"/>
<link rel="stylesheet" href="${confs["content.url"]}/plugin/jquery-ui/jquery-ui.min.css"/>
<link rel="stylesheet" href="${confs["content.url"]}/plugin/plupload/jquery.ui.plupload/css/jquery.ui.plupload.css"/>


<script type="text/javascript">
  var imgIndex = 0;
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
  
  function setUnit(){
  	var type = $("#type").val()
  	switch (type){
  		case 'LT01':
  			$("#au").val('AU01');
  			$("#upu").val('UU01');
  			break;
  		case 'LT02':
  			$("#au").val('AU01');
  			$("#upu").val('UU02');
  			break;
  		case 'LT03':
  			$("#au").val('AU01');
  			$("#upu").val('UU02');
  			break;
  		case 'LT04':
  			$("#au").val('AU01');
  			$("#upu").val('UU02');
  			break;
  		case 'LT05':
  			$("#au").val('AU01');
  			$("#upu").val('UU02');
  			break;
  		case 'LT06':
  			$("#au").val('AU02');
  			$("#upu").val('UU03');
  			break;
  		case 'LT09':
  			$("#au").val('AU01');
  			$("#upu").val('UU02');
  			break;
  	}
  }
  function setWa(){
  	var type = $("#type").val();
  	if(type=='LT02' || type=='LT03' || type=='LT04' || type=='LT05'){
  		$("#landFetrsWS").attr("disabled","disabled");
		$("input[name='landFetrs[WA]']").removeAttr("disabled");
		$("#tr-wa").css('display','table-row');
		$("#tr-ws").css('display','none');
  	}else{
  		$("#landFetrsWS").removeAttr("disabled");
  		$("input[name='landFetrs[WA]']").attr("disabled","disabled");
  		$("#tr-wa").css('display','none');
  		$("#tr-ws").css('display','table-row');
  	}
  }
  function setTm(){
  	var type = $("#type").val();
  	$("input[name='landFetrs[TM]']").removeAttr("disabled");
  	$("input[name='landFetrs[TM]']").next("label").css("color","black");
  	if(type=='LT02' || type=='LT03' || type=='LT04' || type=='LT05' || type=='LT09'){
  		$("#landFetrsTM0").attr("disabled","disabled");
		$("#landFetrsTM0").next("label").css("color","gray");
  	}else if(type == "LT06"){
  		$("#landFetrsTM0,#landFetrsTM4").attr("disabled","disabled");
		$("#landFetrsTM0,#landFetrsTM4").next("label").css("color","gray");
  	}
  }
  function calSp(){
  	var au = $("#au").val();
  	var upu = $("#upu").val();
  	var spu = $("#spu").val();
  	
  	var up = $("#up").val();
  	var years = $("#years").val();
  	var acre = $("#acre").val();
  	
  	var sp = 0;
  	if(upu == 'UU01'||upu == 'UU03'){
  		sp = up*acre;
  	}else{
  		sp = up*years*acre
  	}
  	
  	if(spu == 'SU01' && upu != 'UU01'){
  		sp = sp/10000;
  	}
	sp = Math.round(sp);
	if(sp == 0){
		sp = null;
	}
	if($("select[name='type']").val() != "LT02"){
		$("#sp").val(sp);
	}else{
		$("#sp").val("");
	}
  }
  function genName(){
  	var addrSel = $(".lSelect option:selected").text().replace("请选择","");

  	var addr = addrSel+$("#addr").val();
  	var type = $("#type option:selected").text();
  	if(type=="请选择"){
  		type = "";
  	}
  	var n = addr+" "+type+" "+$("#acre").val()+$("#au option:selected").text();
  	$("#name").val(n);
  }
  function onsmt(){
  	genName();
  	calSp();
  	var imgs = $("input[name='imgs']");
  	if(imgs.length>0){
  		$("#img").val(imgs[0].value);
  	}else{
  		$("#img").val(null);
  	}
  	$("#au,#upu,#spu").removeAttr("disabled");
  }
  
  $(function(){
  	if("SUCCESS" == "${result}"){
  		msgPrompt("土地发布成功！请等待管理员审核","succ",function(parm){
  			window.location="../land/memb-land?perParm=olDiv,olContent,noOlMenu";
  		},"",true);
  		
  	}
  	
  	setWa();
  	setTm();
  	var $areaSelect =$("#area");
  	$areaSelect.lSelect({
		url: "../addr-sel"// AJAX数据获取url
	});
	var cal = new dhtmlXCalendarObject([ "certSdate" ]).hideTime();
	$("#addr,.lSelect").change(genName);
	$("#years").change(calSp);
	$("#up").change(function(){
		calSp();
	});
	$("#acre").change(function(){
		genName();
		calSp();
	});
	$("#type").change(function(){
		setUnit();
		genName();
		setWa();
		setTm();
		calSp();
	});
	loadPic();
	plupload.addI18n({"Select files" : "选择文件<span style='font-size:12px'>(建议上传770*400的图片)</span>"});
	$("#div-uploader").plupload({
        url : "../../img-upload",
        file_data_name:"imgFile",
        multipart_params:{"folder":"land"},
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
  });
  
</script>
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		text-decoration: none;
		font-family: "Microsoft YaHei", 微软雅黑, "Microsoft JhengHei", 华文细黑,
			STHeiti, MingLiu;
	}
	html,body{
		height: 100%;
		width: 100%;
		border: 0;
	}
	.container {
		width: 1200px;
		margin: auto;
		text-align: left;
		position: relative;
		background-color:#FFFFFF;
		margin-top: 20px;
		border:1px #FFFFFF solid;
	}
	.section{
		margin-top:30px;
		margin-left:36px;
	}
	.field {
		color: #46BF6F;
	}
	.title{
		margin-left:5px;
		font-size:14px;
	}
	.titleVertical{
		color:#FF7D1D;
	}
	.content{
		margin-left:4px;
	}
	.ps{
		font-size:11px;
		color:gray;
		margin-left:10px;
	}
	.tab{
		list-style-type:none;
		height:100%;
	}
	.tab li{
		width:124px;
		height:100%;
		float:left;
		font-size:16px;
		font-weight:500;
		text-align: center;
		margin-left:10px;
		line-height:60px;
		background:url(${confs["content.url"]}/img/tab-bottom.png) no-repeat bottom center;
	}
	.btn{
		width:200px;
		height:40px;
		background-color:#0BB452;
		color:white;
		margin-top:50px;
		font-size:15px;
	}
	.btn:hover{
		cursor:pointer;
	}
	.land-body-div input[type=text] {
		width:100px;
	}
	table{
		width:100%;
	}
	table tr{
		height:35px;
	}
	#hint{
		border:1px #72E1A1 solid;
		height:38px;
		line-height:38px;
		background:url(${confs["content.url"]}/img/hint.png) no-repeat #D2F2Df;
		background-position:20px center;
	}
	#hint span{
		margin-left:60px;
		color:#3B9461;
		font-size:16px;
	}
	.star{
		color:red;
		margin-left:3px;
	}
	.err-msg{
		color:#A9A9A9;
		font-size:14px;
		background:url(${confs["content.url"]}/img/err.png) no-repeat;
		background-position:left center;
		padding-left:25px;
		margin-left:5px;
	}
	.land-body-div{
		text-align: center;
		background-color: #f0f0f0;
		padding-top: 50px;
		padding-bottom: 80px;
		font-size: 12px;
		height:1880px;
	}
	.clear-float{
   		clear: both;
    	display: block;
    	height: 0px;
	}
	.li-uploaded{
		float:left;
		width:180px;
		height:120px;
		background:#F6F6F6;
		text-align:center;
		margin-top:10px;
		margin-left:10px;
	}
	.li-uploaded{
		float:left;
		width:180px;
		height:120px;
		background:#F6F6F6;
		text-align:center;
		margin-top:10px;
		margin-left:10px;
	}
	.img-uploaded{
		width:160px;
		height:100px;
		top:10px;
		position:relative;
	}
	.span-remove{
		float:right;
		position:relative;
		top:-100px;
	}
	.span-remove:hover{
		cursor:pointer;
	}
	.land-mdfy-button{
		background-color: #46BF6F;
   	 	border: solid 1px #46bf6f;
    	color: #fff;
    	height: 19px;
    	width: 50px;
        cursor: pointer;
	}
	.land-mdfy-button:hover{
		color:#eee;
	}
</style>
</head>
<body>
	<#include "header1.ftl">
<div class="land-body-div">
  <form action="../land/add" method="post" onsubmit="onsmt();">
  <div class="container" style="height:60px;">
  	<ul class="tab"><li>土地发布信息</li></ul>
  </div>
  <div id="hint" class="container" >
  	<span>温馨提示：填写的土地信息越详尽精准，土地信息排名越靠前，推广效果越佳，找到的人也会越多</span>
  </div>
  <div class="container">
  	<div class="section">
  		<div>
  			<span class="titleVertical">|</span><span class="title">土地信息</span>
			<@spring.formInput path="landMdl.name" attributes="readonly='readonly' style='border:none;width:500px;color:#9A9A9A;margin-left:20px;'"/>
		</div>
  		<table class="content">
    		<col width="70px" />
			<col width="320px" />
			<col width="500px" />
			<col width="70px" />
    		<tr>
    			<td class="field">土地类型<span class="star">*</span></td>
		    	<td>
		    		<@atag.formSingleSelect path="landMdl.type" options=fetrs["LT"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
		    	</td>
		    	<td rowspan="5" colspan="3"><div id="map" style="width:99%;height:300px;"></div></td>
		    </tr>
		    <tr>
		    	<td class="field">土地面积<span class="star">*</span></td>
		    	<td><@spring.formInput path="landMdl.acre"/><@spring.showErrors classOrStyle="err-msg"/>
					<@atag.formSingleSelect path="landMdl.au" options=opts["AU"].children?values header=false attributes="disabled='disabled'"/>
				</td>
			</tr>
		    <tr>
		    	<td class="field">流转年限<span class="star">*</span></td>
		    	<td><@spring.formInput path="landMdl.years"/>年<@spring.showErrors classOrStyle="err-msg"/></td>
		    </tr>
		    <tr>
		    	<td class="field">流转单价</td>
		    	<td><@spring.formInput path="landMdl.up" attributes="placeholder='面议'"/><@spring.showErrors classOrStyle="err-msg"/>
					<@atag.formSingleSelect path="landMdl.upu" options=opts["UU"].children?values header=false attributes="disabled='disabled'"/>
				</td>
			</tr>
		    <tr>
		    	<td class="field">流转总价</td>
		    	<td>
					<@spring.formInput path="landMdl.sp" attributes="placeholder='面议' readonly='readonly' style='background:#F6F6F6;'"/><@spring.showErrors classOrStyle="err-msg"/>
					<@atag.formSingleSelect path="landMdl.spu" options=opts["SU"].children?values header=false attributes="disabled='disabled'"/>
				</td>
		    </tr>
		    <tr>
		    	<td class="field">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址 <span class="star">*</span></td>
		    	<td colspan="2">
		    		<#assign path=''/>
		    		<#if (landMdl.area)?length gt 1>
		    			<#assign path=landMdl.area[0..1]/>
		    			<#if (landMdl.area)?length gt 3>
			    			<#assign path=path+','+landMdl.area[0..3]/>
			    			<#if (landMdl.area)?length gt 5>
				    			<#assign path=path+','+landMdl.area[0..5]/>
				    			<#if (landMdl.area)?length gt 7>
					    			<#assign path=path+','+landMdl.area[0..7]/>
					    		</#if>
				    		</#if>
			    		</#if>
		    		</#if>
		    		<@spring.formInput path="landMdl.area" attributes="defaultSelectedPath='${path}'"/>
		    		<@spring.showErrors classOrStyle="err-msg"/>
		    		<@spring.formInput path="landMdl.addr" attributes="style='width:300px;'"/>
		    		<@spring.showErrors classOrStyle="err-msg"/>
					<input type="button" onclick="getPositon()" value="定位" class="land-mdfy-button">
		    	</td>
		    	<td class="field">经&nbsp;&nbsp;纬&nbsp;&nbsp;度</td>
		    	<td><@spring.formInput path="landMdl.coor" attributes="readonly='readonly' style='width:160px;background:#F6F6F6;'"/></td>
		    </tr>
    	</table>
  	</div>
  	<div class="section">
  		<div>
  			<span class="titleVertical">|</span><span class="title">图片展示</span><span class="star">*</span>
  			<@spring.formHiddenInput path="landMdl.img"/>
  			<@spring.showErrors classOrStyle="err-msg"/>
  		</div>
  		<div class="content" style="width:100%;height:300px;margin-top:16px;">
		    <div id="div-uploader" style="width:520px;float:left;"></div>
		    <div id="div-uploaded" style="width:600px;height:300px;float:left;margin-left:20px;border:#DDDDDD 1px solid;">
		    	<div style="width:100%;height:50px;background:#F6F6F6;border-bottom:#C5C5C5 1px solid;">
		    		<span style="margin-left:20px;font-size:18px;line-height:40px;">已上传图片</span>
		    	</div>
		    	<ul id="ul-uploaded" style="width:100%;height:250px;overflow-y: auto;">
		    		
		    	</ul>
		    </div>
  		</div>
  	</div>
  	<div class="section">
  		<div><span class="titleVertical">|</span><span class="title">联系方式</span></div>
  		<table class="content">
    		<col width="60px" />
			<col width="360px" />
			<col width="60px" />
    		<tr>
		  		<td class="field">联系人<span class="star">*</span></td>
		    	<td><@spring.formInput path="landMdl.ownerName" attributes="maxlength='4'"/><@spring.showErrors classOrStyle="err-msg"/>
					&nbsp;&nbsp;
					<@atag.formSingleSelect path="landMdl.ownerSex" options=opts["SX"].children?values label="value" header=false/><@spring.showErrors classOrStyle="err-msg"/></td>
		    	<td class="field">联系电话<span class="star">*</span></td>
				<td><@spring.formInput path="landMdl.ownerTel" attributes="maxlength='11'"/><@spring.showErrors classOrStyle="err-msg"/></td>
		    </tr>
    	</table>
  	</div>
  	<div class="section">
  		<div><span class="titleVertical">|</span><span class="title">权证信息</span></div>
  		<table class="content">
    		<col width="70px" />
			<col width="300px" />
			<col width="90px" />
    		<tr>
		  		<td class="field">权证类型</td>
		    	<td>
		    		<@atag.formSingleSelect path="landMdl.certType" options=fetrs["CT"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
		    	</td>
		    	<td class="field">权证编号</td>
		    	<td><@spring.formInput path="landMdl.certSn"/><@spring.showErrors classOrStyle="err-msg"/></td>
		    </tr>
		    <tr>
		    	<td class="field">权证年限</td>
				<td><@spring.formInput path="landMdl.certYears"/>年<@spring.showErrors classOrStyle="err-msg"/></td>
				<td class="field">权证起始日期</td>
				<td><@spring.formInput path="landMdl.certSdate"/><@spring.showErrors classOrStyle="err-msg"/></td>
		    </tr>
    	</table>
  	</div>
  	<div class="section">
  		<div><span class="titleVertical">|</span><span class="title">其他信息</span></div>
  		<table class="content">
    		<col width="100px" />
    		<col width="280px" />
    		<col width="70px" />
		    <tr>
		    	<td class="field">${fetrs["TM"].name}<span class="star">*</span></td>
		    	<td colspan="3">
		    		<@atag.formCheckboxes path="landMdl.landFetrs[TM]" options=fetrs["TM"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
				</td>
		    </tr>
		    <tr>
		    	<td class="field">${fetrs["TS"].name}</td>
		    	<td colspan="3">
		    		<@atag.formCheckboxes path="landMdl.landFetrs[TS]" options=fetrs["TS"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
				</td>
		    </tr>
		    <tr>
		    	<td class="field">${fetrs["SU"].name}</td>
				<td colspan="3">
					<@atag.formCheckboxes path="landMdl.landFetrs[SU]" options=fetrs["SU"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
				</td>
			</tr>
		    <tr>
		    	<td class="field">${fetrs["SE"].name}</td>
		    	<td colspan="3">
		    		<@atag.formCheckboxes path="landMdl.landFetrs[SE]" options=fetrs["SE"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
				</td>
		    </tr>
		    <tr>
		    	<td class="field">${fetrs["GF"].name}</td>
		    	<td colspan="3">
		    		<@atag.formCheckboxes path="landMdl.landFetrs[GF]" options=fetrs["GF"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
				</td>
		    </tr>
		    <tr>
		    	<td class="field">${fetrs["EL"].name}</td>
		    	<td>
					<@atag.formSingleSelect path="landMdl.landFetrs[EL]" options=fetrs["EL"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
					&nbsp;&nbsp;
				</td>
				<td class="field">${fetrs["GA"].name}</td>
		    	<td>
					<@atag.formSingleSelect path="landMdl.landFetrs[GA]" options=fetrs["GA"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
					&nbsp;&nbsp;
				</td>
		    </tr>
		    <tr id="tr-ws" >
		    	<td class="field">${fetrs["WS"].name}</td>
		    	<td colspan="3">
					<@atag.formSingleSelect path="landMdl.landFetrs[WS]" options=fetrs["WS"].children?values/>
					<@spring.showErrors classOrStyle="err-msg"/>
					&nbsp;&nbsp;
				</td>
		    </tr>
		    <tr id="tr-wa">
		    	<td class="field">${fetrs["WA"].name}</td>
		    	<td colspan="3">
					<@atag.formCheckboxes path="landMdl.landFetrs[WA]" options=fetrs["WA"].children?values attributes="disabled='disabled'" />
					<@spring.showErrors classOrStyle="err-msg"/>
				</td>
		    </tr>
    	</table>
  	</div>
  	<div class="section">
  		<div>
  			<span class="titleVertical">|</span><span class="title">补充说明</span>
  			<span class="ps">请为您的土地添加详细描述</span>
  		</div>
		<div class="content" style="margin-top:16px;">
		  	<@spring.formTextarea path="landMdl.note" attributes='style="width:1115px;height:170px;"'/>
			<@spring.showErrors classOrStyle="err-msg"/>
		</div>
  	</div>
  	<div class="section" style="text-align:center;height:200px;">
    	<button type="submit" class="btn">立即发布</button>
    </div>
  </div>
 </form>
 </div>
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