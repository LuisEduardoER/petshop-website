<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<td><input type="checkbox" disabled="disabled"/></td>
	<td class="op_name">
		<p>
			<input type="text" value="${selectType.nameCh }" disabled="disabled" class="txtInput" />
			<input type="text" value="${selectType.nameEn }" disabled="disabled" class="txtInput" />
			<input type="hidden" value="${selectType.id }" class="typeHiddenId">
		</p>
	</td>
	<td class="op_cont">
		<c:forEach items="${selectType.infos}" var="selectInfo">
			<p>
				<input type="text" value="${selectInfo.selectInfoCh }" disabled="disabled" class="txtInput" />
				<input type="text" value="${selectInfo.selectInfoEn }" disabled="disabled" class="txtInput" />
				<input type="hidden" value="${selectInfo.id }" class="infoHiddenId">
			</p>
		</c:forEach>
	</td>
	<td><button disabled="disabled">添加</button></td>
	<td class="op_sort"><input type="text" value="${selectType.sortNum }" disabled="disabled" class="txtInput" /></td>
	<td><a href="javascript:void(0);">修改</a></td>
<td><a href="javascript:void(0);">删除</a></td>