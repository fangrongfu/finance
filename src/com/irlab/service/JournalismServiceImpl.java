package com.irlab.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.irlab.dao.JournalismDao;
import com.irlab.entity.Paging;
import com.irlab.service.impl.JournalismService;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月21日下午10:28:54
 */
@Service
public class JournalismServiceImpl implements JournalismService{

	@Resource
	private JournalismDao journalismDao;
	
	@Override
	public Map<String, Object> selectJournalismService(Paging paging) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		int total = journalismDao.selectCountJournalismDao(paging);
		if(total == 0) {
			map.put("total", 0);
			map.put("rows", "");
		}else {
			map.put("total", journalismDao.selectCountJournalismDao(paging));
			map.put("rows", journalismDao.selectJournalismDao(paging));
		}
		return map;
	}
	
	@Override
	public Map<String, Object> selectAllJournalismService(Paging paging) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("total", journalismDao.selectAllCountJournalismDao(paging));
		map.put("rows", journalismDao.selectAllJournalismDao(paging));
		return map;
	}

}
