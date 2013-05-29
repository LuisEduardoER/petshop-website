<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dl class="aside_menu">
	<dt><strong>账号管理</strong></dt>
    <dd>
        <a href="<c:url value="/ch/mu/password" />">密码修改</a>
    </dd>
    <dt><strong>账号管理</strong></dt>
    <dd>
    	<a href="<c:url value="/ch/mu/user/foot/collect" />">产品收藏</a><br>
        <a href="<c:url value="/ch/foot/compare" />">产品比较</a>
    </dd>
    <dt><strong><a href="<c:url value="/ch/mu/user/message" />">预约联系<c:if test="${unreadCount != null && unreadCount > 0}">(<font color="red">${unreadCount }</font>)</c:if></a></strong></dt>
</dl>