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
		PWIE.updown();
		PWIE.tab(".rank_tab>a",".rank_content>table","on");
		PWIE.focus();
	});
	
</script>

</head>

<body>
<!-- 头部导航条START-->
	<c:import url="/ch/head"></c:import>
<!-- 头部导航条END -->
<div class="wrapper">
<div class="center">
<!-- 产品分类 START-->
	<c:import url="/ch/menu"></c:import>
<!-- 产品分类 END -->
    <div class="mainmod fix">
        <div class="leftmod">
	        <!-- 轮播start-->
	       		<c:import url="/ch/barter"></c:import>
	        <!-- 轮播 end -->
        </div>
        <div class="rightmod">
        <!-- 热门搜索 start-->
        	<c:import url="/ch/hotSearch"></c:import>
        <!-- 热门搜索 end-->
			
		<div class="hotnews">
        	<div class="news-item news-item-first">
            	<span class="new"></span>
            	<div class="pic"><img src="${ctx }/images/ch/hot1.jpg" width="124" height="79"/></div>
                <div class="title">店家强烈推荐产品 </div>
                <div class="desc">本品促銷包郵中，非包郵地區，2公斤只收1公斤的運費。买五送一啦......</div>
            </div>
            <div class="news-item">
            	<div class="pic"><img src="${ctx }/images/ch/hot2.jpg" width="124" height="79"/></div>
                <div class="title">店家强烈推荐产品 </div>
                <div class="desc">本品促銷包郵中，非包郵地區，2公斤只收1公斤的運費。买五送一啦......</div>
            </div>
            <br clear="left" />
            <ul class="news-list">
            	<li><a href="#">包邮/原装进口/爱慕思/爱....</a> <span class="date">(2011.7.10)</span> <span class="new"></span></li>
                <li><a href="#">包邮/原装进口/爱慕思/爱....</a> <span class="date">(2011.7.10)</span></li>
                <li><a href="#">包邮/原装进口/爱慕思/爱....</a> <span class="date">(2011.7.10)</span></li>
                <li class="nobb"><a href="#">包邮/原装进口/爱慕思/爱....</a> <span class="date">(2011.7.10)</span></li>
                <li class="more nobb"><a href="http://www.taobao.com" target="_blank">[查看更多]</a></li>
            </ul>
        </div>
			
				
        </div>
    </div>
    <div class="submod fix">
    	<div class="leftmod">
	    	<!-- 排行榜 start -->
	    		<c:import url="/ch/paihangbang"></c:import>
	    	<!-- 排行榜 end -->
    	</div>
        <div class="rightmod">
        	<!-- 新入住游戏  start-->
        		<c:import url="/ch/newFoot"></c:import>
        	<!-- 新入住游戏  end-->
            <div class="home_step">
            </div>
        </div>
    </div>
</div>
</div>

<c:import url="/ch/buttom" />
</body>
</html>