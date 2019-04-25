package kr.or.ddit.page.service;

import java.util.List;

import kr.or.ddit.page.model.PageVo;

public interface IPageService {
	
	/**
	 * 
	 * Method : insert_page
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 페이지 추가
	 */
	int insert_page(PageVo vo);
	
	/**
	 * 
	 * Method : select_pageList
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param section_code
	 * @return
	 * Method 설명 : 섹션의 페이지 리스트 조회
	 */
	List<PageVo> select_pageList(String section_code);
	
	/**
	 * 
	 * Method : select_pageInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param page_code
	 * @return
	 * Method 설명 : 페이지 정보 조회
	 */
	PageVo select_pageInfo(String page_code);
}
