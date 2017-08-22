package com.irlab.entity;

/**
 * @author   fangrongfu
 * @version  1.0
 * @Date     2017年8月14日上午10:01:01
 */
public class Paging {
	private String n_name;//  公司的名称  
	private String n_code;//  公司的股票代码
	private String n_event;//  公司的公告分类的类型
	private String j_title;//  新闻的标题
	private String j_content;//  新闻的内容
	private String j_time;//  新闻的发布时间
	private int    n_total;//  查询的记录的总条数
	private int    n_start;//  起始条数
	private int    n_rows;//   每一行的记录数
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	public String getN_code() {
		return n_code;
	}
	public void setN_code(String n_code) {
		this.n_code = n_code;
	}
	public String getN_event() {
		return n_event;
	}
	public void setN_event(String n_event) {
		this.n_event = n_event;
	}
	public String getJ_title() {
		return j_title;
	}
	public void setJ_title(String j_title) {
		this.j_title = j_title;
	}
	public String getJ_content() {
		return j_content;
	}
	public void setJ_content(String j_content) {
		this.j_content = j_content;
	}
	public String getJ_time() {
		return j_time;
	}
	public void setJ_time(String j_time) {
		this.j_time = j_time;
	}
	public int getN_total() {
		return n_total;
	}
	public void setN_total(int n_total) {
		this.n_total = n_total;
	}
	public int getN_start() {
		return n_start;
	}
	public void setN_start(int n_start) {
		this.n_start = n_start;
	}
	public int getN_rows() {
		return n_rows;
	}
	public void setN_rows(int n_rows) {
		this.n_rows = n_rows;
	}
	@Override
	public String toString() {
		return "Paging [n_name=" + n_name + ", n_code=" + n_code + ", n_event=" + n_event + ", j_title=" + j_title
				+ ", j_content=" + j_content + ", j_time=" + j_time + ", n_total=" + n_total + ", n_start=" + n_start
				+ ", n_rows=" + n_rows + "]";
	}
}
