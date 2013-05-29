<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="rank">
   	<div class="rank_title">
   		<div class="rank_tab">
       	</div>
   	</div>
    <div class="rank_content">
    
       <table class="rank_table">
	       	<tr>
	       		<th class="r1">排名</th>
	           <th class="r2">产品名称</th>
	        </tr>
	        <c:forEach items="${recommends}" var="recommend" varStatus="vs">
	        	<tr <c:if test="${vs.index%2 == 0}">class="bg"</c:if>>
		           	<td><span class="num n${vs.index+1 }"></span></td>
		           	<td><p title="${recommend.nameCh }"><a href="<c:url value='/ch/content?footId=${recommend.id }' />">${recommend.nameCh }</a></p></td>
	           	</tr>
	        </c:forEach>
       </table>
       
   </div>
</div>
   
