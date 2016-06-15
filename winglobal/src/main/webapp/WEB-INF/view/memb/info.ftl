<#assign parm=4>
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
	
	.line-oper-div {
		display: none;
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
	.btn-link {
	    border: 1px solid #0ab552;
	    border-radius: 3px;
	    background-color: #ffffff;
	    height: 40px;
	    line-height: 10px;
	    cursor: pointer;
	    padding-left: 3px;
	    padding-right: 3px;
	    width: 130px;
	    color: #0ab552;
	}
	
	.right-body-div-update{
		margin-top: 15px;
	    margin-top: 0;
	    margin-bottom: 15px;
	    width: 100%;
	    float: left;
	    background-color: #fff;
	    font-size: 12px;
	}
	
		.input-group {
            width: 100%;
            margin-top: 20px;
        }

        .input-group > .label {
            width: 150px;
            height: 35px;
            line-height: 35px;
            color: #222222;
            font-size: 16px;
            float: left;
            text-align: right;
        }
		.input-group > input.field {
            width: 216px;
            height: 35px;
            border: 1px solid #bfbfbf;
            padding: 0 10px;
            clear: left;
        }
        .radio-div{
    	    display: inline;
		    position: relative;
		    top: 10px;
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
		.lSelect{
		    margin-top: 8px;
		}
	</style>
</head>
<body>
	<#include "header2.ftl">
<div class="body-div" style="height:auto;">
	<div class="header-div"></div>
	 <div class="center-div">
	 	<#include "memb/memb-menu.ftl">
        <div class="right-div" id="persion"  >
            <div class="right-head-div" style=" position: relative;">
            	<div class="head-text-div" style="cursor: pointer;" onclick="javascript:window.location.href='../memb/memb-resv?menuIndex=4'">基本信息</div>
            	<div class="head-text-div" style="cursor: pointer;"  onclick="javascript:window.location.href='../memb/memb-pwd?menuIndex=4'">修改密码</div>
                <div class="clear-float"></div>
                <div class="img-div" ><img src="${confs["content.url"]}/img/bottom.png"/></div>
            </div>
            <div class="right-body-div" style="margin-top:15px">
                <div class="right-line-div">
                    <div class="line-name-div">姓名</div>
                    <div class="line-info-div">${(membInfoMdl.name)!}</div>
                    <div class="line-oper-div" >编辑</div>
                </div>
                <div class="right-line-div">	
                    <div class="line-name-div">手机号</div>
                    <div class="line-info-div">${membInfoMdl.phone}</div>
                    <div class="line-oper-div">编辑</div>
                </div>
                <#if memb.type=="MT02" >
                <div class="right-line-div">
                    <div class="line-name-div">性别</div>
                    <div class="line-info-div">${opts["SX"].children[membInfoMdl.sex].name}</div>
                    <div class="line-oper-div">编辑</div>
                </div>
                <div class="right-line-div">
                    <div class="line-name-div">地址</div>
                    <div class="line-info-div"><#if membInfoMdl.area??><#if membInfoMdl.area?length gt 1>${addrs[membInfoMdl.area[0..1]].name}</#if><#if membInfoMdl.area?length gt 3>${addrs[membInfoMdl.area[0..1]].children[membInfoMdl.area[0..3]].name}</#if><#if membInfoMdl.area?length gt 5>${addrs[membInfoMdl.area[0..1]].children[membInfoMdl.area[0..3]].children[membInfoMdl.area[0..5]].name}</#if></#if>${membInfoMdl.addr}</div>
                    <div class="line-oper-div">编辑</div>
                </div>
                <div class="right-line-div" style="margin-left:100px;" >
                   	<input type="button" class="btn-link" id="btn-edit" value="编辑" />
                </div>
                </#if>
                <div class="right-bottom-div" ></div>
            </div>
            <form action="memb-update" method="post" id="myform">
            <input type="hidden" name="coor" id="coor" value="${(membInfoMdl.coor)!}" />
            <input type="hidden" name="id" value="${(memb.id)!}" />
            <div class="right-body-div-update" style="margin-top:15px;display:none;">
				<div class="input-group">
		            <label class="label">姓名：</label>
		            <input class="field" name="name" type="text" value="${(membInfoMdl.name)!}" maxlength="8" placeholder="请输入姓名">
		        </div>
				<div class="input-group">
		            <label class="label">手机号：</label>
		            <input class="field" type="text" value="${(membInfoMdl.phone)!}" readonly >
		        </div>
		        
		        <#if memb.type=="MT02" >
			        <div class="input-group">
			            <label class="label">性别：</label>
			            <div class="radio-div" >
			            <input name="sex" type="radio" value="SX01" <#if membInfoMdl??&&membInfoMdl.sex??&&membInfoMdl.sex == 'SX01'>checked</#if> >男&nbsp;&nbsp;&nbsp;
	            		<input name="sex" type="radio" value="SX02" <#if membInfoMdl??&&membInfoMdl.sex??&&membInfoMdl.sex == 'SX02'>checked</#if> >女
	            		</div>
			        </div>
	            	
	            	<div class="input-group">
	            		<label class="label">地区：</label>
		            	<#assign path=''/>
			    		<#if (membInfoMdl.area)?length gt 1>
			    			<#assign path=membInfoMdl.area[0..1]/>
			    			<#if (membInfoMdl.area)?length gt 3>
				    			<#assign path=path+','+membInfoMdl.area[0..3]/>
				    			<#if (membInfoMdl.area)?length gt 5>
					    			<#assign path=path+','+membInfoMdl.area[0..5]/>
					    			<#if (membInfoMdl.area)?length gt 7>
						    			<#assign path=path+','+membInfoMdl.area[0..7]/>
						    		</#if>
					    		</#if>
				    		</#if>
			    		</#if>
						<@spring.formInput path="membInfoMdl.area" attributes="defaultSelectedPath='${path}'"/>
	            	</div>
	            	
	            	<div class="input-group">
	            		<label class="label" >详细地址：</label>
			            <input type="text" class="field" name="addr" placeholder="请输入详细地址" value="${(membInfoMdl.addr)!}" >
			            <input type="button" onclick="getPositon()" value="定位" class="land-mdfy-button">
	            	</div>
	            	
	            	<div class="input-group">
	            		<label class="label" >地图：</label>
	            		<div id="map" style="width:700px;height:400px;"></div>
	            	</div>
            	</#if>
                <div class="right-line-div" style="margin-left:145px;" >
                	<label class="label" >&nbsp;</label>
                   	<input type="submit" class="btn-link" id="btn-update" value="保存" />&nbsp;&nbsp;&nbsp;
                   	<input type="button" class="btn-link" id="btn-back" value="返回" />
                </div>
                <div class="right-bottom-div" ></div>
            </div>
            </form>
            <div class="clear-float"></div>
        </div>
    </div>
</div>
<div class="clear-float"></div>
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
<#if memb.type=="MT02" >
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery.lSelect.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DoHxZdERGnB2yCGyCfp7H5Qh"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery-validation/jquery.validate.min.js"></script>
</#if>
<#include "footer.ftl">
<script type="text/javascript">
	$(function(){
		$("#btn-edit").click(function(){
			$(".right-body-div-update").css("display","block");
			$(".right-body-div").css("display","none");
		});
		
		$("#btn-back").click(function(){
			$(".right-body-div-update").css("display","none");
			$(".right-body-div").css("display","block");
		});
		
		
		$("#area").lSelect({
			url: "../addr-sel"// AJAX数据获取url
		});
		
	})
	<#if memb.type=="MT02" >
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
	
	
	$("#myform").validate({
            rules: {
                name : {
                    required: true
                },
                sex : {
                	required: true
                },
                coor : {
                	required: true
                },
                addr:{
                	required: true
                },
                area:{
                	required: true
                }
            },
            messages: {
                name :{
                    required: "<lable style='margin-left:10px;color:red;'>请输入姓名</lable>"
                },
                sex : {
                	required: "<lable style='margin-left:10px;color:red;'>请选择性别</lable>"
                },
                coor:{
                	required: "<lable style='margin-left:10px;color:red;'>请定位地址</lable>"
                },
                addr:{
                	required: "<lable style='margin-left:10px;color:red;'>请输入详情地址</lable>"
                },
                area:{
                	required: "<lable style='margin-left:10px;color:red;'>请选择地区</lable>"
                }
            },
             submitHandler:function(form) { 
             	var addrSel = $(".lSelect option:selected").text().replace("请选择","");
	             if(addrSel!=''){
	             	form.submit();
	             }else{
	             	$(".lSelect").after("<lable style='margin-left:10px;color:red;'>请选择完整的地区</lable>");
	             	return;
	             }
             }
        });
	
	</#if>
</script>
</body>
</html>