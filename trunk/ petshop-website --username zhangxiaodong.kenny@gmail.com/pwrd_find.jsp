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
		var account = $.trim($("#accountId").val());
		var rand = $.trim($("#randId").val());
		if (account == "") {
			$("#noAccountId").show();
			$("#accountId").focus();
			return false;
		} else {
			$("#noAccountId").hide();
		}
		if (rand == "") {
			$("#randErrorId").html("Fill in Code").show();
			$("#randId").focus();
			return false;
		} else {
			$("#randErrorId").hide();
		}
		
		$.ajax({
			url : ctx + "/en/find/submit",
			data : {
				account : account,
				rand : rand
			},
			type : 'post',
			dataType : 'json', 
			success : function(data) {
				if (data) {
					if (data.msg != null) {
						alert(data.msg);
						$("#randId").val("");
						changeRandImg();
					} else {
						window.location = ctx + "/en/find2?enAccount="+data.enAccount;
						
					}
				} 
			}
		});
		return false;
	});

});

function changeRandImg() {
    document.getElementById('rand_img').src = ctx + "/servlet/randimgservlet?rand=rand" + "&r=" + Math.random();
}

function checkUser(account) {
	$.ajax({
		url : ctx + "/en/checkUser",
		data : {
			account : account
		},
		type : 'post',
		dataType : 'json', 
		success : function(data) {
			if (data) {
				if (data.result == "success") {
					$("#noAccountId").hide();
				} else {
					$("#noAccountId").show();
				}
			} 
		}
	});
}

</script>


</head>

<body class="minpage_body">
<div class="minpage">
	<div class="minpage_box">
        <div class="minpage_inner minpage_pwd_bg">
        	<dl class="minpage_title">
            	<dt>Password retrieve</dt>
            </dl>
            <div class="minpage_form">
            	<table>
                	<colgroup>
                    	<col width="208" />
                        <col />
                    </colgroup>
                	<tr>
                    	<td class="lb">Account：</td>
                        <td>
                        	<input class="pt" id="accountId" type="text" onblur="checkUser(this.value)"/>&nbsp;&nbsp;<br>
                        	<span id="noAccountId" style="font-size:12px;color: red; display: none;">Your Passport Account is used，Please<a href="${ctx }/en/regist">Regist</a></span>
                        </td>
                    </tr>
                    <tr>
                    	<td class="lb">Code：</td>
                        <td>
                        	<input class="pt" type="text" name="rand" id="randId" />
                        	<div class="val_code">
                        		<img onClick="changeRandImg();return false;" id="rand_img"  src="${ctx }/servlet/randimgservlet" />
                        		<a href="javascript:void(0)" onClick="changeRandImg();return false;">Refresh</a>
                        		<span id="randErrorId" style="font-size:12px;color: red; display: none;"></span>
                        	</div>
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