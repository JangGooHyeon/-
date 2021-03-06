<%@page import="com.sun.javafx.css.Style"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="input-group" style="margin-top: -178px; margin-left: 240px; border: 1px solid #AAAAAA; border-radius: 4px; background-color: #FFFFFF; box-shadow: 0px 2px 5px #aaa;">


					<c:if test="${SESSION_MEMBERVO.mem_id eq corporationInfo.corp_id}">
					
						<button id="btn-write_modal" class="btn-write_modal"
							style="height: 72.6px; margin-top: -9px;">
							<span class="span-text"> <a data-parent="#accordion"
								data-toggle="collapse" href="#collapseExample"
								aria-expanded="false" aria-controls="collapseExample"><i
									class="far fa-edit"></i> 타임라인에 소식을 전하세요!</a>
							</span>
						</button>

						<button id="btn-upload-img" class="btn-upload">
							<span style="font-size: 25px;"> <a
								data-parent="#accordion" data-toggle="collapse" href="#img"
								aria-expanded="false" aria-controls="img"> <i
									class="far fa-images"></i>
							</a>
							</span>
						</button>

						<button id="btn-upload-video" class="btn-upload">
							<span style="font-size: 25px;"> <a
								data-parent="#accordion" data-toggle="collapse" href="#video"
								aria-expanded="false" aria-controls="video"> <i
									class="far fa-play-circle"></i>
							</a>
							</span>
						</button>

						<button id="btn-upload-document" class="btn-upload">
							<span style="font-size: 25px;"> <a
								data-parent="#accordion" data-toggle="collapse"
								href="#collapseExample" aria-expanded="false"
								aria-controls="collapseExample"> <i class="far fa-file-alt"></i>
							</a>
							</span>
						</button>

						<form id="frm_writePost"
							action="${pageContext.request.contextPath }/postInsert"
							method="post">
							<input type="hidden" id="post_contents2" name="post_contents2" />

							<div class="collapse" id="collapseExample">
								<div class="well">
									<textarea id="post_contents" name="post_contents" rows="5"
										cols="33" style="width: 550px;"></textarea>
									<br>
									<div align="center">
										<button type="submit" id="btn_write_upload"
											name="btn_write_upload"
											style="background-color: #FFFFFF; border: 1px solid #AAAAAA; box-shadow: 0px 2px 5px #aaa; border-radius: 4px; font-size: 120%;">글
											등록</button>
									</div>
								</div>
								<hr>
							</div>
						</form>
						<div class="collapse" id="img">
							<div class="well">
								<div align="right" style="margin-top: 10px;">
									<input type="text" id="img_name" name="img_name"
										style="width: 420px;" readonly />
									<button id="image_search" name="image_search"
										style="background-color: #FFFFFF; border: 1px solid #AAAAAA; box-shadow: 0px 2px 5px #aaa; border-radius: 4px; font-size: 120%; margin-right: 10px;">파일
										찾기</button>
								</div>
							</div>
							<hr>
						</div>
						<form id="frm_video"
							action="${pageContext.request.contextPath }/videoInsert"
							method="post">
							<input type="hidden" id="post_contents2" name="post_contents2" />
							<div class="collapse" id="video">
								<div class="well">
									<div align="right" style="margin-top: 10px;">
										<input type="text" id="video_path" name="video_path"
											style="width: 420px;" />
										<button id="btn_video_path" name="btn_video_path"
											style="background-color: #FFFFFF; border: 1px solid #AAAAAA; box-shadow: 0px 2px 5px #aaa; border-radius: 4px; font-size: 120%; margin-right: 10px;">경로
											입력</button>
									</div>
								</div>
								<hr>
							</div>
						</form>
					</c:if>
				</div>



				<div style="height: 150px; width: 555px; margin-left: 242px;">


					<!-- feed -->
					<div class="post-group">
						<!-- post -->
						<c:forEach items="${timelinePost }" var="post">

							<div id="col-post" class="scrolling"
								data-post="${post.post_code }"
								style="box-shadow: 0 6px 12 rgba(0, 0, 0, .15);">
								<div class="col-post" id="post${post.post_code }">
									<div class="col-post-body">
										<a href="#">
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
														<span>${fn:split((post.resultMinute/60), '.')[0] }시간
															전</span>
													</c:when>
													<c:when test="${post.resultMinute < 43200 }">
														<span>${fn:split((post.resultMinute/1440),'.')[0] }일
															전</span>
													</c:when>
													<c:when test="${post.resultMinute < 518400 }">
														<span>${fn:split((post.resultMinute/43200),'.')[0] }달
															전</span>
													</c:when>
												</c:choose>
											</div>
										</a>
										<!-- 게시물 관리버튼(dropdown) -->
										<div class="dropdown" style="float: right;">
											<button class="btn_postControll"
												data-code="${post.post_code }" type="button"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" style="float: right;">
												<i class="fas fa-ellipsis-h"></i>
											</button>
											<c:choose>
												<c:when test="${post.mem_id eq memberInfo.mem_id }">
													<ul class="dropdown-menu" role="menu"
														aria-labelledby="dLabel">
														<button id="btn_modifyPost${post.post_code }"
															data-code="${post.post_code }" type="button"
															class="btn_controll-list btn_modifyPost">
															<i class="fas fa-edit"></i>&nbsp;<span>글 수정</span>
														</button>
														<button id="btn_deletePost${post.post_code }"
															onclick="delete(${post.post_code})"
															data-code="${post.post_code }" type="button"
															class="btn_controll-list btn_deletePost">
															<i class="far fa-trash-alt"></i>&nbsp;<span>글 삭제</span>
														</button>
														<button id="btn_blockComment${post.post_code }"
															data-code="${post.post_code }" type="button"
															class="btn_controll-list btn_blockComment">
															<i class="fas fa-comment-slash"></i>&nbsp;<span>댓글
																차단</span>
														</button>
													</ul>
												</c:when>
												<c:otherwise>
													<ul class="dropdown-menu" role="menu"
														aria-labelledby="dLabel">
														<button class="btn_controll-list"
															style="padding-right: 65.69px;">
															<i class="far fa-eye-slash">&nbsp;</i><span>글 신고</span>
														</button>
														<button class="btn_controll-list"
															style="padding-right: 84.22px;">
															<i class="far fa-flag"></i>&nbsp;<span>언 팔로우</span>
														</button>
													</ul>
												</c:otherwise>
											</c:choose>
										</div>

									</div>
									<div class="post_info">
										<pre class="post_contents"
											style="background: #ffffff; border-color: #ffffff; margin-left: 9px;">${post.post_contents }</pre>
									</div>

									<div class="col-post-footer">
										<span></span>
									</div>

									<!-- 댓글수, 좋아요 수 출력 -->
									<div class="post_socialCount">
										<ul style="padding-left: 10px;">
											<li style="list-style: none; float: left;">
												<button class="btn_goodcount btn_count"
													style="font-size: 12px;">추천 ${post.goodcount }</button>
											</li>
											<li style="list-style: none; float: left;">
												<button class="btn_commentcount btn_count"
													id="btn_commentcount ${post.post_code }"
													title="commentCount ${post.post_code }"
													style="font-size: 12px;">댓글 ${post.commentcount }</button>
											</li>
										</ul>
									</div>

									<div class="col-post-social">
										<button class="btn-social">
											<span style="font-size: 18px;"><i
												class="far fa-thumbs-up"></i></span>
										</button>
										<button class="btn-social btn_comment"
											title="${post.post_code }">
											<span style="font-size: 18px;"><i
												class="far fa-comments"></i></span>
										</button>
										<button class="btn-social">
											<span style="font-size: 18px;"><i
												class="far fa-share-square"></i></span>
										</button>
										<button class="btn-social">
											<span style="font-size: 18px;"><i
												class="far fa-bookmark"></i></span>
										</button>
									</div>

									<!-- comment -->
									<div class="col-comment-area ${post.post_code }"
										id="post_comment ${post.post_code }"></div>
									<!-- /comment -->

								</div>
							</div>

						</c:forEach>
						<!-- ./post -->
					</div>
					<!-- ./feed -->
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
<!-- corp_empl.css -->

<!-- Downloaded chart.css -->
<!-- <link rel="stylesheet" href="chart.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" /> -->


<%-- <div style="border: 1px solid; width: 100%; background-color: white;">

	<label style="">직원 ${empl_count}명</label>
	
	<div  style="border: 1px solid;border-color: red;">
		<div class="charts" style="border: 1px solid;width: 280px;display: inline-block;">
			<label>출신학교||${eec.size()}</label>
			<c:forEach begin="0" end="${ eec.size()-1}" var="i">
				${university_list.get(i).getSchool_name()} || ${eec.get(i)} 
				<div class="charts__chart chart--p${Integer(100*eec.get(i)/eec.size())} chart--blue chart--hover" ></div>
			</c:forEach>
		</div>
		<div class="charts" style="border: 1px solid;width: 280px;display: inline-block;">
			<label>전공||${major_count.size()}</label>
			<c:forEach begin="0" end="${major_count.size()-1}" var="i">
				${major_list.get(i).getMajor()} || ${major_count.get(i)} 
				<div class="charts__chart chart--p${Integer(100*major_count.get(i)/major_count.size())} chart--blue chart--hover" ></div>
			</c:forEach>
		</div>	
		<div class="charts" style="border: 1px soli]d;width: 280px;display: inline-block;">
			<label>직책||${job_position_count.size()}</label>
			<c:forEach begin="0" end="${job_position_count.size()-1}" var="i">
				${job_position_list.get(i).getJob_position()} || ${job_position_count.get(i)} 
				<div class="charts__chart chart--p${Integer(100*job_position_count.get(i)/job_position_count.size())} chart--blue chart--hover" ></div>
			</c:forEach>
		</div>	
	</div>
	
</div>

<div style="margin-top: 20px;">
	<c:forEach begin="0" end="${empl_list.size()-1 }" var="i">
		<div style="border: 1px solid;margin-right: 10px; width: 200px;height: 300px; display: inline-block;text-align: center;">
			<img style="border-radius: 100px;width: 100px;height: 100px;margin-top: 10px;" alt="" src="/images/logo/ruda.png"><br>
			<label style="margin-top: 10px;">${empl_list.get(i).getUser_name() }</label>
			<label style="margin-top: 10px;height: 80px;width: 180px;overflow: hidden;">${empl_list.get(i).getProfile_contents() }></label>
		<div style="border: 1px solid;margin-top: 10px;">
			<c:choose>
				<c:when test="${empl_list.get(i).getReceive_accept() eq 'Y'}">
					<button>일촌 끊기</button>
				</c:when>
				<c:when test="${empl_list.get(i).getReceive_accept() eq 'N'}">
					<button>일촌수락 대기</button>
				</c:when>
				<c:when test="${empl_list.get(i).getReceive_accept() eq null}">
					<button>일촌 맺기</button>
				</c:when>
			</c:choose>
		</div>
		</div>
	</c:forEach>
</div> --%>
	