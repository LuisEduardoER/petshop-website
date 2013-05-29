<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>我的美丽宠物店 - 后台管理</title>
<%@ include file="/common/admin/meta.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		var footId = $("#footId").val();
		$("#btn_set_01").bind("click", function() {
			window.location = ctx + '/admin/set1?footId=' + footId;
		});	

		$("#btn_set_02").bind("click", function() {
			$.post(ctx + '/admin/set2',{
				footId : footId
			}, function(html) {
				if (html) {
					$("div").find("h3").removeClass('curr');
					$("#btn_set_02").addClass('curr');
					$(".includeSpan").empty().html(html);
				} else {
					alert("加载基本信息页面错误");
				}
			}
			);
		});	

	$("#btnId").bind("click",function(){

		var checkStatus = true;

		if (checkStatus) {
			$("select[name=selectInfoIds]").each(function(i,v) {
				if ($(this).val() == "0") {
					alert("请选择" + $("input[name=selectTypeIds]:eq("+i+")").closest("td").find("strong").text());
					$(this).focus();
					checkStatus = false;
					return false;
				}
			});
		}

		if (checkStatus) {
			var options = {
				url :  ctx+"/admin/set1/save",
				dataType : "json",
				beforeSend : function(){
				},
				success : function(data) {
					if (data) {
						if (data.result == "success") {
							alert("设置成功");
						} else {
							alert("设置失败");
						}
					}
				}
			};
			$("#set1FormId").ajaxForm(options);
			$("#set1FormId").submit();
		}
	});
		
	});

</script>
</head>
<body>
<div class="wrapper">
	<div class="fix" id="cont">
		<c:import url="/admin/left?m=1"></c:import>
		<div id="lay_main">
			<div class="set_pro_tit fix">
				<h1>食品名称：
					<strong class="pro_name_cn"><a href="${ctx}/admin/create?footId=${foot.id}">${foot.nameCh }</a></strong>
					<strong class="pro_name_en"><a href="${ctx}/admin/create?footId=${foot.id}">${foot.nameEn }</a></strong>
					<input type="hidden" id="footId" value="${foot.id }" />
				</h1>
				<p><span>食品备注：</span>${foot.comment}</p>
			</div>
			<div class="set_pro_cont">
				<h3 class="curr" id="btn_set_01">基本信息上传</h3>
				<h3 id="btn_set_02">图片信息上传</h3>
				<div class="includeSpan">
					<div class="set_pro_cont_box curr">
						<form method="post" id="set1FormId">
							<input type="hidden" name="footId" value="${foot.id }" />
							<table id="set_pro_cont_table_01">
								<col width="100" />
								<col  />
								<c:forEach items="${selectTypes}" var="selectType">
									<tr>
										<td><strong>${selectType.nameCh }：</strong><input type="hidden" name="selectTypeIds" value="${selectType.id }"></input></td>
										<td>
											<select class="visb" name="selectInfoIds">
												<option value="0">-选择-</option>
												<c:forEach items="${selectType.infos}" var="info">
													<option value="${info.id }" <c:if test="${selectType.footSelectId==info.id }">selected</c:if> >${info.selectInfoCh }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
								</c:forEach>
								
							</table>
						</form>
						</div>
						<div class="set_pro_cont_btn">
							<input type="button" value="确定" id="btnId" class="btn" />
							<input type="reset" value="取消" class="btn"/>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>