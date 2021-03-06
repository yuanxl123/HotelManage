﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- 包含公共的JSP代码片段 -->

<title>无线点餐平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="style/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="style/js/page_common.js"></script>
<link href="style/css/common_style_blue.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" href="style/css/index_1.css" />
<link href="style/css/index.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#msg {
	position: fixed;
	top: 300px;
	right: 35px;
	z-index: 10000;
	width: 1px;
	height: 52px;
	line-height: 52px;
	font-size: 20px;
	text-align: center;
	color: #fff;
	background: #360;
	display: none
}
</style>
<script src="style/js/fly/jquery.fly.min.js"></script>
<script type="text/javascript">
	function addFood(node) {
		var foodId = node.lang;
		$(function() {
			$.ajax({
				type : "POST",
				url : "addFoodByShopping",
				data : {
					"foodId" : foodId
				},
				success : function() {
					var $node = $(node)
					var offset = $("#end").offset();
					var img = $node.parent().parent().find('img').attr('src');
					console.log(img)
					var flyer = $('<img class="u-flyer" src="'+img+'">');
					flyer.fly({
						start : {
							left : node.offsetLeft, //开始位置（必填）#fly元素会被设置成position: fixed 
							top : node.offsetTop
						//开始位置（必填） 
						},
						end : {
							left : offset.left + 10, //结束位置（必填） 
							top : offset.top + 10, //结束位置（必填） 
							width : 0, //结束时宽度 
							height : 0//结束时高度 
						},
						onEnd : function() { //结束回调 
							$("#msg").show().animate({
								width : '250px'
							}, 200).fadeOut(1000); //提示信息 
						}
					});
				}
			});
		});
	}
</script>
</head>
<body style="text-align: center">
	<div id="all">
		<div id="menu">
			<!-- 显示菜品的div -->
			<div id="top">
				<ul>
					<!-- 循环列出餐品 -->
					<c:if test="${foodList!=null}">
						<c:forEach items="${foodList}" var="fd">
							<li>
								<dl>
									<dt>
										<a href="foodInfor?foodId=${fd.foodId}"> <img
											width="214px" height="145px" src="../upload/${fd.img}" />
										</a>
									</dt>
									<dd class="f1">
										<a href="foodInfor?foodId=${fd.foodId}">${fd.foodName}</a>
									</dd>
									<dd class="f2">
										&nbsp;&nbsp;<a href="foodInfor?foodId=${fd.foodId}">&yen;${fd.price}</a>
										<img id="shoppingcar" lang="${fd.foodId}"
											onclick="addFood(this)"
											style="width: 20px; height: 20px; float: right; margin-right: 20px"
											src="style/images/购物车.png">
									</dd>
								</dl>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>

			<!-- 底部分页导航条div -->
			<c:if test="${type==0}">
				<div id="foot">
					<span
						style="float: left; line-height: 53PX; margin-left: -50px; font-weight: bold;">
						<span style="font-weight: bold"> <c:choose>
								<c:when test="${FFcurrentPage>1}">
									<a href="menus?FFcurrentPage=${FFcurrentPage-1}">&lt;&lt;</a>
								</c:when>
								<c:otherwise>
									<a href="#">&lt;&lt;</a>
								</c:otherwise>
							</c:choose>
					</span>
					</span>
					<div id="btn">
						<ul>
							<!-- 参看 百度, 谷歌是 左 5 右 4 -->
							<c:forEach begin="1" end="${FFtotalPage}" var="p">
								<c:choose>
									<c:when test="${p==FFcurrentPage}">
										<li><a href="menus?FFcurrentPage=${p}"
											style="color: #067db5">${p}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="menus?FFcurrentPage=${p}">${p}</a></li>
									</c:otherwise>
								</c:choose>
					</c:forEach>
						</ul>
					</div>
					<span
						style="float: right; line-height: 53px; margin-right: 10px; font-weight: bold;">
						<c:choose>
							<c:when test="${FFcurrentPage<FFtotalPage}">
								<a href="menus?FFcurrentPage=${FFcurrentPage+1}">&gt;&gt;</a>
							</c:when>
							<c:otherwise>
								<a href="#">&gt;&gt;</a>
							</c:otherwise>
						</c:choose>

					</span>
				</div>
			</c:if>
			<c:if test="${type==1}">
				<div id="foot">
					<span
						style="float: left; line-height: 53PX; margin-left: -50px; font-weight: bold;">
						<span style="font-weight: bold"> <c:choose>
								<c:when test="${FFcurrentPage>1}">
									<a href="menusByType?FFcurrentPage=${FFcurrentPage-1}">&lt;&lt;</a>
								</c:when>
								<c:otherwise>
									<a href="#">&lt;&lt;</a>
								</c:otherwise>
							</c:choose>
					</span>
					</span>
					<div id="btn">
						<ul>
							<!-- 参看 百度, 谷歌是 左 5 右 4 -->
							<c:forEach begin="1" end="${FFtotalPage}" var="p">
								<c:choose>
									<c:when test="${p==FFcurrentPage}">
										<li><a href="menusByType?FFcurrentPage=${p}"
											style="color: #067db5">${p}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="menusByType?FFcurrentPage=${p}">${p}</a></li>
									</c:otherwise>
								</c:choose>
					</c:forEach>
						</ul>
					</div>
					<span
						style="float: right; line-height: 53px; margin-right: 10px; font-weight: bold;">
						<c:choose>
							<c:when test="${FFcurrentPage<FFtotalPage}">
								<a href="menusByType?FFcurrentPage=${FFcurrentPage+1}">&gt;&gt;</a>
							</c:when>
							<c:otherwise>
								<a href="#">&gt;&gt;</a>
							</c:otherwise>
						</c:choose>

					</span>
				</div>
			</c:if>
		</div>

		<!-- 右边菜系列表，菜品搜索框  -->
		<div id="dish_class">
			<i id="end"></i>
			<div id="dish_top">
				<ul>
					
					<li><a href="cart"> <img src="style/images/call01.png" />
					</a></li>

				</ul>
				<div id="msg">已成功加入菜单！</div>
			</div>

			<div id="dish_2">
				<input id="btn_top" type="button" value="上一页"
					style="background: none"> <input id="currentPage"
					name="当前页" type="hidden" value="${FTcurrentPage}" /> <input
					id="totalPage" name="总页数" type="hidden" value="${FTtotalPage}" />
				<ul id="typeList">
					<c:if test="${ftl!=null }">
						<c:forEach items="${ftl}" var="ft">
							<li><a
								href="menusByType?foodtypeid=${ft.foodtypeid}&&key=${null}&&FFcurrentPage=1&&type=1">${ft.typename}</a></li>
						</c:forEach>
					</c:if>
				</ul>
				<input id="btn_foot" type="button" value="下一页"
					style="background: none">
			</div>
			<div id="dish_3">
				<!-- 搜索菜品表单  -->
				<form action="menus" method="post">
					<table width="166px">
						<tr>
							<td><input type="text" id="dish_name" name="key"
								class="select_value" /> </td>
						</tr>
						<tr>
							<td><input type="submit" id="sub" value="" /></td>
						</tr>
						<tr>
							<td><a href="menus?key=${null}&&type=0"> <img
									src="style/images/look01.png" />
							</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

	</div>
</body>
</jsp>