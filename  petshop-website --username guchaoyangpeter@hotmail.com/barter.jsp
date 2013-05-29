<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>我的美丽宠物店 - 后台管理</title> 
<%@ include file="/common/admin/meta.jsp" %>

<script type="text/javascript">

	$(document).ready(function() {

		//新建
		$("#createId").click(function() {
			window.location.href = ctx + "/admin/barter/create";
		});
			


		//发布
		$(".pub").live("click", function() {
			var $this = $(this);
			var $tr = $this.closest("tr");
			var barterId = $tr.attr("barterId");
			$.ajax({
				url : ctx+"/admin/barter/publish",
				data : {
					barterId : barterId
				},
				type : 'post',
				dataType : 'json', 
				beforeSend : function(){
				},
				success : function(data) {
					if (data.result == "success") {
						$this.removeClass("pub").addClass("unpub").text("取消发布");
						$tr.find(".pc").text("已发布");
					} else {
						alert("发布失败");
					}
				}
			});
		});


		//取消发布
		$(".unpub").live("click", function() {
			var $this = $(this);
			var $tr = $this.closest("tr");
			var barterId = $tr.attr("barterId");
			$.ajax({
				url : ctx+"/admin/barter/unpublish",
				data : {
					barterId : barterId
				},
				type : 'post',
				dataType : 'json', 
				beforeSend : function(){
				},
				success : function(data) {
					if (data.result == "success") {
						$this.removeClass("unpub").addClass("pub").text("发布");
						$tr.find(".pc").text("未发布");
					} else {
						alert("取消发布失败");
					}
				}
			});
		});


		//删除
		$(".del").click(function() {

			if (confirm("确认删除？")) {
				var $this = $(this);
				var $tr = $this.closest("tr");
				var barterId = $tr.attr("barterId");
				$.ajax({
					url : ctx+"/admin/barter/del",
					data : {
						barterId : barterId
					},
					type : 'post',
					dataType : 'json', 
					beforeSend : function(){
					},
					success : function(data) {
						if (data.result == "success") {
							$tr.next("tr").remove();
							$tr.remove();
						} else {
							alert("删除失败");
						}
					}
				});
			}
			
			
			
		});


		
	});
	

</script>
</head>
<body>
	<div class="wrapper">
		<div class="fix" id="cont">
			<c:import url="/admin/left?m=13"></c:import>
			<div id="lay_main">
				<div class="search">
					<button id="createId">新建</button>
				</div>
	
				<div class="list_pro">
			
						<div class="list_pro_table">
								<table style="word-break:break-all;" width="100%">
									<col width="150" />
									<col width="230" />
									<col width="50" />
									<col width="150" />
									<col width="50" />
									<col width="50" />
									<col/>
									<col  />
									<thead>
										<tr>
											<th>轮播标题</th>
											<th>轮播内容</th>
											<th>图片</th>
											<th>连接地址</th>
											<th>后台状态</th>
											<th>排序</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${barters}" var="barter" varStatus="vs"> 
											<tr class="<c:if test="${vs.index%2==0 }">bg</c:if>" barterId="${barter.id }"> 
												<td>${barter.titleCh }</td>
												<td>${barter.contentCh }</td>
												<td><img width="40px" height="40px" src="${ctx }${barter.picturePathCh}"></img></td>
												<td>${barter.linkCh }</td>
												<td rowspan="2" class="pc">
													<c:if test="${barter.status == 0}">未发布</c:if>
													<c:if test="${barter.status == 1}">已发布</c:if>
												</td>
												<td rowspan="2">${barter.sortNum }</td>
												<td rowspan="2">
													<c:if test="${barter.status == 0}"><a href="javascript:void(0);" class="pub">发布</a>|</c:if>
													<c:if test="${barter.status == 1}"><a href="javascript:void(0);" class="unpub">取消发布</a>|</c:if>
													<a href="${ctx }/admin/barter/create?barterId=${barter.id}">修改|</a>
													<a href="javascript:void(0);" class="del">删除</a>
												</td>
											</tr>
											<tr class="<c:if test="${vs.index%2==0 }">bg</c:if>">
												<td>${barter.titleEn }</td>
												<td>${barter.contentEn }</td>
												<td><img width="40px" height="40px" src="${ctx }${barter.picturePathEn}"></img></td>
												<td>${barter.linkEn }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<p class="page">
									<c:if test="${!empty commonList && commonList.pageNum>1 }">
										<g:page commonList="${commonList}"  uri="${ctx}/admin/barter" target="#lay_main" pageNum="5" model="12" />  
									</c:if>
								</p>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>