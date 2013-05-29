<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--

	$(document).ready(function() {
		$(".search_btn").unbind().bind("click", function() {
			var keyWord = $("#keyWordId").val();
			window.location.href = ctx + "/ch/searchByKeyWord?keyWord="+keyWord;
			return false;
		});

		$(".hotword a").unbind().bind("click", function() {
			$this = $(this);
			var keyWord = $this.text();
			window.location.href = ctx + "/ch/searchByKeyWord?keyWord="+keyWord;
			return false;
		});
	});
//-->
</script>
<div class="search">
	<div class="search_txt"><input type="text" id="keyWordId"/></div>
    <input type="button" class="search_btn" />
</div>
<div class="hotword">热门搜索：
	 <a href="javascript:void(0);">三国</a>  
	 <a href="javascript:void(0);">武侠</a>  
	 <a href="javascript:void(0);">赛车</a>  
	 <a href="javascript:void(0);">战争</a>  
	 <a href="javascript:void(0);">神器</a>  
	 <a href="javascript:void(0);">穿越</a>  
	 <a href="javascript:void(0);">小说</a>
</div>