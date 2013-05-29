<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>我的美丽宠物食品店</title>
<%@ include file="/common/ch/meta.jsp" %>
	
<script type="text/javascript">

$(document).ready(function() {

	//提交
	$(".btn_pwd_submit").click(function() {
		var answer = $.trim($("#answerId").val());
		if (answer == "") {
			alert("密保提问答案不能为空");
			$("#answerId").focus();
			return false;
		}

		$.ajax({
			url : ctx + "/ch/find2/submit",
			data : {
				enAccount : $("#enAccountId").val(),
				answer : answer
			},
			type : 'post',
			dataType : 'json', 
			success : function(data) {
				if (data) {
					if (data.result == "error") {
						alert("密保提问答案错误");
						$("#answerId").focus();
					} else if (data.result == "success"){
						window.location = ctx + "/ch/reset?enAccount="+data.enAccount;
					}
				} 
			}
		});
		return false;
	});
	
});

</script>

</head>

<body class="minpage_body">
<input type="hidden" id="enAccountId" value="${enAccount }">
<div class="minpage">
	<div class="minpage_box">
        <div class="minpage_inner minpage_pwd_bg">
        	<dl class="minpage_title">
            	<dt>密码找回</dt>
            </dl>
            <div class="minpage_form">
            	<table>
                	<colgroup>
                    	<col width="208" />
                        <col />
                    </colgroup>
                	<tr>
                    	<td class="lb">密保问题：</td>
                        <td><strong>${question }？</strong></td>
                    </tr>
                    <tr>
                    	<td class="lb">密保问题答案：</td>
                        <td><input class="pt" type="text" id="answerId" />
                        </td>
                    </tr>
                    <tr>
                    	<td class="lb"></td>
                        <td>
                        	<input class="btn_pwd_submit" type="button" value="" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>