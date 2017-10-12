<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单页</title>

<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<link href="<%=basePath%>css/address.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>css/order.css" />
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<link rel="stylesheet" href="<%=basePath%>css/index.css" />
<link href="<%=basePath%>css/city-picker.css" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
$(document).ready(function(){
	$("#addr-show").hide();
});
$(document).ready(function(){
	$("#addr-update").hide();
});

function newAddr(){
	if($("#addr-show").css("display")=='none'){
        $("#addr-show").css("display","block");
    }else{
    	
        $("#addr-show").css("display","none");
    }
}
function updateAddr(){
	if($("#addr-update").css("display")=='none'){
        $("#addr-update").css("display","block");
    }else{
    	
        $("#addr-update").css("display","none");
    }
}

function usubmit(action){//获取radio的value的方法
	var radios = document.getElementById("upadr").radio1;//获取id为list下的所有name为user的值的集合
	for(var i=0;i<radios.length;i++){//循环值得集合
	if(radionum[i].checked){//通过checked属性判断是否被选中
	userid = radionum[i].value//将被选择的radio的值赋给变量userid
	}
	}
	alert(userid)//弹出被选中的radio的值
	}

</script>
</head>
<body>
	<!--header-->
	<div ng-controller="headerController"
		class="header stark-components navbar-fixed ng-scope">
		<nav class="white nav1">
			<div class="nav-wrapper">
				<a href="<%=basePath%>goods/homeGoods" class="logo"> <em
					class="em2">C2C</em>
				</a>
				<div class="nav-wrapper search-bar">
					<form ng-submit="search()"
						class="ng-pristine ng-invalid ng-invalid-required"
						action="<%=basePath%>goods/search">
						<div class="input-field">
							<input id="search" name="str" placeholder="搜点什么吧233..."
								style="height: 40px;"
								class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
							<label for="search" class="active"> <i
								ng-click="search()" class="iconfont"></i>
							</label>
						</div>
					</form>
				</div>
				<ul class="right">
					<c:if test="${empty cur_user}">
						<li class="publish-btn">
							<button ng-click="showLogin()" data-position="bottom"
								data-delay="50" data-tooltip="需要先登录哦！"
								class="red lighten-1 waves-effect waves-light btn"
								data-tooltip-id="510d3084-e666-f82f-3655-5eae4304a83a">
								我要发布</button>
						</li>
					</c:if>
					<c:if test="${!empty cur_user}">
						<li class="publish-btn">
							<button data-position="bottom"
								class="red lighten-1 waves-effect waves-light btn">
								<a href=" <%=basePath%>goods/publishGoods">我要发布</a>
							</button>
						</li>
						<li><a href=" <%=basePath%>user/allGoods">我发布的商品</a></li>
						<li><a>${cur_user.username}</a></li>
						<li class="notification"><i ng-click="showNotificationBox()"
							class="iconfont"></i>
							<div ng-show="notification.tagIsShow"
								class="notification-amount red lighten-1 ng-binding ng-hide">0
							</div></li>
						<li class="changemore"><a class="changeMoreVertShow()"> <i
								class="iconfont"></i>
						</a>
							<div class="more-vert">
								<ul class="dropdown-content">
									<li><a href="../user/home">个人中心</a></li>
									<li><a>消息</a></li>
									<li><a onclick="ChangeName()">更改用户名</a></li>
									<li><a href="../user/logout">退出登录</a></li>
								</ul>
							</div></li>
					</c:if>
					<c:if test="${empty cur_user}">
						<li><a onclick="showLogin()">登录</a></li>
						<li><a onclick="showSignup()">注册</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>
	<!-- 地址信息 -->
	<div class="container">
		<div class="check-out1">
			<h2>地址信息</h2>
			<form id="upadrs" action="" method="post">
				<div class="addre" style="margin-top: 10px;">
				<c:forEach var="items" items="${addressList}" >
					<div class="address1">
						<p>
							<label> <input id="radio1" name="radio1" type="radio" value="${items.id}" />${items.addressContent }
								（${items.buyerName} 收）电话：${items.buyerPhone}</label>
<!-- 							 <a data-toggle="modal" onclick="updateAddr()">修改本地址</a> -->
							<a onclick="deleteAddress(${items.id})">删除本地址</a>
						</p>
					</div>
					</c:forEach>
					
					<!-- 新增地址 -->
					<div class="newadr">
						<button class="newbutt" onclick="newAddr()" type="button"
							style="width: 90px; height: 30px;">新增地址</button>

					</div>
				</div>

			</form>
		</div>
	</div>

	<!-- 新增地址弹窗 -->
	<div id="addr-show" class="container">
		<div class="check-out">
			<h2 class="page-header">新增地址</h2>
			
			<div class="form-inline">
				<div id="distpicker">
					<div style="float: left; font-size: 15px;">所&nbsp;在&nbsp;地&nbsp;区：</div>
					<div class="form-group">
						<div style="position: relative;">
							<input id="address11" class="form-control" readonly="readonly" type="text" value="请选择" data-toggle="city-picker"/>
						</div>
					</div>
				</div>
				<div class="adr">
					<div class="adr1">详&nbsp;细&nbsp;地&nbsp;址：</div>
					<textarea rows="3" cols="40" id="address2"	style="width: 230px; background-color: white; border: 1px solid; border-color: gainsboro;"></textarea>
				</div>
				<div class="aname" >
					收货人姓名：<input type="text"  id="buyerName"/>
				</div>
				<div class="phone">
					电&nbsp;话&nbsp;号&nbsp;码：<input type="text" id = "buyerPhone" />
				</div>
				<div class="baocun">
				  <a href="#" class=" to-buy" onclick = "saveAddress()">保存</a>
				</div>
				</div>
			
		</div>
	</div>

	<!-- 修改地址-->

<!-- 	<div id="addr-update" class="container"> -->
<!-- 		<div class="check-out"> -->
<!-- 			<h2 class="page-header">修改地址</h2> -->
			
<%-- 			<form class="form-inline" action=""> --%>
<!-- 				<div id="distpicker"> -->
<!-- 					<div style="float: left; font-size: 15px;">所&nbsp;在&nbsp;地&nbsp;区：</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<div style="position: relative;"> -->
<!-- 							<input id="city-picker3" class="form-control" readonly -->
<!-- 								type="text" value="请选择" data-toggle="city-picker"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="adr"> -->
<!-- 					<div class="adr1">详&nbsp;细&nbsp;地&nbsp;址：</div> -->
<!-- 					<textarea rows="3" cols="40" -->
<!-- 						style="width: 230px; background-color: white; border: 1px solid; border-color: gainsboro;"></textarea> -->
<!-- 				</div> -->
<!-- 				<div class="aname"> -->
<!-- 					收货人姓名：<input type="text" /> -->
<!-- 				</div> -->
<!-- 				<div class="phone"> -->
<!-- 					电&nbsp;话&nbsp;号&nbsp;码：<input type="text" /> -->
<!-- 				</div> -->
<!-- 				<div class="baocun"> -->
<!-- 					 <a href="#" class=" to-buy" onclick = "">保存</a> -->
<!-- 				</div> -->
<%-- 			</form> --%>
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- 修改结束 -->

	<!--订单信息-->
	<div class="container">
		<div class="check-out">
			<!--<h1>Checkout</h1>-->
			<h2>确认订单信息</h2>
			<table style="margin-top: 5px;" frame=hsides>
				<tr>
					<th>${ordersExtend.goodsName}</th>
					<th style="width: 100px;">数量</th>
					<th>价格</th>
					<th style="width: 250px;">商品描述</th>
					<th>总计</th>
				</tr>
				<tr>
					<td class="ring-in"><a href="single.html" class="at-in"> <img
							src="<%=basePath%>upload/${ordersExtend.image}" alt=""></a>

						<div class="clearfix"></div></td>
						<td>&nbsp;1</td>
					<td>${ordersExtend.goodsPrice }</td>
					<td style="width: 250px;">${ordersExtend.goodsDescrible }</td>
					<td>${ordersExtend.goodsPrice }</td>

				</tr>

			</table>
			<a href="#" class=" to-buy" onclick="add()">购买</a>
			<div class="clearfix"></div>
		</div>
	</div>

	<script src="<%=basePath%>js/city-picker.data.js"></script>
	<script src="<%=basePath%>js/city-picker.js"></script>
	<script src="<%=basePath%>js/main.js"></script>

	<script type="text/javascript">
	
	function deleteAddress(addressId){
		$.post("<%=basePath%>address/deleted", {
			"addressId" : addressId
		}, function(result) {
			if(result){
				alert("删除成功！");
				window.location.reload(); 
			}else{
				alert("删除失败！");
			}
		});
	}
	
	
	
	function saveAddress(){
		var buyerName = $("#buyerName").val().trim();
		var buyerPhone = $("#buyerPhone").val().trim();
		var address1 =$("#address11").val().trim();
		var address2 =$("#address2").val().trim();
		
		$.post("<%=basePath%>order/address",{
			"buyerName": buyerName,
			"buyerPhone": buyerPhone,
			"address1": address1,
			"address2": address2
		},function(result) {
			if(result){
				window.location.reload(); 
				alert("添加地址成功！");
				}else{
				alert("回复失败！");
			}
		}
		)
	}
function add() {
	var goodsId ="${ordersExtend.goodsId}";
	var sellerId ="${ordersExtend.sellerId}";
	var goodsName="${ordersExtend.goodsName}";
	var goodsPrice="${ordersExtend.goodsPrice}";
	var image="${ordersExtend.image}";
	var goodsDescrible="${ordersExtend.goodsDescrible}";
	var addressId = $("input[name='radio1']:checked").val();
		$.post("<%=basePath%>order/add", {
		"goodsId" : goodsId,
		"goodsPrice" : goodsPrice,
		"sellerId" : sellerId,
		"addressId": addressId
	},function(result) {
		if(result){
			alert("购买成功！");
			window.location.href="<%=basePath%>user/myorder";
			}else{
			alert("购买失败！");
		}
	}
	
		);
	
}

</script>
</body>
</html>