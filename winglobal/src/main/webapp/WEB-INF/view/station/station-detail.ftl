<!DOCTYPE html PUBLIC "-//W3C//DTDd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no"/>

<head>
    <title></title>
    <style>
        *{
            margin:0;
            padding:0;
        }
        body{
            background-color: #eee;
        }
        .station-body-div{
            max-width: 480px;
            min-width：300px;
            background-color: #fff;
            text-align: center;
            margin:auto;
            font-family: '微软雅黑', '宋体';
            background: url('${confs["content.url"]}/img/work-bg.png');
            background-size: 100%;
        }
        .station-info{
            margin-top:20px;
            padding-bottom:50px ;
        }
        .station-line{
            line-height:30px;
            font-size: 20px;
            margin-top:11px;
        }
        .station-line-left{
            width:45%;
            float:left;
            text-align: right;
            font-weight: bold;
        }
        .station-line-right{
            width:45%;
            float:left;
            text-align: left;
            font-size:18px;
        }
        .float-clear{
            clear: both;
            display: block;
            height: 0px;
        }
        .station-footer{
            margin-top:50px;
            font-size: 14px;
        }
        .station-head{
        	margin-top:39px;
        	margin-bottom:22px;
        }
        .station-head img{
        	border-radius:15px;
        }
        .work-yz{
        	width:138px;	
    		position: absolute;
   	 		margin-left: -77px;
    		margin-top: 116px;
        }
    </style>
</head>
<body>
    <div class="station-body-div">
    	<img src="${confs["content.url"]}/img/work-heade.png"  width="100%"/>
        <div  class="station-head">
            <img src="${confs["content.njtx.url"]}/img/${station.mstrImg}" onerror="this.src='${confs["content.url"]}/img/logo.png'"  width="138px" height="190px"/>
       		<img src="${confs["content.url"]}/img/yz.png" class="work-yz"/> 
       	</div>
        <div class="station-info">
            <div class="station-line"><div class="station-line-left">分站名称：</div><div class="station-line-right">${station.name}&nbsp;</div></div>
             <div class="station-line"><div class="station-line-left">分站编号：</div><div class="station-line-right">${station.code}&nbsp;</div></div>
            <div class="station-line"><div class="station-line-left">站长姓名：</div><div class="station-line-right">${station.mstrName}&nbsp;</div></div>
            <div class="station-line"><div class="station-line-left">联系电话：</div><div class="station-line-right">${station.mstrTel}&nbsp;</div></div>
            <div class="station-line"><div class="station-line-left">详细地址：</div><div class="station-line-right"><#if station.area??><#if station.area?length gt 1>${addrs[station.area[0..1]].name}</#if><#if station.area?length gt 3>${addrs[station.area[0..1]].children[station.area[0..3]].name}</#if><#if station.area?length gt 5>${addrs[station.area[0..1]].children[station.area[0..3]].children[station.area[0..5]].name}</#if></#if>${station.addr}&nbsp;</div></div>
           <div class="station-line"><div class="station-line-left">业务范围：</div><div class="station-line-right">${station.biz}&nbsp;</div></div>
          	<div class="float-clear"> </div>
        </div>
        <img src="${confs["content.url"]}/img/work-bottom1.png" width="100%" />
    </div>
</body>
</html>