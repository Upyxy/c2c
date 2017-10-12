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
    <title>地址信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
	<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
	<link href="<%=basePath%>css/city-picker.css" rel="stylesheet">
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
            描述：左侧个人中心栏
        -->
        <div id="user_nav">
            <div class="user_info">
                <div class="head_img">
                    <img src="<%=basePath%>img/photo.jpg">
                </div>
                <div class="big_headimg">
                    <img src="<%=basePath%>img/findfun.png">
                </div>
                <span class="name">${cur_user.username}</span>
                <span class="school">C2C</span>
                <span class="name">闲置数量：${cur_user.goodsNum}</span>
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
                            <span>我已购买</span>
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
            描述：右侧内容区域
        -->
        <div id="user_content">
            <div class="basic">
            <h2 class="page-header">新增地址</h2>
			<div class="docs-methods">
				<form class="form-inline" action="<%=basePath%>address/add" method="post">
					<div id="distpicker">
						<div style="float: left;font-size: 15px;">所&nbsp;在&nbsp;地&nbsp;区：</div>
						<div class="form-group">
							<div style="position: relative;">
								<input id="city-picker3" class="form-control" readonly="readonly"  type="text" name="address1" value="请选择" data-toggle="city-picker"/>
							</div>
						</div>
					</div>
					<div class="adr">
				<div class="adr1">详&nbsp;细&nbsp;地&nbsp;址：</div>
				<textarea rows="2" cols="40" name="address2">
				</textarea>
					</div>
					<div class="aname">
						收货人姓名：<input type="text" name="buyerName"/>
					</div>
					<div class="phone">
						电&nbsp;话&nbsp;号&nbsp;码：<input type="text" name="buyerPhone"/>
					</div>
					<div class="baocun">
						<input type="submit" value="保存" />
					</div>
					
				</form>
			</div>
			
			<!-- 地址列表 -->
            <div class="adList">
            	<h5>已保存地址</h5>
            	<table>
            		<tr>
            			<th style="width: 90px;">收货人</th>
            			<th style="width:350px">详细地址</th>
            			<th>电话号码</th>
            			<th>操作</th>
            		</tr>
            		<c:forEach var="items" items="${addressList}" >
            		<tr>
            			<td>${items.buyerName}</td>
            			<td>${items.addressContent }</td>
            			<td>${items.buyerPhone}</td>
            			<td>
<!--             				<button type="button">修改</button> -->
            				<button type="button" onclick="deletes(${items.id})">删除</button>
            			</td>
            		</tr>
            		</c:forEach>
            	</table>
            </div>
            </div>
            
            
            <!--描述：最右侧，可能认识的人-->
            <div class="recommend">
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
	<script src="<%=basePath%>js/jquery.js"></script>
		<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/city-picker.data.js"></script>
		<script src="<%=basePath%>js/city-picker.js"></script>
	<script src="<%=basePath%>js/main.js"></script>
	<script type="text/javascript">
	function deletes(addressId){
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
	</script>
</body>
</html>