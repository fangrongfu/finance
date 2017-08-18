/**
 * 
 */
package com.irlab.entity;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月18日下午9:10:16
 */
public class Information {
	private int i_id;//  
	private String i_createDate;//  成立日期
	private String i_listing;//  挂牌日期
	private String i_ceo;//  董事长
	private String i_legalRepresentative;//  法人代表
	private String i_address;//  所属地域
	private String i_tell;//  电话
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public String getI_createDate() {
		return i_createDate;
	}
	public void setI_createDate(String i_createDate) {
		this.i_createDate = i_createDate;
	}
	public String getI_listing() {
		return i_listing;
	}
	public void setI_listing(String i_listing) {
		this.i_listing = i_listing;
	}
	public String getI_ceo() {
		return i_ceo;
	}
	public void setI_ceo(String i_ceo) {
		this.i_ceo = i_ceo;
	}
	public String getI_legalRepresentative() {
		return i_legalRepresentative;
	}
	public void setI_legalRepresentative(String i_legalRepresentative) {
		this.i_legalRepresentative = i_legalRepresentative;
	}
	public String getI_address() {
		return i_address;
	}
	public void setI_address(String i_address) {
		this.i_address = i_address;
	}
	public String getI_tell() {
		return i_tell;
	}
	public void setI_tell(String i_tell) {
		this.i_tell = i_tell;
	}
	@Override
	public String toString() {
		return "Information [i_id=" + i_id + ", i_createDate=" + i_createDate + ", i_listing=" + i_listing + ", i_ceo="
				+ i_ceo + ", i_legalRepresentative=" + i_legalRepresentative + ", i_address=" + i_address + ", i_tell="
				+ i_tell + "]";
	}
}
