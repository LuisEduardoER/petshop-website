<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dl class="aside_menu">
	<dt><strong>Account management</strong></dt>
    <dd>
        <a href="<c:url value="/en/mu/password" />">Change password</a>
    </dd>
    <dt><strong>Products management</strong></dt>
    <dd>
    	<a href="<c:url value="/en/mu/user/foot/collect" />">Collect products</a><br>
        <a href="<c:url value="/en/foot/compare" />">Compare products</a>
    </dd>
    <dt><strong><a href="<c:url value="/en/mu/user/message" />">Message<c:if test="${unreadCount != null && unreadCount > 0}">(<font color="red">${unreadCount }</font>)</c:if></a></strong></dt>
</dl>