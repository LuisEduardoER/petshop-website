<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/en/meta.jsp" %>

<script type="text/javascript">

	$(document).ready(function() {

		//提交
		$(".btn_pwd_submit").click(function() {
			var newPassword = $.trim($("#newPasswordId").val());
			var reNewPassword = $.trim($("#reNewPasswordId").val());
			if (newPassword == "") {
				alert("Fill in passord");
				$("#newPasswordId").focus();
				return false;
			}

			var reguA = /\w{6,16}$/;
			if (newPassword.length > 16 || newPassword.length < 6 || !reguA.test(newPassword)) {
				alert("Password has to be 6-16 characters and numbers");
				$("#newPasswordId").focus();
				return false;
			}
			
			if (reNewPassword == "") {
				alert("Confirm password");
				$("#reNewPasswordId").focus();
				return false;
			}
			if (newPassword != reNewPassword) {
				alert("Wrong password");
				$("#reNewPasswordId").focus();
				return false;
			}
			


			$.ajax({
				url : ctx + "/en/reset/submit",
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
							alert("Wrong password");
						} else if (data.result = "success") {
							window.location = ctx + "/en/prelogin";
							
						} else {
							alert("Failed to Modify Password");
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
            	<dt>Set New Password</dt>
            </dl>
            <div class="minpage_form">
            	<table>
                	<colgroup>
                    	<col width="208" />
                        <col />
                    </colgroup>
                	<tr>
                    	<td class="lb">Account：</td>
                        <td><strong>${account }</strong></td>
                    </tr>
                    <tr>
                    	<td class="lb">New password：</td>
                        <td>
							<input class="pt" type="password" id="newPasswordId" onblur="pwStrength(this.value)" onafterpaste="this.value=this.value.replace(/\W/g,'')" onkeyup="pwStrength(this.value);this.value=this.value.replace(/\W/g,'')" maxlength="16"/>
							<span class="tip">6-16 characters and numbers</span>
                        	<div class="pwd_grade fix">
	                        	<span>Security level：</span>
	                            <em id="strength_L" class="ash">low</em>
	                            <em id="strength_M" class="ash">mid</em>
	                            <em id="strength_H" class="ash">high</em>
	                        </div>
                        </td>
                    </tr>
                    <tr>
                    	<td class="lb">Enter password again：</td>
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