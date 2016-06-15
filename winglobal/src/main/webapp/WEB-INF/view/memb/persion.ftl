	<style>
	.left-center-div a{
		color:#fff;
	}
	.persion-meun-img{
		margin-top:7px;
	}
	
	.push-land {
		width:80px;
		display: inline-block;
		padding-left: 58px;
		background: url('${confs["content.url"]}/img/fj.png') no-repeat center left 15px;
	}
	
	.push-goods {
		width:78px;
		display: inline-block;
		padding-left: 58px;
		background: url('${confs["content.url"]}/img/push_goods.png') no-repeat center left 15px;
		border : 1px solid #fc984b;
		color : #fc984b;
		border-radius : 3px;
	}
	
	</style>
	<script>
		function chengContent(contentId ){
            $(".right-div").hide();
            $("#"+contentId).show();
        }

        function changMenu( id, contentId,elementId, url){
            if(url != null){
            	window.location.href=url+"?perParm="+id+","+contentId+","+elementId;
            }else{
            	$(".select-menu").hide();
	            $(".list-menu-div").show();
	            if(elementId != null && id != null){
            		 $("#"+id).show();
            		 $("#"+elementId).hide();
            	}
            	chengContent(contentId);
            }
        }
        
        function info(){
        	window.location.href="../memb/memb-resv";
        }
        
        function initPage(){
        	var perParm = $("#perParm").val();
        	if(perParm != ""){
        		var divIds = perParm.split(","); 
        		if(divIds.length == 3){
        			changMenu(divIds[0],divIds[1],divIds[2],null);
        			return false;
        		}
        	}
        	changMenu(null,'persion',null,null);
        }
         $(document).ready(function(){
        	initPage();
         	$("#membHead").mouseover(function(){
    	 		$("#membInfo").show();
    	 	});
    	 	$("#membHead").mouseout(function(){
    	 		$("#membInfo").hide();
    	 	});
    	 });
	</script>
	<input type="hidden" id="perParm" value="${perParm}" />
        <div class="left-div">
            <div class="left-top-div">
            	<div id="membHead" style="float:left"  onclick="info()">
               	<div class="head-img-div"  >
               		<img src="${confs["content.njtx.url"]}/img/${memb.head}" onerror="this.src='${confs["content.url"]}/${confs["content.memb.head"]}'" />
               	</div>
               	<div class="head-img-up" id="membInfo" >资料</div>
               	</div>
                <div class="nice-div" onclick="info()" style="margin-top:10px;"><#if memb.name ==null >${memb.phone}<#else>${memb.name}</#if></div>
                <div class="nice-div" onclick="info()"><img src='${confs["content.url"]}/img/${memb.type}.png' style="margin-right:7px;    vertical-align: middle;margin-top: -2px;" />${opts['MT'].children[memb.type].name}</div>
                <!-- <div class="base-info-div" onclick="changMenu(null,'persion',null,null)">基本信息</div> -->
            </div>
            <#if memb??&&memb.type=='MT02'>
	            <div class="left-center-div" style="background-color: #eee;">
	            	<div style="background-color: #fc984b; display: inline-block;border-radius : 3px;">
		              	<a class="push-land" href="../land/add-init" target="_blank">发布土地</a>
	            	</div>
	            	<div style="background-color: #eee; display: inline-block;">
				      	<a class="push-goods" href="../goods/add" style="color: #fc984b;">发布商品</a>        	
	            	</div>
	            </div>
            </#if>
            <div class="left-bottom-div" style="height:252px">
            	<div style="height:12px;float:left;width:100%"></div>
                <div class="list-menu-div" id="noRepwdMenu" onclick="changMenu('repwdDiv','repwd','noRepwdMenu','../memb/memb-pwd')" ><div class="menu-img-div"><img class="persion-meun-img" src="${confs["content.url"]}/img/land.png" /></div>修改密码</div>
                <div class="select-menu" id="repwdDiv"><div class="left-img-div"><img src="${confs["content.url"]}/img/left.png" /></div>
                    <div class="select-img-div"><img class="persion-meun-img" src="${confs["content.url"]}/img/newland.png" /></div>修改密码</div>
                <a href="../prep" target="_blank"><div  class="list-menu-div" ><div class="menu-img-div"><img  class="persion-meun-img" src="${confs["content.url"]}/img/sc.png" /></div>我收藏的土地</div></a>
                <div class="select-menu" id="scDiv" ><div class="left-img-div"><img src="${confs["content.url"]}/img/left.png" /></div>
                    <div class="select-img-div"><img src="${confs["content.url"]}/img/newsc.png"  class="persion-meun-img" /></div>我收藏的土地</div>
                <div  class="list-menu-div" id="noYyMenu" onclick="changMenu('yyDiv','yyContent','noYyMenu','../reserve/resv-land-buy')" ><div class="menu-img-div"><img src="${confs["content.url"]}/img/yy.png"  class="persion-meun-img" /></div>我的预约</div>
                <div class="select-menu" id="yyDiv" onclick="changMenu('yyDiv','yyContent','noYyMenu','../reserve/resv-land-buy')" ><div class="left-img-div"><img src="${confs["content.url"]}/img/left.png" /></div>
                    <div class="select-img-div"><img src="${confs["content.url"]}/img/newyy.png"  class="persion-meun-img" /></div>我的预约</div>
                    <div  class="list-menu-div" id="noOlMenu" onclick="changMenu('olDiv','olContent','noOlMenu','../land/memb-land')" ><div class="menu-img-div"><img src="${confs["content.url"]}/img/ol.png"  class="persion-meun-img" /></div>我的土地</div>
                <div class="select-menu" id="olDiv" onclick="changMenu('olDiv','olContent','noOlMenu','../land/memb-land')" ><div class="left-img-div"><img src="${confs["content.url"]}/img/left.png" /></div>
                    <div class="select-img-div"><img src="${confs["content.url"]}/img/newol.png"  class="persion-meun-img" /></div>我的土地</div>
                    <div  class="list-menu-div" id="noDdMenu" onclick="changMenu('ddDiv','ddContent','noDdMenu','../memb/orders-buyer')" ><div class="menu-img-div"><img src="${confs["content.url"]}/img/ol.png"  class="persion-meun-img" /></div>我的订单</div>
                <div class="select-menu" id="ddDiv" onclick="changMenu('ddDiv','ddContent','noDdMenu','../memb/orders-buyer')" ><div class="left-img-div"><img src="${confs["content.url"]}/img/left.png" /></div>
                    <div class="select-img-div"><img src="${confs["content.url"]}/img/newol.png"  class="persion-meun-img" /></div>我的订单</div>
                <#if memb??&&memb.type=='MT02'>
                    <div  class="list-menu-div" id="noFxMenu" onclick="changMenu('fxDiv','fxContent','noFxMenu','../memb/memb-sharecode')" ><div class="menu-img-div"><img src="${confs["content.url"]}/img/ol.png"  class="persion-meun-img" /></div>分享二维码</div>
                <div class="select-menu" id="fxDiv" onclick="changMenu('fxDiv','fxContent','noFxMenu','../memb/memb-sharecode')" ><div class="left-img-div"><img src="${confs["content.url"]}/img/left.png" /></div>
                    <div class="select-img-div"><img src="${confs["content.url"]}/img/newol.png"  class="persion-meun-img" /></div>分享二维码</div> 
                </#if>    
            </div>
        </div>
