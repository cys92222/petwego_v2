package com.example.demo.vo;

import java.util.Date;

public class ReplyVo {
	private int t_num;
	private int t_r_num;
	private String t_r_content;
	private String user_id;
	private Date regdate;
	
	public int getT_num() {
		return t_num;
	}
	
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	
	public int getT_r_num() {
		return t_r_num;
	}
	
	public void setT_r_num(int t_r_num) {
		this.t_r_num = t_r_num;
	}
	
	public String getT_r_content() {
		return t_r_content;
	}
	public void setT_r_content(String t_r_content) {
		this.t_r_content = t_r_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ReplyVo [t_num=" + t_num + ", t_r_num=" + t_r_num + ", t_r_content=" + t_r_content + ", user_id=" + user_id + ", regdate="
				+ regdate + "]";
	}
	
	
}
