<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
    <table class="product-paramlist">
	<c:if test="${!empty selectRelations}">
		<c:forEach items="${selectRelations}" var="select">
            <tr>
            	<td class="product-param-key">${select.selectType.nameEn }</td>
                <td>${select.selectInfo.selectInfoEn }</td>
            </tr>
		</c:forEach>
	</c:if>
	

	<c:if test="${!empty textRelations}">
		<c:forEach items="${textRelations}" var="text">
			<tr>
            	<td class="product-param-key">${text.textInfo.nameEn }</td>
                <td>${text.en }</td>
            </tr>
		</c:forEach>
	</c:if>
    </table>