<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>MY BEAUTIFUL PAT FOOD HOUSE</title>
<%@ include file="/common/en/meta.jsp" %>
<script type="text/javascript" src="<c:url value="/js/en/commom.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){

		
		PWIE.menu();
		PWIE.tab(".rank_tab>a",".rank_content>table","on");
		addSWF(ctx + "/images/ch/pices/dugeon-303-210.swf", "rightgg_swf",303,210);
		//下拉框
		$(".dropdown").hover(
			function(){
				$(this).find(".dropdown_list").show();
			},
			function(){
				$(this).find(".dropdown_list").hide();
			}
		)

		
		$(".search_filter_content li").bind("click", function() {
			//为每个选择项添加选中事件
			$this = $(this);
			$li = $this.closest("li");
			$ul = $this.closest("ul");
			if ($this.text() == $ul.find("li:first").text()) {
				//选择全部
				$ul.find("li").removeClass("on");
				$li.addClass("on");
			} else {
				$ul.find("li:first").removeClass("on");
				if ($li.hasClass("on")) {
					$li.removeClass("on");
				} else {
					$li.addClass("on");
				}
				
				if ($ul.find("li.on").length == 0) {
					$ul.find("li:first").addClass("on");
				}
			}

			//为每个选择条件，添加搜索事件
			var selectTypeIds = "";
			var selectInfoIds = "";
			$(".search_filter_content").find("ul").each(function() {
				$ul = $(this);
				if (!$ul.find("li:first").hasClass("on")) {
					selectTypeIds += $ul.closest("dl").attr("selectTypeId") + ";";
				}
				var hasOn = false;
				$ul.find("li:gt(0)").each(function(){
					if ($(this).hasClass("on")) {
						selectInfoIds += $(this).attr("infoId") + ",";
						hasOn = true;
					}
				});
				if (hasOn) {
					selectInfoIds += ";";
				}
			});
			window.location.href = ctx + '/en/search?selectTypeIds=' + selectTypeIds +"&selectInfoIds=" + selectInfoIds + "&ext="+$("#extId").val();
			return false;
		});

		//点击游戏图片和游戏名称，进入产品详细信息页面
		$(".product_list .pic").bind("click", function() {
			$this = $(this);
			var gameId = $this.closest("li").attr("gameId")
			window.location.href = ctx + "/en/content?gameId=" + gameId;
			return false;
		});

		//产品收藏
		$(".collect").bind("click", function() {
			var currentUserId = $.trim($("#currentUserId").val());
			if (currentUserId == "") {
				window.location = ctx + "/en/prelogin"
			} else {
				var $this = $(this);
				var $li = $this.closest("li");
				var gameId = $li.attr("gameId");

				$.ajax({
					url : ctx + "/en/mu/game/collect",
					data : {
						gameId : gameId
					},
					type : 'post',
					dataType : 'json', 
					success : function(data) {
						if (data) {
							if (data.noLogin != null) {
								alert("Please Login");
								window.location = ctx + "/en/prelogin";
							} else if (data.hasGame != null) {
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

		//商信
		$(".msgClass").bind("click", function() {
			var currentUserId = $.trim($("#currentUserId").val());
			if (currentUserId == "") {
				window.location = ctx + "/en/prelogin"
			} else {
				window.location = ctx + "/en/mu/user/message";
			}
			return false;
		});



	});

	
</script>
</head>

<body>
	<input type="hidden" id="currentUserId" value="${currentUser.id }">
	<input type="hidden" id="extId" value="${ext }">
	<c:set value="/images/default.jpg" var="defaultPic"></c:set>
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
    <!--主体内容start-->
    <div class="pagemain fix">
    	<div class="leftmod">
        	<div class="search_banner">
            </div>

            <div class="main650">
            
	            <!-- search filter start-->
	            <div class="breadnav">
	            	<div class="product_name">
	            		
	                	<span>&nbsp;&nbsp;Result: ${count } </span>
                	</div>
	            </div>
	            <div class="search_filter">
	            	<div class="search_filter_title">Condition Selection</div>
     				<c:set value=";${selectTypeIds}" var="typeIds"></c:set>
					<c:set value=";${selectInfoIds}" var="infoIds"></c:set>
					<div class="search_filter_content">
				     	<c:forEach items="${selectTypes}" var="selectType">
				     		<c:set value=";${selectType.id};" var="typeId" />
							<dl selectTypeId=${selectType.id }>
								<dt>${selectType.nameEn }：</dt>
								<dd>
									<ul>
										<li <c:if test="${!fn:contains(typeIds,typeId) }">class="on"</c:if>><input type="checkbox" <c:if test="${!fn:contains(typeIds,typeId) }">checked</c:if> />ALL</li>
											<c:forEach items="${selectType.infos}" var="info">
												<c:if test="${info.selectInfoEn != '-'}">
													<c:set value=",${info.id}," var="infoId1" />
													<c:set value=";${info.id}," var="infoId2" />
													<li infoId="${info.id }" <c:if test="${fn:contains(infoIds,infoId1)||fn:contains(infoIds,infoId2) }">class="on"</c:if>><input type="checkbox" <c:if test="${fn:contains(infoIds,infoId1)||fn:contains(infoIds,infoId2) }">checked</c:if> />${info.selectInfoEn }</li>
												</c:if>
											</c:forEach>
									</ul>
								</dd>
							</dl>
						</c:forEach>
            <div class="search_filter_toggle">
            	<a href="javascript:void(0);" class="close">
            		<c:choose>
            				<c:when test="${ext != null && ext == 'show'}">
            					Close
            				</c:when>
            				<c:otherwise>
            					Open
            				</c:otherwise>
            			</c:choose>
				</a>
            </div>
			       </div>
	            </div>
	            <!-- search filter end-->
	             <script type="text/javascript">
              	(function($){
									var extFilter = $(".search_filter_content dl:gt(3)");
									if (${ext != null && ext == "show"}) {
										$(".search_filter_toggle > a").toggle(function(){
											extFilter.hide();
											this.className = "close";
											this.innerHTML = "<span>Open</span>";
											$("#extId").val("");
										}, function(){
											extFilter.show();
											this.className = "open";
											this.innerHTML = "<span>Close</span>";
											$("#extId").val("show");
										});
									} else {
										extFilter.hide();
										$(".search_filter_toggle > a").toggle(function(){
											extFilter.show();
											this.className = "open";
											this.innerHTML = "<span>Close</span>";
											$("#extId").val("show");
										}, function(){
											extFilter.hide();
											this.className = "close";
											this.innerHTML = "<span>Open</span>";
											$("#extId").val("");
										});
									}
									
								})(jQuery);
              </script>
	            <!-- search type start -->
	            <div class="search_type" style="display:none">
	            	<ul class="fix">
						<li class="on"><a href="javascript:void(0);">所有产品</a></li>
	                    <li><a href="javascript:void(0);">新品入驻</a></li>	
	                    <li><a href="javascript:void(0);">官方认证</a></li>
	                    <li><a href="javascript:void(0);">成功授权</a></li>
	                    <li><a href="javascript:void(0);">体验试玩</a></li>

	                </ul>
	            </div>
	            <!-- search type end -->
	            

	            <!-- search sort end -->

				<!-- search list start -->
	            <div class="top_page">
	            	<div class="pages">
	            		<c:if test="${!empty commonListTop && commonListTop.pageNum>1 }">
	            			<c:choose>
	            				<c:when test="${null != keyWord}">
									<g:page commonList="${commonListTop}"  uri="${ctx}/en/searchByKeyWord" target="html" pageNum="4" model="5" />	            					
	            				</c:when>
	            				<c:otherwise>
			            			<g:page commonList="${commonListTop}"  uri="${ctx}/en/search" target="html" pageNum="4" model="5" />  
	            				</c:otherwise>
	            			</c:choose>
	            		</c:if>
	                </div>
	            </div>
	
	            <ul class="product_list fix">
	            	<c:choose>
	            		<c:when test="${!empty games}">
	            			<c:forEach items="${games}" var="game">
								<li gameId="${game.id }">
							    	<span class="hot"></span> 
							    	<a href="javascript:void(0);" class="pic">
							    		<img alt="${game.nameEn }" width="206" height="168"
							    			<c:choose>
								    			<c:when test="${game.logo != null}">
								    				src="${ctx }${game.logo }"
								    			</c:when>
								    			<c:otherwise>
								    				src="${ctx }${defaultPic }"
								    			</c:otherwise>
											</c:choose>
							    		/>
							    	</a>
							   	 	<p class="desc">《${game.nameEn }》
							   	 		<c:choose>
							   	 			<c:when test="${fn:length(game.enParam) < 25}">
							   	 				${game.enParam }
							   	 			</c:when>
							   	 			<c:otherwise>
							   	 				${fn:substring(game.enParam,0,25) }....
							   	 			</c:otherwise>
							   	 		</c:choose>
							   	 	</p>
							    	<p class="btn">
							    		<a href="javascript:void(0)" class="msgClass">Subscribe</a> 
							        	<a href="javascript:void(0)" class="collect" >Favorite</a>&nbsp;&nbsp;&nbsp;&nbsp;
							        	<a href="javascript:void(0)" onClick="compareLayer.add('${game.id}');">Contrast</a>
							    	</p>
								</li>
							</c:forEach>
	            		</c:when>
	            		<c:otherwise>
							<div align="center">No Product</div>
	            		</c:otherwise>
	            	</c:choose>
	                
	            </ul>
	            
	            <div class="foot_page">
	            	<div class="pages">
	            		<c:if test="${!empty commonListFoot && commonListFoot.pageNum>1 }">
	            			<c:choose>
	            				<c:when test="${null != keyWord}">
		            				<g:page commonList="${commonListFoot}"  uri="${ctx}/en/searchByKeyWord" target="html" pageNum="4" model="6" />	
	            				</c:when>
	            				<c:otherwise>
									<g:page commonList="${commonListFoot}"  uri="${ctx}/en/search" target="html" pageNum="4" model="6" />  
	            				</c:otherwise>
	            			</c:choose>
						</c:if>
	                </div>
	            </div>
				<!-- search list end -->
            </div>
        </div>
        <div class="rightmod">
        	<c:import url="/en/paihangbang"></c:import>
            <div class="rightgg2">
            	<!-- <div id="rightgg_swf"></div>  FLASH广告 -->
				<a href="/en/content?gameId=82" target="_blank"><img src="/images/ch/pices/gg_20120611.jpg" /></a> 
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