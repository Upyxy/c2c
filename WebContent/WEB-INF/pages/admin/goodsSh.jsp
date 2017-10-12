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
<link rel="stylesheet" href="<%=basePath%>css/shenhe.css">
<link
	href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=basePath%>css/bootstrap-datetimepicker.min.css"
	type="text/css"></link>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/content.min.js"></script>
<script
	src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script
	src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script
	src="<%=basePath%>js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="col-sm-12">
			<%-- 			<a class="btn btn-primary" href="<%=basePath%>admin/exportUser" --%>
			<!-- 				style="text-decoration: none; margin-top: 10px;">导出数据为excel</a> -->
			<div class="example-wrap">
				<h4 class="example-title"
					style="margin-top: 15px; margin-bottom: -28px;">c2c商品信息审核</h4>
				<div class="example">
					<table id="goodsShListTable">
					</table>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
							$("#goodsShListTable")
									.bootstrapTable(
											{
												url : "../admin/GoodsListsSh",
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
												pageList : [ 5, 10, 15, 20, 100 ], //可供选择的每页的行数（*）
												search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
												strictSearch : true,
												showColumns : true, //是否显示所有的列
												showRefresh : true, //是否显示刷新按钮
												minimumCountColumns : 2, //最少允许的列数
												clickToSelect : true, //是否启用点击选中行
												height : 460, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
												uniqueId : "id", //每一行的唯一标识，一般为主键列
												showToggle : false, //是否显示详细视图和列表视图的切换按钮
												cardView : false, //是否显示详细视图
												detailView : false, //是否显示父子表
												columns : [
														{
															field : 'image',
															title : '图片',
															align : 'center',
															width : '20%',
															hight:  '20%',
															formatter : function( value, row, index) {
																var options=[];
																for(var i=0;i<value.length;i++){
																	var a=value[i];
																	options.push(a.imgUrl);
																}
																return "<img src='../upload/"+options+"' width='25%' hight='25%'/>";
															}
														},
														{
															field : 'id',
															title : 'ID'
														},
														{
															field : 'catelog',
															title : '类别名',
															align : 'center',
															formatter : function( value, row, index) {
																var options=[];
																for(var i=0;i<value.length;i++){
																	var a=value[i];
																	options.push(a.name);
																}
																return options;
															}
														},
														{
															field : 'name',
															title : '商品名',
															width : '20%',
															hight:  '20%'
														},
														{
															field : 'describle',
															title : '商品简介',
															align : 'center'
														},
														{
															field : 'price',
															title : '现价',
															align : 'center'
														},
														{
															field : 'realPrice',
															title : '原价',
															align : 'center'
														},
														{
															field : 'startTime',
															title : '发布时间',
															align : 'center'
														},
														{
															field : 'polishTime',
															title : '擦亮时间',
															align : 'center'
														},
														{
															field : 'endTime',
															title : '失效时间',
															align : 'center'
														},
														{
															field : 'opt',
															title : '操作',
															align : 'center',
															formatter : function(value, row,index) {
																return '<button id="'
																+ row.id
																+ '"  type="button" class=" btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onClick=sh('+ JSON.stringify(row).replace(/"/g, '&quot;') + ')>审核</button>';

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
		
		
		//触发模态框的同时调用此方法  
		function sh(obj) {
// 			console.log(obj);
		    //获取表格中的一行数据
		    //向模态框中传值  		    
		    $("#shmodal").html(" <div class='she'><img src='../upload/"+obj.image[0].imgUrl+"' width='25%' hight='50%'/></div>"
		    +"<div class='she1'>"
		    +"<input type='hidden'  id='id' value='"+obj.id+"'/>"
		    +"<div>类别名："+obj.catelog[0].name+"awda&nbsp;&nbsp;&nbsp;&nbsp;商品名："+obj.name+"</div>"
		    +"<div class='yuanjia'>商品原价：<a>"+obj.realPrice+"</a></div>"
		    
		    +"<div class='xianjia'>商品现价：<a>"+obj.price+"</a></div>"
		    
		    +"<div>商品简介："+obj.describle+"</div>"
		    
		    +"<div>审核：<select id='shs'>"
		  	    +"<option value='1'>审核通过</option>"
		    	+"<option value='2'>审核不通过</option>"
		    +"</select></div>"
		    +"</div>");
		    $('#update').modal('show');  
		}  
		
		
		
		
	</script>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">审核</h4>
				</div>

				<div class="modal-body" id="shmodal" style="height: 330px;">



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" onclick="tjshGoods()">提交更改</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	function tjshGoods(){
		var good_status = $("#shs").val().trim();
		var id = $("#id").val().trim();
	 	$.post("../admin/tjshGoods", {
		"good_status" : good_status,
		"id" : id
	}, function(result) {
		$('#myModal').modal('hide');
		$("#goodsShListTable").bootstrapTable('refresh',"../admin/GoodsListsSh");
	});
	}  
	

	</script>
</body>
</html>