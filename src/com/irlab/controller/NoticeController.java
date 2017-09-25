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
import com.irlab.entity.Journalism;
import com.irlab.entity.Notice;
import com.irlab.entity.Paging;
import com.irlab.service.impl.NoticeService;

/**
 * @author fangrongfu
 * @version 1.0
 * @Date 2017年8月11日上午11:23:45
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Resource
	private NoticeService noticeService;

	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectNoticeControlller(HttpServletRequest request, int page, int rows, String searchObj) {
		Paging paging = new Paging();
		Map<String, Object> map = new HashMap<String, Object>();
		paging.setN_event(searchObj);
		paging.setN_name(searchObj);
		paging.setN_code(searchObj);
		paging.setN_start((page - 1) * rows);
		paging.setN_rows(rows);
		return noticeService.selectNoticeService(paging);
	}

	@RequestMapping("/selectAll")
	@ResponseBody
	public Map<String, Object> selectAllNoticeControlller(HttpServletRequest request, int page, int rows) {
		Paging paging = new Paging();
		Map<String, Object> map = new HashMap<String, Object>();
		paging.setN_start((page - 1) * rows);
		paging.setN_rows(rows);
		return noticeService.selectAllNoticeService(paging);
	}

	@RequestMapping("/selectDetail")
	@ResponseBody
	public Map<String, Object> selectNoticeControlller(HttpServletRequest request, int page, int rows, String n_event,
			String n_code) {
		Paging paging = new Paging();
		Map<String, Object> map = new HashMap<String, Object>();
		paging.setN_event(n_event);
		paging.setN_code(n_code);
		paging.setN_start((page - 1) * rows);
		paging.setN_rows(rows);
		return noticeService.selectDetailNoticeService(paging);
	}
}
