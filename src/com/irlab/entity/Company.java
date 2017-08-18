
package com.irlab.entity;
import com.irlab.entity.Information;
/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月18日下午9:04:47
 */
public class Company {
	private int c_id;// 公司的ID
	private String c_name;//  公司的名称
	private String c_fullname;//  公司的全称
	private Information information;//  基本信息
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_fullname() {
		return c_fullname;
	}
	public void setC_fullname(String c_fullname) {
		this.c_fullname = c_fullname;
	}
	public Information getInformation() {
		return information;
	}
	public void setInformation(Information information) {
		this.information = information;
	}
	@Override
	public String toString() {
		return "Company [c_id=" + c_id + ", c_name=" + c_name + ", c_fullname=" + c_fullname + ", information="
				+ information + "]";
	}
}
