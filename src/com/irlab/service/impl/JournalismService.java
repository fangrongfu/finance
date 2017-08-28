package com.irlab.service.impl;

import java.util.Map;

import com.irlab.entity.Paging;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月21日下午10:26:28
 */
public interface JournalismService {
	public Map<String,Object> selectJournalismService(Paging paging);	//新闻检索的业务处理接口
	public Map<String,Object> selectAllJournalismService(Paging paging);	//检索所有新闻信息的业务处理接口
}
