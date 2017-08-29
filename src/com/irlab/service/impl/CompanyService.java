package com.irlab.service.impl;

import com.irlab.entity.Company;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月29日上午9:59:56
 */
public interface CompanyService {
	public Company selectCompanyService(Company company); //通过股票代码查询公司信息的接口
}
