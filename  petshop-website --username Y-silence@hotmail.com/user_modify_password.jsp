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
			url : ctx + "/ch/mu/password/modify",
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
						alert("密码修改成功");
						window.location = ctx + "/ch/mu/password";
					} 
					if (data.result ==  "error") {
						alert("密码修改失败");
					} 
				} else {
					alert("密码修改失败");
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
			url : ctx + "/ch/mu/password/check",
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
	<c:import url="/ch/head"></c:import>
<!-- 头部导航条END -->
<div class="wrapper pagewrap">
<div class="center">
<!-- 产品分类 START-->
	<c:import url="/ch/menu"></c:import>
 <!-- 产品分类 end -->
     <!-- 搜索条start -->
    <div class="search_bar">
       	<c:import url="/ch/hotSearch"></c:import>
    </div>
  	<!-- 搜索条end -->
    <div class="search_banner" style="float:left;margin-top:-105px"> 
    </div>
    <!--主体内容start-->
    <div class="pagemain fix" style="clear:left">
    	<!-- 左侧start -->
    	 <c:import url="/ch/user/content/menu"></c:import>
        <!-- 左侧end -->
        <!-- 右侧start -->
        <div class="aside_box">
        	<div class="tit">
            	密码修改
            </div>
            <div class="con minpage_form reg_form">
            	<br><br>
            	<table>
                	<colgroup>
                    	<col width="200" />
                        <col />
                    </colgroup>
                	<tr>
                    	<td class="lb">请输入当前密码：</td>
                        <td>
                        	<input class="pt" type="password" name="oldPassword" id="oldPasswordId" onblur="checkOldPassWord()" />
                        	<span id="oldPasswordBlankId" class="errtip" style="display: none">&nbsp;原密码不能为空</span>
				   			<span id="oldPasswordWrongId" class="errtip" style="display: none">&nbsp;原密码错误</span>
                        </td>
                    </tr>
                    <tr>
                    	<td class="lb">请输入新密码：</td>
                        <td>
                        	<input class="pt" type="password" name="newPassword" id="newPasswordId" onblur="pwStrength(this.value);checkNewPassword()" onafterpaste="this.value=this.value.replace(/\W/g,'')" onkeyup="pwStrength(this.value);this.value=this.value.replace(/\W/g,'')" maxlength="16"/>
                        	<span id="newPasswordBlankId" class="errtip" style="display: none">&nbsp;新密码不能为空</span>
				   			<span id="newPasswordLengthId" class="errtip" style="display: none">&nbsp;由6-16位英文字母及数字组成</span>
	                        <div class="pwd_grade fix">
	                        	<span>安全级别：</span>
	                           <em id="strength_L" class="ash">低</em>
		                            <em id="strength_M" class="ash">中</em>
		                            <em id="strength_H" class="ash">高</em>
	                        </div>
                        </td>
                    </tr>
                    <tr>
                    	<td class="lb">请再次输入新密码：</td>
                        <td>
                        	<input type="password" name="reNewPassword"  id="reNewPasswordId" onblur="checkReNewPassword()"/>
                        	<span id="passwordFixId" class="errtip" style="display: none">&nbsp;两次输入密码不相同</span>
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
	<c:import url="/ch/buttom"></c:import>
</body>
</html>