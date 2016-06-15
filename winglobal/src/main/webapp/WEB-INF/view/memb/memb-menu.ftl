	<style>
		.nav .main-menu li > a.checked {
            background: url("${confs["content.url"]}/img/left.png") no-repeat left;
            color: #0AB552;
            color: #0AB552;
        }
	</style>
    <div class="nav">
        <div class="memb-info">
            <div class="head">
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
            <div class="info">
                <div>${(memb.phone)!}</div>
                <div class="top8 memb-rank">
	                    <img src="${confs["content.url"]}/img/${(memb.level)!'MT01'}.png">
                    	<#if memb.type == 'MT01'>
                    		普通会员
                    	<#elseif memb.type == 'MT02'>
                    		<span style="vertical-align: middle;" >${opts["ML"].children[memb.level].name}</span>
                    	</#if>
                </div>
                <div class="top8">推广收益：<span class="span_money"></span>元</div>
                <#if memb.type == 'MT02'>
	                <div class="top8 btn">
	                    	<a href="javascript:;" id="sign-id-a">签到</a>
	                </div>
                </#if>
            </div>
        </div>
        <#if memb?? && memb.type == 'MT02'>
        <div class="oper-box">
            <div class="land">
                <a href="../land/add-init" style="background: url('${confs["content.url"]}/img/fj.png') no-repeat center left 15px;">
                    	发布土地
                </a>
            </div>
            <div class="goods">
                <a id="addGoods" href="javascript:"  style="background: url('${confs["content.url"]}/img/bg_goods_btn.png') no-repeat center left 15px;">
                    	发布商品
                </a>
            </div>
        </div>
        </#if>
        <div class="menu-box">
            <ul class="main-menu">
                <li index="1" >
                    <a class="menu-item" href="javascript:">
                        <i style="background-image: url('${confs["content.url"]}/img/ic_amount_unselected.png')"></i>
                        	<span class="menu_name">我的账户<span>
                    </a>
                </li>
                <li index = "2" >
                    <a class="menu-item toggle" href="javascript:">
                        <i style="background-image: url('${confs["content.url"]}/img/ic_goods_unselected.png')"></i>
                       	<span class="menu_name">商品管理</span>
                        <span class="toggle">+</span>
                    </a>
                    <ul class="sub-menu">
                    	<#if memb.type == 'MT02'>
                        <li index="21" >
                            <a class="menu-item" href="../memb/goods?menuIndex=21">
                                <i style="background-image: url('${confs["content.url"]}/img/ic_goods_unselected.png')"></i>
                                	我的商品
                            </a>
                        </li>
                        </#if>
                        <li index="22">
                            <a class="menu-item" href="../memb/orders-buyer?menuIndex=22" >
                                <i style="background-image: url('${confs["content.url"]}/img/ic_orders_unselected.png')"></i>
                                	我的订单
                            </a>
                        </li>
                        <li index="23">
                            <a class="menu-item" href="javascript:">
                                <i style="background-image: url('${confs["content.url"]}/img/sc.png')"></i>
                               	 我的收藏
                            </a>
                        </li>
                    </ul>
                </li>
                <li index="3" >
                    <a class="menu-item toggle" href="javascript:">
                        <i style="background-image: url('${confs["content.url"]}/img/ol.png')"></i>
                        <span class="menu_name">土地管理</span>
                    	<span class="toggle">+</span>
                    </a>
                     <ul class="sub-menu">
                     	<#if memb.type == 'MT02'>
                        <li index="31">
                            <a class="menu-item" href="../land/memb-land?menuIndex=31">
                                <i style="background-image: url('${confs["content.url"]}/img/ic_goods_unselected.png')"></i>
                                	我的土地
                            </a>
                        </li>
                        </#if>
                        <li index="32">
                            <a class="menu-item" href="../reserve/resv-land-buy?menuIndex=32">
                                <i style="background-image: url('${confs["content.url"]}/img/sc.png')"></i>
                               	 	我的预约
                            </a>
                        </li>
                        <li index="33">
                            <a class="menu-item" href="javascript:">
                                <i style="background-image: url('${confs["content.url"]}/img/sc.png')"></i>
                               	 我的收藏
                            </a>
                        </li>
                    </ul>
                </li>
                <li index="4" >
                    <a class="menu-item" href="../memb/memb-resv?menuIndex=4">
                        <i style="background-image: url('${confs["content.url"]}/img/ic_info_unselected.png')"></i>
                    	<span class="menu_name">基本信息</span>
                    </a>
                </li>
                <#if memb.type == 'MT02'>
                <li index="5">
                    <a class="menu-item" href="../memb/memb-sharecode?menuIndex=5">
                        <i style="background-image: url('${confs["content.url"]}/img/ic_invite_unselected.png')"></i>
                       	<span class="menu_name">邀请好友</span>
                    </a>
                </li>
                </#if>
            </ul>
        </div>
    </div>
    <script>
    	
    	window.onload=function(){
    		<#-- 检查是否签到 -->
    		var signIda=$("#sign-id-a");
    		$.ajax({
    			url:"../signed/isSign",
    			type:"GET",
    			success:function(data){
    				if(data.isSigned){
    					signIda.attr("class","signed_a");
    				}else{
    					signIda.removeAttr("class","signed_a");
    					signIda.css("border","1px solid #ddd").css("color","#ddd");
    					signIda.html("已签到");
    				}
    			},error:function(){
    			}
    		});
    		<#-- 加载余额 -->
    		var $spanMoney = $(".span_money");
    		$.ajax({
    			url:"../memb/balance",
    			type:"GET",
    			success:function(data){
	    			if(data.succ){
	    				$spanMoney.html(data.balance);
	    			}else{
	    				$spanMoney.html("-");
	    			}
    			},error:function(){
    				$spanMoney.html("-");
    			}
    		});
    	}
    	
    	$(function(){
    		var menuIndex = "${(menuIndex)!'0'}"
    		if(menuIndex.length == 1){
    			if(menuIndex != '0'){
					menuChecked(menuIndex);
    			}
    		} else if(menuIndex.length == 2){
    			subMenuChecked(menuIndex);
    		}
    		
    		function menuChecked (index){
    			var menuItem = $(".main-menu > li > .menu-item");
				menuItem.each(function(i){
					if($(this).parent().attr("index") == index){
						$(this).addClass("checked");
						return;
					}			
				})
    		}
    		
    		function subMenuChecked (index){
    			var menuItem = $(".main-menu > li > .sub-menu .menu-item");
				menuItem.each(function(i){
					if($(this).parent().attr("index") == index){
						var parent = $(this).parent().parent().prev();
						$(this).parent().parent().slideDown();
						$(this).parent().parent().parent().find("span.toggle").text("-");
						$(this).addClass("checked");
						return;
					}			
				})
    		}
    		
    		 $(document).on("click",".signed_a",function(){
    			var $this=$(this);
    			$.ajax({
    				url:"../signed/sign",
    				type:"GET",
    				success:function(msg){
    					if(msg.succ){
    						msgPrompt("签到成功","succ");
    						$this.removeAttr("class");
    						$this.css("border","1px solid #ddd").css("color","#ddd");
    						$this.html("已签到");
    					}else{
    						msgPrompt(msg.msg,"error");
    					}
    				}
    			});
    		});
    		
    		$("#addGoods").click(function(){
    			$.ajax({
    				url : "../memb/check-openid",
    				type : "post",
    				dataType: "json",
    				success: function(result){
    					if(result.status == 'success'){
    						window.location.href = "../goods/add";
    					}else{
    						alert(result.errMsg);
    					}
    				}
    			})
    		})
    		
    	})
    
    </script>