<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--
$(document).ready(function() {

	$(".list_pro_sort a").bind("click", function() {
		$this = $(this);
		$(".list_pro_sort a").removeClass('curr');
		$this.addClass('curr');
		formSubmit();
	});

	$("#searchId").bind("click", formSubmit);

	function formSubmit() {
		$.post(ctx + '/admin/foot/list',{
			c: $(".list_pro_sort .curr").text(),
			keyWord : $("#keyWord").val()
		}, function(html) {
			if (html) {
				$("#lay_main").html(html);
			} else {
				$("#lay_main").html("加载列表出错");
			}
		});
	}

	//单个删除  -->
	$(".del").bind("click", function() {
		$tr = $(this).closest("tr");
		if (confirm("确认删除"))
		$.post(ctx + '/admin/foot/del',{
			c: $(".list_pro_sort .curr").text(),
			keyWord : $("#keyWord").val(),
			footId : $tr.attr("footId")
		}, function(html) {
			if (html) {
				$("#lay_main").html(html);
			} else {
				$("#lay_main").html("加载列表出错");
			}
		});
	});

	//单个发布 -->
	$(".publish").bind("click", function() {
		$tr = $(this).closest("tr");
		if (confirm("确认发布"))
		$.post(ctx + '/admin/foot/publish',{
			c: $(".list_pro_sort .curr").text(),
			keyWord : $("#keyWord").val(),
			footId : $tr.attr("footId")
		}, function(html) {
			if (html) {
				$("#lay_main").html(html);
			} else {
				$("#lay_main").html("加载列表出错");
			}
		});
	});

	//单个取消发布 -->
	$(".unpublish").bind("click", function() {
		$tr = $(this).closest("tr");
		if (confirm("确认取消发布"))
		$.post(ctx + '/admin/foot/unpublish',{
			c: $(".list_pro_sort .curr").text(),
			keyWord : $("#keyWord").val(),
			footId : $tr.attr("footId")
		}, function(html) {
			if (html) {
				$("#lay_main").html(html);
			} else {
				$("#lay_main").html("加载列表出错");
			}
		});
	});

	//批量删除 -->
	$("#batchDel").bind("click", function() {
		 if(!checkSelect()){
       		return false;
        }
		if (confirm("确认删除")) {
			var options = {
				url : ctx + "/admin/foot/batchDel",
				data : {
					c: $(".list_pro_sort .curr").text(),
					keyWord : $("#keyWord").val()
				},
				success : function(html) {
					if (html) {
						$("#lay_main").empty().html(html);
					} else {
						$("#lay_main").html("加载列表出错");
					}
				}
			};
			$("#queryform").ajaxForm(options);
			$("#queryform").submit();	
		}
	});


	//批量发布 -->
	$("#batchPublish").bind("click", function() {
		 if(!checkSelect()){
       		return false;
        }
		if (confirm("确认批量发布")) {
			var options = {
				url : ctx + "/admin/foot/batchPublish",
				data : {
					c: $(".list_pro_sort .curr").text(),
					keyWord : $("#keyWord").val()
				},
				success : function(html) {
					if (html) {
						$("#lay_main").empty().html(html);
					} else {
						$("#lay_main").html("加载列表出错");
					}
				}
			};
			$("#queryform").ajaxForm(options);
			$("#queryform").submit();	
		}
	});

	//推荐设置
	$(".recommend").click(function() {
		var footId = $(this).closest("tr").attr("footId");
		var recommendStatus = false;
		if ($(this).is(":checked") == true) {
			recommendStatus = true;
		} 
		$.ajax({
			url : ctx+"/admin/foot/recommend",
			data : {
				footId : footId,
				recommendStatus : recommendStatus
			},
			type : 'post',
			dataType : 'json', 
			success : function(data) {
				
				if (data.result == "success") {
					if (recommendStatus) {
						alert("推荐设置成功");	
					} else {
						alert("取消推荐成功");	
					}
				} else {
					alert("推荐设置失败");	
				}
			}
		});
	});


	//新品设置
	$(".new").click(function() {
		var footId = $(this).closest("tr").attr("footId");
		var newStatus = false;
		if ($(this).is(":checked") == true) {
			newStatus = true;
		} 
		$.ajax({
			url : ctx+"/admin/foot/new",
			data : {
				footId : footId,
				newStatus : newStatus
			},
			type : 'post',
			dataType : 'json', 
			success : function(data) {
				
				if (data.result == "success") {
					if (newStatus) {
						alert("新品设置成功");	
					} else {
						alert("取消新品设置成功");	
					}
				} else {
					alert("新品设置失败");	
				}
			}
		});
	});

	
});

	function checkSelect(){
	    if(!isAnyNamedBoxSelected(document.getElementById("queryform"),"footIds")){
			alert("至少选择一项！")
	        return false;
		}
		return true;
	}
	
	//反选
	function checks() {
	    var items = document.getElementsByName('footIds');
	    if (items.length > 0) {
	        for (var i = 0; i < items.length; i++) {
	            items[i].checked = document.getElementById("checkall").checked;
	        }
	    }
}

//-->
</script>

	<div class="search">
		<strong>食品名称及编号搜索</strong>
		<input type="text" id="keyWord" value="${keyWord }" class="txtInput" />
		<button id="searchId">查询</button>
	</div>

	<div class="list_pro">

<p class="list_pro_sort">
	<a id="all" href="javascript:void(0);" <c:if test="${c=='ALL' }">class='curr'</c:if>>ALL</a>
	<c:forEach items="${chars}" var="char">
		<a href="javascript:void(0);" <c:if test="${char==c }">class='curr'</c:if>>${char }</a>
	</c:forEach>
</p>
<div class="list_pro_table">
	<form action="" method="post" id="queryform">
		<table style="word-break:break-all;" width="100%">
			<col width="20" />
			<col width="60" />
			<col width="60" />
			<col width="50" />
			<col width="100" />
			<col width="60" />
			<col width="100" />
			<col width="100" />
			<col width="100" />
			<col  />
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th>推荐设置</th>
					<th>新品设置</th>
					<th>首字母</th>
					<th>食品名称</th>
					<th>食品编号</th>
					<th>发布状态</th>
					<th>更新时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${foots}" var="foot">
					<tr footId="${foot.id }"> 
						<td><input type="checkbox" name="footIds" value="${foot.id }"/></td>
						<td><input type="checkbox" class="recommend" <c:if test="${foot.isRecommend==1 }">checked</c:if> /></td>
						<td><input type="checkbox" class="new" <c:if test="${foot.isNew==1 }">checked</c:if> /></td>
						<td>${foot.firstChar }</td>
						<td><a href="${ctx }/admin/set1?footId=${foot.id}">${foot.nameCh }</a></td>
						<td>${foot.code }</td>
						<td>
							<c:if test="${foot.status == 0}">未发布</c:if>
							<c:if test="${foot.status == 1}">已发布</c:if>
						</td>
						<td><fmt:formatDate value="${foot.modifyTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
						<td>
							<c:if test="${foot.status == 0}"><a href="javascript:void(0);" class="publish">发布</a>|</c:if>
							<c:if test="${foot.status == 1}"><a href="javascript:void(0);" class="unpublish">取消发布</a>|</c:if>
							<a href="javascript:void(0);" class="del">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<input type="checkbox" id="checkall" onclick="checks()"/>
						<a href="javascript:void(0);" id="batchPublish">发布</a>
						<a href="javascript:void(0);" id="batchDel">删除</a>
					</td>
		
				</tr>
			</tfoot>
		</table>
		<p class="page">
			<c:if test="${!empty commonList && commonList.pageNum>1 }">
				<g:page commonList="${commonList}"  uri="${ctx}/admin/foot/list" target="#lay_main" pageNum="5" model="2" />  
			</c:if>
		</p>
	</form>
</div>
	</div>
