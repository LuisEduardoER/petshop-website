 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
 <div class="focus">
 	<ul class="image-box">
 		<c:forEach items="${barters}" var="barter">
 			<li>
 				<a target="_blank" href="${barter.linkEn }">
 					<img width="655px" height="376px" src="<c:url value="${barter.picturePathEn }" />" />
 				</a>
 			</li>
 		</c:forEach>
     </ul>
     <div class="img-info">
         <p class="img-info-title"></p>
         <p class="img-info-desc"></p>
     </div>
     <div class="img-thumb">
     <ul class="fix">
     	<c:forEach items="${barters}" var="barter">
	         <li info="${barter.titleEn }|${barter.contentEn}">
	         	<a href="${barter.linkEn }">
	         		<img src="<c:url value="${barter.picturePathEn }" />" />
	         	</a>
	         </li>
     	</c:forEach>
     </ul>
     </div>
     <div class="img-dot"></div>
     <div class="img-bg"></div>
     <div class="img-prev"></div>
     <div class="img-next"></div>
 </div>
 <div class="">Welcome to my pet food house</div>