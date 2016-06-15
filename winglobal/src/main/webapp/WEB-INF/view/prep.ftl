<!DOCTYPE html>
<html>
	<head>
		<#include "head.ftl">
		<#assign parm=1>
		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
				text-decoration: none;
				font-family: "Microsoft YaHei", 微软雅黑, "Microsoft JhengHei", 华文细黑,
				STHeiti, MingLiu;
			}
			html,body{
				background-color:#F2F2F2;
				height: 100%;
				width: 100%;
				border: 0;
			}
			.container {
				width: 500px;
				height: 650px;
				margin: auto;
				text-align: center;
			}
			#img-prompt{
				margin-top:200px;
			}
			</style>
	</head>
	<body>
		<#include "header2.ftl">
		<div class="container">
			<img id="img-prompt" src="${confs["content.url"]}/img/prep.png"/>
		</div>
		<#include "footer.ftl">
	</body>
</html>
