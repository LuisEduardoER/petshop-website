<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
 <div class="focus">
 	<ul class="image-box">
 		<c:forEach items="${barters}" var="barter">
 			<li>
 				<a target="_blank" href="${barter.linkCh }">
 					<img width="655px" height="376px" src="<c:url value="${barter.picturePathCh }" />" />
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
	         <li info="${barter.titleCh }|${barter.contentCh}">
	         	<a href="${barter.linkCh }">
	         		<img src="<c:url value="${barter.picturePathCh }" />" />
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
 <div></div>
 <div></div>
 <div></div>
 <div class="">欢迎来到我的宠物食品店王国</div>