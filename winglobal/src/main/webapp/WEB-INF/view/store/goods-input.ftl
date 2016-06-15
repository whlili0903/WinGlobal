<!DOCTYPE html>
<html lang="en">
<head>
	<#include "head.ftl">
	<#assign  parm=5>
    <meta charset="UTF-8">
    <title>添加商品</title>
    <link rel="stylesheet" href="${confs["content.url"]}/plugin/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="${confs["content.url"]}/plugin/plupload/jquery.ui.plupload/css/jquery.ui.plupload.css">
    <style>

        body {
            width: 100%;
            margin: 0;
        }

        .container {
            width: 1200px;
            padding-top: 34px;
            padding-left: 86px;
            padding-bottom: 10px;
            background-color: #faf7f7;
            margin: 0 auto;
        }

        .container > .title {
            font-size: 18px;
            color: #222222;
            font-weight: bold;
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

    </style>
</head>
<body>
<#include "header1.ftl">
<div class="container">
    <div class="title">发布商品</div>
    <form class="valid-form" id="valid-form" action="save" method="post">
        <div class="input-group">
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
            <label class="label">商品图片：</label>
            <div class="field" id="div-uploader"></div>
            <div id="div-uploaded" class="preview-box">
                <div class="title">
                	<span style="margin-left:20px;">已上传图片</span>
                </div>
                <ul id="ul-uploaded" style="width:100%;height:250px;overflow-y: auto;">

                </ul>
            </div>
        </div>
        <div class="input-group">
            <label class="label">商品详情：</label>
            <textarea class="field" name="desc" id="editor" style="height: 600px; width: 800px;" placeholder="请输入商品详情">${(goods.des)!}</textarea>
        </div>
        <div class="input-group">
            <label class="label">&nbsp;</label>
            <input class="btn" type="submit" value="提交">
            <input class="btn reset" type="button" value="重置">
        </div>
    </form>
</div>
<#include "footer.ftl">
</body>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/jquery.ui.plupload/jquery.ui.plupload.min.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/plupload/i18n/zh_CN.js"></script>
<script charset="utf-8" src="${confs["content.url"]}/plugin/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${confs["content.url"]}/plugin/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="${confs["content.url"]}/plugin/jquery-validation/jquery.validate.min.js"></script>
<script>
    $(function () {

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
	
    function showPic(path){
	  	var domStr = '<li class="li-uploaded">'+
	  					'<img class="img-uploaded" style="width:100px; height:100px;" src="${confs["content.njtx.url"]}/img/'+path+'"/>'+
	  					'<span class="span-remove" onclick="removePic(this);">'+
	  						'<img style="width:30px;height:30px;" src="${confs["content.url"]}/img/delete.png" alt="删除"/>'+
	  					'</span>'+
	  					'<input type="hidden" name="imgs" value="'+path+'"/>';
	  	$("#ul-uploaded").append(domStr);
  	}
</script>
</html>