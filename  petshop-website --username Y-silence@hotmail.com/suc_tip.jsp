<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/ch/meta.jsp" %>

<script language="javascript">
var leftTime = 3000;
function go(){
   document.getElementById("leftTimeId").innerText = leftTime/1000;
   leftTime -= 1000;
   if(leftTime <= 0){
    document.location.href = ctx + "/en/index" 
   }
}
setInterval(go,1000);
</script>


</head>

<body class="minpage_body">
<div class="minpage">
	<div class="minpage_box">
        <div class="minpage_inner fix">
            <div class="minpage_form">
            	<div class="tip_main suc_tip">
                	Rigets success
                </div>
                <div class="tip_text">
                	This page <span id="leftTimeId">3</span> Seconds back to home.<br>
					If not redirect，please<a href="${ctx }/en/index">click here</a>.
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>