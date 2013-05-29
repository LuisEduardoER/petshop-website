<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--

	$(document).ready(function() {
		
		$(".file input[name='file']").bind("change", uploadFile);

		$(".file .del").bind("click",delFile);
		$(".file .view").bind("click",viewFile);
		
		$("#set3SubmitBtn").bind("click", function() {
			$ch = $(".file input[name='ch']");
			$en = $(".file input[name='en']");
			var ch = "";
			var chType = "";
			var en = "";
			var enType = "";
			if ($ch.length > 0 || $en.length > 0) {

				if ($ch.length > 0) {
					ch = $ch.val();
					chType = $ch.attr("contentType");
				}

				if ($en.length > 0) {
					en = $en.val();
					enType = $en.attr("contentType");
				}

				$.ajax({
					url : ctx+'/admin/set3/save',
					data : {
						gameId : $("#gameId").val(),
						ch : ch,
						chType : chType,
						en : en,
						enType : enType
					},
					type : 'post',
					dataType : 'json', 
					beforeSend : function(){
					},
					success : function(data) {
						if (data.result == "success") {
							alert("成功");
						} else if (data.result == "error") {
							alert("提交失败");
						} else {
							alert("信息丢失，请与管理员联系");
						}
					},
					error : function() {
						alert("error");
					}
				});
			}
		});

	});

	function uploadFile() {
		$td = $(this).closest("td");
		var options = {
				url : ctx + "/common/upload?type=2",
				dataType : "json",
				success : function(data) {
					if (data) {
						if (data.msg) {
							alert(data.msg);
						} else {
							var filePath = data.filePath;
							var contentType = data.contentType;
							if ($td.attr("id") == "chTd") {	
								$td.html('<input type="hidden" name="ch" contentType="'+contentType+'" value="'+filePath+'"/>${ctx}'+filePath + '&nbsp;<a class="del" href="javascript:void(0);">删除</a>&nbsp;<a class="view" href="javascript:void(0);">浏览</a>');
								$td.find(".view").bind("click",viewFile);
								$td.find(".del").bind("click",delFile);;
							} else {
								$td.html('<input type="hidden" name="en" contentType="'+contentType+'" value="'+filePath+'"/>${ctx}'+filePath + '&nbsp;<a class="del" href="javascript:void(0);">删除</a>&nbsp;<a class="view" href="javascript:void(0);">浏览</a>');
								$td.find(".view").bind("click",viewFile);
								$td.find(".del").bind("click",delFile);
							}
						}
					}
				}
			};
		$(this).closest("form").ajaxForm(options);
		$(this).closest("form").submit();
	}

	function delFile() {
		$td = $(this).closest("td");
		$input = $td.find("input");

		$.ajax({
			url : ctx+'/admin/set3/del',
			data : {
				gameId : $("#gameId").val(),
				chOrEn : $input.attr("name"),
				filePath :  $input.val()
			},
			type : 'post',
			dataType : 'json', 
			beforeSend : function(){
			},
			success : function(data) {
				if (data.result == "success") {
					$td.html('<form enctype="multipart/form-data" method="post" ><input type="file" name="file" /></form>').find("input[name='file']").bind("change", uploadFile);
				} else if (data.result == "error") {
					alert("提交失败");
				} else {
					alert("信息丢失，请与管理员联系");
				}
			}
		});
	}

	function viewFile() {
		$td = $(this).closest("td");
		$input = $td.find("input");
		var filePath = $input.val();
		window.open(ctx + '/admin/viewEvaluate?filePath='+filePath);
	}
//-->
</script>
<div class="set_pro_cont_box curr">
	<table id="set_pro_cont_table_03">
			<col width="150" />
			<col />
			<tbody>
			<tr>
				<td><input type="hidden" id="gameId" value="${gameId }"/>
					<strong>评测信息</strong>
				</td>
				<td class="file" id="chTd">
					<c:choose>
						<c:when test="${not empty evaluate.ch }">
							<input type="hidden" name="ch" contentType="${evaluate.chType }" value="${evaluate.ch }"/> ${ctx}${evaluate.ch}
							<a class="del" href="javascript:void(0);">删除</a>
							<a class="view" href="javascript:void(0);">浏览</a>
						</c:when>
						<c:otherwise>
							<form enctype="multipart/form-data" method="post" >
								<input type="file" name="file" />
							</form>
						</c:otherwise>
					</c:choose>
					
				</td>
			</tr>
			<tr>
				<td>
					<strong>评测信息（英）</strong>
				</td>
				<td class="file" id="enTd">
					<c:choose>
						<c:when test="${not empty evaluate.en}">
							<input type="hidden" name="en" contentType="${evaluate.enType }" value="${evaluate.en }"/> ${ctx}${evaluate.en}
							<a class="del" href="javascript:void(0);">删除</a>
							<a class="view" href="javascript:void(0);">浏览</a>
						</c:when>
						<c:otherwise>
							<form enctype="multipart/form-data" method="post" >
								<input type="file" name="file" />
							</form>
						</c:otherwise>
					</c:choose>
					
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="set_pro_cont_btn">
		<input type="button" id="set3SubmitBtn" value="确定" class="btn"/>
		<input type="reset" value="取消" class="btn"/>
</div>