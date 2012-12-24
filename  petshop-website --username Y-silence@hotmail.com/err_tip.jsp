<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/en/meta.jsp" %>
</head>

<body class="minpage_body">
<div class="minpage">
	<div class="minpage_box">
        <div class="minpage_inner fix">
            <div class="minpage_form">
            	<div class="tip_main err_tip">
                	Sorry, Failed to Login
                </div>
                <br>
                <div class="tip_text">
                	<a href="${ctx }/en/regist" class="btn_reg2"></a>
                    <a href="${ctx }/en/index" class="btn_return"></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>