<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/en/meta.jsp" %>

<script type="text/javascript">

	$(document).ready(function(){
		PWIE.menu();
		PWIE.updown();
		PWIE.tab(".rank_tab>a",".rank_content>table","on");
		PWIE.focus();
	});
	
</script>

</head>

<body>
<!-- 头部导航条START-->
	<c:import url="/en/head"></c:import>
<!-- 头部导航条END -->
<div class="wrapper">
<div class="center">
<!-- 产品分类 START-->
	<c:import url="/en/menu"></c:import>
<!-- 产品分类 END -->
    <div class="mainmod fix">
        <div class="leftmod">
	        <!-- 轮播start-->
	       		<c:import url="/en/barter"></c:import>
	        <!-- 轮播 end -->
        </div>
        <div class="rightmod">
        <!-- 热门搜索 start-->
        	<c:import url="/en/hotSearch"></c:import>
        <!-- 热门搜索 end-->
        	
        </div>
    </div>
    <div class="submod fix">
    	<div class="leftmod">
	    	<!-- 排行榜 start -->
	    		<c:import url="/en/paihangbang"></c:import>
	    	<!-- 排行榜 end -->
    	</div>
        <div class="rightmod">
        	<!-- 新入住游戏  start-->
        		<c:import url="/en/newFoot"></c:import>
        	<!-- 新入住游戏  end-->
            <div class="home_step">
            </div>
        </div>
    </div>
</div>
</div>
<c:import url="/en/buttom"></c:import>
</body>
</html>