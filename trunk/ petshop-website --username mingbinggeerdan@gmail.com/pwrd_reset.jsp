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
			var newPassword = $.trim($("#newPasswordId").val());
			var reNewPassword = $.trim($("#reNewPasswordId").val());
			if (newPassword == "") {
				alert("新密码不能为空");
				$("#newPasswordId").focus();
				return false;
			}

			var reguA = /\w{6,16}$/;
			if (newPassword.length > 16 || newPassword.length < 6 || !reguA.test(newPassword)) {
				alert("密码由6-16位英文字母及数字组成");
				$("#newPasswordId").focus();
				return false;
			}
			
			if (reNewPassword == "") {
				alert("确认密码不能为空");
				$("#reNewPasswordId").focus();
				return false;
			}
			if (newPassword != reNewPassword) {
				alert("两次输入密码不一致");
				$("#reNewPasswordId").focus();
				return false;
			}
			


			$.ajax({
				url : ctx + "/ch/reset/submit",
				data : {
					enAccount : $("#enAccountId").val(),
					newPassword : newPassword,
					reNewPassword : reNewPassword
				},
				type : 'post',
				dataType : 'json', 
				success : function(data) {
					if (data) {
						if (data.newPasswordFix != null) {
							alert("两次输入密码不一致");
						} else if (data.result = "success") {
							window.location = ctx + "/ch/prelogin";
						} else {
							alert("更改密码失败");
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
<input type="hidden" id="enAccountId" value="${enAccount }"></input>
<div class="minpage">
	<div class="minpage_box">
        <div class="minpage_inner minpage_pwd_bg">
        	<dl class="minpage_title">
            	<dt>设置新密码</dt>
            </dl>
            <div class="minpage_form">
            	<table>
                	<colgroup>
                    	<col width="208" />
                        <col />
                    </colgroup>
                	<tr>
                    	<td class="lb">账号：</td>
                        <td><strong>${account }</strong></td>
                    </tr>
                    <tr>
                    	<td class="lb">输入新密码：</td>
                        <td>
							<input class="pt" type="password" id="newPasswordId" onblur="pwStrength(this.value)" onafterpaste="this.value=this.value.replace(/\W/g,'')" onkeyup="pwStrength(this.value);this.value=this.value.replace(/\W/g,'')" maxlength="16"/>
							<span class="tip">由6-16位英文字母及数字组成</span>
                        	<div class="pwd_grade fix">
	                        	<span>安全级别：</span>
	                            <em id="strength_L" class="ash">低</em>
	                            <em id="strength_M" class="ash">中</em>
	                            <em id="strength_H" class="ash">高</em>
	                        </div>
                        </td>
                    </tr>
                    <tr>
                    	<td class="lb">再次输入新密码：</td>
                        <td><input class="pt" type="password" id="reNewPasswordId"/>
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