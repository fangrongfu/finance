/**
 * 
 */
package com.irlab.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irlab.entity.Journalism;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月19日下午6:46:59
 */
@Controller
@RequestMapping("/journalism")
public class JournalismController {
	
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectJournalismController(){
		Map<String, Object> map = new HashMap<String, Object>();
		Journalism journalism = new Journalism();
		/*journalism.setJ_id(000413);
		journalism.setJ_title("公司顺利通过了SGS进行TS16949初步审核");
		journalism.setJ_time("2017.03.01");
		journalism.setJ_digest("经过近半年的前期学习、准备，2014年9月22日，认证机构SGS前来我公司进行TS16949管理体系的初步审核，确认基本符合要求，预定于10月中旬进行正式审核。TS16949管理体系认证是汽车行业质量管理的基本要求，推行该体系旨在增强公司向汽车用产品供货的质量保证能力。");
		journalism.setJ_industry("电器设备");
		journalism.setJ_url("http://www.szxinye.com/info.php?mod=detail&id=5");*/
		List<Journalism> m = new ArrayList<Journalism>();
		journalism.setJ_id(000413);
		journalism.setJ_title("公司顺利通过了SGS进行TS16949初步审核");
		journalism.setJ_time("2017.03.01");
		journalism.setJ_digest("经过近半年的前期学习、准备，2014年9月22日，认证机构SGS前来我公司进行TS16949管理体系的初步审核，确认基本符合要求，预定于10月中旬进行正式审核。TS16949管理体系认证是汽车行业质量管理的基本要求，推行该体系旨在增强公司向汽车用产品供货的质量保证能力。");
		journalism.setJ_industry("电器设备");
		journalism.setJ_url("http://www.szxinye.com/info.php?mod=detail&id=5");
		m.add(journalism);
		map.put("rows",m);
		map.put("total", 2);
		System.out.println(map);
		return map;
	}
}
