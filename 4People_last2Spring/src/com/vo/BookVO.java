package com.vo;

public class BookVO {
	//���� ������ ���� ���� 
	//VO���� �ȿ��� ���̺� �ִ� �÷��ܿ� ����ó���� �ʿ��� �ٸ� ������ ��밡����.
	//VO(Value Object) - ����Ŭ�� ������ Ÿ�԰� �ڹ��� Ÿ���� ���߰� ���� �а� ����
	//DTO(Data Transfer Object)
	private String command = null;//insert|update|delete|detail
	private YesCate1VO yvo = null;
	//�˻� ���ǿ� ����� ���� ����
	//����ڰ� JComboBox���� ������ ���ڿ��� ���� ����
	private String search = null;//����|����|����
	//����ڰ� �Է��� Ű���带 ���� ����
	private String keyword = null;//����ڰ� �Է��� ��
	//DB �Է�,����,���� ����� ���� ����
	private int    result 	  = 0;//
	private String goods_num  ="0";//������ȣ @ 010
	private String goods_name =null;//������  @
	private String goods_paia =null;//�������� @
	private String goods_memo =null;//�������� 
	private String goods_ea   =null;//������ @ 
	private String goods_use  =null;//���� ���  @
	private String goods_date =null;//�������� 
	private String cate_num   =null;//ī�װ� 
	private String book_maker =null;//���� 
	//������ �߰��ϱ�
	//����Ʈ �����ڸ� ������� �ʰ�  �Ķ���Ͱ� �ִ� �����ڸ� ����� �� 
	//������ ����Ʈ �����ڵ� �߰�����.- why? �Ķ���Ͱ� �ִ� �����ڸ� �� ���� ���� ������
	//JVM�� �������� ����.
	public BookVO() {}
	public BookVO(String goods_num, String goods_name, String goods_paia
		         ,String goods_ea, String goods_use) {
		//�����ڴ� �������� �ʱ�ȭ��.
		//�ٸ� ��(�����ڰ� �ƴ� ��)���� ����Ϸ��� �ݵ�� ���������϶� �� ���ٰ�����.
		this.goods_num  = goods_num;
		this.goods_name = goods_name;
		this.goods_paia = goods_paia;
		this.goods_ea   = goods_ea;
		this.goods_use  = goods_use;
    }	

	public BookVO(String goods_num, String goods_name, String goods_paia
			     ,String goods_memo,String goods_ea, String goods_use
			     ,String goods_date,String book_maker) {
		//�����ڴ� �������� �ʱ�ȭ��.
		//�ٸ� ��(�����ڰ� �ƴ� ��)���� ����Ϸ��� �ݵ�� ���������϶� �� ���ٰ�����.
		this.goods_num = goods_num;
		this.goods_name = goods_name;
		this.goods_paia = goods_paia;
		this.goods_memo = goods_memo;
		this.goods_ea = goods_ea;
		this.goods_use = goods_use;
		this.goods_date = goods_date;
		this.book_maker = book_maker;
	}
	//getter�� ���������� ����ִ� ���� ���� �� ����Ѵ�.
	//getter�� �� �Ķ���Ͱ� ����?
	//getter�޼ҵ�� �������� goods_num������ ����� ���� ���� �� �����.
	//�׷��ٸ� goods_num������ ���� �ִ°� ���� ����?
	//setGoods_num�޼ҵ忡 �Ķ���Ͱ� �ʿ��� ������ �ٷ� �̰� ��������.
	//setter�޼ҵ尡 ���� Ȥ�� ���� ������ �ϹǷ� getter�� ȣ���ϱ� ���� 
	//���� setter�� ȣ�� �Ǿ�� �մϴ�.
	//setter�޼ҵ忡 �ݵ�� �Ķ���Ͱ� �ʿ��� ������ DB������ ���̺� �÷��� �����
	//������ ��ƾ� �ϹǷ� select�� ó���ÿ� ���� ������ �־�� ���� ���� �� �־��.
	public String getGoods_num() {
		return goods_num;
	}
	//setter�� ���������� ���� ����(����,����) �� ����Ѵ�.
	//setter�� �� �Ķ���Ͱ� �־�� ����?
	//DB�������� ���� ���� BookVO.java�ȿ� ����������.......
	//�� �ȿ� ���� �����ؾ� �ϴϱ�
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
