<!DOCTYPE>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
   	<link rel="icon" href="${confs["content.url"]}/img/logo.png" type="image/x-icon">
    <title>邀经纪人,赢多重返利</title>
    <style>
    
    	*{
    		margin:0px;
    	}
    
        .register-container {
        	height: 100%;
        	width:100%;
            margin: 0 auto;
            text-align:center;
            vertical-align:middle;
        }
        #img_url{
        	position: absolute;
        }
        
        
        
    </style>

</head>
<body>
<div class="register-container">
	<input type="hidden" id="url" value="/memb/add-broker?invCode=${(invCode)!}" />
	<img style="-webkit-user-select: none ;" id="img_url">
	<img src="${confs["content.url"]}/img/code-bg.png" style="width:100%;" id="img_bj" />
<#--
	<div style="margin-top:20px;">
		<img src="${confs["content.url"]}/img/code-logo.png" style="height:100px;width:100px; margin-top:10px;" />
	</div>
	<div style="margin-top:10px;">
		<input type="hidden" id="url" value="/memb/add-broker?parentId=${(parentId)!}" />
	    <img style="-webkit-user-select: none ; width:300px;" id="img_url">
	</div>
    <div>
    	<span style="border-bottom: 1px solid red;padding-bottom:10px;">请扫描或长按屏幕识别二维码</span>
    </div>
    -->
</div>
</body>
<script type="text/javascript" src="${confs["content.url"]}/js/jquery-1.10.2.min.js"></script>
<script>
    $().ready(function () {
		 // 首先计算 二维码的宽高

	    var screenWidth = $(window).width(); // 屏幕宽度
	    var bl = 324/1080; // 缩放比例
	    var marginLeft = screenWidth * bl; // 二维码距离左边距离
	    var marginTop = 894*screenWidth / 1080; // 二维码距离顶部宽度
	    var codeWidth = screenWidth * 427/1080; // 二维码的宽高
	    var codeHieght = codeWidth;
	
	
	    console.log(codeWidth)
	    $("#img_url").attr("width" ,codeWidth);
	    $("#img_url").attr("height", codeHieght);
	
	    $("#img_url").css("left", marginLeft);
	    $("#img_url").css("top", marginTop);
	
	
	    $("#img_url").attr("src", "http://pan.baidu.com/share/qrcode?w=427&h=427&url=" + "${basePaths}" + $("#url").val());
		
    })
    
    
</script>
</html>