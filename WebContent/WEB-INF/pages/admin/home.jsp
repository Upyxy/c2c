<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>C2C后台管理</title>

<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../css/animate.min.css" rel="stylesheet">
<link href="../css/style.min862f.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->

		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element" style="text-align: center;">
							<span><img alt="image" class="img-circle"
								src="../img/photo.jpg" /></span> <a data-toggle="dropdown"
								class="dropdown-toggle" href="#"> <span class="clear">
									<span class="block m-t-xs"><strong class="font-bold">${cur_user.username}</strong></span>
									<span class="text-muted text-xs block">管理员</b></span>
							</span>
							</a>
						</div>
						<div class="logo-element">C2C</div>
					</li>
					<li><a href=""> <i class="fa fa-home"></i>
						<span class="nav-label">主页</span>
						<span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="../admin/userList">用户管理</a></li>
							<li><a class="J_menuItem" href="../admin/goodsList">商品管理</a></li>
							<li><a class="J_menuItem" href="index_v3.html">评论管理</a></li>
						</ul></li>
					<li><a class="J_menuItem" href="layouts.html"><i
							class="fa fa-columns"></i> <span class="nav-label">布局</span></a></li>

				</ul>
			</div>
		</nav>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>

					</div>
			</div>

			<div class="row content-tabs">
				
				<nav class="page-tabs J_menuTabs" style="margin-left:2px;">
					<div class="page-tabs-content" style="margin-left:2px;">
					</div>
				</nav>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="../user/logout" class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="../admin/adminIndex" frameborder="0"
					data-id="adminIndex" seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right" style="padding-top: 8px;padding-bottom: 8px;">
					&copy; c2c <a href="#" target="_blank"></a>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../js/plugins/layer/layer.min.js"></script>
	<script src="../js/hplus.min.js"></script>
	<script type="text/javascript" src="../js/contabs.min.js"></script>
	<script src="../js/plugins/pace/pace.min.js"></script>
</body>

</html>
