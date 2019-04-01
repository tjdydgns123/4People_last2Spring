package com.vo;

public class BookVO {
	//업무 구분을 위한 변수 
	//VO패턴 안에는 테이블에 있는 컬럼외에 업무처리에 필요한 다른 변수도 사용가능함.
	//VO(Value Object) - 오라클의 데이터 타입과 자바의 타입을 맞추고 값을 읽고 쓰기
	//DTO(Data Transfer Object)
	private String command = null;//insert|update|delete|detail
	private YesCate1VO yvo = null;
	//검색 조건에 사용할 변수 선언
	//사용자가 JComboBox에서 선택한 문자열을 담을 변수
	private String search = null;//제목|저자|내용
	//사용자가 입력한 키워드를 담을 변수
	private String keyword = null;//사용자가 입력한 값
	//DB 입력,수정,삭제 결과를 담을 변수
	private int    result 	  = 0;//
	private String goods_num  ="0";//도서번호 @ 010
	private String goods_name =null;//도서명  @
	private String goods_paia =null;//도서가격 @
	private String goods_memo =null;//도서설명 
	private String goods_ea   =null;//재고수량 @ 
	private String goods_use  =null;//새거 헌거  @
	private String goods_date =null;//출판일자 
	private String cate_num   =null;//카테고리 
	private String book_maker =null;//저자 
	//생성자 추가하기
	//디폴트 생성자를 사용하지 않고  파라미터가 있는 생성자를 사용할 땐 
	//무조건 디폴트 생성자도 추가해줌.- why? 파라미터가 있는 생성자를 한 개라도 갖고 있으면
	//JVM이 제공하지 않음.
	public BookVO() {}
	public BookVO(String goods_num, String goods_name, String goods_paia
		         ,String goods_ea, String goods_use) {
		//생성자는 전역변수 초기화함.
		//다른 곳(생성자가 아닌 곳)에서 사용하려면 반드시 전역변수일때 만 접근가능함.
		this.goods_num  = goods_num;
		this.goods_name = goods_name;
		this.goods_paia = goods_paia;
		this.goods_ea   = goods_ea;
		this.goods_use  = goods_use;
    }	

	public BookVO(String goods_num, String goods_name, String goods_paia
			     ,String goods_memo,String goods_ea, String goods_use
			     ,String goods_date,String book_maker) {
		//생성자는 전역변수 초기화함.
		//다른 곳(생성자가 아닌 곳)에서 사용하려면 반드시 전역변수일때 만 접근가능함.
		this.goods_num = goods_num;
		this.goods_name = goods_name;
		this.goods_paia = goods_paia;
		this.goods_memo = goods_memo;
		this.goods_ea = goods_ea;
		this.goods_use = goods_use;
		this.goods_date = goods_date;
		this.book_maker = book_maker;
	}
	//getter는 전역변수에 들어있는 값을 꺼낼 때 사용한다.
	//getter는 왜 파라미터가 없지?
	//getter메소드는 전역변수 goods_num변수에 저장된 값을 꺼낼 때 사용함.
	//그렇다면 goods_num변수에 값을 넣는건 누가 하죠?
	//setGoods_num메소드에 파라미터가 필요한 이유가 바로 이것 때문이죠.
	//setter메소드가 저장 혹은 쓰기 역할을 하므로 getter를 호출하기 전에 
	//먼저 setter가 호출 되어야 합니다.
	//setter메소드에 반드시 파라미터가 필요한 이유는 DB서버의 테이블에 컬럼에 저장된
	//정보를 담아야 하므로 select문 처리시에 값을 저장해 주어야 값을 얻어올 수 있어요.
	public String getGoods_num() {
		return goods_num;
	}
	//setter는 전역변수에 값을 담을(저장,쓰기) 때 사용한다.
	//setter는 왜 파라미터가 있어야 하지?
	//DB서버에서 꺼낸 값을 BookVO.java안에 전역변수들.......
	//그 안에 값을 저장해야 하니까
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_paia() {
		return goods_paia;
	}
	public void setGoods_paia(String goods_paia) {
		this.goods_paia = goods_paia;
	}
	public String getGoods_memo() {
		return goods_memo;
	}
	public void setGoods_memo(String goods_memo) {
		this.goods_memo = goods_memo;
	}
	public String getGoods_ea() {
		return goods_ea;
	}
	public void setGoods_ea(String goods_ea) {
		this.goods_ea = goods_ea;
	}
	public String getGoods_use() {
		return goods_use;
	}
	public void setGoods_use(String goods_use) {
		this.goods_use = goods_use;
	}
	public String getGoods_date() {
		return goods_date;
	}
	public void setGoods_date(String goods_date) {
		this.goods_date = goods_date;
	}
	public String getCate_num() {
		return cate_num;
	}
	public void setCate_num(String cate_num) {
		this.cate_num = cate_num;
	}
	public String getBook_maker() {
		return book_maker;
	}
	public void setBook_maker(String book_maker) {
		this.book_maker = book_maker;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public YesCate1VO getYvo() {
		return yvo;
	}
	public void setYvo(YesCate1VO yvo) {
		this.yvo = yvo;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
