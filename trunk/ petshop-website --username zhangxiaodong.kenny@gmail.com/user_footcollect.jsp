<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/en/meta.jsp" %>
<script type="text/javascript" src="<c:url value="/js/en/commom.js"/>"></script>
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
		if (confirm("Confirm  Delete?")) {
			$.ajax({
				url : ctx + "/en/mu/user/foot/collect/del",
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
							alert("Fail Delete");
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
	<c:import url="/en/head"></c:import>
<!-- 头部导航条END -->
<div class="wrapper pagewrap">
<div class="center">
<!-- 产品分类 START-->
	<c:import url="/en/menu"></c:import>
 <!-- 产品分类 end -->
     <!-- 搜索条start -->
    <div class="search_bar">
       	<c:import url="/en/hotSearch"></c:import>
    </div>
  	<!-- 搜索条end -->
    <div class="search_banner" style="float:left;margin-top:-105px"> 
    </div>
    <!--主体内容start-->
    <div class="pagemain fix" style="clear:left">
    	<!-- 左侧start -->
    	 <c:import url="/en/user/content/menu"></c:import>
        <!-- 左侧end -->
         <!-- 右侧start -->
        <div class="aside_box">
        	<div class="tit">
            	Collect products
            </div>
            <div class="con fav_list">
            	<p class="more">
                You have collected
                <span class="num">${fn:length(collects) }</span> products&nbsp;&nbsp;<a href="${ctx }/en/search">More>></a></p>
                <table>
                	<colgroup>
                    	<col width="134" />
                        <col width="255" />
                        <col />
                    </colgroup>
                	<tr>
	                    <th>Name</th>
	                    <th>Genre</th>
	                    <th>operate</th>
                	</tr>
                	<c:forEach items="${collects}" var="collect">
						<tr collectId="${collect.id }" footId="${collect.foot.id }">
							<td><a href="${ctx }/en/content?footId=${collect.foot.id}">${collect.foot.nameEn }</a></td>
							<td>
								<c:choose>
					   	 			<c:when test="${fn:length(collect.foot.enParam) < 18}">
					   	 				${collect.foot.enParam }
					   	 			</c:when>
					   	 			<c:otherwise>
					   	 				${fn:substring(collect.foot.enParam,0,18) }....
					   	 			</c:otherwise>
					   	 		</c:choose>
							</td>
							<td>
								<a href="javascript:void(0);" class="addCompareClass" onclick="compareLayer.add('${collect.foot.id}');">Contrast</a> | 
								<a href="javascript:void(0);" class="collectDel" >Delete</a>
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
<c:import url="/en/buttom"></c:import>
</body>
</html>