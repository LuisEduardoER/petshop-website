<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--
	$(document).ready(function() {

		$(".lang-zh").bind("click", function() {
			var uri = window.location;
			$.post(
				ctx + '/change', {
					uri: escape(escape(uri)),
					type: 'ch'
				}, function(data){
					if (data) {
						window.location = ctx + unescape(data.redirectUrl); 
						
					}
				}
			);
			return false;
		});

		$("#loginId").click(function() {
			window.location = ctx + "/en/prelogin";
			return false;
		});

		//商信
		$("#messageId").click(function() {
			window.location = ctx + "/en/mu/user/message";
			return false;
		});

		//收藏
		$("#collectId").click(function() {
			window.location = ctx + "/en/mu/user/foot/collect";
			return false;
		});

		//产品比较
		$("#compareId").click(function() {
			window.location = ctx + "/en/foot/compare";
			return false;
		});

		//帐号
		$("#passwordId").click(function() {
			window.location = ctx + "/en/mu/password";
			return false;
		});

		//登出
		$("#logoutId").click(function() {
			window.location = ctx + "/en/mu/logout";
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
	        		<span> Welcome:${currentUser.account }</span><s></s>
	        		<a href="javascript:void(0);" id="logoutId">Logout</a><s></s>
	        		<a href="javascript:void(0);" id="passwordId">Account</a><s></s>
		        	<a href="javascript:void(0);" id="messageId">Subscribe<c:if test="${unreadCount != null && unreadCount > 0}">(<font color="red">${unreadCount }</font>)</c:if></a><s></s>
		        	<a href="javascript:void(0);" id="collectId">Favorite</a><s></s>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="${ctx }/en/regist" target="_blank">Register</a><s></s>
	        		<a href="javascript:void(0);" id="loginId">Login</a><s></s>
	        	</c:otherwise>
	        </c:choose>
	        	<a href="${ctx }/en/search?selectTypeIds=0;&selectInfoIds=0,;">Foots</a><s></s>
		        <a href="javascript:void(0);" id="compareId">Comparison</a><s></s>
	        <a href="${ctx }/en/regist" >Home</a>
	        <span class="topnav-lang">Language:</span>
	        <a href="javascript:void(0);" class="lang-en"></a><s style="width:6px;"></s>
	        <a href="javascript:void(0);" class="lang-zh"></a>
	    </div>
	</div>
</div>
