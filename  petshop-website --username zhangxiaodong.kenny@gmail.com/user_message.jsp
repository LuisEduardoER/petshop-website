<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/en/meta.jsp" %>

<script type="text/javascript">
$(document).ready(function(){

	//发佈短消息
	$(".btn_msg_publish").bind("click", function() {

		var messageContent = $.trim($("#messageContentId").val());
		var rand = $.trim($("#randId").val());
		if (messageContent == "") {
			alert("Fill in message");
			$("#messageContentId").focus();
			return false;
		}
		if (messageContent.length > 400) {
			alert("Message, less than 400 letters");
			$("#messageContentId").focus();
			return false;
		}
		if (rand == "") {
			alert("Fill in Code");
			$("#randId").focus();
			return false;
		}

		$.post( ctx + '/en/user/message/publish',
				{
					rand : rand,
					messageContent : messageContent
				},function(html){
					if (html) {
						if (html == "randError") {
							alert("Wrong Code");
							$("#randId").val("");
							changeRandImg();
						} else {
							$("#messageContentId").val("");
							$("#randId").val("");
							changeRandImg();
							$(".con.msg_list").prepend(html);						
						}
					}
				});
		
	});


	//回覆
	$(".btn_msg_reply").live("click", function() {
		var $this = $(this);
		var $msgReply = $this.closest(".msg_reply");
		var $msg = $this.closest(".msg_item");
		var $replyContent = $this.siblings("input[name=replyContent]")
		var messageId = $msg.attr("messageId");
		var replyContent = $.trim($replyContent.val());

		if (replyContent == "") {
			alert("Please add reply message");
			$replyContent.focus();
			return false;
		}
		if (replyContent.length > 400) {
			alert("Reply message, less than 400 letters");
			$replyContent.focus();
			return false;
		}
		$.post( ctx + '/en/mu/user/message/reply', 
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

function changeRandImg() {
    document.getElementById('rand_img').src = ctx + "/servlet/randimgservlet?rand=rand" + "&r=" + Math.random();
}

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
 <!-- 产品分类 end -->
     <!-- 搜索条start -->
    <div class="search_bar">
       	<c:import url="/en/hotSearch"></c:import>
    </div>
  	<!-- 搜索条end -->
    <div class="search_banner" style="float:left;margin-top:-105px"> 
    </div>
    <!--主体内容start-->
    <div class="pagemain fix" style="clear:left">
    	<!-- 左侧start -->
    	 <c:import url="/en/user/content/menu"></c:import>
        <!-- 左侧end -->
         <!-- 右侧start -->
        <div class="aside_box">
        	<div class="tit">
            	Subscribe
            </div>
            <div class="con msg_form">
            	<textarea class="pt msg_tt" name="messageContent" id="messageContentId"></textarea>
                <div class="fix" style="padding-top:5px">
	                <div class="msg_code">
		               	 Code：
		               	 <input class="pt code_pt" type="text"  name="rand" id="randId"/>
		                 <img onClick="changeRandImg();return false;" id="rand_img"  src="${ctx }/servlet/randimgservlet" style="vertical-align:middle"/>
		                 <a href="javascript:void(0)" onClick="changeRandImg();return false;">Change Another</a>
	                </div>
	                <input type="button" class="btn_msg_publish" />
                </div>
            </div>
            <div class="tit msg_tit_tab">
            	<c:choose>
            		<c:when test="${hasUnread==true}">
            			<a href="javascript:void(0);" class="on">New</a>&nbsp;&nbsp;<a href="${ctx }/en/mu/user/message">History</a>
            		</c:when>
            		<c:otherwise>
            			<a href="javascript:void(0);" class="on">History</a>
            		</c:otherwise>
            	</c:choose>
            </div>
            <div class="con msg_list">
            	<c:forEach items="${messages}" var="message">
            		<!-- 单个留言 -->
	            	<div class="msg_item" messageId="${message.id }">
	                	<div class="msg_row msg_topic">
	                    	<div class="msg"><span class="user">${message.publishUser.account }：</span>${message.messageContent } </div>
	                        <div class="time"><fmt:formatDate value="${message.createTime}" pattern="yyyy-MM-dd HH:mm"/></div>
	                    </div>
	                    <div class="msg_reply">
	                    	<c:forEach items="${message.replys}" var="reply">
	                    		<div class="msg_row">
		                        	<div class="msg"><span class="user red">${reply.replyUser.account }：</span>${reply.replyContent }</div>
		                            <div class="time"><fmt:formatDate value="${reply.replyTime}" pattern="yyyy-MM-dd HH:mm"/></div>
		                        </div>
	                    	</c:forEach>
	                    	<div class="msg_input">
	                            <input type="text" class="pt" name="replyContent"/><input type="button" class="btn_msg_reply" />
	                        </div>
	                    </div>
	                </div>
            	</c:forEach>
                 <div style="text-align: right" class="msg_more">
                	<c:if test="${!empty commonList && commonList.pageNum>1 }">
                		<g:page commonList="${commonList}"  uri="${ctx}/en/mu/user/message" target="#lay_main" pageNum="5" model="9" /> 
					</c:if>
                </div>
            </div>
        </div>
        <!-- 右侧end -->
    </div>
    <!--主体内容end-->
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	PWIE.menu();
	PWIE.tab(".rank_tab>a",".rank_content>table","on");
	//下拉框
	$(".dropdown").hover(
		function(){
			$(this).find(".dropdown_list").show();
		},
		function(){
			$(this).find(".dropdown_list").hide();
		}
	)
});
</script>
<c:import url="/en/buttom"></c:import>
</body>
</html>