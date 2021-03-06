<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<input type="hidden" id="listSize" value="${srList.size() }">

<c:forEach begin="1" end="${srList.size() }" varStatus="i">
	<table border="0" style="margin: 2px; margin-top: 2px;">
		<tr>
			<td class="img" rowspan="6" onmouseover="" style="cursor: pointer; 
					border-bottom: 1px solid; border-bottom-color: #d9d9d9; padding-bottom: 7px; 
					padding-top: 7px; width: 244px; text-align: center;" 
					data-code="${srList.get(i.index - 1).recruit_code }">
				<c:choose>
					<c:when test="${ fn:contains(corpImgList.get(i.index - 1), 'http') }">
						<img src="${corpImgList.get(i.index - 1) }" width="200">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath  }/view/imageView?mem_id=${corpIdList.get(i.index - 1) }&division=pf" width="200">
					</c:otherwise>	
				</c:choose>					
			</td>
			<td class="srecr" onmouseover="" style="cursor: pointer; width: 473px;
					border-bottom: 1px solid; border-bottom-color: #d9d9d9; padding-left: 15px;
					font-size: 15px;" data-code="${srList.get(i.index - 1).recruit_code }">
				<strong style="font-size: 17px;">${srList.get(i.index - 1).recruit_title }</strong><br>
				${corpNmList.get(i.index - 1) }<br>
				${srList.get(i.index - 1).job_local }<br>
<!-- 				<span style="color: #d11124;">(xx일 전에 마감되었습니다.)</span> -->
			</td>
			<td style="width: 77px; text-align: center; border-bottom: 1px solid; border-bottom-color: #d9d9d9;">
				<div style="width: 56px; height: 56px; border-radius: 28px; background-color: white;
						padding-top: 7px;" class="div_scrap">
					<div class="scrap" data-code="${srList.get(i.index - 1).recruit_code }" data-idx="${i.index - 1 }">
						<i class="fas fa-bookmark" onmouseover="" style="margin-top: 10px; font-size: 22px; 
								cursor: pointer; color: #0174b0;"></i>
					</div>
				</div>
			</td>
		</tr>
	</table>			
</c:forEach>					
					
					
					
					
					
					
					
