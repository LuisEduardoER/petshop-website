<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="product-piclist">
	<c:choose>
		<c:when test="${!empty pictures}">
			<c:forEach items="${pictures}" var="picture">
				<li>
                	<p class="desc">${picture.nameCh }</p>
					<a class="pic" href="javascript:void(0);"><img src="<c:url value="${ctx }${picture.path }"/>" /></a>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="no-content">暂无游戏图片</div>
		</c:otherwise>
	</c:choose>
	
</ul>