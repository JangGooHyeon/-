<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/personalConnection/feedFollowing.css" rel="stylesheet">
<nav class="navbar navbar-inverse navbar-fixed-top feedTop" style="margin-top: -20px;">
	<div class="container" style="padding-top: 8px;">
		<div class="feedDiv">
			<a href="/feedFollow" >신선한 시각 팔로우</a>
		</div>
		<div class="feedDiv">
			<a href="/feedFollowing">(${allFollowCount})명 팔로우 중</a>
		</div>
		<div class="feedDiv">
			<a href="/#">팔로워 ()명</a>
		</div>
	</div>
</nav>

<div class="container">
<div class="row">
<div>
<div class="row" style="margin-top: 47px;">
	<div id="pc_leftmenu" class="col-md-3" style="padding-left: 0px;margin-left: 30px;">
		<div class="row corporationList">
			<c:forEach items="${resultMapList }" var="result">
				<div style="width: 225px;">
					<div class="corporation">
						<c:choose>
							<c:when test="${not empty result.user_id}">
								<div 
								style="width: 59px;height: 59px;background-image:url(${result.imgPath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;border-radius: 100px;">
								</div>
							</c:when>
							
							<c:otherwise>
							<div 
								style="width: 59px;height: 59px;background-image:url(${result.imgPath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;">
								</div>
							</c:otherwise>
						</c:choose>
						
						<div style="text-overflow: ellipsis; display: inline-block; width: 196px; white-space: nowrap; overflow: hidden;">
							<label style="font-size: 18px;"><strong>${result.title }</strong></label><br/>
							<label>${result.content }</label>
						</div>
					</div>
					<div>
						<button style="color: #0073b1;" class="btn btn-default followingBtn follow Out">
							<i class="fas fa-plus"></i> 팔로우
						</button>
					</div>
				</div>
			
			</c:forEach>
		
		</div>
	</div>

</div>
</div>
</div>
</div>

<script type="text/javascript">
$(".follow").on("click", function(){
	/* var followStr = $(this).attr('title'); */
	
if(!$(this).hasClass('Out')){
		
		$(this).html('<i class="fas fa-plus"></i> 팔로우');
		$(this).attr('class','btn btn-default followingBtn follow Out');
		
	}else{
		$(this).html('<i class="fas fa-check"></i>팔로우 중');
		$(this).attr('class','btn btn-default followingBtn follow');
		
	}
	
	
});







</script>