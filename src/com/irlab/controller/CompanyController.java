package com.irlab.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irlab.entity.Company;
import com.irlab.service.impl.CompanyService;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月29日上午10:05:26
 */
@Controller
@RequestMapping("/company")
public class CompanyController {
	
	@Resource
	private CompanyService companyService;
	
	//接收前端传过来的公司股票代码并返回所有的公司信息
	@RequestMapping("/select")
	@ResponseBody
	public Company selectCompanyController(String N_code) {
		Company company = new Company();
		company.setN_code(N_code);
		return companyService.selectCompanyService(company);	
	}
}
