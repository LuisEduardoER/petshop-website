<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>

<script type="text/javascript">
$(document).ready(function(){

	//回覆
	$(".btn_msg_reply").click(function() {
		
		var $this = $(this);
		var $msgReply = $this.closest(".msg_reply");
		var $replyContent = $this.siblings("input[name=replyContent]")
		var messageId = $this.closest(".msg_item").attr("messageId");
		var replyContent = $.trim($replyContent.val());
		if (replyContent == "") {
			alert("回覆不能為空");
			$replyContent.focus();
			return false;
		}
		if (replyContent.length > 400) {
			alert("回覆內容最多可以輸入400字");
			$replyContent.focus();
			return false;
		}
		$.post( ctx + '/admin/user/message/reply', 
				{
					replyContent : replyContent,
					messageId : messageId
				}, 
				function(html) {
					$replyContent.val("");
					$msgReply.prepend(html);	
				});

		
	});
	
});


</script>
<div class="msg_content">
    
       <div class="msg_con_tab fix">
         	<c:choose>
          		<c:when test="${hasUnread==true}">
          			<a href="javascript:void(0);" class="on">未读消息</a>&nbsp;&nbsp;
          		</c:when>
          		<c:otherwise>
          			<a href="javascript:void(0);" class="on">历史消息</a>
          		</c:otherwise>
          	</c:choose>
       	</div>
        <ul>
        	<c:forEach items="${messages}" var="message">
		        <li class="msg_item" messageId="${message.id }">
	        		<div class="msg_topic msg_row" >
		            	<div class="msg"><span class="user">${message.publishUser.account }：</span>${message.messageContent } </div>
		                <div class="time"><fmt:formatDate value="${message.createTime}" pattern="yyyy年MM月dd日 HH:mm"/></div>
		            </div>
		            <div class="msg_reply">
		            	<c:forEach items="${message.replys}" var="reply">
		            		<div class="msg_row">
		                    	<div class="msg"><span class="user red">${reply.replyUser.account }：</span>${reply.replyContent }</div>
		                        <div class="time"><fmt:formatDate value="${reply.replyTime}" pattern="yyyy年MM月dd日 HH:mm"/></div>
		                    </div>
		            	</c:forEach>
		                	<div class="msg_input">
		                		<input type="text" class="pt" name="replyContent"/><input type="button" class="btn_msg_reply" />
		                    </div>
		           </div>
		           <br />
		        </li>
        	</c:forEach>
        	
        </ul>
        <div align="right">
        	<c:if test="${!empty commonList && commonList.pageNum>1 }">
				<g:page commonList="${commonList}"  uri="${ctx}/admin/user/message" target=".bef_msg_content" pageNum="5" model="10" />  
			</c:if>
		</div>
</div>