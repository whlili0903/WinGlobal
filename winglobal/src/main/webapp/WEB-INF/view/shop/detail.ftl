<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include "head.ftl">
	<link rel="stylesheet" href="${confs["content.url"]}/css/detail.css"/>
	<script type="text/javascript" src="${confs["content.url"]}/js/detail.js"></script>
	
	<script type="text/javascript">
		$(function(){
			// 百度地图API功能
			var map = new BMap.Map("det-map",{mapType:BMAP_HYBRID_MAP});    // 创建Map实例
			map.addControl(new BMap.NavigationControl());
			map.addControl(new BMap.MapTypeControl());
			var coor = "${land.landAddl.coor}";
			var point = null;
			if(coor.length>2){
				var coorAry = coor.split("#");
				point = new BMap.Point(coorAry[0], coorAry[1]);
			}
			if(point == null){
				map.centerAndZoom("<#if land.area??><#if land.area?length gt 1>${addrs[land.area[0..1]].name}</#if><#if land.area?length gt 3>${addrs[land.area[0..1]].children[land.area[0..3]].name}</#if><#if land.area?length gt 5>${addrs[land.area[0..1]].children[land.area[0..3]].children[land.area[0..5]].name}</#if></#if>${land.addr}",12);
				
				var local = new BMap.LocalSearch(map, {
					renderOptions:{map: map,selectFirstResult:true}
				});
				local.search("<#if land.area??><#if land.area?length gt 1>${addrs[land.area[0..1]].name}</#if><#if land.area?length gt 3>${addrs[land.area[0..1]].children[land.area[0..3]].name}</#if><#if land.area?length gt 5>${addrs[land.area[0..1]].children[land.area[0..3]].children[land.area[0..5]].name}</#if></#if>${land.addr}");
			}else{
				map.centerAndZoom(point,12);
				var marker = new BMap.Marker(point);
				map.addOverlay(marker);
			}
		});
		var isLogin = false;
		<#if memb != null >
			isLogin = true;
		</#if>
		function reserve(id , isResvPlfm){
			var url ;
			if(isResvPlfm){
				url = "../reserve/look-land-admin";
			}else{
				url = "../reserve/look-land-seller";
			}
			$.post(url, { "landId": id},
  			 function(data){
    			if(data.succ){
    				var msg ;
    				if(isResvPlfm){
    					/*msg = "<span style='font-size: 20px;display: block;line-height: 25px;'>"+
    					"电话：${confs["cust.tel"]}<br/>QQ：${confs["cust.qq"]}"+
    						"</span>";
    						*/
    					$("#MEIQIA-BTN-TEXT").click();
    					window.location.reload();
    				}else{
    					msg = "<span style='font-size: 20px;display: block;line-height: 25px;'>"+
    						data.msg+"<br/>${land.landAddl.ownerName}${opts['SX'].children[land.landAddl.ownerSex].value}${land.landAddl.ownerTel}</span>";
    					msgPrompt(msg,"succ", function(data){
    						window.location.reload();
    					},data,true);
    				}
    				
    			}else{
    				msgPrompt(data.msg, "warn", function(data){
    					if(!data.login){
    						window.location.href="../memb/memb-login?url="+window.location.href;
    					}else if(!isLogin){	
    						window.location.reload();
    					}
    				},data,true);
    			}
 			}, "json");
		}
	</script>
	<style>
    .tel-div  a:hover{
		color:#F15B09;
	}
	.land-tag{
		width:183px;
		position: absolute;
    	z-index: 222;
		margin-left: 76px;
    	margin-top: -21px;
	}
	</style>
</head>
<body>
	<#include "header2.ftl">
<div class="mid">
    <div class="det_mid_grary">
    <div id="vertical" class="bigImg">
        <img src="${confs["content.njtx.url"]}/img/${land.img}" width="770" height="435" alt="" id="midimg" onerror="this.src='${confs["content.url"]}/${confs["content.big.img"]}'" />
        <div style="display:none;" id="winSelector"></div>
        <div class="smallImg">
        <div class="scrollbutton smallImgUp disabled"></div>
        <div id="imageMenu">
            <ul>
            	<#list land.landFetrs as landFetr>
            		<#if landFetr.code == "IM">
		                <li><img src="${confs["content.njtx.url"]}/img/${landFetr.value}" width="770" height="435" alt="土地" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'"/></li>
                	</#if>
                </#list>
            </ul>
        </div>
        <div class="scrollbutton smallImgDown"></div>
    </div><!--smallImg end-->
    </div><!--bigImg end-->
    
    <div  class="det_main">
        <div class="det_title">
          <#if land.name?length gte 30 >${(land.name)?substring(0,30)+"..."}<#else>${land.name}</#if>
        </div>
        <#-- <div>
            <p class="det_benifit">
                <span>性价比高</span>
                <span>面积集中</span>
                <span>水源便利</span>
            </p>
        </div> -->
        <div class="det_infos">
            <span class="det_in1">地块编号：${land.sn}</span>
            <div style="float:right"><img src="${confs["content.url"]}/img/wj.png" style="width:20px;height:23px;margin-right: 20px;"/></div>
        </div>
        <div class="det_infos">
            <span class="det_in1">更新时间：${(land.mdfyTime!land.crtTime)?datetime?string('yyyy-MM-dd')}</span>
        </div>
       	<#if land.stat=="AS02"> <img src="${confs["content.url"]}/img/yc.png" class="land-tag" /></#if>
        <div class="det_money" >
        <ul class="det_money_ul">
       		<li class="det_money_li">
       			<#if land.up != null &&  land.sp != null && land.sp !=0 &&land.up != 0 >
	   			 <div class="det_money_p">
                    <p><span class="det_money_in">单价：</span>${land.up?string("#.##")}</span>${opts["UU"].children[land.upu].name}</p>
                    <p><span class="det_money_in">总价：</span>${land.sp?string("#.##")}</span>${opts["SU"].children[land.spu].name}</p>
                 </div>
            	<#else>
            	<#if land.up != null && land.up != 0>
            	<div class="det_money_prent">
            		<p><span class="det_money_in">单价：</span>${land.up?string("#.##")}</span>${opts["UU"].children[land.upu].name}</p>
            	</div>
            	<#else>
                    	<#if land.sp == null || land.sp == 0>
                    	<div class="det_money_prent">
            				<p><span class="det_money_in">价格：</span>面议</span></p>
            			</div>
                    	</#if>
            	</#if>
            	<#if  land.sp != null && land.sp != 0 >
            		<div class="det_money_prent">
            			<p><span class="det_money_in">总价：</span>${land.sp?string("#.##")}</span>${opts["SU"].children[land.spu].name}</p>
            		</div>
            	</#if>
            	</#if>
 			   
            </li>
            <li>
            <span class="det_money_in2">${land.acre?string("#.##")}<span class="det_money_in">${opts["AU"].children[land.au].name}</span></span>
           	</li>
           	<li>
            <span class="det_money_in2" >${land.years}<span class="det_money_in">年</span></span>
            </li>
        </div>
        <div class="det_type_in">
            <span>土地类型：${fetrs['LT'].children[land.type].name}</span>
        </div>
        <div class="det_type_info">
            <span>流转方式：
            <#list land.landFetrs as landFetr>
            	<#if landFetr.code == 'TM'>
				${fetrs['TM'].children[landFetr.value].name}&nbsp;&nbsp;
				</#if>
			</#list>
			</span>
        </div>
        <div class="det_type_info">
            <span>区域位置：<#if land.area??><#if land.area?length gt 1>${addrs[land.area[0..1]].name}</#if><#if land.area?length gt 3>${addrs[land.area[0..1]].children[land.area[0..3]].name}</#if><#if land.area?length gt 5>${addrs[land.area[0..1]].children[land.area[0..3]].children[land.area[0..5]].name}</#if></#if>${land.addr}</span>
        </div>
        <div class="det_button">
       		 <#if memb ==null >
       		 	<#if land.stat=="AS02" || land.stat=="AS03">
       		 		<div class="det_but_but1" style="background-color: #ccc;"">
               			<a >已交易</a>
               		</div>
               		<div class="tel-div">
				  	<a href="../memb/memb-login?url=../land/detail?id=${land.id}" target="_blank">登录可查看卖家电话</a><br>
 						 客服：${confs["cust.tel"]}
  					</div>
       		 	<#else>
               		<div class="det_but_but1"  onclick="reserve('${land.id}',false)">
               			<a id="reserveA">预约看地</a>
               		</div>
               		<div class="tel-div">
				  <a href="../memb/memb-login?url=../land/detail?id=${land.id}" target="_blank">登录可查看卖家电话</a><br>
 						 客服：${confs["cust.tel"]}
  				</div>
               	</#if>
              <#else>
            <#if land.stat=="AS02" || land.stat=="AS03">
            		 <div class="det_but_but1"  style="background-color: #ccc;">
               			<a >已交易</a>
               		</div>
             		 <div class="tel-div" style="font-size: 14px;">
				 		 ${land.landAddl.ownerName}${opts['SX'].children[land.landAddl.ownerSex].value}：${land.landAddl.ownerTel}<br>
 							 客服：${confs["cust.tel"]}
  					</div>
              <#else>
              	 <#if isAdmin == true>
              	 	<div  class="det_but_but1" style="float:right;margin-right:28px;background-color: #ccc;" >
               			<a id="reserveA">已预约平台</a>
               		</div>
               	<#else>
				 	<div class="det_but_but1" style="float:right;margin-right:28px;" id="resvOk" onclick="reserve('${land.id}',true)">
               			<a id="reserveP">联系平台</a>
               		</div>
               	</#if>
             	 <#if isReserve == true>
       		 		 <div class="det_but_but1"  style="background-color: #ccc;">
               			<a id="reserveA">已预约地主</a>
               		</div>
               		<#else>
              		<div class="det_but_but1" id="resvOk" onclick="reserve('${land.id}',false)">
               			<a id="reserveA">预约地主</a>
               		</div>
               	</#if>
               	</#if>
               </#if>
        </div>
         <#if memb!=null>
         <#if land.stat!="AS02" && land.stat!="AS03">
     	<div style="    font-size: 12px;
    width: 342px;
    margin: auto;
    ">
   <div style="float:left">${land.landAddl.ownerName}${opts['SX'].children[land.landAddl.ownerSex].value}：${land.landAddl.ownerTel}</div>
    <div  style="float:right">平台电话：${confs["cust.tel"]}</div>
    </div>
    </#if>
    </#if>
    </div>
</div>
<div class="det_mid">
    <div class="det_category">
        <span class="det_land_info">土地信息</span>

    </div>
</div>
<div class="det_mid_info">
    <li class="det_land_type_info">
        <ul>
            <li>
                <div class="det_land_info_title">权证情况</div>
                <div class="det_land_info_title2"><span class="type_01">权属类型</span><span class="type_02">${fetrs['CT'].children[land.landAddl.certType].name}</span></div>
                <#if land.landAddl.certYears !=null>
                 <div class="det_land_info_title2"><span class="type_01">流转期限</span><span class="type_02">${land.landAddl.certYears}年</span></div>
                 <div class="det_land_info_title2">
                	<span class="type_01">权证期间</span>
                	<span class="type_02">
	                	<#if land.landAddl.certYears?? && land.landAddl.certSdate??>
						${land.landAddl.certSdate?string['yyyy']}年-${land.landAddl.certSdate?string['yyyy']?number + land.landAddl.certYears?number}
						</#if>年
					</span>
				</div>
				</#if>
            </li>
            <li>
                <div class="det_land_info_title">${strucFetrs['TS'].name}</div>
                <div class="det_land_info_title3">
                	<#list strucFetrs['TS'].children?values as ts>
                		<div class="land-fetr-div"><img src="${confs["content.url"]}/${confs["content.img"]}/<#if ts.checked>gou<#else>cha</#if>.png"/>${ts.name}</div>
                	</#list>
                </div>
            </li>
            <li>
                <div class="det_land_info_title" style="margin-bottom:13px;">水电气情况</div>
                <div class="det_land_info_title2"><span class="type_01">${strucFetrs['EL'].name}</span>
                	<span class="type_02">
                	<#list strucFetrs['EL'].children?values as el>
                		<#if el.checked>${el.name}</#if>
                	</#list>
                	</span>
                </div>
                <div class="det_land_info_title2"><span class="type_01">${strucFetrs['GA'].name}</span>
                	<span class="type_02">
                	<#list strucFetrs['GA'].children?values as ga>
                		<#if ga.checked>${ga.name}</#if>
                	</#list>
                	</span>
                </div>
                <div class="det_land_info_title2"><span class="type_01">${strucFetrs['WS'].name}</span>
                	<span class="type_02" style="width:250px;text-align: right;">
                	<#if land.type=="LT02" || land.type=="LT03" || land.type=="LT04" || land.type=="LT05">
	                	<#list strucFetrs['WA'].children?values as wa>
	                		<#if wa.checked>${wa.name}</#if>
	                	</#list>
                	<#else>
	                	<#list strucFetrs['WS'].children?values as ws>
	                		<#if ws.checked>${ws.name}</#if>
	                	</#list>
					</#if>
					</span>
                </div>
            </li>
            <li>
                <div class="det_land_info_title">${strucFetrs['SU'].name}</div>
                <div class="det_land_info_title3">
	                <#list strucFetrs['SU'].children?values as su>
	                	<div class="land-fetr-div"><img src="${confs["content.url"]}/${confs["content.img"]}/<#if su.checked>gou<#else>cha</#if>.png"/>${su.name}</div>
                	</#list>
               </div>
            </li>
            <li>
                <div class="det_land_info_title">${strucFetrs['SE'].name}</div>
                <div class="det_land_info_title3">
                	<#list strucFetrs['SE'].children?values as se>
                		<div class="land-fetr-div"><img src="${confs["content.url"]}/${confs["content.img"]}/<#if se.checked>gou<#else>cha</#if>.png"/>${se.name}</div>
					</#list>
                </div>
            </li>
            <li>
                <div class="det_land_info_title">${strucFetrs['GF'].name}</div>
                <div class="det_land_info_title3">
                	<#list strucFetrs['GF'].children?values as gf>
                		<div class="land-fetr-div"><img src="${confs["content.url"]}/${confs["content.img"]}/<#if gf.checked>gou<#else>cha</#if>.png"/>${gf.name}</div>
					</#list>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="det_mid">
    <div class="det_category">
        <span class="det_land_info">地理位置</span>
    </div>
    <div class="det_mid det_land_detail" id="det-map" style="width:1248px;height:500px;"></div>
</div>
<div class="det_mid">
    <div class="det_category">
        <span class="det_land_info">土地描述</span>
    </div>
     <div class="det_mid det_land_detail">
		<span >${land.landAddl.note}</span>
     </div>
</div>
<div class="mid">
    <div class="category">
        <p class="title">
            <span class="birder-line-m1">附近土地流转</span>
            <#-- <span class="birder-line-m2">土地动态全面掌握</span> -->
        </p>
        <div style="margin-bottom: 28px;border-bottom: 1px solid #ccc;"></div>
        	<ul>
	        	<#list slands as sland>
	            <li>
	                <a href="../land/detail?id=${sland.id}" target="_blank"><img src="${confs["content.njtx.url"]}/img/${sland.img}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'"/>
	                	<#if sland.stat=="AS02"> <img src="${confs["content.url"]}/img/jyz.png"
                style="width: 86px;height: 84px; border: none; position: absolute;margin-top: -222px;margin-left: 6px;" />  </#if>
	                <div class="introwrap">
	                    <p class="intro"><#if land.name?length gte 30 >${(land.name)?substring(0,30)+"..."}<#else>${land.name}</#if></p>
	                    <span class="red">
	                        <#if sland.sp != null && sland.sp != 0>
                     	<span style="font-size:20px;">${sland.sp?string("#.##")}</span>${opts["SU"].children[land.spu].name}&nbsp;&nbsp;&nbsp;
                  	  </#if>
                  	  <#if sland.up != null &&  sland.up == 0>
                    	<span style="<#if sland.sp == null ||  sland.sp == 0>font-size:20px;</#if>">${sland.up?string("#.##")}</span>${opts["UU"].children[land.upu].name}
                  	  <#else>
                    	<#if land.sp == null || land.sp == 0>
                    		<span style="font-size:20px;">面议</span>
                    	</#if>
                  	  </#if>
	                    </span>
	                 
	                    <!--<p class="benifit">
	                        <span>性价比高</span>
	                        <span>面积集中</span>
	                        <span>水源便利</span>
	                    </p>-->
	                </div>
	                </a>
	            </li>
	            </#list>
            </ul>
        </div>
    </div>
	<#include "footer.ftl">
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DoHxZdERGnB2yCGyCfp7H5Qh"></script>
</html>