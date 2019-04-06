<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">경력</h4>
</div>
<div class="modal-body">
<form action="/usersProfileUpdate" method="post" id="usersUpdateFrm" enctype="multipart/form-data">
	<div style="min-height: 328px;">
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">회사 </label>
				<input class="form-control" type="text" name="corporate_name" data-toggle="dropdown">
			</div>
			<div class="dropdown">
			<ul class="dropdown-menu" style="top: 75px;left: 15px;width: 337px;min-height: 50px;" >
  				<li><a>Action</a></li>
			    <li><a>Another action</a></li>
			    <li><a>Something else here</a></li>
			    <li><a>Separated link</a></li>
			</ul>
			</div>
			<div class="modalHalfRight">
				<label class="essential">회사코드 </label>
				<input class="form-control" id="corp_code" type="text" name="corp_code">
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">주소 </label>
			    <div class="input-group">
			      <input class="form-control zipcode" name="corp_local" type="text" style="width:283px; height: 31px;" />
			      <span class="input-group-btn" style="height: 33px;">
			        <button class="btn btn-default zipcodeSearch" type="button" style="height: 31px;margin-top: -1px;">검색</button>
			      </span>
			    </div>
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">직군</label>
				<input type="text" name="job_position" class="form-control addr1"/>
			</div>
			<div class="modalHalfRight">
				<label class="essential">직급 </label>
				<input type="text" name="job_rank" class="form-control addr2" />
			</div>
		</div>
		<div class="modalRow">
			<div class="modalHalfLeft">
				<label class="essential">시작일 </label>
				<input class="form-control" name="join_date" type="text" >
			</div>
			<div class="modalHalfRight">
				<label>종료일 </label>
				<input class="form-control" name="resign_date" type="text" >
			</div>
		</div>
		<div class="modalRow" style="padding-bottom: 15px;">
			<div style="modalHalfLeft">
				<label>설명 </label>
				<textarea class="form-control" rows="3" name="contents" style="width: 682px; height: 80px;"></textarea>
			</div>
		</div>
		<div style="margin-top: 10px;">
			<div class="modalHalfRight">
				<label style="display: block;">미디어 </label>
				<label>외부 문서, 사진, 사이트 동영상 프레젠테이션 링크 </label>
			</div>
			<div class="modalHalfRight" style="height: 30px; display: flex;">
				<label class="btn btn-default fileUpload" style="font-size: 14px; width:64px; height: 31px; padding: 6px 12px 6px 12px;">업로드</label>
				<button class="btn btn-default" style="height: 31px; padding: 0 10px 0 10px;" data-toggle="collapse" href="#link" aria-expanded="false" aria-controls="background">링크</button>
				
			</div>
		</div>
		<div class="collapse" id="link" style="margin-top: 10px; border: 0px;">
      		<div class="well modalHalfLeft" style="padding: 0 0 0 0; border-top: 0px;">
				<div class="input-group">
     					<input class="form-control" type="text" name="persnal_url" style="width:283px; height: 31px;"/>
				    <span class="input-group-btn" style="height: 33px;">
				    	<button class="btn btn-default" type="button" style="height: 31px;margin-top: -1px;">등록</button>
				    </span>
			    </div>
      		</div>
      	</div>
      	<div class="modalRow" style="padding-bottom: 15px;">
			<div  class="fileListBox" style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
				<c:forEach items="${userFilesList }" var="files" > 
					<div class="files" style="height: 25px; margin-right: 10px;font-size: 15px; font-weight: bold">
						<a href="/fileDownload?file_code=${files.file_code }">${files.file_name}</a>
						<input type="hidden" name="file_name" value="${files.file_name}">
						<input type="hidden" name="file_path" value="${files.file_path}">
						<label class="btn btn-link delBtn" style="font-size: 14px; width:64px; height: 31px; padding: 3px 12px 6px 0;">X</label>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<input type="hidden" value="${SESSION_MEMBERVO.mem_id }" name="user_id">
</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" id="usersSave">저장</button>
</div>

<script>
/* $(document).on("click","input[name=corporate_name]", function(){
	
$('.dropdown-toggle').dropdown(); 
})
 */
	$(document).on("change","input[name=filesVo]",function(){
	
		var fileValue = $(this).val().split("\\");
		var fileName = fileValue[fileValue.length-1];
	
		$(".fileListBox").append('<div class="files" style="height: 25px; margin-right: 10px;font-size: 15px; font-weight: bold"><label style="height: 25px; margin-right: 10px;font-size: 15px; font-weight: bold">'+fileName+'</label><label class="btn btn-link fileVodelBtn"style="font-size: 14px; width:64px; height: 31px; padding: 3px 12px 6px 0;">X</label></div>');
		
	});

	// 파일삭제
	$(document).on("click",".delBtn", function(){
		$(this).parents("div.files").remove();
	});
	
	$(document).on("click",".fileVodelBtn", function(){
		$(".fileUpload").parent().children().last().remove();
		$(this).parents("div.files").remove();
	});
	
	

	
	$("#usersSave").on("click",function(){
		if($("input[name=user_name]").val().trim()==""){
			/* <div class="alert alert-danger" role="alert">사용자 이름을 입력해주세요</div> */
			$("input[name=user_name]").focus();
			return false;
		}
		if($("input[name=zipcode]").val().trim()==""){
			alert("사용자 우편번호를 입력해주세요");
			$("input[name=zipcode]").focus();
			return false;
		}
		if($("input[name=addr1]").val().trim()==""){
			alert("사용자 주소를 입력해주세요");
			$("input[name=addr1]").focus();
			return false;
		}
		if($("input[name=addr2]").val().trim()==""){
			alert("사용자 상세주소를 입력해주세요");
			$("input[name=addr2]").focus();
			return false;
		}
		
		if($("input[name=email]").val().trim()==""){
			alert("사용자 이메일을 입력해주세요");
			$("input[name=email]").focus();
			return false;
		}
		
		$("#usersUpdateFrm").submit();
	});

	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();

   // 배경이미지 실시간 변경하기
   function readBackgroundURL(input) { 
		if (input.files && input.files[0]) { 
		var reader = new FileReader(); 
		reader.onload = function (e) { 
			$('.modalBackground').css('background-image', 'url('+e.target.result+')'); 
		} 
		reader.readAsDataURL(input.files[0]); 
		} 
	}
   // 배경이미지 파일 변경시 
    $("#backgroundFile").change(function(){ 
		readBackgroundURL(this); 
	});
	
   // 배경이미지 변경 버튼 클릭시 파일업로드 하기
	$("#backgroundBtn").on("mouseup",function(){
		$("#backgroundFile").click();
	});
	
   // 프로필이미지 실시간 변경하기
   function readProfileURL(input) { 
		if (input.files && input.files[0]) { 
		var reader = new FileReader(); 
		reader.onload = function (e) { 
			$('.modalprofile').css('background-image', 'url('+e.target.result+')'); 
		} 
		reader.readAsDataURL(input.files[0]); 
		} 
	}
	 
    // 프로필이미지 파일 변경시 
    $("#profileFile").change(function(){ 
		readProfileURL(this); 
	});
    
    // 프로필이미지 변경 버튼 클릭시 파일업로드 하기
	$("#profileBtn").on("mouseup",function(){
		$("#profileFile").click();
	});
   
	// 미디어 업로드 버튼 클릭시 파일업로드 하기
	$(".fileUpload").on("click",function(){
		$(".fileUpload").parent().append('<input type="file" multiple="multiple" name="filesVo" style="display: none;">');
		$(".fileUpload").parent().children().last().click();
		
	});
	
	$("#userBirth").datepicker({
        dateFormat: "yy-mm-dd" //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"] //달력의 월 부분 텍스트
        ,monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ["일","월","화","수","목","금","토"] //달력의 요일 부분 텍스트
        ,dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"] //달력의 요일 부분 Tooltip 텍스트
        //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        //,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });                    
    
    //초기값을 오늘 날짜로 설정
	$("#userBirth").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
</script>