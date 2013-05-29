<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<tr>
	<td>
		<input type="hidden" name="ids" value="#"></input>
		<select class="visb" name="types">
			<c:forEach items="${picTypes}" var="pt">
				<option value="${pt.key }">${pt.value }</option>
			</c:forEach>
		</select>
	</td>
	<td>
		<strong>图片名称（中）</strong><input type="text" name="chs" class="txtInput" />
	</td>
	<td>
		<strong>图片名称（英）</strong><input type="text" name="ens" class="txtInput" />
	</td>
	<td class="file">
		<form class="uploadpic-form" enctype="multipart/form-data" method="post" >
			<input type="button" value="浏览" class="uploadpic-button" />
            <input type="file" name="file" class="uploadpic-file" />
		</form>
	</td>
	<td>
		<a href="javascript:void(0);">删除</a>
	</td>
</tr>
