<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="hotnews">
	<ul class="hotnews_text">
		<c:forEach items="${imps}" var="imp">
			<li class="top">
               	<p class="title"><a target="_blank" href="<c:url value="/ch/news?newsId=${imp.id}" />">${imp.titleCh }</a></p>
                   <p class="subtitle">${imp.subTitle1Ch }</p>
               	<p class="link">
                   	${imp.subTitle2Ch }
                   </p>
               </li>
		</c:forEach>
		<c:forEach items="${unimps}" var="unimp">
			<li>
				<a target="_blank" href="<c:url value="/ch/news?newsId=${unimp.id}" />">${unimp.titleCh }</a>
				<c:if test="${unimp.isNew==1}">
					<span class="new"></span>
				</c:if>
			</li> 
		</c:forEach>
		<li class="more"><a href="<c:url value="/ch/news/list" />">更多&gt;&gt;</a></li>
    </ul>    
</div>