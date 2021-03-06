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
<link rel="stylesheet" type="text/css" href="style/css/dis_message.css" />
</head>
<body style="text-align: center">
	<div id="all">
		<!--左边菜品详细信息 -->
		<div id="menu1">
			<div class="menu2" style="text-align: center;">
				<img src="style/images/order_detials_bg.png" />
			</div>
			<div class="menu3">
				<div class="menu3_left">
					<img src="../upload/${sFood.img}"
						style="width: 270px; height: 290px;" />
				</div>
				<div class="menu3_right">
					<c:if test="${sFood!=null}">
						<p>菜名:${sFood.foodName}</p>
						<p>价格:&nbsp;&nbsp;&yen;&nbsp;${sFood.price}</p>
						<p>简介:${sFood.remark}</p>
					</c:if>
				</div>
			</div>
			<div class="menu4">
				<a href="clientCart?foodId=${sFood.foodId}"
					style="background: url(style/css/img/order_left_corner_bg.png);">放入餐车</a>
				<a href="#" onclick="javascript:history.go(-1);"
					style="background: url(style/css/img/order_right_corner_bg.png);">返回</a>
			</div>
		</div>

		<!-- 右边菜系列表，菜品搜索框  -->
		<div id="dish_class">
			<div id="dish_top">
				<ul>
					<li><a href="cart"> <img
							src="style/images/call01.png" />
					</a></li>
				</ul>
			</div>

			<div id="dish_2">
			<input id="btn_top" type="button" value="上一页" style="background:none">
			<input id="currentPage" name="当前页" type="hidden" value="${FTcurrentPage}"/>
			<input id="totalPage"name="总页数" type="hidden" value="${FTtotalPage}"/>
				<ul id="typeList">
					<c:if test="${ftl!=null }">
						<c:forEach items="${ftl}" var="ft">
							<li><a
								href="menusByType?foodtypeid=${ft.foodtypeid}&&key=${null}&&FFcurrentPage=1&&type=1">${ft.typename}</a></li>
						</c:forEach>
					</c:if>
				</ul>
				<input id="btn_foot"  type="button" value="下一页" style="background:none">
			</div>
			<div id="dish_3">
				<!-- 搜索菜品表单  -->
				<form action="menus" method="post">
				<table width="166px">
						<tr>
							<td><input type="text" id="dish_name" name="key"
								class="select_value" value="${foodName}"/> 
								<input type="hidden" value="selectFood"
								name="method"></td>
						</tr>
						<tr>
							<td><input type="submit" id="sub" value="" name="f"/></td>
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
</html>
