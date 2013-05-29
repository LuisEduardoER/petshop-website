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

		//登陆
		$("#loginId").click(function() {
			var account = $.trim($("#accountId").val());
			var password = $.trim($("#passwordId").val());
			if (account == "") {
				alert("请输入通行证账号");
				$("#accountId").focus();
				return false;
			}
			if (password == "") {
				alert("请输入密码");
				$("#passwordId").focus();
				return false;
			}

			var options = {
					url : ctx + "/ch/login",
					dataType : "json",
					success : function(data) {
						if (data) {
							if (data.msg != null) {
								alert(data.msg);
								$("#passwordId").val("");
							} else if (data.result == "success") {
								window.location = ctx + "/ch/index";
							} else {
								alert("登录出错");
							} 
						} else {
							alert("登录出错");
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
	                        <td><b>欢迎您登录我的宠物食品店</b></td>
	                    </tr>
	                	<tr>
	                    	<td class="lb">账号：</td>
	                        <td><input class="pt" type="text"  name="account" id="accountId"/></td>
	                    </tr>
	                    <tr>
	                    	<td class="lb">密码：</td>
	                        <td>
	                        	<input class="pt" type="password" name="password" id="passwordId"/><br>
	                        	<a href="${ctx }/ch/find" >忘记密码？</a>
	                        </td>
	                    </tr>
	                    <tr style="display: none">
	                    	<td class="lb">验证码：</td>
	                        <td>
	                        	<input class="pt" type="text" name="rand" id="randId" /><br>
					        	<img onClick="changeRandImg();return false;" id="rand_img"  src="${ctx }/servlet/randimgservlet" width="48" height="19" />
					        	<a href="javascript:void(0)" onClick="changeRandImg();return false;">换一张</a>
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
            <p class="p2">如果您还没有注册账号</p>
            <a href="${ctx }/ch/regist" class="btn_reg" target="_blank"></a>
        </div>
        </div>
       
    </div>
</div>
</body>
</html>