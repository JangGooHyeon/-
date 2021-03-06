package kr.or.ddit.util.pagination;

public class PaginationVo {
	private int page;		//page번호
	private int pageSize;	//page당 사이즈
	private String mem_id;
	private String criteria_code; //다음페이지 기준 코드(불러올 게시글 기준코드)
	private String ref_code;
	private String division;
	private String user_id;
	private String corp_id;
	private String hashtag_name;
	private String search_word; // 검색어
	
	private String corp_code;
	
	public PaginationVo() {
		
	}
	public PaginationVo(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public String getSearch_word() {
		return search_word;
	}
	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}
	public String getHashtag_name() {
		return hashtag_name;
	}
	public void setHashtag_name(String hashtag_name) {
		this.hashtag_name = hashtag_name;
	}
	public String getRef_code() {
		return ref_code;
	}
	public void setRef_code(String ref_code) {
		this.ref_code = ref_code;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getCriteria_code() {
		return criteria_code;
	}
	public void setCriteria_code(String criteria_code) {
		this.criteria_code = criteria_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPage() {
		return page == 0 ? 1 : page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize == 0 ? 10 : pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCorp_id() {
		return corp_id;
	}
	public void setCorp_id(String corp_id) {
		this.corp_id = corp_id;
	}
	
	
	public String getCorp_code() {
		return corp_code;
	}
	public void setCorp_code(String corp_code) {
		this.corp_code = corp_code;
	}
	@Override
	public String toString() {
		return "PaginationVo [page=" + page + ", pageSize=" + pageSize + ", mem_id=" + mem_id + ", criteria_code="
				+ criteria_code + ", ref_code=" + ref_code + ", division=" + division + ", user_id=" + user_id
				+ ", corp_id=" + corp_id + ", hashtag_name=" + hashtag_name + ", search_word=" + search_word
				+ ", corp_code=" + corp_code + "]";
	}
	
}
