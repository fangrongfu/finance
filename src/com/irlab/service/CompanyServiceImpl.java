package com.irlab.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.irlab.dao.CompanyDao;
import com.irlab.entity.Company;
import com.irlab.service.impl.CompanyService;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月29日上午10:02:10
 */
@Service
public class CompanyServiceImpl implements CompanyService{

	@Resource
	private CompanyDao companyDao;
	
	//通过股票代码查询公司信息的接口的实现
	public Company selectCompanyService(Company company) {
		// TODO Auto-generated method stub
		return companyDao.selectCompanyDao(company);
	}
}
