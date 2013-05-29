<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
<!--
	$(document).ready(function() {
		$(".mainmenu ul li a").bind('click', function() {
			$this = $(this);
			var selectTypeIds = $this.closest("ul").attr("selectTypeId");
			var selectInfoIds = $this.closest("li").attr("selectInfoId");
			if (selectInfoIds == "0") {
				selectTypeIds = "0";
			}
			window.location.href = ctx + '/ch/search?selectTypeIds=' + selectTypeIds +";&selectInfoIds=" + selectInfoIds + ",;";
			return false;
		});
	})
//-->
</script>

<div class="menu">
	<ul class="mainmenu">
		
		<c:forEach items="${selectTypes}" var="selectType" varStatus="s">
			<c:if test="${s.index < 10}">
				<li class="menu-item 
					<c:if test="${s.index==0}">first</c:if>
				">
		        	<a class="menu-item-a" href="javascript:void(0)">${selectType.nameCh }</a>
		            <ul class="submenu" selectTypeId="${selectType.id }"
		            	<c:if test="${s.index==7}">style="left:-100px"</c:if>
		            	<c:if test="${s.index==8}">style="left:-350px"</c:if>
                        <c:if test="${s.index==9}">style="left:-120px"</c:if>
		            >
		            	<li selectInfoId="0"><a href="javascript:void(0);">全部</a></li>
	            		<c:forEach items="${selectType.infos}" var="info">
	            			<c:if test="${info.selectInfoCh != '-'}">
			            		<li selectInfoId="${info.id }"><a href="javascript:void(0);">${info.selectInfoCh }</a></li>
	            			</c:if>
		            	</c:forEach>
		            </ul>
	        	</li>
        	</c:if>
		</c:forEach>	
	
<!--        <li class="menu-item"><a class="menu-item-a" href="javascript:void(0)">产品评分</a>-->
<!--        	<ul class="submenu" style="left:-30px;">-->
<!--            	<li>尚未开放，敬请关注</li>-->
<!--            </ul>-->
<!--        </li>-->
    </ul>
</div>
