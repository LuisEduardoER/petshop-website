<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--
	$(document).ready(function(){

		$("#submitBtnId").bind("click", function() {
			var checkstatus = true;
			$(".tbody").find("tr").each(function(){
				if (!isStringLengthValidated($(this).find("input[name='chs']").val(), 1, 8)) {
					alert("图片中文名称长度在18个字符之内");
					$(this).find("input[name='chs']").focus();
					checkstatus = false;
					return false;
				}
				if (!isStringLengthValidated($(this).find("input[name='ens']").val(), 1, 50)) {
					alert("图片英文名称长度在1-50个字符");
					$(this).find("input[name='ens']").focus();
					checkstatus = false;
					return false;
				}

				if ($(this).find(".file input[name='file']").length != 0) {
					alert("请上传图片");
					$(this).find(".file input[name='file']").focus();
					checkstatus = false;
					return false;
				}
			});

			if (checkstatus) {
				var options = {
						url : ctx + "/admin/set2/save",
						success : function(html) {
							if (html) {
								alert("成功");
								$(".tbody").html(html);
							} else {
								alert("保存出错");
							}
						}
					};
				$("#set2FormId").ajaxForm(options);
				$("#set2FormId").submit();	
			}
			
		});
		
		$("#addPicBtnId").bind("click", function() {
			$.post(ctx + '/admin/addPic',{
			}, function(html) {
				if (html) {
					$(".tbody").append(html);
					$(".tbody").find(".file input[name='file']:last").bind("change", uploadPic);
				}
			}
			);	
		});
	});

	function uploadPic() {
		$td = $(this).closest("td");
		var options = {
				url : ctx + "/common/upload?type=1",
				dataType : "json",
				success : function(data) {
					if (data) {
						if (data.msg) {
							alert(data.msg);
						} else {
							var filePath = data.filePath;
							$td.html('<input type="hidden" name="paths" value="'+filePath+'"/><img alt="" src="${ctx }'+filePath+'" width="40px" height="40px">');
						}
					}
				}
			};
		$(this).closest("form").ajaxForm(options);
		$(this).closest("form").submit();
	}
//-->
</script>

<div class="set_pro_cont_box curr">
	<form method="post" id="set2FormId">
	<input type="hidden" name=footId value="${footId }"></input>
	<table id="set_pro_cont_table_02">
		<col width="80" />
		<col width="200" />
		<col width="200" />
		<col width="60" />
		<col width="40"/>
		<tbody class="tbody">
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
		</tbody>
		<tfoot>
		<tr>
			<td colspan="5">
				<input type="button" class="btn" value="添加图片" id="addPicBtnId" />
			</td>
		</tr>
		</tfoot>
	</table>
	</form>
</div>

<div class="set_pro_cont_btn">
	<input type="button" value="确定" id="submitBtnId" class="btn"/>
	<input type="reset" value="取消" class="btn"/>
</div>