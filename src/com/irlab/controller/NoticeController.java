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
		Journalism journalism = new Journalism();
		Notice notice = new Notice();
		Company company = new Company();
		Date date = new Date();
		SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd");
		information.setI_id(1);
		information.setI_createDate((myFmt.format(date)));
		information.setI_listing((myFmt.format(date)));
		information.setI_ceo("刘家伟");
		information.setI_legalRepresentative("刘家伟");
		information.setI_address("襄阳");
		information.setI_tell("11231313123");
		company.setC_id(11);
		company.setC_name("家伟集团");
		company.setC_fullname("襄阳家伟集团");
		company.setInformation(information);
		notice.setN_id(1);
		notice.setN_name("家伟集团");
		notice.setN_title("新闻公告");
		notice.setN_time((myFmt.format(date)));
		notice.setN_content("公告内容");
		notice.setN_code("000633");
		notice.setN_url("http://file.finance.sina.com.cn/211.154.219.97:9494/MRGG/CNSESH_STOCK/2017/2017-6/2017-06-29/3525112.PDF");
		notice.setN_event("人事任免");
		journalism.setJ_id(1);
		journalism.setJ_title("新闻标题");
		journalism.setJ_time("新闻时间");
		journalism.setJ_digest("新闻摘要");
		journalism.setJ_industry("所属行业");
		journalism.setJ_url("http://finance.sina.com.cn/chanjing/gsnews/2017-08-18/doc-ifykcypp8898450.shtml");
		map.put("rows", company);
		map.put("rows", journalism);
		map.put("rows", notice);
		System.out.println(map);
		return map;
	}
}
