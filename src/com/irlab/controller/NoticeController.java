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
		information.setI_createDate("1993-02-13");
		information.setI_listing("2016-06-08");
		information.setI_ceo("贾小晶");
		information.setI_legalRepresentative("贾小晶");
		information.setI_address("江苏-苏州市");
		information.setI_tell("0512-65040208");
		company.setC_id(1);
		company.setC_name("新业电子");
		company.setC_fullname("苏州新业电子股份有限公司");
		company.setInformation(information);
		notice.setN_id(1);
		notice.setN_name("新业电子");
		notice.setN_title("苏州新业电子股份有限公司\r\n" + 
				"关于高级管理人员变动的公告 ");
		notice.setN_time("2017 年 2 月 23 日");
		notice.setN_content("一、任免基本情况\r\n" + 
				"(一)程序履行的基本情况\r\n" + 
				"根据《公司法》及公司章程的有关规定，公司第一届董事会第九\r\n" + 
				"次会议于 2017 年 2 月 21 日审议并通过：\r\n" + 
				"《关于聘任朱兴文为副总经理的议案》\r\n" + 
				"根据公司发展规划，结合公司生产经营实际，公司总经理贾小晶\r\n" + 
				"提请董事会聘任朱兴文先生担任副总经理，全面分管元件事业部业\r\n" + 
				"务，任期自 2017 年 02 月 22 日起至第一届董事会届满之日止。\r\n" + 
				"根据中国执行信息公开网的查询记录，截止本公告之日，朱兴文\r\n" + 
				"不存在被列入失信被执行人名单、被执行联合惩戒的情形。\r\n" + 
				"本次会议召开 5 日前以电话方式通知全体董事，实际到会董事 5\r\n" + 
				"人，持有公司股份 7,707,500 股，占股份总数的 72.03%，会议由蒋\r\n" + 
				"孝清主持。\r\n" + 
				"以上决议表决情况为：\r\n" + 
				"表决结果：同意 5 票，反对 0 票，弃权 0 票。。\r\n" + 
				"公告编号：2017-003\r\n" + 
				"2 / 2\r\n" + 
				"(二)被任免董监高人员情况\r\n" + 
				"该任命副总经理朱兴文持有公司股份 0 股，占公司股本的 0.00%。\r\n" + 
				"(三)任命/免职原因\r\n" + 
				"根据公司发展规划，为加快元件事业部的发展，设立分管副总\r\n" + 
				"经理，聘任朱兴文就任该职务。\r\n" + 
				"二、上述人员任免对公司的影响\r\n" + 
				"(一)对公司董事会（监事会）成员人数的影响\r\n" + 
				"本次聘任未导致公司董事会及监事会成员人数低于法定最低人\r\n" + 
				"数。\r\n" + 
				"(二)对公司生产、经营上的影响\r\n" + 
				"本次聘任有利于公司在管理结构上的进一步完善，加强元件部分\r\n" + 
				"的管理、技术实力，能够促进公司快速发展，对公司经营、管理产生\r\n" + 
				"积极影响。\r\n" + 
				"三、备查文件\r\n" + 
				"经与会董事签字确认的《苏州新业电子股份有限公司第一届董事\r\n" + 
				"会第九次会议决议》。\r\n" + 
				"苏州新业电子股份有限公司\r\n" + 
				"董事会\r\n" + 
				"2017 年 2 月 23 日");
		notice.setN_code("837641");
		notice.setN_url("http://www.neeq.com.cn/disclosure/2017/2017-02-23/1487835067_920829.pdf");
		notice.setN_event("人事任免");
		journalism.setJ_id(1);
		journalism.setJ_title("公司顺利通过了SGS进行TS16949初步审核");
		journalism.setJ_time("2017.03.01");
		journalism.setJ_digest("经过近半年的前期学习、准备，2014年9月22日，认证机构SGS前来我公司进行TS16949管理体系的初步审核，确认基本符合要求，预定于10月中旬进行正式审核。TS16949管理体系认证是汽车行业质量管理的基本要求，推行该体系旨在增强公司向汽车用产品供货的质量保证能力。");
		journalism.setJ_industry("电器设备");
		journalism.setJ_url("http://www.szxinye.com/info.php?mod=detail&id=5");
		map.put("company", company);
		map.put("journalism", journalism);
		map.put("notice", notice);
		return map;
		/*rows.put(map);
		System.out.println(company);
		System.out.println(journalism);
		System.out.println(notice);
		System.out.println(rows);
		return rows;*/
	}
}
