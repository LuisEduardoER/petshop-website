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

	$("#passwordSubmitBtnId").click(function() {
		$("#passwordSubmitBtnId").attr("disabled", "disabled");
		
		var oldPassword = $.trim($("#oldPasswordId").val());
		var newPassword = $.trim($("#newPasswordId").val());
		var reNewPassword = $.trim($("#reNewPasswordId").val());
		
		if (oldPassword == "") {
			$("#oldPasswordBlankId").show();
			$("#oldPasswordId").focus();
			return false;
		}

		if (newPassword == "") {
			$("#newPasswordBlankId").show();
			$("#newPasswordId").focus();
			return false;
		}

		var reguA = /\w{6,16}$/;
		if (newPassword.length > 16 || newPassword.length < 6 || !reguA.test(newPassword)) {
			$("#newPasswordLengthId").show();
			$("#newPasswordId").focus();
			return false;
		}

		if (newPassword != reNewPassword) {
			$("#passwordFixId").show();
			return false;
		}

		$.ajax({
			url : ctx + "/en/mu/password/modify",
			data : {
				oldPassword : oldPassword,
				newPassword : newPassword,
				reNewPassword : reNewPassword
			},
			type : 'post',
			dataType : 'json', 
			success : function(data) {
				if (data) {
					if (data.oldError != null) {
						$("#oldPasswordWrongId").show();
						$("#oldPasswordId").focus();
						return;
					}
					if (data.newPasswordFix != null) {
						$("#passwordFixId").show();
						return;
					}
					if (data.result == "success") {
						alert("Password changed");
						window.location = ctx + "/en/mu/password";
					} 
					if (data.result ==  "error") {
						alert("Failed to change password");
					} 
				} else {
					alert("Failed to change password");
				}
				
			}
		});
	});
});

function checkOldPassWord() {
	var oldPassword = $.trim($("#oldPasswordId").val());
	if (oldPassword == "") {
		$("#oldPasswordWrongId").hide();
		$("#oldPasswordBlankId").show();
	} else {
		$("#oldPasswordBlankId").hide();
		$.ajax({
			url : ctx + "/en/mu/password/check",
			data : {
				oldPassword : oldPassword
			},
			type : 'post',
			dataType : 'json', 
			success : function(data) {
				if (data.result == "success") {
					$("#oldPasswordWrongId").hide();
				} else {
					$("#oldPasswordWrongId").show();
				}
			}
		});
	}
}

function checkNewPassword() {
	var newPassword = $.trim($("#newPasswordId").val());
	if (newPassword == "") {
		$("#newPasswordBlankId").show();
	} else {
		$("#newPasswordBlankId").hide();
		if (newPassword.length > 16 || newPassword.length < 6) {
			$("#newPasswordLengthId").show();
		} else {
			$("#newPasswordLengthId").hide();
		}
	}
}

function checkReNewPassword() {
	var newPassword = $.trim($("#newPasswordId").val());
	var reNewPassword = $.trim($("#reNewPasswordId").val());
	
	if (newPassword != reNewPassword) {
		$("#passwordFixId").show();
	} else {
		$("#passwordFixId").hide();
	}
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
            	Password Changing
            </div>
            <div class="con minpage_form reg_form">
            	<br><br>
            	<table>
                	<colgroup>
                    	<col width="200" />
                        <col />
                    </colgroup>
                	<tr>
                    	<td class="lb">Existing password：</td>
                        <td>
                        	<input class="pt" type="password" name="oldPassword" id="oldPasswordId" onblur="checkOldPassWord()" />
                        	<span id="oldPasswordBlankId" class="errtip" style="display: none">&nbsp;Fill in password</span>
				   			<span id="oldPasswordWrongId" class="errtip" style="display: none">&nbsp;Wrong password</span>
                        </td>
                    </tr>
                    <tr>
                    	<td class="lb">New password：</td>
                        <td>
                        	<input class="pt" type="password" name="newPassword" id="newPasswordId" onblur="pwStrength(this.value);checkNewPassword()" onafterpaste="this.value=this.value.replace(/\W/g,'')" onkeyup="pwStrength(this.value);this.value=this.value.replace(/\W/g,'')" maxlength="16"/>
                        	<span id="newPasswordBlankId" class="errtip" style="display: none">&nbsp;Fill in New password</span>
				   			<span id="newPasswordLengthId" class="errtip" style="display: none">&nbsp;Need to be 6 to 16 digits and letters</span>
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
                        <td>
                        	<input type="password" name="reNewPassword"  id="reNewPasswordId" onblur="checkReNewPassword()"/>
                        	<span id="passwordFixId" class="errtip" style="display: none">&nbsp;Wrong password</span>
                        </td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td><input class="btn_pwd_submit" type="button" id="passwordSubmitBtnId" value="" /></td>
                    </tr>
                </table>
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
</body>
</html>