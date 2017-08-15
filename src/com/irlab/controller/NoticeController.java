package com.irlab.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public Map<String, Object> selectNoticeControlller(HttpServletRequest request,int page,int rows){
		String searchObj = null;
		Paging paging = new Paging();
		Map<String, Object> map = new HashMap<String, Object>();
		String searchObjOne = request.getParameter("searchObj");
		System.out.println(searchObjOne);
		searchObj = searchObjOne.substring(1, searchObjOne.length()-1);
		if("".equals(searchObj) || searchObj == null ){
			map.put("paging", null);
			return noticeService.selectNoticeService(paging);
		}
		paging.setN_event(searchObj);
		paging.setN_name(searchObj);
		paging.setN_code(searchObj);
		paging.setN_start((page-1)*rows);
		paging.setN_rows(rows);
		return noticeService.selectNoticeService(paging);
	}
}
