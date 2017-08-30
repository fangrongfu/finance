/**
 * 
 */
package com.irlab.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irlab.dao.JournalismDao;
import com.irlab.entity.Journalism;
import com.irlab.entity.Paging;
import com.irlab.service.impl.JournalismService;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月19日下午6:46:59
 */
@Controller
@RequestMapping("/journalism")
public class JournalismController {
	
	@Resource
	private JournalismService journalismService;
	
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectJournalismController(HttpServletRequest request,int page,int rows,String companyName,String date){
		Paging paging = new Paging();
		Map<String, Object> map = new HashMap<String, Object>();
		if(date.equals("all")) {
			date = null;
			paging.setJ_time(date);
			paging.setJ_title(companyName);
			paging.setJ_content(companyName);
			paging.setN_start((page-1)*rows);
			paging.setN_rows(rows);
		}else {
			paging.setJ_time(date);
			paging.setJ_title(companyName);
			paging.setJ_content(companyName);
			paging.setN_start((page-1)*rows);
			paging.setN_rows(rows);
		}
		if(companyName.equals("all") && paging.getJ_time() == null ) {
			return journalismService.selectAllJournalismService(paging);
		}else {
			if(companyName.equals("all")) {
				companyName = null;
				paging.setJ_title(companyName);
				paging.setJ_content(companyName);
				return journalismService.selectJournalismService(paging);
			}
			return journalismService.selectJournalismService(paging);
		}
	}
}
