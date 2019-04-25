<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 





<div class="col-md-6">
	<div class="panel panel-default">

		<div id="page_area_select_head"
			class="panel-body page_area_select_head">
			<div class="page_area_title">
				<a><i class="far fa-folder-open"
					style="font-size: 40px; margin-right: 10px"></i> <i
					class="fas fa-chevron-right"></i> ${ pVo.portfolio_name } <i
					class="fas fa-chevron-right"></i> ${ sVo.section_name }</a>
			</div>


			<c:if test='${ pVo.user_id == SESSION_MEMBERVO.mem_id }'>
				<button id="writePageBtn" class="btn writePageBtn"
					onclick="writePage('${ sVo.section_code }')">Page 작성</button>
			</c:if>
		</div>
	</div>
	
	
		<!-- page -->
		<c:forEach items="${ pageList }" var="page">
			
			<div id="col-post${ page.page_code }" class="scrolling" data-post="${ page.page_code }" style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
				<div class="col-post" id="page${ page.page_code }">
					<!-- 대가리 -->
					<div class="col-post-body">
					
						<!-- 글 제목, 작성일 감싸기 -->
						<div class="writer_info">
							
							<a class="page_title" href="/page/page_view?page_code=${ page.page_code }">${ page.page_title }</a>		
                 	   
                 	   		<div class="page_write_date"><fmt:formatDate value="${ page.write_date }" pattern="yyyy-MM-dd" /></div>
						</div>
						<!-- 글 제목, 작성일 감싸기 --> 
						
						<!-- 게시물 관리버튼(dropdown) -->
						<div class="dropdown" style="float: right;">
							<button class="btn_postControll" data-code="${ page.page_code }"
								type="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="float: right;">
								<i class="fas fa-ellipsis-h"></i>
							</button>
							<c:choose>
								<c:when test="${ post.mem_id eq memberInfo.mem_id }">
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
										<button id="btn_modifyPost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list">
											<i class="fas fa-edit icon"></i>글 수정
										</button>
										<button id="btn_deletePost${post.post_code }" data-code="${post.post_code }" type="button" class="btn_controll-list">
											<i class="far fa-trash-alt icon"></i>&nbsp;<span>글 삭제</span>
										</button>
									</ul>
								</c:when>
								<c:otherwise>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="dLabel">
										<button id="btn_reportPost${ ost.post_code }"
											data-code="${post.post_code }" type="button" class="btn_controll-list" style="padding-right: 84.22px;">
											<i class="far fa-flag icon"></i>글 신고
										</button>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 게시물 관리버튼(dropdown) -->
						
					</div>
					<!-- 대가리 -->
					
					
					<!-- 몸통 -->
					<div class="page_body">
						<a><img class="page_thumbnail" src="/page/onenoteImageView?src=${ page.page_thumbnail }"></a>
					</div>
					<!-- 몸통 -->
					
					
					<!-- 댓글수, 좋아요 수 출력 -->
					<div class="post_socialCount">
						<ul style="padding-left: 10px;">
							<li style="list-style: none; float: left;">
								<button class="btn_count btn_goodcount"
									title="goodCount ${post.post_code }" style="font-size: 12px;">
									추천 <span id="txt_good_count${post.post_code }">${post.goodcount }</span>
								</button>
							</li>
							<li style="list-style: none; float: left;">
								<button class="btn_count btn_commentcount"
									id="btn_commentcount${post.post_code }"
									title="commentCount ${post.post_code }"
									style="font-size: 12px;">
									댓글 <span id="txt_comment_count${post.post_code }">${post.commentcount }</span>
								</button>
							</li>
						</ul>
					</div>
					<!-- 댓글수, 좋아요 수 출력 -->
					
					
					
					<div class="col-post-social">
						<!-- 좋아요 버튼 -->
						<button class="btn-social btn_good"
							style="margin-left: 10px; margin-top: 2px;"
							title="${post.post_code }">
							<span style="font-size: 18px;"> <i
								id="icon_good${post.post_code }" class="far fa-thumbs-up"></i>
							</span>
						</button>
						<!-- 댓글 출력 버튼 -->
						<button class="btn-social btn_comment"
							id="btn_comment${post.post_code }" data-code="${post.post_code }"
							title="${post.post_code }">
							<span style="font-size: 18px;"><i class="far fa-comments"></i></span>
						</button>
					</div>

					<!-- comment -->
					<div class="col-comment-area ${ post.post_code }" id="post_comment${ post.post_code }">
					
					</div>
					<!-- /comment --> 

				</div>
			</div>



		</c:forEach>





	
</div>


<script>
	$('#page_area_select_head').css('background-color', '${ pVo.index_color }');

	function writePage(section_code) {
		document.location.href = "/page/onenote?section_code=" + section_code;
	}
</script>
















