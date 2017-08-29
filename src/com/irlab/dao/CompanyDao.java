package com.irlab.dao;

import com.irlab.entity.Company;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月29日上午9:45:43
 */
public interface CompanyDao {
	public Company selectCompany(Company company);  //通过ID查询公司的基本信息
}
