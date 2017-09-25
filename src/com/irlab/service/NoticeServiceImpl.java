package com.irlab.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.irlab.dao.NoticeDao;
import com.irlab.entity.Paging;
import com.irlab.service.impl.NoticeService;

/**
 * @author   fangrongfu
 * @version  1.0
 * @Date     2017年8月11日上午11:21:18
 */
@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Resource
	private NoticeDao noticeDao;

	@Override
	public Map<String, Object> selectNoticeService(Paging paging) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("total", noticeDao.selectCountNoticeDao(paging));
		map.put("rows", noticeDao.selectNoticeDao(paging));
		return map;	
	}

	/* (non-Javadoc)
	 * @see com.irlab.service.impl.NoticeService#selectAllNoticeService(com.irlab.entity.Paging)
	 */
	@Override
	public Map<String, Object> selectAllNoticeService(Paging paging) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("total", noticeDao.selectCountAllNoticeDao(paging));
		map.put("rows", noticeDao.selectAllNoticeDao(paging));
		return map;	
	}

	/* (non-Javadoc)
	 * @see com.irlab.service.impl.NoticeService#selectDetailNoticeService(com.irlab.entity.Paging)
	 */
	@Override
	public Map<String, Object> selectDetailNoticeService(Paging paging) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("total", noticeDao.selectCountDetailNoticeDao(paging));
		map.put("rows", noticeDao.selectDetailNoticeDao(paging));
		return map;	
	}
}
