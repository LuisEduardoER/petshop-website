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

		//登陆
		$("#loginId").click(function() {
			var account = $.trim($("#accountId").val());
			var password = $.trim($("#passwordId").val());
			if (account == "") {
				alert("Fill in passport account");
				$("#accountId").focus();
				return false;
			}
			if (password == "") {
				alert("Fill in password");
				$("#passwordId").focus();
				return false;
			}

			var options = {
					url : ctx + "/en/login",
					dataType : "json",
					success : function(data) {
						if (data) {
							if (data.msg != null) {
								alert(data.msg);
								$("#passwordId").val("");
							} else if (data.result == "success") {
								window.location = ctx + "/en/index";
								
							} else {
								alert("Failed to Login");
							} 
						} else {
							alert("Failed to Login");
						}
					}
				};
			$("#loginFormId").ajaxForm(options);
			$("#loginFormId").submit();	
			
			return false;
		});
	});

	function changeRandImg() {
	    document.getElementById('rand_img').src = ctx + "/servlet/randimgservlet?rand=rand" + "&r=" + Math.random();
	}
</script>

</head>

<body class="minpage_body">
<div class="minpage">
	<div class="minpage_box">
        <div class="minpage_inner fix">
            <div class="minpage_form login_form">
            	<form action="" method="post" id="loginFormId">
	            	<table>
	                	<colgroup>
	                    	<col width="165" />
	                        <col />
	                    </colgroup>
	                    <tr>
	                    	<td></td>
	                        <td><b>welcome to My pet food house!</b></td>
	                    </tr>
	                	<tr>
	                    	<td class="lb">Account:</td>
	                        <td><input class="pt" type="text"  name="account" id="accountId"/></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb">password:</td>
	                        <td>
	                        	<input class="pt" type="password" name="password" id="passwordId"/><br>
	                        	<a href="${ctx }/en/find" >Forgot password?</a>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td class="lb"></td>
	                        <td>
	                        	<input class="btn_login" type="button" id="loginId" value="" />
	                        </td>
	                    </tr>
	                </table>
                </form>
            </div>
             <div class="reg_tip">
            <p class="p2">If you have not registered accounts</p>
            <a href="${ctx }/en/regist" class="btn_reg" target="_blank"></a>
        </div>
        </div>
       
    </div>
</div>
</body>
</html>