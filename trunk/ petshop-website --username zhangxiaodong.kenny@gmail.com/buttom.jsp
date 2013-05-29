<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="footnav fix">
	<div class="mod">
    	<h3 class="fn-gt">产品列表</h3>
        <ul>
        	<li><a href="${ctx }/ch/search?selectTypeIds=0;&selectInfoIds=0,;">·所有产品</a></li>
        </ul>
    </div>
    <div class="mod">
    	<h3 class="fn-xs">预约联系</h3>
        <ul>
            <li><a href="${ctx }/ch/mu/user/message">·预约联系</a></li>
        </ul>
    </div>
    <div class="mod">
    	<h3 class="fn-yy">产品收藏</h3>
        <ul>
        	<li><a href="${ctx }/ch/mu/user/foot/collect">产品收藏</a></li>
        </ul>
    </div>
    <div class="mod">
    	<h3 class="fn-yf">产品比较</h3>
        <ul>
        	<li><a href="${ctx }/ch/foot/compare">产品比较</a></li>
        </ul>
    </div>
    <div class="mod">
    	<h3 class="fn-gy">联系我们</h3>
        <ul>
        	<li><a href="${ctx }/ch/contact">联系我们</a></li>
        </ul>
    </div>
</div>