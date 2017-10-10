<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>c2c后台管理系统</title>



<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/jquery.bootgrid.min.css">

<link href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<%=basePath%>css/bootstrap-datetimepicker.min.css"
	type="text/css"></link>
	<script src="<%=basePath%>js/jquery.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/content.min.js"></script>
	<script src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script src="<%=basePath%>js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="col-sm-12">
			<a class="btn btn-primary" href="<%=basePath%>admin/exportUser"
				style="text-decoration: none; margin-top: 10px;">导出数据为excel</a>
			<div class="example-wrap">
				<h4 class="example-title"
					style="margin-top: 15px; margin-bottom: -28px;">c2c商品信息</h4>
				<div class="example">
					<table id="userListTable">
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document)
				.ready(
						function() {
							$("#userListTable")
									.bootstrapTable(
											{
												url : "../admin/getGoodsLists",
												method : "post",
												contentType : "application/x-www-form-urlencoded",
												toolbar : '#toolbar', //工具按钮用哪个容器
												striped : true, //是否显示行间隔色
												cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
												pagination : true, //是否显示分页（*）
												sortable : false, //是否启用排序
												sortOrder : "asc", //排序方式
												queryParams : queryParams,//传递参数（*）
												sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
												pageNumber : 1, //初始化加载第一页，默认第一页
												pageSize : 6, //每页的记录行数（*）
												pageList : [ 5,10, 15, 20, 100 ], //可供选择的每页的行数（*）
												search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
												strictSearch : true,
												showColumns : true, //是否显示所有的列
												showRefresh : true, //是否显示刷新按钮
												minimumCountColumns : 2, //最少允许的列数
												clickToSelect : true, //是否启用点击选中行
												height : 455, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
												uniqueId : "id", //每一行的唯一标识，一般为主键列
												showToggle : false, //是否显示详细视图和列表视图的切换按钮
												cardView : false, //是否显示详细视图
												detailView : false, //是否显示父子表
												columns : [
														{
															
															field : 'opt',
															title : '图片',
															width : '35%',
															align : 'center',
															formatter : function(value,row,index) {
																	return "<img src='../img/photo.jpg' width='35%'/>";
															}
														},
														{
															field : 'phone',
															title : '账号'
														},
														{
															field : 'username',
															title : '昵称',
															align : 'center'
														},
														{
															field : 'qq',
															title : 'QQ',
															align : 'center'
														},
														{
															field : 'createAt',
															title : '创建时间',
															align : 'center'
														},
														{
															field : 'goodsNum',
															title : '发布商品数量',
															align : 'center'
														},
														{
															field : 'power',
															title : '账号类型',
															align : 'center',
															formatter : function(
																	value, row,
																	index) {
																if (row.power === 90) {
																	return "<label style='color: red'>管理员</label>";
																} else {
																	return "<label>普通会员</label>";
																}
															}
														},
														{
															field : 'lastLogin',
															title : '最后上线时间',
															align : 'center'
														},
														{
															field : 'status',
															title : '状态',
															align : 'center',
															formatter : function(
																	value, row,
																	index) {
																if (row.status === 0) {
																	return "<label id='"+
																			row.id+"s'style='color: green'>正常</label>";
																} else {
																	return "<label id='"+
																		row.id+"s'style='color: red'>已禁用</label>";
																}
															}
														}
														,
														{
															field : 'opt',
															title : '操作',
															align : 'center',
															formatter : function(
																	value, row,
																	index) {

																if (row.status === 0) {
																	return '<button id="'
																			+ row.id
																			+ '"   type="button" class="btn btn-outline  btn-default" onClick=disableAccount('
																			+ row.id
																			+ ')>禁用</button>';
																} else {
																	return '<button id="'
																			+ row.id
																			+ '"  type="button" class="btn btn-outline btn-default" onClick=enableAccount('
																			+ row.id
																			+ ')>启用</button>'

																	;
																}

															}

														}
														
														]
											});
						});

		function queryParams(params) {
			var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				pageSize : params.limit, //页面大小
				currentPage : params.offset, //页码
				keyword : $("div.pull-right.search > input").val()
			};
			return temp;
		}
	</script>
</body>
</html>