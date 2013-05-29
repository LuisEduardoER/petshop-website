<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
   
 <!-- 单个留言 -->
<div class="msg_item" messageId="${message.id }">
	<div class="msg_row msg_topic">
    	<div class="msg"><span class="user">${message.publishUser.account }：</span>${message.messageContent } </div>
        <div class="time"><fmt:formatDate value="${message.createTime}" pattern="yyyy-MM-dd HH:mm"/></div>
    </div>
    <div class="msg_reply">
    	<div class="msg_input">
            <input type="text" class="pt" name="replyContent"/><input type="button" class="btn_msg_reply" />
        </div>
    </div>
</div>