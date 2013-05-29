<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="msg_row">
	<div class="msg"><span class="user red">${reply.replyUser.account }：</span>${reply.replyContent }</div>
    <div class="time"><fmt:formatDate value="${reply.replyTime}" pattern="yyyy年MM月dd日 HH:mm"/></div>
</div>
