<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>我的美丽宠物店 - 后台管理</title>
<%@ include file="/common/admin/meta.jsp" %> 
<script type="text/javascript">
	$(document).ready(function() {
		$("#addTextBtnId").bind("click", function() {
			$this = $(this);
			$.post(ctx + '/admin/addTextItem',
				{}, 
				function(html) {
					if (html) {
						$this.parents('tfoot').siblings('tbody').append(html);
					}
				});
		});

		
	});
	
</script>
</head>
<body>
<div class="wrapper">
	<div class="fix" id="cont">
		<c:import url="/admin/left?m=3"></c:import>
		<div id="lay_main">
			<div class="list_pro_op list_pro_sele">
			<h6 class="tit">选项类</h6>
				<table>
					<col width="46" />
					<col width="150" />
					<col width="400" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<thead>
						<tr>
							<th>必填</th>
							<th>选项名称</th>
							<th>内容</th>
							<th>&nbsp;</th>
							<th>排序</th>
							<th colspan="2">操作</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${selectTypes}" var="selectType">
							<tr>
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
							</tr>
						</c:forEach>
						

					</tbody>
					<tfoot>
						<tr>
							<td colspan="7">
								<button>添加选项类</button>
							</td>
						</tr>
					</tfoot>

				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>