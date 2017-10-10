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
    <meta charset="UTF-8">
    <title>订单信息</title>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/emoji.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <link rel="stylesheet" href="<%=basePath%>css/order.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />

</head>
<body>
<div class="pre-2" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif" class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>goods/homeGoods" class="logo">
                <em class="em2">C2C</em>
            </a>
            <a href="<%=basePath%>user/home">
                <div class="home"></div>
            </a>
        </div>
        <!--
            作者：hlk_1135@outlook.com
            时间：2017-05-10
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
                <span class="name">${cur_user.username}</span>
                <span class="school">C2C</span>
                <span class="name">闲置数量：${cur_user.goodsNum}</span>
                <span class="fa fa-share-alt">"快去分享一下"</span>
            </div>
            <div class="home_nav">
                <ul>
                    <a href="">
                        <li class="notice">
                            
                            <span>我的消息</span>
                            <strong></strong>
                        </li>
                    </a>
                   <a href="<%=basePath%>collection/scList">
                        <li class="fri">
                            
                            <span>收藏列表</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/basic">
                        <li class="set">
                            
                            <span>个人设置</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>goods/publishGoods">
                        <li class="store">
                            
                            <span>发布物品</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allGoods">
                        <li class="second">
                            
                            <span>我的闲置</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/myorder">
                    <li class="myorder">
                            <span>我的订单</span>
                            <strong></strong>
                    </li>
                    </a>
                    <a href="<%=basePath%>user/address">
                    <li class="myadr">
                            <span>我的地址</span>
                            <strong></strong>
                            
                    </li>
                    </a>
                </ul>
            </div>
        </div>
        <!--
            作者：hlk_1135@outlook.com
            时间：2017-05-10
            描述：右侧内容区域
        -->
        <div id="user_content">
           <div class="">
	<div class="check-out" style="position: absolute;">
                <!--
                    作者：hlk_1135@outlook.com
                    时间：2017-05-11
                    描述：闲置商品展示
                -->
               <!--  <div class="share_content"> -->
                
		<!--<h1>Checkout</h1>-->
		<h2 style="margin-left: 100px;">确认订单信息</h2>
    	    <table style="margin-top: 5px;margin-left: 100px;width: 700px;" frame=hsides>
		  <tr>
			<th>${ordersExtend.goodsName}名称</th>
			<th style="width: 100px;">单价</th>
			<th style="width: 100px;">数量</th>		
			
			<th style="width: 100px;">实付款</th>
			<th>总计</th>
		  </tr>
		  <tr>
			<td class="ring-in"><a href="single.html" class="at-in">
			<img src="<%=basePath%>upload/${ordersExtend.image}" alt=""></a>
			
			<div class="clearfix"> </div>
			</td>
			<td>${ordersExtend.goodsPrice }3200</td>
			<td class="check">
			2
			<!-- <input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"> -->
			</td>		
			<td>${ordersExtend.goodsPrice }3200</td>
			
			<td>${ordersExtend.goodsPrice }</td>
			
		  </tr>
		  
	</table>
                    <%-- <c:if test="${empty collection}">
                        <div class="no_share">
                            <span>没有任何内容，去逛逛其它的吧！</span>
                        </div>
                    </c:if> --%>
                   <%-- <c:if test="${!empty collection}">
                        <c:forEach var="items" items="${collection}">
                            <div class="story">
                                <a href="<%=basePath%>goods/goodsId/${items.goodsid}" class="head_img">
                                    <img src="../upload/${ordersExtend.image}">
                                </a>
                                <span class="name">${ordersExtend.goodsName}</span>
                                <span class="text" style="overflow: hidden; outline: none;">${items.goods_describle}</span>
                                <div class="box">
                                    <div class="box_content">
                                        <div class="left_shadow"></div>
                                        <div class="left" index="1" style="display: none;"></div>
                                        <div class="right_shadow"></div>
                                        <div class="left" index="3" style="display: none;"></div>
                                        <img src="../upload/${ordersExtend.image}" index="2">
                                        <span class="com" style="display: none;left: 396.733px;"></span>
                                    </div>
                                    <div>
                                    	${ordersExtend.goodsPrice }
                                    	2
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if> --%>
                </div>
            </div>
          
            <div class="recommend" style="float: right;">
                <div class="title">
                    <span class="text">可能认识的人</span>
                    <span class="change">换一组</span>
                    <span class="underline"></span>
                </div>
                <ul>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo1.jpg">
                        </a>
                        <span>Brudce</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo2.jpg">
                        </a>
                        <span>Graham</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo3.jpg">
                        </a>
                        <span>策马奔腾hly</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo4.jpg">
                        </a>
                        <span>Danger-XFH</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo5.jpg">
                        </a>
                        <span>Keithw</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>