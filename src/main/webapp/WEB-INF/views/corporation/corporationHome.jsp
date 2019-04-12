<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style>
textarea {
    font-size: 100%;
    letter-spacing: 1px;
}
textarea {
    padding: 10px;
    line-height: 1.5;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div style="margin-left: 15px;">
				<!-- 			<section style="text-align: center;"> -->
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
				<br> <br>
				<%@ include file="/WEB-INF/views/corporation/module/write.jsp"%>

				
				
		

	<div class="input-group" style="margin-top: -178px; margin-left: 240px;border: 1px solid #AAAAAA;border-radius: 4px;background-color: #FFFFFF;box-shadow: 0px 2px 5px #aaa;">
	          <button id="btn-write_modal" class="btn-write_modal"  style="height: 72.6px; margin-top: -9px;"><span class="span-text"><a parent="#accordion" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="far fa-edit"></i> 타임라인에 소식을 전하세요!</a></span></button>
	          <button id="btn-upload-img" class="btn-upload"><span style="font-size: 25px;"><a parent="#accordion" data-toggle="collapse" href="#img" aria-expanded="false" aria-controls="img"><i class="far fa-images"></i></a></span></button>
	          <button id="btn-upload-video" class="btn-upload"><span style="font-size: 25px;"><a parent="#accordion" data-toggle="collapse" href="#video" aria-expanded="false" aria-controls="video"><i class="far fa-play-circle"></i></a></span></button>
	          <button id="btn-upload-document" class="btn-upload"><span style="font-size: 25px;"><a parent="#accordion" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="far fa-file-alt"></i></a></span></button>
	          
	          <form id="frm_writePost" action="${pageContext.request.contextPath }/postInsert" method="post">
	          <input type="hidden" id="post_contents2" name="post_contents2">
	          
				<div class="collapse" id="collapseExample" >
				  <div class="well">
				    <textarea id="post_contents" name="post_contents" rows="5" cols="33" style="width: 550px;"></textarea>
				    <br>
				    <div align="center"><button type="submit" id="btn_write_upload" name="btn_write_upload" style="background-color: #FFFFFF;border: 1px solid #AAAAAA;box-shadow: 0px 2px 5px #aaa;border-radius: 4px;font-size: 120%;">글 등록</button></div>
				  </div><hr>
  				</div>
			 </form>
				<div class="collapse" id="video" >
				  <div class="well">
				    <div align="right">
				    	<input type="text" id="video_path" name="video_path" style="width: 420px;" />
				    	<button style="background-color: #FFFFFF;border: 1px solid #AAAAAA;box-shadow: 0px 2px 5px #aaa;border-radius: 4px;font-size: 120%;margin-right: 10px;">경로 입력</button>
				    </div>
				  </div><hr>
  				</div>
		
	</div>
			



<div style="height: 300px; width: 555px; margin-left: 242px;">

	          <c:forEach items="${postList }" var="post">
		          
		        <div id="col-post" class="scrolling"  data-post="${post.post_code }">
				  <div class="col-post" style="box-shadow: 0px 1px 3px;">
					<div class="col-post-body">
					  <a href="#" >
						<div class="writer_info" style="float: left;">
						  <a style="font-size: 20px;" href="#">${post.writer_name }</a>
						  <c:choose>
						    <c:when test="${post.resultMinute <= 1 }">
						      <span>방금 전</span>
						    </c:when>
						    <c:when test="${post.resultMinute < 60 }">
				              <span>${post.resultMinute }분 전</span>
				            </c:when>
				            <c:when test="${post.resultMinute < 1440 }">
				              <span>${fn:split((post.resultMinute/60), '.')[0] }시간 전</span>
				            </c:when>
				            <c:when test="${post.resultMinute < 43200 }">
				              <span>${fn:split((post.resultMinute/1440),'.')[0] }일 전</span>
				            </c:when>
				            <c:when test="${post.resultMinute < 518400 }">
				              <span>${fn:split((post.resultMinute/43200),'.')[0] }달 전</span>
				            </c:when>
						  </c:choose>
						</div>
					  </a>
					  <!-- 게시물 관리버튼(dropdown) -->
				      <div class="dropdown" style="float: right;">
					    <button class="btn_postControll" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right;">
					    	<i class="fas fa-ellipsis-h"></i>
					    </button>
					    <c:choose>
					      <c:when test="${post.mem_id eq memberInfo.mem_id }">
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				      	    	<button class="btn_controll-list">
					            	<i class="fas fa-edit"></i>&nbsp;<span>글 수정</span>
					            </button>
				      	    	<button class="btn_controll-list">
					            	<i class="far fa-trash-alt"></i>&nbsp;<span>글 삭제</span>
					        	</button>
				      	    	<button class="btn_controll-list">
					            	<i class="fas fa-comment-slash"></i>&nbsp;<span>댓글 차단</span>
					            </button>
					        </ul>
					      </c:when>
					      <c:otherwise>
				        	<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				      	    	<button class="btn_controll-list" style="padding-right: 65.69px;">
					            	<i class="far fa-eye-slash">&nbsp;</i><span>글 숨기기</span>
					            </button>
				      	    	<button class="btn_controll-list" style="padding-right: 24.33px;">
					            	<i class="fas fa-ban"></i>&nbsp;<span>${post.writer_name }&nbsp;언 팔로우</span>
					        	</button>
				      	    	<button class="btn_controll-list" style="padding-right: 84.22px;">
					            	<i class="far fa-flag"></i>&nbsp;<span>글 신고</span>
					            </button>
					        </ul>
					      </c:otherwise>  
					    </c:choose>
				      </div>
					  
					</div>
					<div class="post_info">
					  <pre style="background: #ffffff; border-color: #ffffff;">${post.post_contents }</pre>
					</div>
				
					<div class="col-post-footer">
					  <span></span>
					</div>
					
					<!-- 댓글수, 좋아요 수 출력 -->
					<div class="post_socialCount">
					  <ul style="padding-left: 10px;">
					  	<li style="list-style: none; float: left;">
					  		<button class="btn_goodcount btn_count" style="font-size: 12px;">추천 ${post.goodcount }</button>
					  	</li>
					  	<li style="list-style: none; float: left;">
					  		<button class="btn_commentcount btn_count" id="btn_commentcount ${post.post_code }" title="commentCount ${post.post_code }" style="font-size: 12px;">댓글 ${post.commentcount }</button>
					  	</li>
					  </ul>
					</div>
					
					<div class="col-post-social">
					  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-thumbs-up"></i></span></button>
					  <button class="btn-social btn_comment" title="${post.post_code }">
					  	<span style="font-size: 18px;"><i class="far fa-comments"></i></span>
					  </button>
					  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-share-square"></i></span></button>
					  <button class="btn-social"><span style="font-size: 18px;"><i class="far fa-bookmark"></i></span></button>
					</div>
					
					<!-- comment -->
					<div class="col-comment-area ${post.post_code }" id="post_comment ${post.post_code }"></div>
					<!-- /comment -->
				
				  </div>
				</div>

	          </c:forEach>



</div>







			</div>
		</div>
	</div>





	
			          

<script>	
$(function () {
	$("#btn_write_upload").on("click", function () {
		$("#post_contents2").val($("#post_contents").val());
				$("#frm_writePost").submit();
		});
});


</script>

</body>

</html>