<style>
	.reline{
		margin-bottom: 10px;
	}
	
	.WB_widget WB_follow_ex {
		 display: inline-block;
	}
</style>
   <div class="footer-body">
   		 <div class="footer-header">
        	  <div class="footer-link-div">
                   <div class="footer-link-title">友情链接：</div>
                     <div  class="footer-link-line">
                    <a href="http://www.globalhexi.com/hexishop/index.html" target="_blank" >和系</a>
                    </div>
                      <div  class="footer-link-line">
                    	<a href="http://www.txtangseng.com" target="_blank" >天下唐僧</a>
                    </div>
                    <div  class="footer-link-line">
                    	<a href="http://www.17ju.cn/"  target="_blank" >聚天下</a>
                    </div>
                    <div  class="footer-link-line">
                    	<a href="http://www.cbecm.com/"  target="_blank" >清风竞技</a>
                    </div>
                    <div  class="footer-link-line">
                    	<a href="http://www.pxto.com.cn/"  target="_blank" >培训通</a>
                    </div>
                      <div  class="footer-link-line">
                    	<a href="http://www.you-ke.com.cn/" target="_blank" > 优课网</a>
                    </div>
                    <div  class="footer-link-line-right">
                   	 	<a href="http://se-innovation.com/" target="_blank" >中欧创新网</a>
                    </div>
                </div>
        	</div>
        	<div class="clear-float"></div>
        <div class="footer-center">
            <div class="footer-top">
            	<div class="footer-column">
                    <div class="footer-column-title-right">关于农交天下</div>
                    <div  class="footer-column-line"><a href="../tp/statement"  target="_blank" >免责声明</a></div>
                    <div  class="footer-column-line"><a href="../tp/about"  target="_blank" >关于我们</a></div>
                    <div  class="footer-column-line"><a href="../tp/contact"  target="_blank" >联系我们</a></div>
                </div>
               <div class="footer-column">
                    <div class="footer-column-title">一起致富</div>
                    <#--
                    <div  class="footer-column-line"><a href="../memb/add-broker"  target="_blank" >申请经纪人</a></div>
                    <div  class="footer-column-line"><a href="../station/add-station"  target="_blank" >申请分站</a></div>
                    -->
                    <div  class="footer-column-line"><a href="javascript:;"  target="_blank" >申请经纪人</a></div>
                    <div  class="footer-column-line"><a href="javascript:;"  target="_blank" >申请分站</a></div>
                    <div  class="footer-column-line"><a href="../tp/recru"  target="_blank" >招聘人才</a></div>
                </div>
                <div class="footer-column">
                    <div class="footer-column-title">分站</div>
                    <#list station3 as station>
                    <div  class="footer-column-line">${ station.name}</div>
                    </#list>
                </div>
                 <div class="footer-column">
                    <div class="footer-column-title">帮助中心</div>
                    <div  class="footer-column-line"><a href="../tp/helf-land" target="_blank">如何找土地</a></div>
                    <div  class="footer-column-line"><a href="../tp/helf-contact" target="_blank">如何联系卖家</a></div>
                    <div  class="footer-column-line"><a href="../tp/helf-release" target="_blank">如何发布土地</a></div>
                </div>
                <div class="footer-column" style="display:none;">
                    <div class="footer-column-title">登录/注册</div>
                    <div  class="footer-column-line">
                    <a href="../memb/memb-register" target="_blank" >注册新用户</a>
                    </div>
                    <div  class="footer-column-line">
                     <a href="../memb/memb-repwd" target="_blank" >快速找回密码</a>
                    </div>
                    <div  class="footer-column-line">
                    	<a href="../memb/memb-resv" target="_blank" >修改个人资料</a>
                    </div>
                </div>
                <div class="footer-column-right">
                    <div class="footer-column-title">联系我们</div>
                    <div class="footer-column-phone2">${confs["cust.tel"]}</div>
                    <div class="footer-column-line reline">9:00-17:00</div>
                    <div class="footer-column-line reline">座机：${confs["cust.landline"]}</div>
                    <div class="footer-column-line reline">传真：${confs["cust.fax"]}</div>
                    <div class="footer-column-line reline">手机号：${confs["cust.phone"]}</div>
                    <div class="footer-column-line reline">邮箱：${confs["cust.email"]}</div>
                    <div class="footer-column-line reline">
                    	微博：${confs["cust.blog"]}
                    	<wb:follow-button uid="5887720820" type="red_1" width="100" height="24" style="display: inline-block;"></wb:follow-button>
                    </div>
                </div>
                <div class="footer-column-right">
                    <div class="footer-column-line"><img src="${confs["content.url"]}${confs["cust.qr"]}" class="footer-erwei-img"/></div>
               		<div class="footer-column-erwei">农交天下APP</div>
                </div>
                 <div class="footer-column-right footer-center-border" style="padding-right: 128px;" >
                    <div class="footer-column-line"><img src="${confs["content.url"]}/img/nongjiaowb.png" class="footer-erwei-img"/></div>
               		<div class="footer-column-erwei">关注我们</div>
                </div>
                <div class="clear-float"></div>
            </div>
        </div>
        <div class="footer-bottom">
            Copyright 2016 农交天下 All Rights Reserved 蜀ICP备16006919号
        </div>
    </div>
  <script type="text/javascript">
  	  
  </script>