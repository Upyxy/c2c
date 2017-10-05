<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="<%=basePath%>css/order.css" rel="stylesheet" type="text/css" media="all" />	
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<!--header-->
<div class="user_area">
 <div id="home_header" style="margin-left: 100px;">
            <a href="<%=basePath%>goods/homeGoods" class="logo">
                <em class="em2">C2C</em>
            </a>
            <a href="<%=basePath%>user/home">
                <div class="home"></div>
            </a>
        </div>
       </div>
<!--订单信息-->
<div class="container">
	<div class="check-out">
		<!--<h1>Checkout</h1>-->
		<h4 class="h4">确认订单信息</h4>
    	    <table style="margin-top: 25px;" frame=hsides>
		  <tr>
			<th style="float: left;margin-left: 10px;">${ordersExtend.goodsName}</th>
			<th>数量</th>		
			<th>价格</th>
			<th>商品描述</th>
			<th>总计</th>
		  </tr>
		  <tr>
			<td class="ring-in"><a href="single.html" class="at-in"><img src="<%=basePath%>upload/${ordersExtend.image}" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5></h5>
				<p> </p>
			
			</div>
			<div class="clearfix"> </div></td>
			<td class="check"><input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		
			<td>${ordersExtend.goodsPrice }</td>
			<td>${ordersExtend.goodsDescrible }</td>
			<td>${ordersExtend.goodsPrice }</td>
			
		  </tr>
		  
		  
		  
	</table>
	<a href="#" class=" to-buy" onclick="add()" >购买</a>
	<div class="clearfix"> </div>
    </div>
</div>
<script type="text/javascript">
function add() {
	var goodsId ="${ordersExtend.goodsId}";
	var sellerId ="${ordersExtend.sellerId}";
	var goodsName="${ordersExtend.goodsName}";
	var goodsPrice="${ordersExtend.goodsPrice}";
	var image="${ordersExtend.image}";
	var goodsDescrible="${ordersExtend.goodsDescrible}";
	
	$.post("<%=basePath%>order/add", {
		"goodsId" : goodsId,
		"goodsPrice" : goodsPrice,
		"sellerId" :sellerId
	});
	
}


</script>
</body>
</html>