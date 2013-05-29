<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>我的美丽宠物食品店</title>
<%@ include file="/common/ch/meta.jsp" %>
</head>

<body class="minpage_body">
<div class="minpage">
	<div class="minpage_box">
        <div class="minpage_inner fix">
            <div class="minpage_form">
            	<div class="tip_main err_tip">
                	很抱歉，注册失败！
                </div>
                <br>
                <div class="tip_text">
                	<a href="${ctx }/ch/regist" class="btn_reg2"></a>
                    <a href="${ctx }/ch/index" class="btn_return"></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>