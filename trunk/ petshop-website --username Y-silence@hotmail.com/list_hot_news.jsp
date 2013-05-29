<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ include file="/common/taglibs.jsp" %>
<div class="box323">
	<div class="box323_hd">热点新闻：</div>
    <div class="box323_bd">
    	<ul class="mod_newlist">

			<c:forEach items="${hotNews}" var="hotNew">
	        	<li><a href="${ctx }/ch/news?newsId=${hotNew.id}">${hotNew.titleCh }</a></li>
			</c:forEach>
        </ul>
    </div>
</div>