<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>我的美丽宠物食品店</title>
<%@ include file="/common/ch/meta.jsp" %>

<script language="javascript">
var leftTime = 3000;
function go(){
   document.getElementById("leftTimeId").innerText = leftTime/1000;
   leftTime -= 1000;
   if(leftTime <= 0){
    document.location.href = ctx + "/ch/index" 
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
                	恭喜您，注册成功！
                </div>
                <div class="tip_text">
                	本页面将在 <span id="leftTimeId">3</span> 秒后返回首页。<br>
					如果页面没有自动跳转，请<a href="${ctx }/ch/index">点击此处</a>。
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>