<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>

<script type="text/javascript">
<!--
	$(document).ready(function() {

		//查看消息
		$(".msgClass").click(function() {
			var $this = $(this);
			var $li = $this.closest("li");
			var userId = $li.attr("userId");
			$.post(ctx + '/admin/user/message', {
					userId : userId
					}, function(html) {
						$(".bef_msg_content").html(html);
					});
			
		});

	});	

//-->
</script>


	<div class="msg_list">
    	<div class="msg_thead fix">
        	<span>发信人</span>
            <span>操作</span>
        </div>
        <ul>
        	<c:forEach items="${users}" var="user">
        		<li userId="${user.id }">
	            	<span class="msg_user">
	            		${user.account }
	            		<c:if test="${user.adminUnreadMsgCount > 0}">
	            				<em>(${user.adminUnreadMsgCount})</em>
							</c:if>
	            	</span>
	                <span class="msg_do">
	                	<a href="javascript:void(0);" class="msgClass">查看消息</a>
	                </span>
	            </li>
        	</c:forEach>
        	
        </ul>
        <div class="msg_page">
        	<c:if test="${!empty commonList && commonList.pageNum>1 }">
				<g:page commonList="${commonList}"  uri="${ctx}/admin/message/user/list" target=".msg_wrap.fix" pageNum="5" model="7" />  
			</c:if>
        </div>
    </div>
    <div class="bef_msg_content">
    </div>