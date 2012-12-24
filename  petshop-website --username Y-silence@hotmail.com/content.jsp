<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/en/meta.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/fancybox/jquery.fancybox-1.3.4.css"></c:url>" />
<script type="text/javascript" src="<c:url value="/js/fancybox/jquery.fancybox-1.3.4.pack.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.hashchange.min.js"></c:url>"></script>
<script type="text/javascript" src="<c:url value="/js/en/commom.js"/>"></script>
<script type="text/javascript">
	
	function getProductInfo(name,footId){
			
			var url = ctx + '/en/content/' + name;
			
			$.post(url, {
				footId : footId
			}, function(html) {
				$(".product_content").html(html);
			});
			
		}

	$(document).ready(function(){
		PWIE.menu();
		PWIE.tab(".rank_tab>a",".rank_content>table","on");

		var hashmap = {
			"intro": "comment",
			"param": "param",
			"picture": "picture",
			"evaluate": "evaluate",
			"video": "video"
		};
		
		$(window).hashchange(function(){
			var hash = window.location.hash || "#intro";
			var key = hash.substr(1);
			var footId = $("#footId").val();
			if(hashmap[key]){
				$(".product_tab li").removeClass("on");
				$("."+key).addClass("on");
				getProductInfo(hashmap[key],footId);
			}
		});
		
		$(window).hashchange();
		
		$(".product_tab a").click(function(){
			window.location.hash = this.href.split("#")[1];
			return false;
		});
		

		$(".product-piclist .pic").live("click",function(){
			var src = $(this).find("img").attr("src");
			$.fancybox(src,{
				"type":"image"
			});
			return false;
		});
		
		//关注--添加收藏
		$(".guanzhu").bind("click", function() {

			var currentUserId = $.trim($("#currentUserId").val());
			if (currentUserId == "") {
				window.location = ctx + "/en/prelogin";
			} else {
				$.ajax({
					url : ctx + "/en/mu/foot/collect",
					data : {
						footId : $("#footId").val()
					},
					type : 'post',
					dataType : 'json', 
					success : function(data) {
						if (data) {
							if (data.noLogin != null) {
								alert("Please Login");
								window.location = ctx + "/en/prelogin";
							} else if (data.hasfoot != null) {
								alert("Product has been in your Favorite Folders.");
							} else if (data.result == "success") {
								alert("Successfully paid attention");
							} else {
								alert("Failed to pay attention");
							}
						} 
					}
				});
			}
			return false;
		});

		
	});

</script>
</head>

<body>
	<input type="hidden" id="currentUserId" value="${currentUser.id }">
	<c:set value="/images/xuan.jpg" var="xuanPic"></c:set>
<!-- 头部导航条START-->
	<c:import url="/en/head"></c:import>
<!-- 头部导航条END -->
<div class="wrapper pagewrap">
	<div class="center">
	<!-- 产品分类 START-->
		<c:import url="/en/menu"></c:import>
	<!-- 产品分类 END -->
		
	    <!-- 搜索条start -->
	    <div class="search_bar">
	        <c:import url="/en/hotSearch"></c:import>
	    </div>
	    <!-- 搜索条end -->
	    
	    <!--主体内容start-->
	    <div class="pagemain fix">
	    	<div class="leftmod">
	    		<!-- 左侧详细信息 start -->
	    			<input type="hidden" id="footId" value="${foot.id }">
	    			<div class="product_img"> 
						<img width="655" height="237"
							<c:choose>
				    			<c:when test="${xcPicture.path != null}">
				    				src="${ctx }${xcPicture.path }"
				    			</c:when>
				    			<c:otherwise>
				    				src="${ctx }${xuanPic }"
				    			</c:otherwise>
							</c:choose>
						/>
					</div>
					<div class="main650">
						<div class="product_menu">
						 	<ul class="fix">
						         <li><a href="javascript:void(0);" class="guanzhu"></a></li>
						         <li><a href="javascript:void(0);" class="compare" onClick="compareLayer.add('${foot.id}');"></a></li>
						     </ul>
					 	</div>
                        <div class="product_nav">
                        	<a href="<c:url value="/en/index"></c:url>">Home</a> > ${foot.nameEn }
                        </div>
					 	<div class="product_tab">
						 	<ul class="fix">
						 		<li class="intro" class="on"><a href="#intro">Intro</a></li>
					         	<li class="param"><a href="#param">Parameters</a></li>
					         	<li class="picture"><a href="#picture">Picture</a></li>
						   </ul>
						</div>
					 	<div class="product_content">
						</div>
					</div>
	    		<!-- 左侧详细信息 end -->
	    	</div>
	        <div class="rightmod">
	        	<!-- 排行榜 start -->
		    		<c:import url="/en/paihangbang"></c:import>
		    	<!-- 排行榜 end -->
	            <div class="rightgg2">
	           		<!--  <div id="rightgg_swf"></div>  FLASH广告 -->
					<a href="/en/content?footId=82" target="_blank"><img src="/images/ch/pices/gg_20120611.jpg" /></a> 
	            </div>
	            <!-- 精品推荐 start-->
	            	<c:import url="/en/recommond"></c:import>
	            <!-- 精品推荐 end-->
	       	</div>
	   	</div>
	    <!--主体内容end-->
</div>
</div>
<c:import url="/en/buttom"></c:import>
</body>
</html>