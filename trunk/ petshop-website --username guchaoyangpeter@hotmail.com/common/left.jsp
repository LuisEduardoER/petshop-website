<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags" %>
<div id="lay_side">
	<dl class="nav_manage disbk">
		<dt>食品管理</dt>
		<dd class="<c:if test='${m==1 }'>curr</c:if>">
			<a href="<c:url value='/admin/index'></c:url>">食品查询</a>
		</dd>
		<dd class="<c:if test='${m==2 }'>curr</c:if>">
			<a href="<c:url value='/admin/create'></c:url>">添加食品</a>
		</dd>
		<dd class="<c:if test='${m==3 }'>curr</c:if>">
			<a href="<c:url value='/admin/project'></c:url>">食品类别管理</a>
		</dd>
		
		<dt>预约管理</dt>
		<dd class="<c:if test='${m==7 }'>curr</c:if>">
			<a href="<c:url value='/admin/message/user'></c:url>">预约管理</a>
		</dd>
		<dt>轮播管理</dt>
		<dd class="<c:if test='${m==13 }'>curr</c:if>">
			<a href="<c:url value='/admin/barter'></c:url>">轮播</a>
		</dd>
	</dl>
</div>

