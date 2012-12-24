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

		$(".service_menu.fix a").bind("click", function() {
			alert("Coming soon, stay tuned");
		});
		//商信
		$(".message").bind("click", function() {
			window.location = ctx + "/en/mu/user/message";
			return false;
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
<!-- 产品分类 END -->

    <div class="search_bar">
        <!-- 热门搜索 start-->
        	<c:import url="/en/hotSearch"></c:import>
        <!-- 热门搜索 end-->
    </div>
    
    <!--主体内容start-->
    <div class="pagemain fix">
    	<div class="leftmod"> 
        	<div class="topbanner"></div>
            <div class="main650">
            <div class="service_box">
            	<div class="service_box_hd">Contact us：</div>
                <div class="service_box_bd">
                    <div class="service_intro">
                    <p>China (Monday to Friday, 8:00 - 18:00)</p>
                    <p>Address:perfect jia li dun university</p>
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
	<c:import url="/en/buttom"></c:import>
<!-- 底部 END-->

</body>
</html>