<#assign contextPath = request.contextPath/> 
<link rel="stylesheet" href="${confs["content.url"]}/css/header01.css" id="css_id1" />
<link rel="stylesheet" href="${confs["content.url"]}/css/header02.css" id="css_id2" />
<div id="header">
<div id="header1Div">
<div class="page-header">
    <div class="page-header-body">
       <div class="header-body-top">
           <div class="header-logo-div"><img src="${confs["content.url"]}/img/logo.png" style="height:50px;"/><img class="header-logo1" src="${confs["content.url"]}/img/logo1.png"/></div>
          <div class="header-ts"><img src="${confs["content.url"]}/img/tipc.png"/></div>
       </div>
       <div class="header-body-buttom">
           <div class="header-tag">
               <div class="header-tag-select" id="tpPage"><a href="../tp/load">首页</a></div>
               <div class="header-tag-uncheck" id="searchPage"><a href="../land/list">我要找地</a></div>
               <#if memb??&&memb.type=='MT02'>
	               <div class="header-tag-uncheck" id="addPage"><a href="../land/add-init">我要卖地</a></div>
               </#if>
               <#if !memb??||(memb??&&memb.type=='MT01')>
               		<div class="header-tag-uncheck" id="borkerOrStation"><a href="../memb/add-broker" target="_self" >注册经纪人</a></div>
               </#if>
               <div class="header-tag-uncheck" id="goods"><a href="../tp/store">农村好货</a></div>
           </div>
            <div class="header-search-div">
               <div class="header-user" style="float: left;margin-right: 10px;font-size: 18px;" >
                   <div style="<#if memb != null>display: none;</#if>margin-left:24px;">
                   		<a id="headerLoginA" href="../memb/memb-login" >登录</a>/<a id="headerRegisterA" href="../memb/memb-register" >注册</a>
                  		<#--<a id="headerRegisterA" href="../prep" target="_blank" style="margin-left:20px;" >心愿卡</a> -->
                   </div>
                   <div class="header-user-div" <#if memb == null>style="display: none" </#if>>
                       <div class="header-user-info"  id="membPhone" style="width: 110px;margin-right: 5px;"  >
                           <div class="header-user-icon"><img id="headIcon" src="${confs["content.url"]}/img/down.png" /></div>
                           <div class="header-user-phone"><#if memb !=null>${memb.phone?substring(0,7)+"..."}</#if></div>
                           <div class="clear-float"></div>
                           <div class="header-persion">
                               <div><a href="../memb/index" >用户中心</a></div>
                               <div><a href="../prep"  target="_blank" >心愿卡</a></div>
                               <div><a href="../memb/login-out" >退出</a></div>
                           </div>
                       </div>
                       <div class="header-user-head" >
                       		<#if (memb.head)??>
								<#if memb.head?index_of("http://")!=-1>
									 <img src="${memb.head}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'" />
								<#else>	 
									 <img src="${confs['content.url']}/${memb.head}" onerror="this.src='${confs["content.url"]}/${confs["content.small.img"]}'" />
								</#if>
							<#else>
								<img src="${confs["content.url"]}/${confs["content.small.img"]}"/>
							</#if>
                       </div>
                   </div>
               </div>
               <div class="header-searder-button"><img src="${confs["content.url"]}/img/search.png"></div>
               <div class="header-search-text"><input type="text" placeholder="请输入关键字进行搜索" /></div>
           </div>
       </div>
    </div>
</div>
<div style="height:148px;" id="pageTop">
</div> 

<!--点击改变导航样式-->
<script language="javascript" type="text/javascript">
       $(function(){
       		var locationHref = window.location.href;
       		if(locationHref.indexOf("?url=") != -1){
       			locationHref = locationHref.split("?url=")[0];
       		}
       		$("#headerLoginA").attr("href","../memb/memb-login?url="+locationHref)
       		$("#headerRegisterA").attr("href","../memb/memb-register?url="+locationHref)
            $(".header-persion").hide();
            $("#membPhone").mouseover(function(){
                $(".header-persion").show();
                $("#headIcon").attr("src","${confs["content.url"]}/img/up.png");
            });
            $("#membPhone").mouseout(function(){
                $(".header-persion").hide();
                $("#headIcon").attr("src","${confs["content.url"]}/img/down.png");
            });
            
        	var locationHref = window.location.href;
       		if(locationHref.indexOf("?url=") != -1){
       			locationHref = locationHref.split("?url=")[0];
       		}
       		$("#headerLoginA").attr("href","../memb/memb-login?url="+locationHref)
       		$("#headerRegisterA").attr("href","../memb/memb-register?url="+locationHref)
            $(".header-persion").hide();
            $("#membPhoneA").mouseover(function(){
                $(".header-persion").show();
                $("#headIcon").attr("src","${confs["content.url"]}/img/up.png");
            });
            $("#membPhoneA").mouseout(function(){
                $(".header-persion").hide();
                $("#headIcon").attr("src","${confs["content.url"]}/img/down.png");
            });
	  		
            
        });
  var parm = ${parm}+"";
  if(parm==""){parm="1";}
  $(document).ready(function (){
  	   if(parm=="1"){
  	   		$("#tpPage").attr("class","header-tag-select");
  	   		$("#searchPage").attr("class","header-tag-uncheck");
  	   		$("#addPage").attr("class","header-tag-uncheck");
  	   		$("#borkerOrStation").attr("class","header-tag-uncheck");
  		}
  		if(parm=="2"){
  			$("#tpPage").attr("class","header-tag-uncheck");
  	   		$("#searchPage").attr("class","header-tag-select");
  	   		$("#addPage").attr("class","header-tag-uncheck");
  	   		$("#borkerOrStation").attr("class","header-tag-uncheck");
  		}
  		if(parm=="3"){
  			$("#tpPage").attr("class","header-tag-uncheck");
  	   		$("#searchPage").attr("class","header-tag-uncheck");
  	   		$("#borkerOrStation").attr("class","header-tag-uncheck");
  	   		$("#addPage").attr("class","header-tag-select");
  		}
  		if(parm=="4"){
  			$("#tpPage").attr("class","header-tag-uncheck");
  	   		$("#searchPage").attr("class","header-tag-uncheck");
  	   		$("#borkerOrStation").attr("class","header-tag-select");
  	   		$("#addPage").attr("class","header-tag-uncheck");
  		}
  		
  		if(parm=="5"){
  			$("#tpPage").attr("class","header-tag-uncheck");
  	   		$("#searchPage").attr("class","header-tag-uncheck");
  	   		$("#borkerOrStation").attr("class","header-tag-uncheck");
  	   		$("#addPage").attr("class","header-tag-uncheck");
  	   		$("#goods").attr("class","header-tag-select");
  		}
    });
</script>
</div>

<div id="header2Div">
	<div class="page-header">
    <div class="page-header-body">
       <div class="header-body-top">
           <div class="header-logo-div"><img src="${confs["content.url"]}/img/logo.png" style="height:50px;"/><img class="header-logo1" src="${confs["content.url"]}/img/logo1.png"/></div>
           <div class="header-link">
               <div ><a href="../tp/load">首页</a></div>
               <div><a href="../land/list">我要找地</a></div>
               <#if memb??&&memb.type=='MT02'>
               		<div><a href="../land/add-init">我要卖地</a></div>
               </#if>
               <#if !memb??>
               		<div><a href="../memb/add-broker" target="_self">注册经纪人</a></div>
               </#if>
               <div><a href="../tp/store">农村好货</a></div>
           </div>
           <div class="header-search-div">
           	    <div class="header-user" style="float: left;margin-right: 10px;font-size: 18px;">
                   <div style="<#if memb != null>display: none;</#if>margin-left:24px;"><a id="headerLoginA" href="../memb/memb-login" >登录</a>/<a id="headerRegisterA" href="../memb/memb-register" >注册</a> 
                   <#--<a id="headerRegisterA" href="../prep" target="_blank" style="margin-left:20px;" >心愿卡</a> -->
                   </div>
                   <div class="header-user-div" <#if memb == null>style="display: none"</#if>>
                       <div class="header-user-info"  id="membPhoneA" style="width: 110px;margin-right: 5px;">
                           <div class="header-user-icon"><img id="headIcon" src="${confs["content.url"]}/img/down.png" /></div>
                           <div class="header-user-phone"><#if memb !=null>${memb.phone?substring(0,7)+"..."}</#if></div>
                           <div class="clear-float"></div>
                           <div class="header-persion">
                               <div><a href="../memb/memb-resv" >用户中心</a></div>
                               <div><a href="../prep"  target="_blank" >心愿卡</a></div>
                               <div><a href="../memb/login-out" >退出</a></div>
                           </div>
                       </div>
                       <div class="header-user-head"><img src="${confs["content.njtx.url"]}/img/${memb.head}" onerror="this.src='${confs["content.url"]}/${confs["content.memb.head"]}'"/></div>
                   </div>
               </div>
               <div class="header-searder-button"><img src="${confs["content.url"]}/img/search.png"></div>
               <div class="header-search-text"><input type="text" placeholder="请输入关键字进行搜索" /></div>
           </div>
       </div>
    </div>
</div>
<div style="height:85px;" id="pageTop">
</div>

</div>
</div>
<script>
		var headerFlag =true ; 
  		window.onscroll=function(){
  			if($(document).scrollTop() == 0){
  				$("#header2Div").css("display","none");
  				$("#header1Div").css("display","block");
  				$("#css_id2").attr("disabled",'disabled');
  				$("#css_id1").removeAttr("disabled");
  			}else{
  				$("#header2Div").css("display","block");
  				$("#header1Div").css("display","none");
  				$("#css_id1").attr("disabled",'disabled');
  				$("#css_id2").removeAttr("disabled");
  			}
  			
  		}
  		
	  var parm = ${parm}+"";
	  if(parm==""){parm="1";}
	  $(document).ready(function (){
	  	   if(parm=="1"){
	  	   		$("#tpPage").attr("class","header-tag-select");
	  	   		$("#searchPage").attr("class","header-tag-uncheck");
	  	   		$("#addPage").attr("class","header-tag-uncheck");
	  		}
	  		if(parm=="2"){
	  			$("#tpPage").attr("class","header-tag-uncheck");
	  	   		$("#searchPage").attr("class","header-tag-select");
	  	   		$("#addPage").attr("class","header-tag-uncheck");
	  		}
	  		if(parm=="3"){
	  			$("#tpPage").attr("class","header-tag-uncheck");
	  	   		$("#searchPage").attr("class","header-tag-uncheck");
	  	   		$("#addPage").attr("class","header-tag-select");
	  		}
	  		
	  	
	    });
	  		
	 </script>

<script>
	var header1Div = $("#header1Div").html();
	var header2Div = $("#header2Div").html();
	$("#header2Div").css("display","none");
	$("#css_id2").attr("disabled",'disabled');
</script>
