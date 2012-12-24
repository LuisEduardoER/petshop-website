<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/en/meta.jsp" %>
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
				alert("Fill in Passport account");
				$("#accountId").focus();
				return false;
			}
			if (account.length > 16 || account.length < 6) {
				alert("Passport account has to be 6-16 characters and numbers");
				$("#accountId").focus();
				return false;
			}
			 var regu = /^[a-zA-Z]+/;
			if (!regu.test(account)) {
				alert("Passport account has to start with letter");
				$("#accountId").focus();
				return false;
			}
			var reguA = /^[a-zA-Z]\w{5,15}$/;
			if (!reguA.test(account)) {
				alert("Passport account has to be 6-16 characters and numbers");
				$("#accountId").focus();
				return false;
			}
			
			if (password == "") {
				alert("Fill in password");
				$("#passwordId").focus();
				return false;
			}
			var reguB = /\w{6,16}$/;
			if (password.length > 16 || password.length < 6 || !reguB.test(password)) {
				alert("Password has to be 6-16 characters and numbers");
				$("#passwordId").focus();
				return false;
			}

			if (repassword == "") {
				alert("Confirm password");
				$("#repasswordId").focus();
				return false;
			}
			if (repassword != password) {
				alert("Wrong password");
				$("#repasswordId").focus();
				return false;
			}

			if (email == "") {
				alert("Fill in email");
				$("#emailId").focus();
				return false;
			}
			if (email.length > 100) {
				alert("Wrong email address");
				$("#accountId").focus();
				return false;
			}
			if (!validateEmail(email)) {
				alert("Unvalid email");
				$("#emailId").focus();
				return false;
			} 

			if (name == "") {
				alert("Fill in Real Name");
				$("#nameId").focus();
				return false;
			}

			if (name.length > 200) {
				alert("Real Name, not more than 200 letters");
				$("#nameId").focus();
				return false;
			}

			if (questionId == 0) {
				alert("Please select a security question for password retrieve");
				$("#questionIdId").focus();
				return false;
			}

			if (answer == "") {
				alert("Answer to security question is empty");
				$("#answerId").focus();
				return false;
			}
			if (answer.length > 200) {
				alert("Answer to security question too long");
				$("#answerId").focus();
				return false;
			}

			if (rand == "") {
				alert("Fill in Code");
				$("#randId").focus();
				return false;
			}

			var options = {
					url : ctx + "/en/user/save",
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
								window.location = ctx + "/en/regist/suc";
							} else {
								window.location = ctx + "/en/regist/err";
							} 
						} else {
							window.location = ctx + "/en/regist/err";
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
            	<dt>Register</dt>
            </dl>
            <div class="minpage_form reg_form">
            	<form action="" method="post" id="registFormId">
	            	<table>
	                	<colgroup>
	                    	<col width="208" />
	                        <col />
	                    </colgroup>
	                	<tr>
	                    	<td class="lb"><font style="color:red">* </font>Passport account：</td>
	                        <td><input class="pt" type="text"  name="account" id="accountId"/></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>Passport password：</td>
	                        <td>
	                        	<input class="pt" type="password" name="password" id="passwordId" onblur="pwStrength(this.value)" onafterpaste="this.value=this.value.replace(/\W/g,'')" onkeyup="pwStrength(this.value);this.value=this.value.replace(/\W/g,'')" maxlength="16"/>
	                        	<span class="tip"> 6-16 characters and numbers</span>
		                        <div class="pwd_grade fix">
		                        	<span>Security level：</span>
		                            <em id="strength_L" class="ash">low</em>
		                            <em id="strength_M" class="ash">mid</em>
		                            <em id="strength_H" class="ash">high</em>
		                        </div>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>Confirm password：</td>
	                        <td><input class="pt" type="password" name="repassword" id="repasswordId" /></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>Email：</td>
	                        <td><input class="pt" type="text" name="email" id="emailId"/></td>
	                    </tr>
	                     <tr>
	                    	<td class="lb"><font style="color:red">* </font>Real Name：</td>
	                        <td><input class="pt" type="text" name="name" id="nameId" /></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>Security code question：</td>
	                        <td>
	                        	<select name="questionId" id="questionIdId" class="pt">
									<option value="0">Choose</option>
									<c:forEach items="${questions}" var="q">
										<option value="${q.key }">${q.value }</option>
									</c:forEach>
								</select>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>Answer：</td>
	                        <td><input class="pt" type="text" name="answer" id="answerId"/></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"><font style="color:red">* </font>Code：</td>
	                        <td>
	                        	<input class="pt code_pt" type="text"  name="rand" id="randId"/>
	                        	<img onClick="changeRandImg();return false;" id="rand_img"  src="${ctx }/servlet/randimgservlet" style="vertical-align:middle"/>
	                        	<a href="javascript:void(0)" onClick="changeRandImg();return false;">Change another</a>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"></td>
	                        <td>
	                        	<input type="button" value="Rigist" id="registBtnId"/>
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