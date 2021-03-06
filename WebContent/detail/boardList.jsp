﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
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
	$(document).ready(function() {
	})
</script>
</head>
<body>
	<!-- 页面标题 -->
	<div id="TitleArea">
		<div id="TitleArea_Head"></div>
		<div id="TitleArea_Title">
			<div id="TitleArea_Title_Content">
				<img border="0" width="13" height="13"
					src="style/images/title_arrow.gif" /> 餐桌列表
			</div>
		</div>
		<div id="TitleArea_End"></div>
	</div>
	<!-- 过滤条件 -->
	<div id="QueryArea">
		<form action="Dinner" method="post">
			<input type="hidden" name="method" value="search"> <input
				type="text" name="keyword" value="${name}" title="请输入餐桌名称">
			<input type="submit" value="搜索">
		</form>
	</div>
	<!-- 主内容区域（数据列表或表单显示） -->
	<div id="MainArea">
		<table class="MainArea_Content" cellspacing="0" cellpadding="0">
			<!-- 表头-->
			<thead>
				<tr align="center" valign="middle" id="TableTitle">
					<td>编号</td>
					<td>桌名</td>
					<td>状态</td>
					<td>预定时间</td>
					<td>操作</td>
				</tr>
			</thead>
			<!--显示数据列表 -->
			<tbody id="TableData">
				<c:if test="${list!=null}">
					<c:forEach items="${list}" var="d" varStatus="v">
						<tr class="TableDetail1">
							<td align="center">${d.tableId}&nbsp;</td>
							<td align="center">${d.tableName}&nbsp;</td>
							<td align="center">${d.tableStatus==0?"空闲":"预定"}</td>
							<td align="center">${d.orderDate}</td>
							<td><c:if test="${d.tableStatus==0}">
									<a href="#" class="FunctionButton"
										onclick="return confirm('餐桌处于空闲状态不可退')">退桌</a>
								</c:if> <c:if test="${d.tableStatus==1}">
									<a href="returnTable?tableId=${d.tableId}"
										class="FunctionButton">退桌</a>
								</c:if> <a href="deleteTable?tableId=${d.tableId}"
								onClick="return delConfirm();" class="FunctionButton">删除</a></td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>

		<!-- 其他功能超链接 -->
		<div id="TableTail" align="center">
			<div class="FunctionButton">
				<a href="saveBoard.jsp">添加</a>
			</div>
			<div class="FunctionButton">
				<a href="Dinner?currentPage=1">首页</a>
			</div>
			<c:choose>
				<c:when test="${DcurrentPage>1}">
					<div class="FunctionButton">
						<a href="Dinner?currentPage=${DcurrentPage-1}">上一页</a>
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
							<a href="Dinner?currentPage=${p}"
								style="background: #FFF; border: #89bdd8 solid 1px; color: #067db5">${p}</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="FunctionButton">
							<a href="Dinner?currentPage=${p}">${p}</a>
						</div>
					</c:otherwise>
				</c:choose>>
			</c:forEach>
			<c:choose>
				<c:when test="${DcurrentPage<DtotalPage}">
					<div class="FunctionButton">
						<a href="Dinner?currentPage=${DcurrentPage+1}">下一页</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="FunctionButton">
						<a href="#">下一页</a>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="FunctionButton">
				<a href="Dinner?currentPage=${DtotalPage}">尾页</a>
			</div>
		</div>
	</div>
</body>
</html>
