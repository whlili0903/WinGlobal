	<style>
		.body-left-div{
			width:203px;
			float:left;
			background-color:#fff;
			text-align:center;
			padding-bottom:20px;
		}
		.help-div-h1{
			font-size:24px;
			color:#222;
			margin-top:18px;
			text-align:center;
			width:100%;
		}
		.help-div-img{
		 	margin-top: -9px;
		}
		.help-div-menu{
			width:165px;
			margin:auto;
			margin-top:26px;
			text-align:left;
		}
		.help-menu-line{
			height:44px;
			line-height:44px;
			margin-top:20px;
			float:left;
			font-size:16px;
			width: 150px;
   		 	padding-left: 15px;
   		 	color:#222;
   		 	cursor: pointer;
		}
		.help-menu-line2{
			height:44px;
			line-height:44px;
			margin-top:20px;
			float:left;
			font-size:16px;
			width: 150px;
   		 	padding-left: 15px;
   		 	background-color: #0AB552;
   		 	color:#fff;
   		 	cursor: pointer;
		}
		.help-menu-line img {
			vertical-align: middle;
			margin-right: 8px;
		}
		.help-menu-line2 img {
			vertical-align: middle;
			margin-right: 8px;
		}
		.help-menu-line-img{
			float:left;
			margin-top:7px;
		}
	</style>
	<script>
		$(function(){
			$(".help-div-menu div").each(function(index, node){
				if((index+1)==${parm}){
					$(node).attr("class","help-menu-line2");
					$(node).find("img").attr("src","${confs["content.url"]}/img/help-title0"+${parm}+".png")
				}
			});
			$(".help-div-menu div").click(function(){
				window.location.href = $(this).attr("url"); 
			});
		});
	</script>
		<div class="body-left-div"> 
			<div class="help-div-img"><img src="${confs["content.url"]}/img/helf-top.png"/></div>
			<div class="help-div-h1">帮助中心</div>
			<div class="help-div-menu">
				<div class="help-menu-line" url="../tp/helf-land">
					<img src="${confs["content.url"]}/img/help-title1.png">如何找土地
				</div>
				<div class="help-menu-line" url="../tp/helf-contact">
					<img src="${confs["content.url"]}/img/help-title2.png">如何联系卖家
				</div>
				<div class="help-menu-line" url="../tp/helf-release">
					<img src="${confs["content.url"]}/img/help-title3.png">如何发布土地
				</div>
			</div>
		</div>
