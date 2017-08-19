package com.irlab.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irlab.entity.Company;
import com.irlab.entity.Information;
import com.irlab.entity.Journalism;
import com.irlab.entity.Notice;
import com.irlab.entity.Paging;
import com.irlab.service.impl.NoticeService;

/**
 * @author   fangrongfu
 * @version  1.0
 * @Date     2017年8月11日上午11:23:45
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Resource
	private NoticeService noticeService;
	
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectNoticeControlller(HttpServletRequest request,int page,int rows,String searchObj){
		Paging paging = new Paging();
		Map<String, Object> map = new HashMap<String, Object>();
		paging.setN_event(searchObj);
		paging.setN_name(searchObj);
		paging.setN_code(searchObj);
		paging.setN_start((page-1)*rows);
		paging.setN_rows(rows);
		return noticeService.selectNoticeService(paging);
	}
	
	@RequestMapping("/selectDetail")
	@ResponseBody
	public Map<String, Object> selectNoticeDetailControlller(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		Information information = new Information();
		Company company = new Company();
		/*Date date = new Date();
		SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd");*/
		information.setI_id(837641);
		information.setI_createDate("1993-02-13");
		information.setI_listing("2016-06-08");
		information.setI_ceo("贾小晶");
		information.setI_legalRepresentative("贾小晶");
		information.setI_address("江苏-苏州市");
		information.setI_tell("0512-65040208");
		company.setC_id(837641);
		company.setC_name("新业电子");
		company.setC_fullname("苏州新业电子股份有限公司");
		company.setInformation(information);
		map.put("company", company);
		return map;
		/*rows.put(map);
		System.out.println(company);
		System.out.println(journalism);
		System.out.println(notice);
		System.out.println(rows);
		return rows;*/
	}
}
