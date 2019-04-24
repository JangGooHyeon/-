<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach items="${followConnections}" var="conn">
<c:set var="profile_addrpath" value="/profile?mem_id=${conn.user_id }"/> 
<c:choose>
	<c:when test="${fn:contains(user.profile_path, 'http')}">
		<c:set var="profile_path" value="${conn.profile_path }"/> 
	</c:when>
</c:choose>

	<div style="width: 225px;">
		<div class="corporation">
			<div
				style="width: 85px;height: 85px;background-image:url(${not empty profile_path ? profile_path : profile_addrpath});background-repeat: no-repeat;background-size: cover;background-position: center;margin-left: 5px;margin-top: 15px; margin-bottom: 12px;border-radius: 100px;border: 2px solid #E3EEF2;"></div>
			<div>
				<label style="font-size: 17px;"><strong>${conn.user_name}
				</strong></label><br/> <label>${conn.introduce}</label>
			</div>
		</div>
		<div>
			<button class="btn btn-default followingBtn follow" onclick="location.href='/deleteFollow?follow_code=${conn.follow_code}'">
				<i class="fas fa-check"></i> 팔로우 중
			</button>
		</div>
	</div>
</c:forEach>
<script type="text/javascript">
$(".follow").on("click", function(){
	var followStr = $(this).attr('title');
	
	if(!$(this).hasClass('Out')) {
		$(this).html('<i class="fas fa-plus-circle"></i> 팔로우');
		$(this).attr('class','btn btn-default followingBtn follow Out');
		
	}else {
		$(this).html('<i class="fas fa-check"></i>팔로우 중');
		$(this).attr('class','btn btn-default followingBtn follow');
		
	}
});
</script>