<style>
	.alert-right-menu{
		width: 82px;
    	height: 200px;
    	position: fixed;
   	 	z-index: 999;
    	right: 0px;
    	bottom: 100px;
    	opacity: 1;
    	color: #202020;
	}
	.alert-right-menu-line{
		background-color: #0AB552;
		margin-top:5px;
		cursor: pointer;
		height:35px;
		color:#fff;
		text-align:center;
		line-height:35px;
		width: 82px;
		float:left;
		z-index:60;
	}
	.alert-right-menu-line:hover{
		color:#222;
	}
	.alert-right-menu-line a{
		color:#fff;
	}
	.alert-right-menu-line a:hover{
		color:#222;
	}
	.alert-right-menu-tel{
		z-index: -1;
    	width: 150px;
    	margin-top: -35px;
    	position: relative;
    	background-color: #0AB552;
    	color: #fff;
    	height: 35px;
    	float: left;
    	line-height: 35px;
    	padding-left: 15px;
	}
</style>
<script>
	$(function(){
		$("#contactPt").mouseover(function(){
    		//$("#ptTel").show();
    		$("#ptTel").animate({left: '-125px'}, "slow");

    	});
    	$("#contactPt").mouseout(function(){
    	 	$("#ptTel").animate({left: '+125px'}, "slow");
    	});
	});
</script>
<div class="alert-right-menu" >
	<div class="alert-right-menu-line"><a href="../prep" target="_blank">我的收藏</a></div>
	<div class="alert-right-menu-line"><a href="../reserve/resv-land-buy?perParm=yyDiv,yyContent,noYyMenu" target="_blank">我的预约</a></div>
	<div id="contactPt"><div class="alert-right-menu-line">联系平台</div>
	<div class="alert-right-menu-tel" id="ptTel">${confs["cust.tel"]}</div></div>
	<div class="alert-right-menu-line"><a href="../prep"  target="_blank">我的愿望</a></div>
	<div class="alert-right-menu-line"><a href="#pageTop">返回顶部</a></div>
</div>