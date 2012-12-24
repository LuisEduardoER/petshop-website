<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--

	$(document).ready(function() {
		$(".search_btn").unbind().bind("click", function() {
			var keyWord = $("#keyWordId").val();
			window.location.href = ctx + "/en/searchByKeyWord?keyWord="+keyWord;
			return false;
		});

		$(".hotword a").unbind().bind("click", function() {
			$this = $(this);
			var keyWord = $this.text();
			window.location.href = ctx + "/en/searchByKeyWord?keyWord="+keyWord;
			return false;
		});
	});
//-->
</script>
<div class="search">
	<div class="search_txt"><input type="text" id="keyWordId"/></div>
    <input type="button" class="search_btn" />
</div>
<div class="hotword">Hot Search:
	 <a href="javascript:void(0);">War</a>
	 <a href="javascript:void(0);">Cute</a>  
	 <a href="javascript:void(0);">SLG</a>
	 <a href="javascript:void(0);">Chess</a>
</div>