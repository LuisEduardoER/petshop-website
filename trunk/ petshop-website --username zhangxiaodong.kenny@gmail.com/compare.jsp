﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>我的美丽宠物食品店</title>
<%@ include file="/common/ch/meta.jsp" %>

<script type="text/javascript">

	$(document).ready(function() {

		<c:if test="${selectTypeIds!=null}">
			<c:forEach items="${selectTypeIds}" var="selectTypeId" varStatus="vs">
				if (${selectTypeId} > 0) {
					
					$.post(ctx + '/ch/selectTypeInfo/list',{
						selectTypeId : ${selectTypeId}
					}, function(data){
						if (data) {
							var $compareItem =  $(".compare_item_list").find(".compare_item:eq(${vs.index})");
							var $selectInfoSele = $compareItem.find("select[name=selectInfoSele]");
							$selectInfoSele.empty();
							$("<option></option>").attr("value", 0).html("-选择-").appendTo($selectInfoSele);
							$.each(data.selectTypeInfos, function(i,v) {
									if (v.selectInfoCh != "-") {
										if (${selectInfoIds[vs.index]} == v.id) {
											$("<option></option>").attr("value", v.id).attr("selected",true).html(v.selectInfoCh).appendTo($selectInfoSele);
										} else {
											$("<option></option>").attr("value", v.id).html(v.selectInfoCh).appendTo($selectInfoSele);
										}
									}
									
							});
						}
					});
				}
			</c:forEach>
		</c:if>
			
		
		//改变selectType
		$(".compare_item select[name=selectTypeSele]").bind("change", function() {
			var $this = $(this);
			var $selectInfoSele =$this.parent().parent().find("select[name=selectInfoSele]");
			var selectTypeId = $this.val();
			$.post(ctx + '/ch/selectTypeInfo/list',{
					selectTypeId : selectTypeId
				}, function(data){
					if (data) {
						$selectInfoSele.empty();
						$("<option></option>").attr("value", 0).html("-选择-").appendTo($selectInfoSele);
						$.each(data.selectTypeInfos, function(i,v) {
							if (v.selectInfoCh != "-") {
								$("<option></option>").attr("value", v.id).html(v.selectInfoCh).appendTo($selectInfoSele);
							}
						});
					}
				});
		});

		
		//改变selectInfo
		$(".compare_item select[name=selectInfoSele]").bind("change", function() {
			var $this = $(this);
			var $selectGameSele =$this.parent().parent().find("select[name=selectGameSele]");
			var selectInfoId = $this.val();
			$.post(ctx + '/ch/gameListBySelctInfoId',{
					selectInfoId : selectInfoId
				}, function(data){
					if (data) {
						$selectGameSele.empty();
						$("<option></option>").attr("value", 0).html("-选择-").appendTo($selectGameSele);
						$.each(data.games, function(i,v) {
								var name = v.firstChar+" " + v.nameCh;
								$("<option></option>").attr("value", v.id).html(name).appendTo($selectGameSele);
						});
					}
				});
		});


		//改变选择
		$(".compare_item_list").find("select[name=selectGameSele]").unbind().bind("change", function() {
			var flag = true;
			var $this = $(this);
			var compareIds = [];
			var selectTypeIds = [];
			var selectInfoIds = [];
			$(".compare_item_list").find("select[name=selectGameSele]").each(function(i,v) {
				var $selectTypeSele = $(this).closest(".compare_item").find("select[name=selectTypeSele]");
				var $selectInfoSele = $(this).closest(".compare_item").find("select[name=selectInfoSele]");
				if ($this.attr("id") != $(v).attr("id")) {
					if ($this.val() != 0 && $this.val() == $(v).val()) {
						alert("您已经添加了该产品的对比");
						flag = false;
						return false;
					} 
				} 
				
				compareIds.push($(v).val());
				if ($(v).val()>0) {
					selectTypeIds.push($selectTypeSele.val());
					selectInfoIds.push($selectInfoSele.val());
				} else {
					selectTypeIds.push(0);
					selectInfoIds.push(0);
				}
				
				
			});
			if (flag) {
				window.location = ctx + "/ch/foot/compare?compareIds="+compareIds.join(",")+"&selectTypeIds="+selectTypeIds+"&selectInfoIds="+selectInfoIds;
				
			}
			return false;
		});
			

		//删除
		$(".compare_item_list").find(".del").unbind().bind("click", function() {
			var $this = $(this);
			var $compareItem = $this.closest(".compare_item");
			var $selectGameSele = $compareItem.find("select[name=selectGameSele]");
			var compareIds = [];
			var selectTypeIds = [];
			var selectInfoIds = [];

			$(".compare_item_list").find("select[name=selectGameSele]").each(function(i,v) {
				var $selectTypeSele = $(this).closest(".compare_item").find("select[name=selectTypeSele]");
				var $selectInfoSele = $(this).closest(".compare_item").find("select[name=selectInfoSele]");
				
				
				if ($selectGameSele.attr("id") == $(v).attr("id")) {
					compareIds.push(0);
					selectTypeIds.push(0);
					selectInfoIds.push(0);
				} else {
					compareIds.push($(v).val());
					if ($(v).val()>0) {
						selectTypeIds.push($selectTypeSele.val());
						selectInfoIds.push($selectInfoSele.val());
					} else {
						selectTypeIds.push(0);
						selectInfoIds.push(0);
					}
				}
			});

			window.location = ctx + "/ch/foot/compare?compareIds="+compareIds.join(",")+"&selectTypeIds="+selectTypeIds+"&selectInfoIds="+selectInfoIds;
			return false;
		});



		//高亮显示差异
		$(".disImp").click(function() {
			if ($(this).is(":checked") == true) {
				$(".compareTable").find("tr").each(function() {
					var $tr = $(this);
					var va= "";
					$tr.find("td:gt(0)").each(function(i,v) {
						var temp = $.trim($(v).text());
							if(va) {
								if (temp && va != temp) {
									$tr.find("td:gt(0)").addClass("imp");
								}
							} else {
								va = temp;
							}
									
						
					});
				});
			} else {
				$(".compareTable").find("tr").find("td:gt(0)").removeClass("imp");
			}
			
			
		});
		
	});

</script>
	

</head>

<body>
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
    <div class="search_banner" style="float:left;margin-top:-105px"> 
    </div>
    <!--主体内容start-->
    <div class="pagemain" style="clear:left">
    	<div class="compare_box">
        	<div class="compare_tit1">产品对比</div>

                <table class="compare_item_list" style="width:100%;">
                	<tr>
                    <td class="compare_hl_chk">
                    	<input type="checkbox" class="disImp"/>高亮显示差异
                    </td>
                    <td class="compare_item">
                    	<p class="pic">
                    		<c:choose>
                    			<c:when test="${game1.id != null}">
                    				<img alt="${game1.nameCh }" width="122" height="92"
					    			<c:choose>
						    			<c:when test="${game1.logo != null}">
						    				src="${ctx }${game1.logo }"
						    			</c:when>
						    			<c:otherwise>
						    				src="${ctx }${defaultPic }"
						    			</c:otherwise>
									</c:choose>
					    		/>
                    			</c:when>
                    			<c:otherwise>
                    				<img src="<c:url value="/images/ch/cp_pic1.jpg" />"></img>
                    			</c:otherwise>
                    		</c:choose>
						</p>
                        <p>
                       <select name="selectTypeSele">
                        	<option value="0">-选择-</option>
                        	<c:forEach items="${selectTypes}" var="selectType" > 
                        		<option value="${selectType.id }"  <c:if test="${selectTypeIds!=null&&selectTypeIds[0]==selectType.id}">selected</c:if>>${selectType.nameCh }</option>
                        	</c:forEach>
                        </select></p>
                        <p>
                        <select name="selectInfoSele">
                        	<option value="0">-选择-</option>
                        </select></p>
                        <p>
                        <select name="selectGameSele" id="selectGame${game1.id }">
                        	<option value="0">-选择-</option>
							<c:forEach items="${games}" var="g">
								<option value="${g.id }" <c:if test="${game1.id==g.id }">selected</c:if> >${g.firstChar } ${g.nameCh }</option>
							</c:forEach>
                        </select></p>
                        <p><input type="button" value="删除" <c:if test="${game1.id==null }" >disabled</c:if> class="del"/></p>
                    </td>
                    <td class="compare_item">
                    	<p class="pic">
                    		 <c:choose>
                    			<c:when test="${game2.id != null}">
                    				<img alt="${game2.nameCh }" width="122" height="92"
					    			<c:choose>
						    			<c:when test="${game2.logo != null}">
						    				src="${ctx }${game2.logo }"
						    			</c:when>
						    			<c:otherwise>
						    				src="${ctx }${defaultPic }"
						    			</c:otherwise>
									</c:choose>
					    		/>
                    			</c:when>
                    			<c:otherwise>
                    				<img src="<c:url value="/images/ch/cp_pic2.jpg" />"></img>
                    			</c:otherwise>
                    		</c:choose>
						</p>
                        <p>
                       <select name="selectTypeSele">
                        	<option value="0">-选择-</option>
                        	<c:forEach items="${selectTypes}" var="selectType">
                        		<option value="${selectType.id }" <c:if test="${selectTypeIds!=null&&selectTypeIds[1]==selectType.id}">selected</c:if> >${selectType.nameCh }</option>
                        	</c:forEach>
                        </select></p>
                        <p>
                        <select name="selectInfoSele">
                        	<option value="0">-选择-</option>
                        </select></p>
                        <p>
                        <select name="selectGameSele" id="selectGame${game2.id }">
                        	<option value="0">-选择-</option>
							<c:forEach items="${games}" var="g">
								<option value="${g.id }" <c:if test="${game2.id==g.id }">selected</c:if> >${g.firstChar } ${g.nameCh }</option>
							</c:forEach>
                        </select></p>
                        <p><input type="button" value="删除" <c:if test="${game2.id==null }" >disabled</c:if> class="del"/></p>
                    </td>
                    <td class="compare_item">
                    	<p class="pic">
                    		 <c:choose>
                    			<c:when test="${game3.id != null}">
                    				<img alt="${game3.nameCh }" width="122" height="92"
					    			<c:choose>
						    			<c:when test="${game3.logo != null}">
						    				src="${ctx }${game3.logo }"
						    			</c:when>
						    			<c:otherwise>
						    				src="${ctx }${defaultPic }"
						    			</c:otherwise>
									</c:choose>
					    		/>
                    			</c:when>
                    			<c:otherwise>
                    				<img src="<c:url value="/images/ch/cp_pic3.jpg" />"></img>
                    			</c:otherwise>
                    		</c:choose>
						</p>
                        <p>
                       <select name="selectTypeSele">
                        	<option value="0">-选择-</option>
                        	<c:forEach items="${selectTypes}" var="selectType">
                        		<option value="${selectType.id }" <c:if test="${selectTypeIds!=null&&selectTypeIds[2]==selectType.id}">selected</c:if>  >${selectType.nameCh }</option>
                        	</c:forEach>
                        </select></p>
                        <p>
                        <select name="selectInfoSele">
                        	<option value="0">-选择-</option>
                        </select></p>
                        <p>
                        <select name="selectGameSele" id="selectGame${game3.id }">
                        	<option value="0">-选择-</option>
							<c:forEach items="${games}" var="g">
								<option value="${g.id }" <c:if test="${game3.id==g.id }">selected</c:if> >${g.firstChar } ${g.nameCh }</option>
							</c:forEach>
                        </select></p>
                        <p><input type="button" value="删除" <c:if test="${game3.id==null }" >disabled</c:if> class="del"/></p>
                    </td>
                    <td class="compare_item">
                    	<p class="pic">
                    		 <c:choose>
                    			<c:when test="${game4.id != null}">
                    				<img alt="${game4.nameCh }" width="122" height="92"
					    			<c:choose>
						    			<c:when test="${game4.logo != null}">
						    				src="${ctx }${game4.logo }"
						    			</c:when>
						    			<c:otherwise>
						    				src="${ctx }${defaultPic }"
						    			</c:otherwise>
									</c:choose>
					    		/>
                    			</c:when>
                    			<c:otherwise>
                    				<img src="<c:url value="/images/ch/cp_pic4.jpg" />"></img>
                    			</c:otherwise>
                    		</c:choose>
						</p>
                        <p>
                        <select name="selectTypeSele">
                        	<option value="0">-选择-</option>
                        	<c:forEach items="${selectTypes}" var="selectType">
                        		<option value="${selectType.id }" <c:if test="${selectTypeIds!=null&&selectTypeIds[3]==selectType.id}">selected</c:if> >${selectType.nameCh }</option>
                        	</c:forEach>
                        </select></p>
                        <p>
                        <select name="selectInfoSele">
                        	<option value="0">-选择-</option>
                        </select></p>
                        <p>
                        <select name="selectGameSele" id="selectGame${game4.id }">
                        	<option value="0">-选择-</option>
							<c:forEach items="${games}" var="g">
								<option value="${g.id }" <c:if test="${game4.id==g.id }">selected</c:if> >${g.firstChar } ${g.nameCh }</option>
							</c:forEach>
                        </select></p>
                        <p><input type="button" value="删除" <c:if test="${game4.id==null }" >disabled</c:if> class="del"/></p>
                    </td>
                    </tr>
               </table>
			<!-- 基本参数 -->
            <div class="compare_tit2">基本参数</div>
            <div class="params_compare fix">
            
            	<table class="compareTable">
            		<c:forEach items="${selectTypes}" var="selectType" varStatus="vs">
	            		<tr>
							<td class="params_compare_tit">${selectType.nameCh }</td>
							<td class="params_compare_item">${selectRelations1[vs.index].selectInfo.selectInfoCh }</td>
							<td class="params_compare_item">${selectRelations2[vs.index].selectInfo.selectInfoCh }</td>
							<td class="params_compare_item">${selectRelations3[vs.index].selectInfo.selectInfoCh }</td>
							<td class="params_compare_item">${selectRelations4[vs.index].selectInfo.selectInfoCh }</td>
						</tr>
					</c:forEach>
					<c:forEach items="${textInfos}" var="textInfo" varStatus="vvs">
						<tr>
							<td class="params_compare_tit">${textInfo.nameCh }</td>
							<td class="params_compare_item">${textRelations1[vvs.index].ch }</td>
							<td class="params_compare_item">${textRelations2[vvs.index].ch }</td>
							<td class="params_compare_item">${textRelations3[vvs.index].ch }</td>
							<td class="params_compare_item">${textRelations4[vvs.index].ch }</td>
						</tr>
					</c:forEach>
            	</table>
            </div>
        </div>
    </div>
    <!--主体内容end-->
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	PWIE.menu();
	PWIE.tab(".rank_tab>a",".rank_content>table","on");
	//下拉框
	$(".dropdown").hover(
		function(){
			$(this).find(".dropdown_list").show();
		},
		function(){
			$(this).find(".dropdown_list").hide();
		}
	)
});
</script>
<c:import url="/ch/buttom" />
</body>
</html>