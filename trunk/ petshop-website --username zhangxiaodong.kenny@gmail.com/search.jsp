<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>我的美丽宠物食品店</title>
<%@ include file="/common/ch/meta.jsp" %>
<script type="text/javascript" src="<c:url value="/js/ch/commom.js"/>"></script>
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
			window.location.href = ctx + '/ch/search?selectTypeIds=' + selectTypeIds +"&selectInfoIds=" + selectInfoIds+"&ext="+$("#extId").val();
			return false;
		});

		//点击游戏图片和游戏名称，进入产品详细信息页面
		$(".product_list .pic").bind("click", function() {
			$this = $(this);
			var footId = $this.closest("li").attr("footId")
			window.location.href = ctx + "/ch/content?footId=" + footId;
			return false;
		});

		//产品收藏
		$(".collect").bind("click", function() {
			var currentUserId = $.trim($("#currentUserId").val());
			if (currentUserId == "") {
				window.location = ctx + "/ch/prelogin"
			} else {
				var $this = $(this);
				var $li = $this.closest("li");
				var footId = $li.attr("footId");

				$.ajax({
					url : ctx + "/ch/mu/foot/collect",
					data : {
						footId : footId
					},
					type : 'post',
					dataType : 'json', 
					success : function(data) {
						if (data) {
							if (data.noLogin != null) {
								alert("您还没登录，请登录");
								window.location = ctx + "/ch/prelogin";
							} else if (data.hasFoot != null) {
								alert("您已经收藏过该产品");
							} else if (data.result == "success") {
								alert("加入收藏成功");
							} else {
								alert("加入收藏失败");
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
				window.location = ctx + "/ch/prelogin"
			} else {
				window.location = ctx + "/ch/mu/user/message";
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
    <!--主体内容start-->
    <div class="pagemain fix">
    	<div class="leftmod">
        	<div class="search_banner">
            </div>

            <div class="main650">
            
	            <!-- search filter start-->
	            <div class="breadnav">
	            	<div class="product_name">
	            		
	                	<span>&nbsp;&nbsp;搜索结果 ${count } 条</span>
                	</div>
	            </div>
	            <div class="search_filter">
	            	<div class="search_filter_title">按条件选择</div>
     				<c:set value=";${selectTypeIds}" var="typeIds"></c:set>
					<c:set value=";${selectInfoIds}" var="infoIds"></c:set>
					<div class="search_filter_content">
				     	<c:forEach items="${selectTypes}" var="selectType">
				     		<c:set value=";${selectType.id};" var="typeId" />
							<dl selectTypeId=${selectType.id }>
								<dt>${selectType.nameCh }：</dt>
								<dd>
									<ul>
										<li <c:if test="${!fn:contains(typeIds,typeId) }">class="on"</c:if>><input type="checkbox" <c:if test="${!fn:contains(typeIds,typeId) }">checked</c:if> />全部</li>
											<c:forEach items="${selectType.infos}" var="info">
												<c:if test="${info.selectInfoCh != '-'}">
													<c:set value=",${info.id}," var="infoId1" />
													<c:set value=";${info.id}," var="infoId2" />
													<li infoId="${info.id }" <c:if test="${fn:contains(infoIds,infoId1)||fn:contains(infoIds,infoId2) }">class="on"</c:if>><input type="checkbox" <c:if test="${fn:contains(infoIds,infoId1)||fn:contains(infoIds,infoId2) }">checked</c:if> />${info.selectInfoCh }</li>
												</c:if>
											</c:forEach>
									</ul>
								</dd>
							</dl>
						</c:forEach>
            <div class="search_filter_toggle">
            	<a href="javascript:void(0);" class="close">
            		<span>
            			<c:choose>
            				<c:when test="${ext != null && ext == 'show'}">
            					收缩
            				</c:when>
            				<c:otherwise>
            					展开
            				</c:otherwise>
            			</c:choose>
            		</span>
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
											this.innerHTML = "<span>展开</span>";
											$("#extId").val("");
										}, function(){
											extFilter.show();
											this.className = "open";
											this.innerHTML = "<span>收缩</span>";
											$("#extId").val("show");
										});
									} else {
										extFilter.hide();
										$(".search_filter_toggle > a").toggle(function(){
											extFilter.show();
											this.className = "open";
											this.innerHTML = "<span>收缩</span>";
											$("#extId").val("show");
										}, function(){
											extFilter.hide();
											this.className = "close";
											this.innerHTML = "<span>展开</span>";
											$("#extId").val("");
										});
									}
									
								})(jQuery);
              </script>

				<!-- search list start -->
	            <div class="top_page">
	            	<div class="pages">
	            		<c:if test="${!empty commonListTop && commonListTop.pageNum>1 }">
	            			<c:choose>
	            				<c:when test="${null != keyWord}">
									<g:page commonList="${commonListTop}"  uri="${ctx}/ch/searchByKeyWord" target="html" pageNum="4" model="3" />	            					
	            				</c:when>
	            				<c:otherwise>
			            			<g:page commonList="${commonListTop}"  uri="${ctx}/ch/search" target="html" pageNum="4" model="3" />  
	            				</c:otherwise>
	            			</c:choose>
	            		</c:if>
	                </div>
	            </div>
	
	            <ul class="product_list fix">
	            	<c:choose>
	            		<c:when test="${!empty foots}">
	            			<c:forEach items="${foots}" var="foot">
								<li footId="${foot.id }">
							    	<span class="hot"></span> 
							    	<a href="javascript:void(0);" class="pic">
							    		<img alt="${foot.nameCh }" width="206" height="168"
							    			<c:choose>
								    			<c:when test="${foot.logo != null}">
								    				src="${ctx }${foot.logo }"
								    			</c:when>
								    			<c:otherwise>
								    				src="${ctx }${defaultPic }"
								    			</c:otherwise>
											</c:choose>
							    		/>
							    	</a>
							   	 	<p class="desc">《${foot.nameCh }》
							   	 		<c:choose>
							   	 			<c:when test="${fn:length(foot.chParam) < 25}">
							   	 				${foot.chParam }
							   	 			</c:when>
							   	 			<c:otherwise>
							   	 				${fn:substring(foot.chParam,0,25) }....
							   	 			</c:otherwise>
							   	 		</c:choose>
							   	 	</p>
							    	<p class="btn">
							    		<a href="javascript:void(0)" class="msgClass">预约联系</a> 
							        	<a href="javascript:void(0)" class="collect" >加入收藏</a>
							        	<a href="javascript:void(0)" onClick="compareLayer.add('${foot.id}');">加入比较</a>
							    	</p>
								</li>
							</c:forEach>
	            		</c:when>
	            		<c:otherwise>
							<div align="center">暂无您需要的产品</div>
	            		</c:otherwise>
	            	</c:choose>
	                
	            </ul>
	            
	            <div class="foot_page">
	            	<div class="pages">
	            		<c:if test="${!empty commonListFoot && commonListFoot.pageNum>1 }">
	            			<c:choose>
	            				<c:when test="${null != keyWord}">
		            				<g:page commonList="${commonListFoot}"  uri="${ctx}/ch/searchByKeyWord" target="html" pageNum="4" model="4" />	
	            				</c:when>
	            				<c:otherwise>
									<g:page commonList="${commonListFoot}"  uri="${ctx}/ch/search" target="html" pageNum="4" model="4" />  
	            				</c:otherwise>
	            			</c:choose>
						</c:if>
	                </div>
	            </div>
				<!-- search list end -->
            </div>
        </div>
        <div class="rightmod">
        	<c:import url="/ch/paihangbang"></c:import>
            <div class="rightgg2">
            	<!-- <div id="rightgg_swf"></div>  FLASH广告 -->
				<a href="/ch/content?footId=82" target="_blank"><img src="/images/ch/pices/gg_20120611.jpg" /></a> 
            </div>
             <!-- 精品推荐 start-->
           	<c:import url="/ch/recommond"></c:import>
            <!-- 精品推荐 end-->
        </div>
    </div>
    <!--主体内容end-->
</div>
</div>
	<c:import url="/ch/buttom"></c:import>
</body>
</html>