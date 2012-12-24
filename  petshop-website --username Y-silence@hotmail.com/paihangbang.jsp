<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="rank">
  <div class="rank_title">
  </div>
  <div class="rank_content">
  
  	<table class="rank_table">
	        <tr>
		        <th class="r1">Ranking</th>
		        <th class="r2">Foot name</th>
		      </tr>
	        <c:forEach items="${recommends}" var="recommend" varStatus="vs">
	        	<tr <c:if test="${vs.index%2 == 0}">class="bg"</c:if>>
		           	<td><span class="num n${vs.index+1 }"></span></td>
		           	<td><p title="${recommend.nameEn }"><a href="<c:url value='/en/content?gameId=${recommend.id }' />">${recommend.nameEn }</a></p></td>
	           	</tr>
	        </c:forEach>
       </table>
       
  </div>
</div>
