<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ include file="/common/taglibs.jsp" %>
<c:set value="/images/default.jpg" var="defaultPic"></c:set>
<div class="newgame">
	<div class="newgame_title">
    	<div class="newgame_switch">
        	<span class="prev"></span>
            <span class="next"></span>
        </div>
    </div>

    <div class="newgame_content" style="position:relative">
    	<div class="newgame_inner" style="position:absolute;top:0;left:0">
	    	<c:forEach items="${newFoots}" var="newGame" varStatus="vs">
	    		<c:if test="${vs.index+1==1}"><ul class="fix"></c:if>
	    		<c:if test="${vs.index+1==5}"></ul><ul class="fix"></c:if>
	    		<li>
	            	<a href="<c:url value='/ch/content?gameId=${newGame.id }' />" class="pic">
	            		<img width="132" height="127"
	            			<c:choose>
				    			<c:when test="${newGame.logo != null}">
				    				src="${ctx }${newGame.logo }"
				    			</c:when>
				    			<c:otherwise>
				    				src="${ctx }${defaultPic }"
				    			</c:otherwise>
							</c:choose> 
						/>
	            	</a>
	                
	                <p class="name">产品名称：<a href="<c:url value='/ch/content?gameId=${newGame.id }' />">${newGame.nameCh }</a></p>
	                <c:forEach items="${newGame.selectRelations}" var="sr">
	                	<p>${sr.selectType.nameCh }：${sr.selectInfo.selectInfoCh }</p>
	                </c:forEach>
	               
	            </li>
	    	</c:forEach>
        </div>
    </div>
</div>