<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>我的美丽宠物食品店</title>
<%@ include file="/common/ch/meta.jsp" %>
<script type="text/javascript">

	$(document).ready(function(){
		PWIE.menu();

		$(".service_menu.fix a").bind("click", function() {
			alert("尚未开放，敬请关注");
		});
		//商信
		$(".message").bind("click", function() {
			window.location = ctx + "/ch/mu/user/message";
			return false;
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
<!-- 产品分类 END -->

    <div class="search_bar">
        <!-- 热门搜索 start-->
        	<c:import url="/ch/hotSearch"></c:import>
        <!-- 热门搜索 end-->
    </div>
    
    <!--主体内容start-->
    <div class="pagemain fix">
    	<div class="leftmod"> 
        	<div class="topbanner">
        	</div>
            <div class="main650">
            <div class="service_box">
            	<div class="service_box_hd">联系方式：</div>
                <div class="service_box_bd">
                    <div class="service_intro">
                    <p>中国区（周一至周五，8:00~18:00 节假日正常休息）</p>
                    <p>ADD：完美家里蹲大学2宿舍</p>
                    <p>Tel：(+86)010-123456</p>
                    <p>Tel：(+86)010-654321</p>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <div class="rightmod">&nbsp;</div>
    </div>
    <!--主体内容end-->
</div>
</div>
<!-- 底部 START-->
	<c:import url="/ch/buttom"></c:import>
<!-- 底部 END-->

</body>
</html>