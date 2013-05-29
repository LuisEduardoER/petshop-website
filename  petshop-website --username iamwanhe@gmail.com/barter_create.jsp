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
			var titleCh = $.trim($("#titleChId").val());
			var titleEn = $.trim($("#titleEnId").val());
			var contentCh = $.trim($("#contentChId").val());
			var contentEn = $.trim($("#contentEnId").val());
			var sortNum = $.trim($("#sortNumId").val());

			var checkStatus = true;

			if (!isStringLengthValidated(titleCh, 1, 250)) {
				alert("轮播标题长度在1-250个字符");
				$("#titleChId").focus();
				return false;
			}
			if (!isStringLengthValidated(titleEn, 1, 250)) {
				alert("轮播标题（英）长度在1-250个字符");
				$("#titleEnId").focus();
				return false;
			}
			if (!isStringLengthValidated(contentCh, 1, 250)) {
				alert("轮播内容长度在1-250个字符");
				$("#contentChId").focus();
				return false;
			}
			if (!isStringLengthValidated(contentEn, 1, 250)) {
				alert("轮播内容（英）长度在1-250个字符");
				$("#contentEnId").focus();
				return false;
			}

			if (!isStringLengthValidated(sortNum, 1, 3)) {
				alert("排序数字为3位以为的整数");
				$("#sortNumId").focus();
				return false;
			}
			
			if (!isNumberValue(sortNum)) {
				alert("排序数字应为正整数");
				$("#sortNumId").focus();
				return false;
			}


			//判断上传文件
			
			$("input[type=file]").each(function() {
				if ($.trim($(this).val()) == "") {
					alert("请上传图片");
					$(this).focus();
					checkStatus = false;
					return false;
				}

				if (!checkFiles($.trim($(this).val()), "bmp,jpg,jpeg,png,gif")) {
					alert("仅支持图片文件上传");
					$(this).focus();
					checkStatus = false;
					return false;
				}
				
			});

		if (checkStatus) {
			var options = {
				url : ctx + "/admin/barter/save",
				dataType : "json",
				success : function(data) {
					if(data.result == "success") {
						window.location.href = ctx + "/admin/barter";						
					} else {
						alert("保存发生错误");
					}
				}
			};
			$("#barterFormId").ajaxForm(options);
			$("#barterFormId").submit();
		}
		
	});


		$(".chDel").live("click", function() {
			$(this).closest("span").html('<input type="file" name="fileCh" id="fileChId">');
		});

		$(".enDel").live("click", function() {
			$(this).closest("span").html('<input type="file" name="fileEn" id="fileEnId">');
		});
		
 });
</script>
</head>
<body>
<div class="wrapper">
	<div class="fix" id="cont">
		<c:import url="/admin/left?m=13"></c:import>
		<div id="lay_main">
			<form method="post" enctype="multipart/form-data" id="barterFormId">
				<input type="hidden" name="id" value="${barter.id }">
				<input type="hidden" name="status" value="${barter.status }">
				<dl class="creat_pro">
						<dd>
							<strong>轮播标题</strong>
							<input class="txtInput" type="text" name="titleCh" id="titleChId" value="${barter.titleCh }"/>
						</dd>
						<dd>
							<strong>轮播标题（英）</strong>
							<input class="txtInput" type="text" name="titleEn" id="titleEnId" value="${barter.titleEn }"/>
						</dd>
						<dd>
							<strong>轮播内容</strong>
							<input class="txtInput" type="text" name="contentCh" id="contentChId" value="${barter.contentCh }"/>
						</dd>
						<dd>
							<strong>轮播内容（英）</strong>
							<input class="txtInput" type="text" name="contentEn" id="contentEnId" value="${barter.contentEn }"/>
						</dd>
						<dd>
							<strong>图片上传</strong>
							<span path="${barter.picturePathCh }">
								<c:choose>
									<c:when test="${barter.picturePathCh != null}">
										<input type="hidden" name="picturePathCh" value="${barter.picturePathCh }" />
										<img src="${ctx }${barter.picturePathCh}" width="40px" height="40px"></img>
										<a href="javascript:void(0);" class="chDel">删除</a>
									</c:when>
									<c:otherwise>
										<input type="file" name="fileCh" id="fileChId">
									</c:otherwise>
								</c:choose>
							</span>
						</dd>
						<dd>
							<strong>图片上传（英）</strong>
							<span path="${barter.picturePathEn }">
								<c:choose>
									<c:when test="${barter.picturePathEn != null}">
										<input type="hidden" name="picturePathEn" value="${barter.picturePathEn }" />
										<img src="${ctx }${barter.picturePathEn}" width="40px" height="40px"></img>
										<a href="#" class="enDel">删除</a>
									</c:when>
									<c:otherwise>
										<input type="file" name="fileEn" id="fileEnId">
									</c:otherwise>
								</c:choose>
							</span>
						</dd>
						<dd>
							<strong>连接地址</strong>
							<input type="text" name="linkCh" id="linkChId" value="${barter.linkCh }">
						</dd>
						<dd>
							<strong>连接地址（英）</strong>
							<input type="text" name="linkEn" id="linkEnId" value="${barter.linkEn }">
						</dd>
						<dd>
							<strong>排序</strong>
							<input type="text" name="sortNum" id="sortNumId" value="${barter.sortNum }">
						</dd>
						
						<dt>
							<input type="button" id="submitBtn" value="确定"/>
							<input type="button" onclick="javascript:window.history.back();" value="返回"/>
							
						</dt>
				</dl>
			</form>
		</div>
	</div>
</div>
</body>
</html>