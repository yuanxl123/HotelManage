﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- 包含公共的JSP代码片段 -->

<title>无线点餐平台</title>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="style/js/jquery.js"></script>
<script type="text/javascript" src="style/js/page_common.js"></script>
<link href="style/css/common_style_blue.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" href="style/css/index_1.css" />
<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- 页面标题 -->
	<div id="TitleArea">
		<div id="TitleArea_Head"></div>
		<div id="TitleArea_Title">
			<div id="TitleArea_Title_Content">
				<img border="0" width="13" height="13"
					src="style/images/title_arrow.gif" /> 餐厅订单列表
			</div>
		</div>
		<div id="TitleArea_End"></div>
	</div>

	<!-- 主内容区域（数据列表或表单显示） -->
	<div id="MainArea">
		<table class="MainArea_Content" align="center" cellspacing="0"
			cellpadding="0">
			<!-- 表头-->
			<thead>
				<tr align="center" valign="middle" id="TableTitle">
					<td>订单编号</td>
					<td>餐桌名</td>
					<td>下单日期</td>
					<td>总金额</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
			</thead>
			<!--显示数据列表 -->
			<tbody id="TableData">
				<c:if test="${orders!=null}">
					<c:forEach items="${orders}" var="o">
						<tr height="60">
							<td>${o.ordersId}</td>
							<td>${o.tableName}</td>
							<td>${o.orderDate}</td>
							<td>${o.totalPrice}</td>
							<td>${o.orderStatus==0?"未结帐":"已结帐"}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td><a href="orderDetail?ordersId=${o.ordersId}" class="FunctionButton">详细</a>

								<a href="changOrders?ordersId=${o.ordersId}" class="FunctionButton"
								onClick="return confirm('确定结帐？');">结账</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<!-- 其他功能超链接 -->
		<div id="TableTail" align="center"></div>
		<div class="FunctionButton">
				<a href="orderList?currentPage=1">首页</a>
		</div>
			<c:choose>
				<c:when test="${DcurrentPage>1}">
					<div class="FunctionButton">
						<a href="orderList?currentPage=${DcurrentPage-1}">上一页</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="FunctionButton">
						<a href="#">上一页</a>
					</div>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="1" end="${DtotalPage}" var="p">
				<c:choose>
					<c:when test="${p==DcurrentPage}">
						<div class="FunctionButton">
							<a href="orderList?currentPage=${p}"
								style="background: #FFF; border: #89bdd8 solid 1px; color: #067db5">${p}</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="FunctionButton">
							<a href="orderList?currentPage=${p}">${p}</a>
						</div>
					</c:otherwise>
				</c:choose>>
			</c:forEach>
			<c:choose>
				<c:when test="${DcurrentPage<DtotalPage}">
					<div class="FunctionButton">
						<a href="orderList?currentPage=${DcurrentPage+1}">下一页</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="FunctionButton">
						<a href="#">下一页</a>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="FunctionButton">
				<a href="orderList?currentPage=${DtotalPage}">尾页</a>
			</div>
	</div>
</body>
</html>
