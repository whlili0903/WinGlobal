<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/memb-menu.css"/>
	<link rel="stylesheet" href="${confs["content.url"]}/plugin/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="${confs["content.url"]}/plugin/plupload/jquery.ui.plupload/css/jquery.ui.plupload.css">
	<style>

     	.content .content-header {
            width:100%;
            height: 60px;
            background: #ffffff;
        }

        .content .content-header .title {
            width: 80px;
            margin-left: 34px;
            padding-top: 13px;
            display: inline-block;
            text-align: center;
            font-size: 14px;
        }

        .content .content-header .title img {
            width: 80px;
            margin-top: 7px;
        }
        
        .content-body{
        	background-color: white;
        	margin-top: -5px;
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
        
        .input-group > .label > span {
        	color : red;
        }

        .input-group > input.field {
            width: 216px;
            height: 35px;
            border: 1px solid #bfbfbf;
            padding: 0 10px;
            clear: left;
        }
        
        .input-group > input[type='checkbox'].field {
            width: 30px;
            height: 35px;
            border: 1px solid #bfbfbf;
            padding: 0 10px;
            clear: left;
        }
        
        .input-group > select.field {
            width: 238px;
            height: 35px;
            border: 1px solid #bfbfbf;
            padding: 0 10px;
            clear: left;
        }

        .input-group > textarea.field {
            width: 388px;
            height: 126px;
            border: 1px solid #bfbfbf;
            clear: left;
            padding: 10px;
        }

        .input-group > div.field {
            width: 520px;
            display: inline-block;
            clear: left;
            border: 1px solid #bfbfbf;
        }

        .input-group .btn{
            width: 120px;
            height: 45px;
            color: #fff;
            font-size: 20px;
            background-color: #0bb552;
        }

        .input-group .reset {
            margin-left: 178px;
        }
        
        .preview-box {
        	width:450px;
        	height:302px;
        	border:#DDDDDD 1px solid;
        	float: right;
        	margin-right: 50px;
        }
        
        .preview-box .title {
        	width:450px;
        	height:56px;
        	background:#f6f6f6;
        	border-bottom:#C5C5C5 1px solid;
        	font-size:18px;
        	line-height:56px;
        }

        /** jquery validation 错误信息样式 **/
        input.error { border: 1px solid red; }
        label.error {
            margin-left: 12px;
            /*background:url("img/unchecked.png") no-repeat 0px 0px;*/
            /*padding-left: 30px;*/
            padding-bottom: 2px;
            font-weight: bold;
            font-size: 14px;
            color: #9a9a9a;
        }
        #div-uploader {
        	width: 340px;
        	margin-left: 70px;
        }
		.plupload_wrapper {
			min-width: 340px;
		}
		.preview-box{
			width: 350px;
			margin-right: 110px;
		}
		.preview-box .title {
    		width: 350px;
    	}
    	.plupload_header_content {
		    height: 56px;
		    padding: 0 0px 0 20px;	
		}
		.li-uploaded{
		clear:none;
		float:left;
		width:145px;
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
	}
	.span-remove:hover{
		cursor:pointer;
	}
		
	</style>
</head>
<body>
<#include "header2.ftl">
<div class="body-div">
	<div class="header-div"></div>
	 	<div class="page-container">
	 		<#include "memb/memb-menu.ftl">
        	<div class="content">
        		<div class="content-header">
		            <div class="title">
		                编辑商品
		                <img src="${confs["content.url"]}/img/memb_tab.png">
		            </div>
		        </div>
		        <div  class="content-body" >
		        
		        	<form class="valid-form" id="valid-form" action="update" method="post">
		        		<input type="hidden" name="id" value="${(goods.id)!}" />
				        <div class="input-group" style="padding-top: 20px;">
				            <label class="label"><span>*</span>商品名称：</label>
				            <input class="field" name="name" type="text" value="${(goods.name)!}" maxlength="30" placeholder="请输入商品名称">
				        </div>
				        <div class="input-group">
				            <label class="label"><span>*</span>商品分类：</label>
				            <select class="field" name="category">
				            	<option value="">请选择商品分类</option>
				            	<#list opts['GC'].children?values as gc>
					            	<option value="${(gc.code)!}" <#if goods?? && goods.category == gc.code>selected</#if> >${(gc.name)!}</option>
				            	</#list>
				            </select>
				        </div>
				        <div class="input-group">
				            <label class="label">市场价格：</label>
				            <input class="field" name="marketPrice" type="text" value="${(goods.marketPrice)!}" maxlength="8" placeholder="请输入市场价格">
				        </div>
				        <div class="input-group">
				            <label class="label"><span>*</span>销售价格：</label>
				            <input class="field" name="price" type="text" value="${(goods.price)!}" maxlength="8" placeholder="请输入销售价格">
				        </div>
				        <div class="input-group">
				            <label class="label">规格：</label>
				            <input class="field" name="weight" type="text" value="${(goods.weight)!}" maxlength="8" placeholder="请输入商品规格">
				            <select class="field" name="weightUnit" style="width:70px;">
				            	<#list opts['GU'].children?values as gu>
					            	<option value="${(gu.name)!}" <#if goods?? && goods.weightUnit == gu.name>selected</#if> >${(gu.name)!}</option>
				            	</#list>
				            </select>
				        </div>
				        <div class="input-group">
				            <label class="label"><span>*</span>商品库存：</label>
				            <input class="field" name="store" type="text" value="${(goods.store)!}" maxlength="8" placeholder="请输入商品库存">
				        </div>
				        <div class="input-group">
				            <label class="label" style="width: 100%;text-align: left;margin-left: 70px;" >商品图片：</label>
				            <div class="field" id="div-uploader"></div>
				            <div id="div-uploaded" class="preview-box">
				                <div class="title">
				                	<span style="margin-left:20px;">已上传图片</span>
				                </div>
				                <ul id="ul-uploaded" style="width:100%;height:245px;overflow-y: auto;">
				
				                </ul>
				            </div>
				        </div>
				        <div class="input-group">
				            <label class="label" style="width: 100%;text-align: left;margin-left: 70px;" >商品详情：</label>
				            <label class="label" style="margin-left: 70px;width: 0px;" ></label>
				            <textarea class="field" name="desc" id="editor" style="height: 500px; width: 717px;" placeholder="请输入商品详情">${(goods.desc)!}</textarea>
				        </div>
				        <div class="input-group" style="padding-bottom: 20px;" >
				            <label class="label">&nbsp;</label>
				            <input class="btn" type="submit" value="提交">
				            <input class="btn reset" type="button" value="重置">
				        </div>
				    </form>
				    
		        </div>
    		</div>
    	</div>
    </div>
<div class="clear-float"></div>
</div>
<#include "footer.ftl">
</body>
<script type="text/javascript" src="${confs["content.url"]}/js/memb-menu.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/jquery.ui.plupload/jquery.ui.plupload.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/i18n/zh_CN.js"></script>
<script charset="utf-8" src="${confs["content.url"]}/plugin/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${confs["content.url"]}/plugin/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery-validation/jquery.validate.min.js"></script>
<script>
    $(function () {
    	
    	loadPic();
        // 图片上传初始化
        plupload.addI18n({"Select files": "选择文件<span style='font-size:12px'>(建议上传400*400的图片)</span>"});
        $("#div-uploader").plupload({
            url: "../../img-upload",
            file_data_name: "imgFile",
            multipart_params: {"folder": "goods"},
            max_file_size: '2mb',
            filters: [
                {title: "Image files", extensions: "jpg,gif,png"},
            ],
            rename: true,
            sortable: true,
            dragdrop: false,
            views: {
                list: false,
                thumbs: true,
                active: 'thumbs'
            },
            flash_swf_url: 'plugin/Moxie.swf',
            silverlight_xap_url: 'plugin/Moxie.xap',
            uploaded: function (uploader, file) {
                if (file.result.status == 200) {
                    var r = $.parseJSON(file.result.response);
                    if (r.result == "SUCCESS") {
                        showPic(r.path);
                    }
                }
            }
        });

        // 富文本编辑器初始化
        KindEditor.ready(function (K) {
            window.editor = K.create('#editor', {
                uploadJson: '../editor-img-upload',
                allowFileManager: true,
	            extraFileUploadParams : {
	               folder : "goods"
	            },
	            urlType:"${confs["content.njtx.url"]}/img/",
	            formatUploadUrl: false
            });
            
        });

        $("#valid-form").validate({
            rules: {
                name : {
                    required: true
                },
                category: "required",
                price : {
                	required: true,
                	number : true,
                	min:0
                },
                marketPrice :{
                	number : true,
                	min: 0
                },
                weight :{
                	digits : true
                },
                store : {
                	required : true, 
                	digits : true
                }
            },
            messages: {
                name :{
                    required: "请输入农产品名称"
                },
                category: "请选择商品分类",
                price : {
                	required: "请输入商品售价",
                	number : "商品售价只能为数字且不小于0",
                	min: "商品售价只能为数字且不小于0"
                },
                marketPrice :{
                	number : "商品市场价只能为数字且不小于0",
                	min: "商品市场价只能为数字且不小于0"
                },
                weight :{
                	digits : "商品重量只能为正整数"
                },
                store : {
                	required : "请输入商品库存", 
                	digits : "商品库存只能为正整数"
                }
            }
        });
        

    })
	function removePic(obj){
	  	$(obj).parent().remove();
	}
	
    function showPic(path,id){
	  	var domStr = '<li class="li-uploaded" style="clear:none;" >'+
	  					'<img class="img-uploaded" style="width:100px; height:100px;" src="${confs["content.njtx.url"]}/img/'+path+'"/>'+
	  					'<span class="span-remove" bind_id="'+id+'" onclick="removePic(this);">'+
	  						'<img style="width:30px;height:30px;margin-left: -45px;" src="${confs["content.url"]}/img/delete.png" alt="删除"/>'+
	  					'</span>'+
	  					'<input type="hidden" name="imgs" value="'+path+'"/>';
	  	$("#ul-uploaded").append(domStr);
  	}
  	
  	 function removePic(obj){
		  	$(obj).parent().remove();
		  	$("#ul-uploaded").after('<input type="hidden" name="ids" value="'+$(obj).attr("bind_id")+'" />');
		  }
  	
  	function loadPic(){
		    <#list goods.imgs as img >
		    	showPic("${img.url}","${img.id}");
			</#list>
		  }
  	
</script>
</html>