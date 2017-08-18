/**
 * 
 */
package com.irlab.entity;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月18日下午9:17:49
 */
public class Journalism {
	private int j_id;//  新闻表的id 
	private String j_title;//  新闻的标题
	private String j_time;//  新闻的时间 
	private String j_digest;//  新闻的摘要
	private String j_industry;//  新闻的所属行业
	private String j_url;//  新闻的全文链接
	public int getJ_id() {
		return j_id;
	}
	public void setJ_id(int j_id) {
		this.j_id = j_id;
	}
	public String getJ_title() {
		return j_title;
	}
	public void setJ_title(String j_title) {
		this.j_title = j_title;
	}
	public String getJ_time() {
		return j_time;
	}
	public void setJ_time(String j_time) {
		this.j_time = j_time;
	}
	public String getJ_digest() {
		return j_digest;
	}
	public void setJ_digest(String j_digest) {
		this.j_digest = j_digest;
	}
	public String getJ_industry() {
		return j_industry;
	}
	public void setJ_industry(String j_industry) {
		this.j_industry = j_industry;
	}
	public String getJ_url() {
		return j_url;
	}
	public void setJ_url(String j_url) {
		this.j_url = j_url;
	}
	@Override
	public String toString() {
		return "Journalism [j_id=" + j_id + ", j_title=" + j_title + ", j_time=" + j_time + ", j_digest=" + j_digest
				+ ", j_industry=" + j_industry + ", j_url=" + j_url + "]";
	}
}
