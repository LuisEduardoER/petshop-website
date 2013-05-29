<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>我的美丽宠物店 - 后台管理</title>
<%@ include file="/common/admin/meta.jsp" %> 
</head>
<body>
<div class="wrapper">
  <div class="fix" id="cont">
   <c:import url="/admin/left?m=7"></c:import>
    <div id="lay_main">
    <!-- 右侧内容 start -->
    <div class="breadnav">商信管理 &gt; 全部</div>
    <div class="msg_wrap fix">
		<c:import url="/admin/message/user/list"></c:import>
    </div>
    <!-- 右侧内容 end -->
    </div>
  </div>
</div>
</body>
</html>