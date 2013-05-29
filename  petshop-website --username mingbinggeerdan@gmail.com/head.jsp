<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--
	$(document).ready(function() {
		
		$(".lang-en").bind("click", function() {
			var uri = window.location;
			$.post(
				ctx + '/change', {
					uri: escape(escape(uri)),
					type: 'en'
				}, function(data){
					if (data) {
						window.location = ctx + unescape(data.redirectUrl); 
					}
				}
			);
			return false;
		});

		//登陆
		$("#loginId").click(function() {
			window.location = ctx + "/ch/prelogin";
			return false;
		});

		//商信
		$("#messageId").click(function() {
			window.location = ctx + "/ch/mu/user/message";
			return false;
		});

		//收藏
		$("#collectId").click(function() {
			window.location = ctx + "/ch/mu/user/foot/collect";
			return false;
		});

		//产品比较
		$("#compareId").click(function() {
			window.location = ctx + "/ch/foot/compare";
			return false;
			
		});

		//账号
		$("#passwordId").click(function() {
			window.location = ctx + "/ch/mu/password";
			return false;
		});

		//登出
		$("#logoutId").click(function() {
			window.location = ctx + "/ch/mu/logout";
			return false;
		});

	});

//-->
</script>
<div class="topnav-wrap">
	<div class="topnav">
		<div class="topnav-rukou">
	        <c:choose>
	        	<c:when test="${currentUser != null}">
	        		 <span> 欢迎：${currentUser.account }</span><s></s>
	        		 <a href="javascript:void(0);" id="logoutId">登出</a><s></s>
	        		 <a href="javascript:void(0);" id="passwordId">账号</a><s></s>
				     <a href="javascript:void(0);" id="messageId">预约联系<c:if test="${unreadCount != null && unreadCount > 0}">(<font color="red">${unreadCount }</font>)</c:if></a><s></s>
				     <a href="javascript:void(0);" id="collectId">产品收藏</a><s></s>
	        	</c:when>
	        	<c:otherwise>
			        <a href="${ctx }/ch/regist" target="_blank">注册</a><s></s>
			        <a href="javascript:void(0);" id="loginId">登录</a><s></s>
	        	</c:otherwise>
	        </c:choose>
		
	        <a href="${ctx }/ch/search?selectTypeIds=0;&selectInfoIds=0,;">所有食品</a><s></s>
	        <a href="javascript:void(0);" id="compareId">食品比较</a><s></s>
	        <a href="${ctx }/ch/index">首页</a>
	        <span class="topnav-lang">选择语言：</span>
	        <a href="javascript:void(0);" class="lang-en"></a><s style="width:6px;"></s>
	        <a href="javascript:void(0);" class="lang-zh"></a>
	    </div>
	</div>
</div>
