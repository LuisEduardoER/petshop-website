<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>我的美丽宠物店 - 后台管理</title>
<%@ include file="/common/admin/meta.jsp" %> 
<script type="text/javascript">
 	$(document).ready(function(){

		$("#submitBtn").bind("click",function(){
			$nameCh = $("#nameChId").val();
			$nameEn = $("#nameEnId").val();
			$firstChar = $("#firstCharId").val();
			if (!isStringLengthValidated($nameCh, 1, 50)) {
				alert("食品名称长度在1-50个字符");
				$("#nameChId").focus();
				return false;
			}

			if (!isStringLengthValidated($nameEn, 1, 50)) {
				alert("食品名称（英）长度在1-50个字符");
				$("#nameEnId").focus();
				return false;
			}
			if ($firstChar == "" || $firstChar.length != 1) {
				alert("首字母的应为1个字符");
				$("#firstCharId").focus();
				return false;
			}
			if (!/[a-zA-Z]/.test($firstChar)) {
				alert("首字母的应为英文字符");
				$("#firstCharId").focus();
				return false;
			}
			if (!isStringLengthValidated($("#commentChId").val(), 1, 4000)) {
				
				alert("食品简介长度在1-4000个字符");
				$("#commentChId").focus();
				return false;
			}
			if (!isStringLengthValidated($("#commentEnId").val(), 1, 4000)) {
				
				alert("食品简介（英）长度在1-4000个字符");
				$("#commentEnId").focus();
				return false;
			}

			var options = {
				url : "${ctx}/admin/foot/save",
				dataType : "json",
				success : function(data) {
					if(data.result == "success") {
						window.location.href = "${ctx}/admin/index";						
					} else {
						alert("保存发生错误");
					}
				}
			};
			$("#footFormId").ajaxForm(options);
			$("#footFormId").submit();
		});
 	 });
</script>
</head>
<body>
<div class="wrapper">
	<div class="fix" id="cont">
		<c:import url="/admin/left?m=2"></c:import>
		<div id="lay_main">
			<form method="get" id="footFormId">
				<input type="hidden" name="id" value="${foot.id }">
				<dl class="creat_pro">
						<dd><strong>食品名称</strong><input class="txtInput" type="text" name="nameCh" id="nameChId" value="${foot.nameCh }"/></dd>
						<dd><strong>食品名称（英）</strong><input class="txtInput" type="text" name="nameEn" id="nameEnId" value="${foot.nameEn }"/></dd>
						<dd><strong>首字母</strong><input class="txtInput" type="text" name="firstChar" id="firstCharId" value="${foot.firstChar }"/></dd>
			
						<dd>
							<strong>食品简介</strong>
							<textarea id="commentChId" name="commentCh" >${foot.commentCh }</textarea>
						</dd>
						<dd>
							<strong>食品简介（英）</strong>
							<textarea id="commentEnId" name="commentEn" >${foot.commentEn }</textarea>
						</dd>
						<dt>
							<input type="button" id="submitBtn" value="确定"/>
							<input type="reset" value="取消"/>
						</dt>
				</dl>
			</form>
		</div>
	</div>
</div>
</body>
</html>