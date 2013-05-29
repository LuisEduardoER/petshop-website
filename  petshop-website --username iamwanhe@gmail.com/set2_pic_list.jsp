<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>

<c:forEach items="${pictures}" var="picture">
	<tr>
		<td>
			<input type="hidden" name="ids" value="${picture.id }"></input>
			<select class="visb" name="types">
				<c:forEach items="${picTypes}" var="pt">
					<option value="${pt.key }" <c:if test="${picture.type==pt.key }">selected</c:if>> ${pt.value }</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<strong>图片名称（中）</strong><input type="text" name="chs" value="${picture.nameCh }" class="txtInput" />
		</td>
		<td>
			<strong>图片名称（英）</strong><input type="text" name="ens" value="${picture.nameEn }" class="txtInput" />
		</td>
		<td class="file">
			<input type="hidden" name="paths" value="${picture.path }"/>
			<img alt="" src="${ctx }${picture.path }" width="40px" height="40px">
		</td>
		<td>
			<a href="javascript:void(0);">删除</a>
		</td>
	</tr>
</c:forEach>
