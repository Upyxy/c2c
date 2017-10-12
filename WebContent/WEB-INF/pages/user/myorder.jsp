<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单信息</title>
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/emoji.css" />
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />
<link rel="stylesheet" href="<%=basePath%>css/order.css" />
<link rel="stylesheet" href="<%=basePath%>css/index.css" />

</head>
<body>
	<div class="pre-2" id="big_img">
		<img
			src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif"
			class="jcrop-preview jcrop_preview_s">
	</div>
	<div id="cover" style="min-height: 639px;">
		<div id="user_area">
			<div id="home_header">
				<a href="<%=basePath%>goods/homeGoods" class="logo"> <em
					class="em2">C2C</em>
				</a> <a href="<%=basePath%>user/home">
					<div class="home"></div>
				</a>
			</div>
			<!--
            描述：左侧个人中心栏
        -->
			<div id="user_nav">
				<div class="user_info">
					<div class="head_img">
						<img src="<%=basePath%>img/photo.jpg">
					</div>
					<div class="big_headimg">
						<img src="">
					</div>
					<span class="name">${cur_user.username}</span> <span class="school">C2C</span>
					<span class="name">闲置数量：${cur_user.goodsNum}</span> <span
						class="fa fa-share-alt">"快去分享一下"</span>
				</div>
				<div class="home_nav">
					<ul>
						<a href="">
							<li class="notice"><span>我的消息</span> <strong></strong></li>
						</a>
						<a href="<%=basePath%>collection/scList">
							<li class="fri"><span>收藏列表</span> <strong></strong></li>
						</a>
						<a href="<%=basePath%>user/basic">
							<li class="set"><span>个人设置</span> <strong></strong></li>
						</a>
						<a href="<%=basePath%>goods/publishGoods">
							<li class="store"><span>发布物品</span> <strong></strong></li>
						</a>
						<a href="<%=basePath%>user/allGoods">
							<li class="second"><span>我的闲置</span> <strong></strong></li>
						</a>
						<a href="<%=basePath%>user/myorder">
							<li class="myorder"><span>我已购买</span> <strong></strong></li>
						</a>
						<a href="<%=basePath%>user/address">
							<li class="myadr"><span>我的地址</span> <strong></strong></li>
						</a>
					</ul>
				</div>
			</div>
			<!--
            描述：右侧内容区域
        -->
			<div id="user_content">
				<div class="">
					<div class="check-out" style="position: absolute;">
						<!--
                    描述：闲置商品展示
                -->
						<div class="ding">
							<h2 style="margin-left: 50px;">我已购买的商品的信息</h2>
							<table style="margin-top: 10px; margin-left: 50px; width: 900px;">
								<tr style="background-color: #d3eefc;">
									<th></th>
									<th style="width: 120px">名称</th>
									<th style="width: 300px">卖家描述</th>
									<th style="width: 70px">价格</th>
									<th style="width: 70px">数量</th>
									<th style="width: 120px">收货人电话</th>
									<th style="width: 100px">收货人</th>
									<th style="width: 420px">收货地址</th>
									<th style="width: 170px">状态</th>
								</tr>

								<c:forEach var="items" items="${orderList}">
									<tr>
										<td class="ring-in"><a href="single.html" class="at-in">
												<img src="<%=basePath%>upload/${items.image[0].imgUrl}"
												alt="">
										</a></td>
										<td>${items.goods[0].name}</td>
										<td>${items.goods[0].describle}</td>
										<td>${items.price}</td>
										<td>&nbsp;1</td>
										<td>${items.address[0].buyerPhone}</td>
										<td>${items.address[0].buyerName}</td>
										<td>${items.address[0].addressContent}</td>

										<td>正在发货....</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>