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
<meta charset="utf-8" />
<title>c2c</title>
<%--     <link rel="shortcut icon" href="<%=basePath%>img/favicon.ico"/> --%>
<%--     <link rel="bookmark" href="<%=basePath%>img/favicon.ico"/> --%>
<link rel="stylesheet" href="../css/index.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/materialize.min.js"></script>
<script type="text/javascript" src="../js/index.bundle.js"></script>
<link rel="stylesheet" href="../css/materialize-icon.css" />
<link rel="stylesheet" href="../css/user.css" />
<link rel="stylesheet" href="../css/style.css" />
<script>
	function showLogin() {

		if ($("#signup-show").css("display") == 'block') {
			$("#signup-show").css("display", "none");
		}
		if ($("#login-show").css("display") == 'none') {
			$("#login-show").css("display", "block");
		} else {
			$("#login-show").css("display", "none");
		}
	}
	function showSignup() {
		if ($("#login-show").css("display") == 'block') {
			$("#login-show").css("display", "none");
		}
		if ($("#signup-show").css("display") == 'none') {
			$("#signup-show").css("display", "block");
		} else {
			$("#signup-show").css("display", "none");
		}
	}
	function ChangeName() {
		if ($("#changeName").css("display") == 'none') {
			$("#changeName").css("display", "block");
		} else {
			$("#changeName").css("display", "none");
		}
	}
</script>
<body ng-view="ng-view">
	<!--
    描述：顶部
-->
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
						<!-- 系统信息推送 -->
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
	<!--
    描述：登录
-->
	<div ng-controller="loginController" class="ng-scope">
		<div id="login-show" class="login stark-components">
			<div class="publish-box z-depth-4">
				<div class="row">
					<a onclick="showLogin()">
						<div class="col s12 title"></div>
					</a>
					<form:form action="../user/login" method="post" commandName="user"
						role="form">
						<div class="input-field col s12">
							<input type="text" name="phone" required="required"
								pattern="^1[0-9]{10}$"
								class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
							<label>手机</label>
						</div>
						<div class="input-field col s12">
							<input type="password" name="password" required="required"
								class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
							<label>密码</label> <a ng-click="showForget()" class="forget-btn">忘记密码？</a>
						</div>
						<button type="submit"
							class="waves-effect waves-light btn login-btn red lighten-1">
							<i class="iconfont left"></i> <em>登录</em>
						</button>
						<div class="col s12 signup-area">
							<em>没有账号？赶快</em> <a onclick="showSignup()" class="signup-btn">注册</a>
							<em>吧！</em>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!--
    描述：注册
-->
	<div ng-controller="signupController" class="ng-scope">
		<div id="signup-show" class="signup stark-components">
			<div class="publish-box z-depth-4">
				<div class="row">
					<a onclick="showSignup()">
						<div class="col s12 title"></div>
					</a>
					<form:form action="../user/addUser" method="post"
						commandName="user" role="form">
						<div class="input-field col s12">
							<input type="text" name="username" required="required"
								class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
							<label>昵称</label>
						</div>
						<div class="input-field col s12">
							<input type="text" name="phone" required="required"
								pattern="^1[0-9]{10}$"
								class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
							<label>手机</label>
						</div>
						<div class="input-field col s12">
							<input type="password" name="password" required="required"
								class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
							<label>密码</label>
						</div>
						<div ng-show="checkTelIsShow" class="col s12">
							<button type="submit"
								class="waves-effect waves-light btn verify-btn red lighten-1">
								<i class="iconfont left"></i> <em>点击注册</em>
							</button>
						</div>
						<div ng-show="checkTelIsShow" class="login-area col s12">
							<em>已有账号？去</em> <a onclick="showLogin()">登录</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!--更改用户名-->
	<div ng-controller="changeNameController" class="ng-scope">
		<div id="changeName" class="change-name stark-components">
			<div class="publish-box z-depth-4">
				<div class="row">
					<div class="col s12 title">
						<h1>修改用户名</h1>
					</div>
					<form:form action="../user/changeName" method="post"
						commandName="user" role="form">
						<div class="input-field col s12">
							<input type="text" name="username" required="required"
								class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
							<label>修改用户名</label>
						</div>
						<div ng-show="checkTelIsShow" class="col s12">
							<button
								class="waves-effect waves-light btn publish-btn red lighten-1">
								<i class="iconfont left"></i> <em>确认</em>
							</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!--
    描述：左侧导航条
-->
	<div ng-controller="sidebarController"
		class="sidebar stark-components ng-scope">
		<li ng-class="{true: 'active'}[isAll]"><a
			href="../goods/catelog/1" class="index"> <em>最新发布</em>
		</a></li>
		<li ng-class="{true: 'active'}[isDigital]"><a
			href="../goods/catelog/1" class="digital"> <em>闲置数码</em>
		</a></li>
		<li ng-class="{true: 'active'}[isRide]"><a
			href="../goods/catelog/2" class="ride"> <em>校园代步</em>
		</a></li>
		<li ng-class="{true: 'active'}[isCommodity]"><a
			href="../goods/catelog/3" class="commodity"> <em>电器日用</em>
		</a></li>
		<li ng-class="{true: 'active'}[isBook]"><a
			href="../goods/catelog/4" class="book"> <em>图书教材</em>
		</a></li>
		<li ng-class="{true: 'active'}[isMakeup]"><a
			href="../goods/catelog/5" class="makeup"> <em>美妆衣物</em>
		</a></li>
		<li ng-class="{true: 'active'}[isSport]"><a
			href="../goods/catelog/6" class="sport"> <em>运动棋牌</em>
		</a></li>
		<li ng-class="{true: 'active'}[isSmallthing]"><a
			href="../goods/catelog/7" class="smallthing"> <em>票券小物</em>
		</a></li>
		<div class="info">
			<a href="" target="_blank">关于我们</a><em>-</em> <a href="">联系我们</a>
		</div>
	</div>
	<!--
    描述：右侧显示部分
-->
	<div class="main-content">
		<!--
        作者：hlk_1135@outlook.com
        时间：2017-05-05
        描述：轮播
    -->
		<div class="slider-wapper">
			<div class="content">
				<div class="slide" id="slide">
					<div class="img-div">
						<img src="<%=basePath%>img/l2.jpg" /> <img
							src="<%=basePath%>img/l1.jpg" /> <img
							src="<%=basePath%>img/l3.jpg" />
					</div>
					<div class="slide-btn">
						<a href="#" class="hover">●</a> <a href="#">●</a> <a href="#">●</a>
					</div>
				</div>
			</div>
		</div>
		<!--
        描述：最新发布
    -->
		<div class="index-title">
			<a href="">最新发布</a>
			<hr class="hr1">
			<hr class="hr2">
		</div>
		<div class="waterfoo stark-components row">
			<div class="item-wrapper normal">
				<c:forEach var="item" items="${catelogGoods1}">
					<div class="card col">
						<a href="<%=basePath%>goods/goodsId/${item.goods.id}">
							<div class="card-image"
								style="background:url(../upload/${item.images[0].imgUrl});background-size: 280px 280px;background-repeat: no-repeat;">
								<c:if test="${item.goods.good_status ==3}">
									<img src="../img/c2c.png">
								</c:if>
							</div>
							<div class="card-content item-price">
								<c:out value="${item.goods.price}"></c:out>
							</div>
							<div class="card-content item-name">
								<p>
									<c:out value="${item.goods.name}"></c:out>
								</p>
							</div>
							<div class="card-content item-location">
								<p>C2C</p>
								<p>
									<c:out value="${item.goods.startTime}"></c:out>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!--
        描述：闲置数码
    -->
		<div class="index-title">
			<a href="">闲置数码</a>
			<hr class="hr1">
			<hr class="hr2">
		</div>
		<div class="waterfoo stark-components row">
			<div class="item-wrapper normal">
				<c:forEach var="item" items="${catelogGoods1}">

					<div class="card col">
						<a href="<%=basePath%>goods/goodsId/${item.goods.id}">
							<div class="card-image"
								style="background:url(../upload/${item.images[0].imgUrl});background-size: 280px 280px;background-repeat: no-repeat;">
								<c:if test="${item.goods.good_status ==3}">
									<img src="../img/c2c.png">
								</c:if>
							</div>
							<div class="card-content item-price">
								<c:out value="${item.goods.price}"></c:out>
							</div>
							<div class="card-content item-name">
								<p>
									<c:out value="${item.goods.name}"></c:out>
								</p>
							</div>
							<div class="card-content item-location">
								<p>C2C</p>
								<p>
									<c:out value="${item.goods.startTime}"></c:out>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!--
        描述：校园代步
    -->
		<div class="index-title">
			<a href="">校园代步</a>
			<hr class="hr1">
			<hr class="hr2">
		</div>
		<div class="waterfoo stark-components row">
			<div class="item-wrapper normal">
				<c:forEach var="item" items="${catelogGoods2}">
					<div class="card col">
						<a href="<%=basePath%>goods/goodsId/${item.goods.id}">
							<div class="card-image"
								style="background:url(../upload/${item.images[0].imgUrl});background-size: 280px 280px;background-repeat: no-repeat;">
								<c:if test="${item.goods.good_status ==3}">
									<img src="../img/c2c.png">
								</c:if>
							</div>
							<div class="card-content item-price">
								<c:out value="${item.goods.price}"></c:out>
							</div>
							<div class="card-content item-name">
								<p>
									<c:out value="${item.goods.name}"></c:out>
								</p>
							</div>
							<div class="card-content item-location">
								<p>C2C</p>
								<p>
									<c:out value="${item.goods.startTime}"></c:out>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="index-title">
			<a href="">电器日用</a>
			<hr class="hr1">
			<hr class="hr2">
		</div>
		<div class="waterfoo stark-components row">
			<div class="item-wrapper normal">
				<c:forEach var="item" items="${catelogGoods3}">
					<div class="card col">
						<a href="<%=basePath%>goods/goodsId/${item.goods.id}">
							<div class="card-image"
								style="background:url(../upload/${item.images[0].imgUrl});background-size: 280px 280px;background-repeat: no-repeat;">
								<c:if test="${item.goods.good_status ==3}">
									<img src="../img/c2c.png">
								</c:if>
							</div>
							<div class="card-content item-price">
								<c:out value="${item.goods.price}"></c:out>
							</div>
							<div class="card-content item-name">
								<p>
									<c:out value="${item.goods.name}"></c:out>
								</p>
							</div>
							<div class="card-content item-location">
								<p>C2C</p>
								<p>
									<c:out value="${item.goods.startTime}"></c:out>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="index-title">
			<a href="">图书教材</a>
			<hr class="hr1">
			<hr class="hr2">
		</div>
		<div class="waterfoo stark-components row">
			<div class="item-wrapper normal">
				<c:forEach var="item" items="${catelogGoods4}">
					<div class="card col">
						<a href="<%=basePath%>goods/goodsId/${item.goods.id}">
							<div class="card-image"
								style="background:url(../upload/${item.images[0].imgUrl});background-size: 280px 280px;background-repeat: no-repeat;">
								<c:if test="${item.goods.good_status ==3}">
									<img src="../img/c2c.png">
								</c:if>
							</div>
							<div class="card-content item-price">
								<c:out value="${item.goods.price}"></c:out>
							</div>
							<div class="card-content item-name">
								<p>
									<c:out value="${item.goods.name}"></c:out>
								</p>
							</div>
							<div class="card-content item-location">
								<p>C2C</p>
								<p>
									<c:out value="${item.goods.startTime}"></c:out>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="index-title">
			<a href="">美妆衣物</a>
			<hr class="hr1">
			<hr class="hr2">
		</div>
		<div class="waterfoo stark-components row">
			<div class="item-wrapper normal">
				<c:forEach var="item" items="${catelogGoods5}">
					<div class="card col">
						<a href="<%=basePath%>goods/goodsId/${item.goods.id}">
							<div class="card-image"
								style="background:url(../upload/${item.images[0].imgUrl});background-size: 280px 280px;background-repeat: no-repeat;">
								<c:if test="${item.goods.good_status ==3}">
									<img src="../img/c2c.png">
								</c:if>
							</div>
							<div class="card-content item-price">
								<c:out value="${item.goods.price}"></c:out>
							</div>
							<div class="card-content item-name">
								<p>
									<c:out value="${item.goods.name}"></c:out>
								</p>
							</div>
							<div class="card-content item-location">
								<p>C2C</p>
								<p>
									<c:out value="${item.goods.startTime}"></c:out>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="index-title">
			<a href="">运动棋牌</a>
			<hr class="hr1">
			<hr class="hr2">
		</div>
		<div class="waterfoo stark-components row">
			<div class="item-wrapper normal">
				<c:forEach var="item" items="${catelogGoods6}">
					<div class="card col">
						<a href="<%=basePath%>goods/goodsId/${item.goods.id}">
							<div class="card-image"
								style="background:url(../upload/${item.images[0].imgUrl});background-size: 280px 280px;background-repeat: no-repeat;">
								<c:if test="${item.goods.good_status ==3}">
									<img src="../img/c2c.png">
								</c:if>
							</div>
							<div class="card-content item-price">
								<c:out value="${item.goods.price}"></c:out>
							</div>
							<div class="card-content item-name">
								<p>
									<c:out value="${item.goods.name}"></c:out>
								</p>
							</div>
							<div class="card-content item-location">
								<p>C2C</p>
								<p>
									<c:out value="${item.goods.startTime}"></c:out>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="index-title">
			<a href="">票券小物</a>
			<hr class="hr1">
			<hr class="hr2">
		</div>
		<div class="waterfoo stark-components row">
			<div class="item-wrapper normal">
				<c:forEach var="item" items="${catelogGoods7}">
					<div class="card col">
						<a href="<%=basePath%>goods/goodsId/${item.goods.id}">
							<div class="card-image"
								style="background:url(../upload/${item.images[0].imgUrl});background-size: 280px 280px;background-repeat: no-repeat;">
								<c:if test="${item.goods.good_status ==3}">
									<img src="../img/c2c.png">
								</c:if>
							</div>
							<div class="card-content item-price">
								<c:out value="${item.goods.price}"></c:out>
							</div>
							<div class="card-content item-name">
								<p>
									<c:out value="${item.goods.name}"></c:out>
								</p>
							</div>
							<div class="card-content item-location">
								<p>C2C</p>
								<p>
									<c:out value="${item.goods.startTime}"></c:out>
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var zBase = {
			config : {
				index : 0,
				auto : true,
				direct : 'left'
			},
			init : function() {
				this.slide = this.$id('slide');
				this.img_div = this.$c('img-div')[0], this.slide_btn = this
						.$tag('a', this.$c('slide-btn')[0]);
				this.img_arr = this.$tag('img', this.img_div);
				if (this.config.auto)
					this.play();
				this.hover();
			},
			$id : function(id) {
				return document.getElementById(id);
			},
			$tag : function(tagName, obj) {
				return (obj ? obj : document).getElementsByTagName(tagName);
			},
			$c : function(claN, obj) {
				var tag = this.$tag('*'), reg = new RegExp('(^|\\s)' + claN
						+ '(\\s|$)'), arr = [];
				for (var i = 0; i < tag.length; i++) {
					if (reg.test(tag[i].className)) {
						arr.push(tag[i]);
					}
				}
				return arr;
			},
			$add : function(obj, claN) {
				reg = new RegExp('(^|\\s)' + claN + '(\\s|$)');
				if (!reg.test(obj.className)) {

					obj.className += ' ' + claN;
				}
			},
			$remve : function(obj, claN) {
				var cla = obj.className, reg = "/\\s*" + claN + "\\b/g";
				obj.className = cla ? cla.replace(eval(reg), '') : ''
			},
			css : function(obj, attr, value) {

				if (arguments[2] != null) {
					console.log(value);
					obj.style[attr] = value;
				} else {
					return typeof window.getComputedStyle != 'undefined' ? window
							.getComputedStyle(obj, null)[attr]
							: obj.currentStyle[attr];
				}
			},
			animate : function(obj, attr, val) {
				var d = 1000;//动画时间一秒完成。
				if (obj[attr + 'timer'])
					clearInterval(obj[attr + 'timer']);
				var start = parseInt(zBase.css(obj, attr));//动画开始位置
				//space = 动画结束位置-动画开始位置，即动画要运动的距离。
				var space = val - start, st = (new Date).getTime(), m = space > 0 ? 'ceil'
						: 'floor';
				obj[attr + 'timer'] = setInterval(function() {
					var t = (new Date).getTime() - st;//表示运行了多少时间，
					if (t < d) {//如果运行时间小于动画时间
						var offset = Math[m](zBase.easing['easeOut'](t, start,
								space, d))
								+ 'px';
						zBase.css(obj, attr, offset);
					} else {
						clearInterval(obj[attr + 'timer']);
						zBase.css(obj, attr, val + 'px');
					}
				}, 20);
			},
			play : function() {
				this.slide.timer = setInterval(function() {
					zBase.config.index++;
					if (zBase.config.index >= zBase.img_arr.length)
						zBase.config.index = 0;//如果当前索引大于图片总数，把索引设置0

					zBase.animate(zBase.img_div, zBase.config.direct,
							-zBase.config.index * 900);
					for (var j = 0; j < zBase.slide_btn.length; j++) {
						zBase.$remve(zBase.slide_btn[j], 'hover');
					}
					zBase.$add(zBase.slide_btn[zBase.config.index], 'hover');

				}, 3000)

			},
			hover : function() {
				for (var i = 0; i < this.slide_btn.length; i++) {
					this.slide_btn[i].index = i;//储存每个导航的索引值
					this.slide_btn[i].onmouseover = function() {
						if (zBase.slide.timer)
							clearInterval(zBase.slide.timer);
						zBase.config.index = this.index;

						for (var j = 0; j < zBase.slide_btn.length; j++) {
							zBase.$remve(zBase.slide_btn[j], 'hover');
						}
						zBase
								.$add(zBase.slide_btn[zBase.config.index],
										'hover');
						zBase.animate(zBase.img_div, zBase.config.direct,
								-zBase.config.index * 900);
					}
					this.slide_btn[i].onmouseout = function() {
						zBase.play();
					}
				}
			},
			easing : {
				linear : function(t, b, c, d) {
					return c * t / d + b;
				},
				swing : function(t, b, c, d) {
					return -c / 2 * (Math.cos(Math.PI * t / d) - 1) + b;
				},
				easeIn : function(t, b, c, d) {
					return c * (t /= d) * t * t * t + b;
				},
				easeOut : function(t, b, c, d) {
					return -c * ((t = t / d - 1) * t * t * t - 1) + b;
				},
				easeInOut : function(t, b, c, d) {
					return ((t /= d / 2) < 1) ? (c / 2 * t * t * t * t + b)
							: (-c / 2 * ((t -= 2) * t * t * t - 2) + b);
				}
			}
		}

		zBase.init();
	</script>

</body>
</html>