<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>我的美丽宠物食品店</title>
<%@ include file="/common/ch/meta.jsp" %>
<script type="text/javascript">

	$(document).ready(function(){

		//注册
		$("#registBtnId").click(function() {
			var account = $.trim($("#accountId").val());
			var password = $.trim($("#passwordId").val());
			var repassword = $.trim($("#repasswordId").val());
			var email = $.trim($("#emailId").val());
			var questionId = $("#questionIdId").val();
			var answer = $.trim($("#answerId").val());
			var rand = $.trim($("#randId").val());
			var name = $.trim($("#nameId").val());

			if (account == "") {
				alert("账号不能为空");
				$("#accountId").focus();
				return false;
			}
			if (account.length > 16 || account.length < 6) {
				alert("账号由6-16位英文字母及数字组成");
				$("#accountId").focus();
				return false;
			}
			 var regu = /^[a-zA-Z]+/;
			if (!regu.test(account)) {
				alert("账号必须以字母开头");
				$("#accountId").focus();
				return false;
			}
			var reguA = /^[a-zA-Z]\w{5,15}$/;
			if (!reguA.test(account)) {
				alert("账号由6-16位英文字母及数字组成");
				$("#accountId").focus();
				return false;
			}
			
			if (password == "") {
				alert("密码不能为空");
				$("#passwordId").focus();
				return false;
			}
			var reguB = /\w{6,16}$/;
			if (password.length > 16 || password.length < 6 || !reguB.test(password)) {
				alert("密码由6-16位英文字母及数字组成");
				$("#passwordId").focus();
				return false;
			}

			if (repassword == "") {
				alert("确认密码不能为空");
				$("#repasswordId").focus();
				return false;
			}
			if (repassword != password) {
				alert("两次输入密码不一致");
				$("#repasswordId").focus();
				return false;
			}

			if (email == "") {
				alert("邮箱不能为空");
				$("#emailId").focus();
				return false;
			}
			if (email.length > 100) {
				alert("邮箱输入过长");
				$("#accountId").focus();
				return false;
			}
			if (!validateEmail(email)) {
				alert("邮箱不合法");
				$("#emailId").focus();
				return false;
			} 

			if (name == "") {
				alert("真实姓名不能为空");
				$("#nameId").focus();
				return false;
			}

			if (name.length > 200) {
				alert("真实姓名最多可输入200字");
				$("#nameId").focus();
				return false;
			}

			if (questionId == 0) {
				alert("请选择一个问题用于找回密码");
				$("#questionIdId").focus();
				return false;
			}

			if (answer == "") {
				alert("密保提问答案不能为空");
				$("#answerId").focus();
				return false;
			}
			if (answer.length > 200) {
				alert("密保提问答案过长");
				$("#answerId").focus();
				return false;
			}

			if (rand == "") {
				alert("验证码不能为空");
				$("#randId").focus();
				return false;
			}

			var options = {
					url : ctx + "/ch/user/save",
					dataType : "json",
					success : function(data) {
						if (data) {
							if (data.msg != null) {
								alert(data.msg);
								$("#randId").val("");
								$("#passwordId").val("");
								$("#repasswordId").val("");
								changeRandImg();
							} else if (data.result == "success") {
								window.location = ctx + "/ch/regist/suc";
							} else {
								window.location = ctx + "/ch/regist/err";
							} 
						} else {
							window.location = ctx + "/ch/regist/err";
						}
					}
				};
			$("#registFormId").ajaxForm(options);
			$("#registFormId").submit();	
			return false;
		});
	});

	function changeRandImg() {
	    document.getElementById('rand_img').src = ctx + "/servlet/randimgservlet?rand=rand" + "&r=" + Math.random();
	}

</script>

</head>

<body class="minpage_body">
<div class="minpage" style="padding-top:60px;">
	<div class="minpage_box">
        <div class="minpage_inner">
        	<dl class="minpage_title">
            	<dt>用户注册</dt>
            </dl>
            <div class="minpage_form reg_form">
            	<form action="" method="post" id="registFormId">
	            	<table>
	                	<colgroup>
	                    	<col width="208" />
	                        <col />
	                    </colgroup>
	                	<tr>
	                    	<td class="lb"><font style="color:red">* </font>账号：</td>
	                        <td><input class="pt" type="text"  name="account" id="accountId"/></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>密码：</td>
	                        <td>
	                        	<input class="pt" type="password" name="password" id="passwordId" onblur="pwStrength(this.value)" onafterpaste="this.value=this.value.replace(/\W/g,'')" onkeyup="pwStrength(this.value);this.value=this.value.replace(/\W/g,'')" maxlength="16"/>
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
	                    	<td class="lb"><font style="color:red">* </font>确认密码：</td>
	                        <td><input class="pt" type="password" name="repassword" id="repasswordId" /></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>电子邮箱：</td>
	                        <td><input class="pt" type="text" name="email" id="emailId"/></td>
	                    </tr>
	                     <tr>
	                    	<td class="lb"><font style="color:red">* </font>真实姓名：</td>
	                        <td><input class="pt" type="text" name="name" id="nameId" /></td>
	                    </tr>
                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>密保提问：</td>
	                        <td>
	                        	<select name="questionId" id="questionIdId" class="pt">
									<option value="0">选择</option>
									<c:forEach items="${questions}" var="q">
										<option value="${q.key }">${q.value }</option>
									</c:forEach>
								</select>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>密保提问答案：</td>
	                        <td><input class="pt" type="text" name="answer" id="answerId"/></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>验证码：</td>
	                        <td>
	                        	<input class="pt code_pt" type="text"  name="rand" id="randId"/>
	                        	<img onClick="changeRandImg();return false;" id="rand_img"  src="${ctx }/servlet/randimgservlet" style="vertical-align:middle"/>
	                        	<a href="javascript:void(0)" onClick="changeRandImg();return false;">换一张</a>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"></td>
	                        <td>
	                        	<input type="button" value="立即注册" id="registBtnId"/>
	                        </td>
	                    </tr>
	                </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>