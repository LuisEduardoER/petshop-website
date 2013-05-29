<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>我的美丽宠物食品店</title>
<%@ include file="/common/ch/meta.jsp" %>
<script type="text/javascript" src="<c:url value="/js/ch/commom.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	PWIE.menu();
	PWIE.tab(".rank_tab>a",".rank_content>table","on");
	//下拉框
	$(".dropdown").hover(
		function(){
			$(this).find(".dropdown_list").show();
		},
		function(){
			$(this).find(".dropdown_list").hide();
		}
	)

	//删除
	$(".collectDel").bind("click", function() {
		var $this = $(this);
		var $tr = $this.closest("tr");
		var collectId = $tr.attr("collectId");
		if (confirm("确认删除?")) {
			$.ajax({
				url : ctx + "/ch/mu/user/foot/collect/del",
				data : {
					collectId : collectId
				},
				type : 'post',
				dataType : 'json', 
				success : function(data) {
					if (data) {
						if (data.result == "success") {
							$tr.remove();
							var num = $(".num").text();
							$(".num").text(num-1);
						} else {
							alert("删除失败");
						}
					} 
				}
			});
		}
	});

});
</script>
</head>

<body>
<!-- 头部导航条START-->
	<c:import url="/ch/head"></c:import>
<!-- 头部导航条END -->
<div class="wrapper pagewrap">
<div class="center">
<!-- 产品分类 START-->
	<c:import url="/ch/menu"></c:import>
 <!-- 产品分类 end -->
     <!-- 搜索条start -->
    <div class="search_bar">
       	<c:import url="/ch/hotSearch"></c:import>
    </div>
  	<!-- 搜索条end -->
    <div class="search_banner" style="float:left;margin-top:-105px"> 
    </div>
    <!--主体内容start-->
    <div class="pagemain fix" style="clear:left">
    	<!-- 左侧start -->
    	 <c:import url="/ch/user/content/menu"></c:import>
        <!-- 左侧end -->
         <!-- 右侧start -->
        <div class="aside_box">
        	<div class="tit">
            	产品收藏
            </div>
            <div class="con fav_list">
            	<p class="more">您一共收藏了<span class="num">${fn:length(collects) }</span> 款产品&nbsp;&nbsp;<a href="${ctx }/ch/search">查看更多产品>></a></p>
                <table>
                	<colgroup>
                    	<col width="134" />
                        <col width="255" />
                        <col />
                    </colgroup>
                	<tr>
	                    <th>产品名称</th>
	                    <th>产品类型</th>
	                    <th>功能操作</th>
                	</tr>
                	<c:forEach items="${collects}" var="collect">
						<tr collectId="${collect.id }" footId="${collect.foot.id }">
							<td><a href="${ctx }/ch/content?footId=${collect.foot.id}">${collect.foot.nameCh }</a></td>
							<td>
								<c:choose>
					   	 			<c:when test="${fn:length(collect.foot.chParam) < 18}">
					   	 				${collect.foot.chParam }
					   	 			</c:when>
					   	 			<c:otherwise>
					   	 				${fn:substring(collect.foot.chParam,0,18) }....
					   	 			</c:otherwise>
					   	 		</c:choose>
							</td>
							<td>
								<a href="javascript:void(0);" class="addCompareClass" onclick="compareLayer.add('${collect.foot.id}');">加入比较</a> | 
								<a href="javascript:void(0);" class="collectDel" >删除</a>
							</td>
						</tr>
					</c:forEach>
					
                </table>
            </div>
        </div>
        <!-- 右侧end -->
    </div>
    <!--主体内容end-->
</div>
</div>
	<c:import url="/ch/buttom"></c:import>
</body>
</html>