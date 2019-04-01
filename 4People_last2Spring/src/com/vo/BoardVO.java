package com.vo;

import java.util.List;

public class BoardVO {
	 private String board_no      ="";      
	 private String team_code     ="";    
	 private String board_title   ="";
	 private String board_update  ="";
	 private String board_color   ="";
	 private String mem_id        ="";
	 private List<BoardVO> board_cursor =null;
	 private List<BoardVO> team_cursor =null;
	
	public String getTeam_code() {
		return team_code;
	}
	public void setTeam_code(String team_code) {
		this.team_code = team_code;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_update() {
		return board_update;
	}
	public void setBoard_update(String board_update) {
		this.board_update = board_update;
	}
	public String getBoard_color() {
		return board_color;
	}
	public void setBoard_color(String board_color) {
		this.board_color = board_color;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public List<BoardVO> getBoard_cursor() {
		return board_cursor;
	}
	public void setBoard_cursor(List<BoardVO> board_cursor) {
		this.board_cursor = board_cursor;
	}
	public List<BoardVO> getTeam_cursor() {
		return team_cursor;
	}
	public void setTeam_cursor(List<BoardVO> team_cursor) {
		this.team_cursor = team_cursor;
	}    
}
